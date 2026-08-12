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


### ✅ INT-EXT-003 — Diferenciar credenciales emitidas por proveedores y credenciales emitidas por Vento

**Estado:** APROBADA  
**Tarea anterior:** `INT-EXT-002 — Definir principal técnico independiente por integración` — APROBADA  
**Tarea siguiente:** `INT-EXT-004 — Definir autenticación mediante API key, OAuth, HMAC, certificado u otro mecanismo` — RESERVADA  
**Tipo de tarea:** documental; clasificación materializada de procedencia de credenciales por frontera externa para `EXT-SYS-001` a `EXT-SYS-021`, separando credenciales emitidas por proveedor, credenciales emitidas por VENTO, material cuya procedencia no está acreditada y bindings sin credencial externa acreditada, sin crear secretos, cuentas, mecanismos de autenticación, scopes, configuración ni cambios físicos  
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

Diferenciar, para las 21 identidades externas inventariadas y para las superficies de credencial que la evidencia actual permite observar, quién controla la emisión de la credencial y qué parte la presenta o valida.

La tarea fija esta separación:

```text
QUIÉN EMITE LA CREDENCIAL
≠ QUIÉN LA CUSTODIA
≠ QUIÉN LA PRESENTA
≠ QUIÉN LA VALIDA
≠ PRINCIPAL TÉCNICO
≠ ACTOR HUMANO
≠ PERMISO EMPRESARIAL
```

La procedencia de una credencial no concede autoridad empresarial y no sustituye `IntegrationPrincipal`, `PermissionKey`, cuenta de proveedor, endpoint, dispositivo ni contrato.

---

#### 2. Resultado sustantivo

Queda materializada una decisión documental para cada identidad `EXT-SYS-001` a `EXT-SYS-021`.

Balance:

| Control                                                                       |    Resultado |
| ----------------------------------------------------------------------------- | -----------: |
| Identidades heredadas esperadas                                               |       **21** |
| Decisiones materializadas                                                     | **21 de 21** |
| Identidades faltantes                                                         |        **0** |
| Identidades duplicadas                                                        |        **0** |
| Sistemas con credencial de proveedor acreditada en binding                    |        **6** |
| Sistemas con superficies acreditadas de proveedor y de VENTO                  |        **1** |
| Bindings observados sin credencial externa en la llamada o bridge observado   |        **2** |
| Configuraciones observadas sin credencial física acreditada                   |        **2** |
| Modelo de credencial de proveedor documentado sin binding acreditado          |        **1** |
| Identidades sin procedencia de credencial acreditable por ausencia de binding |        **9** |
| Superficies observadas con credencial emitida por VENTO                       |        **1** |
| Valores secretos creados                                                      |        **0** |
| Cuentas externas creadas                                                      |        **0** |
| Cambios físicos                                                               |        **0** |

La reconciliación por identidad es:

```text
21 IDENTIDADES
= 6 PROVEEDOR_ACREDITADO_EN_BINDING
+ 1 MIXTO_PROVEEDOR_Y_VENTO
+ 2 SIN_CREDENCIAL_EXTERNA_EN_BINDING_OBSERVADO
+ 2 CREDENCIAL_NO_ACREDITADA_EN_CONFIGURACION
+ 1 MODELO_PROVEEDOR_DOCUMENTADO_SIN_BINDING
+ 9 SIN_PROVENIENCIA_ACREDITADA_POR_NO_BINDING
```

Esta distribución clasifica evidencia de procedencia. No declara vigencia productiva, suficiencia de scope, almacenamiento seguro, rotación ni autenticidad runtime.

---

#### 3. Entradas canónicas preservadas

La tarea conserva sin alterar:

- las 21 identidades `EXT-SYS-001` a `EXT-SYS-021` de `INT-EXT-001`;
- la distribución heredada de evidencia **3 + 6 + 2 + 6 + 4 = 21**;
- las decisiones de principal técnico de `INT-EXT-002`;
- la separación entre `PermissionKey`, `IntegrationPrincipal`, `ExternalCredentialId` y valor secreto;
- la prohibición de usar `service_role` como identidad empresarial o entregarlo a un proveedor externo;
- la obligación de conservar secretos fuera de frontend, variables públicas, tablas expuestas, payloads ordinarios y logs;
- la obligación de que los adaptadores externos conserven identidad, autenticación referenciada, trazabilidad y frontera de propiedad;
- la prohibición de derivar autoridad empresarial desde una credencial técnicamente válida.

La tarea no cambia proveedor, propietario funcional, finalidad, principal técnico ni estado de binding definidos por las tareas anteriores.

---

#### 4. Taxonomía de procedencia

##### 4.1. `PROVEEDOR_ACREDITADO_EN_BINDING`

Aplica cuando la evidencia actual muestra una credencial, referencia de acceso o material de autenticación específico del proveedor consumido por VENTO.

Regla:

```text
PROVEEDOR / PLATAFORMA
→ EMITE O ASIGNA MATERIAL DE ACCESO
→ VENTO LO CUSTODIA O REFERENCIA
→ VENTO LO PRESENTA O USA EN LA FRONTERA APROBADA
```

No significa que el proveedor tenga permiso empresarial dentro de VENTO.

##### 4.2. `VENTO_EMITIDA`

Aplica cuando VENTO genera una credencial y la entrega a un cliente, dispositivo o contraparte técnica para que esa parte pueda autenticarse contra una frontera controlada por VENTO.

Regla:

```text
VENTO
→ GENERA CREDENCIAL
→ TERCERO / CLIENTE TÉCNICO LA PRESENTA
→ VENTO LA VALIDA
```

La credencial sigue siendo distinta del actor humano y del permiso empresarial.

##### 4.3. `ORIGEN_NO_ACREDITADO`

Aplica cuando existe una referencia o secreto configurado, pero las fuentes verificadas no demuestran qué parte lo generó originalmente.

No se infiere procedencia por nombre de variable, ubicación del secreto o lado que actualmente lo almacena.

##### 4.4. `SIN_CREDENCIAL_EXTERNA_EN_BINDING_OBSERVADO`

Aplica cuando el binding de código inspeccionado no presenta una credencial externa en la llamada o bridge observado.

Un token de destino, identificador de dispositivo, URL, `projectId`, `place_id`, UID de impresora o referencia equivalente no se convierte en credencial por conveniencia documental.

##### 4.5. `NO_APLICA_ACTUAL`

Aplica a una identidad documentada sin binding acreditado. La tarea no inventa credenciales hipotéticas.

Antes de activar un binding futuro deberá existir una referencia física de credencial con procedencia acreditada cuando el mecanismo elegido la requiera.

---

#### 5. Regla de cardinalidad

La procedencia se clasifica por **superficie de credencial**, no únicamente por plataforma.

Un mismo sistema puede tener:

- una credencial emitida por el proveedor para llamadas salientes de VENTO;
- una credencial emitida por VENTO para callbacks o clientes técnicos;
- credenciales diferentes por binding;
- material cuya procedencia todavía no esté acreditada;
- superficies que no usen credencial externa en el binding observado.

Por tanto:

```text
external_system_id
≠ external_credential_id
```

y:

```text
UNA PLATAFORMA
PUEDE TENER
MÁS DE UNA PROCEDENCIA DE CREDENCIAL
```

sin fusionarlas en una credencial genérica.

---

#### 6. Matriz materializada `VENTO-EXTERNAL-CREDENTIAL-PROVENANCE-001`

| ID            | Sistema / plataforma                     | Evidencia heredada                   | Superficie de credencial observada o documentada                                                                          | Procedencia decidida                                                                                     | Presenta / usa                                                                                                   | Valida / recibe                                          | Estado documental | Decisión y condición                                                                                                                                                                                                                                                   |
| ------------- | ---------------------------------------- | ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------- | ----------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `EXT-SYS-001` | Supabase                                 | `BINDING_TECNICO_OBSERVADO`          | `SUPABASE_ANON_KEY` / clave publicable y `SUPABASE_SERVICE_ROLE_KEY` usadas por componentes VENTO                         | `PROVEEDOR_ACREDITADO_EN_BINDING`                                                                        | clientes o backend VENTO según la clase de clave                                                                 | Supabase                                                 | `ESPECIFICADO`    | Las claves de proyecto pertenecen a la frontera Supabase→VENTO. `service_role` permanece credencial privilegiada interna y nunca se entrega a otro proveedor ni se convierte en principal o permiso.                                                                   |
| `EXT-SYS-002` | Wompi                                    | `BINDING_CONDICIONAL_OBSERVADO`      | `WOMPI_PUBLIC_KEY`, `WOMPI_INTEGRITY_SECRET`, `WOMPI_EVENTS_SECRET` / `WOMPI_WEBHOOK_SECRET`                              | `PROVEEDOR_ACREDITADO_EN_BINDING` con procedencia exacta del secreto de eventos no demostrada por código | VENTO usa las credenciales de checkout; el proveedor emite payload firmado                                       | Wompi valida checkout y VENTO valida el evento           | `ESPECIFICADO`    | La familia de checkout se trata como credencial del proveedor. El secreto de eventos queda `ORIGEN_NO_ACREDITADO` a nivel de ceremonia de emisión; su referencia física deberá conservar ese estado hasta evidencia de la configuración del proveedor.                 |
| `EXT-SYS-003` | RevenueCat                               | `BINDING_CONDICIONAL_OBSERVADO`      | `EXPO_PUBLIC_REVENUECAT_APPLE_API_KEY`, `EXPO_PUBLIC_REVENUECAT_GOOGLE_API_KEY`, `REVENUECAT_WEBHOOK_SECRET`              | `PROVEEDOR_ACREDITADO_EN_BINDING` para API keys; `ORIGEN_NO_ACREDITADO` para el secreto del webhook      | PASS presenta las API keys al SDK; RevenueCat presenta el valor esperado por el webhook observado                | RevenueCat / VENTO según la dirección                    | `ESPECIFICADO`    | Las API keys quedan del lado proveedor→VENTO. La fuente actual no acredita quién creó el secreto compartido del webhook; no se reclasifica por inferencia.                                                                                                             |
| `EXT-SYS-004` | Resend                                   | `BINDING_CONDICIONAL_OBSERVADO`      | `RESEND_API_KEY`                                                                                                          | `PROVEEDOR_ACREDITADO_EN_BINDING`                                                                        | Edge Function de VENTO                                                                                           | API de Resend                                            | `ESPECIFICADO`    | La API key autentica a VENTO ante Resend. No es principal técnico, permiso empresarial ni credencial que Resend pueda usar contra Supabase.                                                                                                                            |
| `EXT-SYS-005` | Expo / EAS Update                        | `CONFIGURACION_OBSERVADA`            | `expoProjectId`, URL `u.expo.dev` y metadatos EAS; no se observó material de credencial en la configuración inspeccionada | `CREDENCIAL_NO_ACREDITADA_EN_CONFIGURACION`                                                              | no determinable con la evidencia actual                                                                          | no determinable con la evidencia actual                  | `ESPECIFICADO`    | La configuración acredita proyecto y servicio, no la procedencia de una credencial física. La referencia física queda a cargo del contrato de credencial cuando se materialice evidencia de cuenta/servicio.                                                           |
| `EXT-SYS-006` | Expo Push Service                        | `BINDING_TECNICO_OBSERVADO`          | llamada HTTP observada sin header de credencial externa; tokens `to` identifican destinos de push                         | `SIN_CREDENCIAL_EXTERNA_EN_BINDING_OBSERVADO`                                                            | VENTO envía mensajes y tokens de destino                                                                         | Expo Push Service                                        | `ESPECIFICADO`    | El token de dispositivo no se clasifica como credencial de integración. Si otra modalidad de Expo exige credencial, deberá registrarse como superficie independiente.                                                                                                  |
| `EXT-SYS-007` | Sentry                                   | `BINDING_CONDICIONAL_OBSERVADO`      | `EXPO_PUBLIC_SENTRY_DSN`                                                                                                  | `PROVEEDOR_ACREDITADO_EN_BINDING`                                                                        | ANIMA SDK                                                                                                        | Sentry                                                   | `ESPECIFICADO`    | El DSN se conserva como referencia de ingestión del proveedor y no se trata como secreto empresarial ni permiso VENTO. La activación depende de configuración vigente.                                                                                                 |
| `EXT-SYS-008` | Google Maps / Google Reviews             | `BINDING_CONDICIONAL_OBSERVADO`      | `EXPO_PUBLIC_GOOGLE_MAPS_API_KEY`; URLs públicas de Maps/Reviews                                                          | `PROVEEDOR_ACREDITADO_EN_BINDING` para la API key                                                        | PASS cuando usa vista cartográfica con API                                                                       | Google                                                   | `ESPECIFICADO`    | La API key pertenece a la frontera proveedor→VENTO. URLs, `place_id`, coordenadas y enlaces de reseña no son credenciales.                                                                                                                                             |
| `EXT-SYS-009` | Apple Wallet / PassKit y APNs            | `BINDING_CONDICIONAL_OBSERVADO`      | material `APPLE_PASS_*`, `APPLE_PUSH_*`; además `authenticationToken` generado con aleatoriedad por VENTO para cada pase  | `MIXTO_PROVEEDOR_Y_VENTO`                                                                                | VENTO usa material asociado a Apple; Wallet/dispositivo presenta el token emitido por VENTO al servicio del pase | Apple/APNs y servicio Wallet de VENTO según la dirección | `ESPECIFICADO`    | Se separan dos direcciones. El `authenticationToken` del pase es `VENTO_EMITIDA`. El material de certificados/keys está asociado a la plataforma Apple, pero la ceremonia exacta de generación no se inventa; la referencia física deberá conservar su evidencia real. |
| `EXT-SYS-010` | Vercel                                   | `CONFIGURACION_OBSERVADA`            | `vercel.json`, rewrites, headers y superficies web; no se observó credencial física en esa configuración                  | `CREDENCIAL_NO_ACREDITADA_EN_CONFIGURACION`                                                              | no determinable con la evidencia actual                                                                          | no determinable con la evidencia actual                  | `ESPECIFICADO`    | Hosting/configuración observados no prueban token, cuenta o procedencia de credencial. La credencial física se registrará únicamente con evidencia de la cuenta o automatización que la consuma.                                                                       |
| `EXT-SYS-011` | Zebra BrowserPrint                       | `BINDING_TECNICO_OBSERVADO`          | bridge `window.BrowserPrint`, enumeración y selección local por UID; no se observó credencial externa                     | `SIN_CREDENCIAL_EXTERNA_EN_BINDING_OBSERVADO`                                                            | navegador/estación VENTO usa bridge local                                                                        | agente BrowserPrint / impresora local                    | `ESPECIFICADO`    | UID, nombre y tipo de impresora no son credenciales. Cualquier autenticación adicional futura será una superficie separada y no se presume.                                                                                                                            |
| `EXT-SYS-012` | Google Wallet / Google Pay & Wallet      | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | modelo documental de cuenta de servicio e issuer; sin binding ni credencial vigente acreditados                           | `MODELO_PROVEEDOR_DOCUMENTADO_SIN_BINDING`                                                               | no aplica actualmente                                                                                            | no aplica actualmente                                    | `ESPECIFICADO`    | El modelo documenta una credencial de plataforma, pero no acredita material físico activo. Estado físico `NO_APLICA_ACTUAL` hasta que exista binding verificable.                                                                                                      |
| `EXT-SYS-013` | POS externo vigente                      | `PROVEEDOR_NO_ACREDITADO`            | proveedor, API, endpoints y credenciales no acreditados                                                                   | `SIN_PROVENIENCIA_ACREDITADA_POR_NO_BINDING`                                                             | no aplica documentalmente                                                                                        | no aplica documentalmente                                | `ESPECIFICADO`    | No se inventa proveedor ni credential family. `INT-POS-001` deberá acreditar el binding; la referencia de credencial física deberá registrar procedencia antes de activación.                                                                                          |
| `EXT-SYS-014` | Shopify / canal de comercio electrónico  | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | plataforma nombrada sin cuenta o integración VENTO acreditada                                                             | `SIN_PROVENIENCIA_ACREDITADA_POR_NO_BINDING`                                                             | no aplica actualmente                                                                                            | no aplica actualmente                                    | `ESPECIFICADO`    | Nombrar Shopify no acredita token, app, client secret ni cuenta. Estado físico `NO_APLICA_ACTUAL`.                                                                                                                                                                     |
| `EXT-SYS-015` | Rappi / marketplace                      | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | plataforma nombrada sin integración activa acreditada                                                                     | `SIN_PROVENIENCIA_ACREDITADA_POR_NO_BINDING`                                                             | no aplica actualmente                                                                                            | no aplica actualmente                                    | `ESPECIFICADO`    | No se presume API key, OAuth, webhook secret ni cuenta. Estado físico `NO_APLICA_ACTUAL`.                                                                                                                                                                              |
| `EXT-SYS-016` | ManyChat / automatización conversacional | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | plataforma nombrada sin cuenta, bot o API activa acreditada                                                               | `SIN_PROVENIENCIA_ACREDITADA_POR_NO_BINDING`                                                             | no aplica actualmente                                                                                            | no aplica actualmente                                    | `ESPECIFICADO`    | No se presume credential family. Estado físico `NO_APLICA_ACTUAL`.                                                                                                                                                                                                     |
| `EXT-SYS-017` | WhatsApp                                 | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | canal nombrado; proveedor/API, número, cuenta y webhook no acreditados                                                    | `SIN_PROVENIENCIA_ACREDITADA_POR_NO_BINDING`                                                             | no aplica actualmente                                                                                            | no aplica actualmente                                    | `ESPECIFICADO`    | El canal no determina proveedor ni procedencia de credencial. Estado físico `NO_APLICA_ACTUAL`.                                                                                                                                                                        |
| `EXT-SYS-018` | Instagram / perfiles sociales            | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | canal nombrado sin API, cuenta o automatización activa acreditada                                                         | `SIN_PROVENIENCIA_ACREDITADA_POR_NO_BINDING`                                                             | no aplica actualmente                                                                                            | no aplica actualmente                                    | `ESPECIFICADO`    | El perfil social no constituye credencial técnica. Estado físico `NO_APLICA_ACTUAL`.                                                                                                                                                                                   |
| `EXT-SYS-019` | Correo corporativo y alias funcionales   | `PROVEEDOR_NO_ACREDITADO`            | proveedor, buzones concretos e integración API no acreditados                                                             | `SIN_PROVENIENCIA_ACREDITADA_POR_NO_BINDING`                                                             | no aplica actualmente                                                                                            | no aplica actualmente                                    | `ESPECIFICADO`    | Un alias o dirección de correo no es credencial. La procedencia solo podrá definirse cuando el proveedor y binding estén acreditados.                                                                                                                                  |
| `EXT-SYS-020` | Telefonía / canal de voz                 | `PROVEEDOR_NO_ACREDITADO`            | operador, numeración, grabación e integración no acreditados                                                              | `SIN_PROVENIENCIA_ACREDITADA_POR_NO_BINDING`                                                             | no aplica actualmente                                                                                            | no aplica actualmente                                    | `ESPECIFICADO`    | Número telefónico, extensión o caller ID no se clasifican como credencial de integración.                                                                                                                                                                              |
| `EXT-SYS-021` | Transporte externo                       | `PROVEEDOR_NO_ACREDITADO`            | proveedor, tracking, API y alternativa no acreditados                                                                     | `SIN_PROVENIENCIA_ACREDITADA_POR_NO_BINDING`                                                             | no aplica actualmente                                                                                            | no aplica actualmente                                    | `ESPECIFICADO`    | No se presume token, portal, API key o cuenta. Estado físico `NO_APLICA_ACTUAL` hasta que exista proveedor y binding acreditados.                                                                                                                                      |

---

#### 7. Separación entre credencial, referencia y valor

Cada credencial física futura deberá poder relacionarse sin almacenar su valor en el registro empresarial:

```text
external_system_id
external_instance_id
integration_principal_id
external_credential_id
credential_issuer_class
credential_owner_ref
credential_presenter_ref
credential_validator_ref
contract_version
```

Esta tarea define únicamente la procedencia documental. Los nombres físicos definitivos pertenecen al contrato compartido posterior.

Reglas:

1. `external_credential_id` identifica una referencia, no el secreto;
2. el valor secreto no forma parte del inventario documental;
3. una credencial del proveedor no convierte al proveedor en actor VENTO;
4. una credencial emitida por VENTO no concede por sí sola permiso empresarial;
5. custodiar una credencial no convierte a VENTO en su emisor;
6. configurar un secreto en VENTO no demuestra que VENTO lo haya generado;
7. validar una credencial no demuestra que el validador sea su emisor;
8. una credencial puede rotar sin cambiar `IntegrationPrincipal`;
9. un principal puede requerir más de una credencial cuando las fronteras sean independientes;
10. una misma credencial no se fusiona entre bindings por compartir proveedor.

---

#### 8. Credenciales emitidas por proveedor

Cuando la procedencia esté acreditada como proveedor→VENTO:

- el proveedor o plataforma conserva la autoridad técnica sobre emisión o asignación de ese material;
- VENTO conserva la referencia, custodia y uso que le correspondan;
- el material se usa exclusivamente en la frontera para la que fue emitido;
- ninguna credencial externa habilita escritura transversal en dominios VENTO;
- `service_role` de Supabase permanece dentro de la frontera VENTO/Supabase y no se entrega a Wompi, RevenueCat, Resend, Expo, Sentry, Google, Apple, Vercel, Zebra ni a otro tercero;
- una clave publicable o DSN visible no se reetiqueta como secreto únicamente por ser una referencia de acceso;
- una API key del proveedor no se reetiqueta como `PermissionKey`.

Esta tarea no define todavía scope, ambiente, almacenamiento ni rotación.

---

#### 9. Credenciales emitidas por VENTO

Una credencial `VENTO_EMITIDA` debe cumplir conceptualmente:

```text
EMISOR = VENTO
PRESENTADOR = CONTRAPARTE TÉCNICA AUTORIZADA
VALIDADOR = FRONTERA VENTO CORRESPONDIENTE
AUTORIDAD EMPRESARIAL = NO DERIVADA
```

La evidencia actual acredita una superficie de este tipo en `EXT-SYS-009`:

- el servicio Wallet genera un `authenticationToken` aleatorio;
- el token se incorpora al pase cuando existe `webServiceURL`;
- el cliente Wallet lo presenta contra el servicio del pase;
- el token no es el usuario, el principal técnico ni el permiso empresarial.

No se generaliza este patrón a otros sistemas sin evidencia.

---

#### 10. Material compartido o de procedencia no demostrada

La presencia de un valor idéntico en ambos extremos no permite inferir quién lo emitió.

Para secretos de webhook o materiales cuya ceremonia de creación no está documentada, la decisión canónica es:

```text
ORIGEN_NO_ACREDITADO
```

hasta disponer de evidencia que demuestre:

- quién creó o asignó el material;
- a qué cuenta o instancia pertenece;
- quién lo presenta;
- quién lo valida;
- qué referencia interna lo representa.

No se reconstruye la procedencia a partir de naming, intuición o documentación genérica del proveedor.

---

#### 11. Elementos que no son credenciales por sí solos

No se clasifican como credenciales:

- `PermissionKey`;
- `IntegrationPrincipal`;
- `external_system_id`;
- `external_instance_id`;
- endpoint o URL;
- `projectId`;
- `place_id`;
- coordenadas;
- UID o nombre de impresora;
- push token usado únicamente como dirección de entrega;
- número telefónico;
- alias de correo;
- identificador de pedido, pago, evento, receipt o tracking;
- `provider_account_ref` por sí solo;
- actor humano;
- rol empresarial;
- sesión humana;
- payload, hash o firma ya producida.

Si alguno de esos elementos participa posteriormente en un mecanismo de autenticación, la tarea correspondiente deberá documentar ese mecanismo sin reescribir su naturaleza base.

---

#### 12. Frontera con principal técnico

La procedencia de credencial no altera las 21 decisiones de `INT-EXT-002`.

Se mantiene:

```text
IntegrationPrincipal
→ QUIÉN EJECUTA TÉCNICAMENTE

ExternalCredentialId
→ QUÉ CREDENCIAL REFERENCIADA AUTENTICA ESA EJECUCIÓN

credential_issuer_class
→ QUIÉN EMITIÓ O ASIGNÓ ESA CREDENCIAL
```

Una rotación futura de credencial no deberá fabricar un principal nuevo salvo que cambie realmente la identidad técnica de la integración.

---

#### 13. Evidencia técnica utilizada

La clasificación de bindings observados se apoya en evidencia actual de repositorio:

- Wompi: `payments-create-intent` y `payments-webhook` usan referencias `WOMPI_*` para checkout y validación de eventos;
- RevenueCat: PASS configura el SDK con API keys por plataforma y el webhook usa un secreto configurado;
- Resend: `staff-invitations-create` usa `RESEND_API_KEY` para la API de correo;
- Expo Push: el envío observado usa el endpoint de push y tokens de destino sin header de credencial externa;
- Sentry: ANIMA inicializa el SDK con `EXPO_PUBLIC_SENTRY_DSN`;
- Google Maps: PASS usa `EXPO_PUBLIC_GOOGLE_MAPS_API_KEY` cuando la vista cartográfica está habilitada;
- Apple Wallet/APNs: PASS usa material de firma/push configurado y genera además el `authenticationToken` de pase bajo control de VENTO;
- Vercel: la configuración inspeccionada acredita rewrites/headers, no una credencial;
- Zebra BrowserPrint: NEXO detecta y selecciona dispositivos mediante el bridge local y UID, sin credencial externa observada;
- Expo/EAS Update: ANIMA acredita `expoProjectId` y `u.expo.dev`, no una credencial física en la configuración inspeccionada.

No se inspeccionaron ni expusieron valores secretos.

---

#### 14. Pendientes de evidencia con destino documental

Los estados no acreditados tienen dueño y condición de salida:

| Caso                                              | Propietario documental                    | Tarea / artefacto responsable                     | Condición de salida                                                                             |
| ------------------------------------------------- | ----------------------------------------- | ------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| Referencia física de credencial sin valor secreto | BLOQUE H / BLOQUE X                       | `SHELL-CON-018`                                   | existir `external_credential_id` con sistema, instancia y procedencia respaldados por evidencia |
| Mecanismo que consume cada credencial             | BLOQUE X                                  | `INT-EXT-004`                                     | mecanismo exacto definido sin alterar procedencia                                               |
| Alcance permitido de la credencial                | BLOQUE X                                  | `INT-EXT-005`                                     | alcance mínimo definido por binding                                                             |
| Separación por ambiente                           | BLOQUE X                                  | `INT-EXT-006`                                     | cada referencia física ligada a un ambiente sin reutilización cruzada                           |
| Custodia del valor secreto                        | BLOQUE X                                  | `INT-EXT-007`                                     | mecanismo de almacenamiento definido sin exponer el valor                                       |
| Rotación, expiración y revocación                 | BLOQUE X                                  | `INT-EXT-008`                                     | lifecycle definido para cada familia aplicable                                                  |
| Binding futuro hoy no acreditado                  | BLOQUE X + propietario funcional heredado | tarea especializada del sistema y `SHELL-CON-018` | proveedor, instancia, binding y referencia de credencial acreditados antes de activación        |

Ninguno de estos pendientes cambia la decisión actual de procedencia: cuando la evidencia no permite afirmar emisor, el estado documental correcto es `ORIGEN_NO_ACREDITADO` o `NO_APLICA_ACTUAL`.

---

#### 15. Reconciliación con el inventario heredado

La clasificación de evidencia de `INT-EXT-001` se conserva exactamente:

| Clasificación heredada               | Cantidad |
| ------------------------------------ | -------: |
| `BINDING_TECNICO_OBSERVADO`          |    **3** |
| `BINDING_CONDICIONAL_OBSERVADO`      |    **6** |
| `CONFIGURACION_OBSERVADA`            |    **2** |
| `DOCUMENTADO_SIN_BINDING_ACREDITADO` |    **6** |
| `PROVEEDOR_NO_ACREDITADO`            |    **4** |
| **Total**                            |   **21** |

La nueva clasificación de procedencia no sustituye esa distribución. Ambas dimensiones permanecen ortogonales.

---

#### 16. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

La tarea no introduce un mecanismo ejecutable nuevo, una nueva autoridad, una nueva credencial física ni una nueva capacidad técnica. Materializa la procedencia documental sobre identidades ya inventariadas y especializa reglas vigentes que ya separan principal técnico, credencial, secreto, actor humano, autoridad empresarial, auditoría y frontera de adaptador.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

El registro canónico de requisitos permanece sin cambios.

---

#### 17. Criterios de aceptación

1. se preservan exactamente `EXT-SYS-001` a `EXT-SYS-021`;
2. existen exactamente 21 decisiones;
3. faltantes = 0;
4. duplicados = 0;
5. se preserva la distribución heredada 3 + 6 + 2 + 6 + 4;
6. cada identidad declara una procedencia o ausencia de procedencia acreditable;
7. se distingue `PROVEEDOR_ACREDITADO_EN_BINDING` de `VENTO_EMITIDA`;
8. se admite más de una procedencia dentro de una plataforma cuando existan superficies independientes;
9. `EXT-SYS-009` conserva separada la credencial generada por VENTO del material asociado a Apple;
10. un secreto configurado localmente no se declara emitido por VENTO sin evidencia;
11. un token de destino no se convierte en credencial de integración;
12. una URL, ID de proyecto, UID de impresora, alias o número telefónico no se convierte en credencial;
13. `service_role` permanece credencial privilegiada interna y no autoridad empresarial;
14. ninguna credencial externa se entrega como acceso directo a varios dominios VENTO;
15. ninguna credencial se convierte en `PermissionKey`;
16. ninguna credencial se convierte en `IntegrationPrincipal`;
17. no se crean valores físicos de credencial;
18. no se crean cuentas;
19. no se crean secretos;
20. no se selecciona un mecanismo de autenticación futuro;
21. no se definen scopes;
22. no se define separación por ambientes;
23. no se define almacenamiento de secretos;
24. no se define rotación o expiración;
25. no se modifica Supabase;
26. no se modifica código;
27. no se ejecuta despliegue;
28. cada caso no acreditado tiene destino documental y condición de salida;
29. se crean cero requisitos de prueba;
30. se modifican cero requisitos de prueba;
31. `INT-EXT-004` permanece reservada.

---

#### 18. Resultado de la tarea

`INT-EXT-003` deja diferenciada documentalmente la procedencia de credenciales para las 21 identidades externas.

El modelo resultante permite representar:

```text
SISTEMA EXTERNO
+
PRINCIPAL TÉCNICO
+
REFERENCIA DE CREDENCIAL
+
PROCEDENCIA DE CREDENCIAL
+
PRESENTADOR
+
VALIDADOR
+
PROPIETARIO EMPRESARIAL
+
CONTRATO
```

sin equiparar proveedor, credencial, principal, actor ni permiso.

---

ÚLTIMA TAREA APROBADA

`INT-EXT-002 — Definir principal técnico independiente por integración`

TAREA ACTUAL APROBADA

`INT-EXT-003 — Diferenciar credenciales emitidas por proveedores y credenciales emitidas por Vento`

SIGUIENTE TAREA RESERVADA

`INT-EXT-004 — Definir autenticación mediante API key, OAuth, HMAC, certificado u otro mecanismo`


### ✅ INT-EXT-004 — Definir autenticación mediante API key, OAuth, HMAC, certificado u otro mecanismo

**Estado:** APROBADA
**Tarea anterior:** `INT-EXT-003 — Diferenciar credenciales emitidas por proveedores y credenciales emitidas por Vento` — APROBADA
**Tarea siguiente:** `INT-EXT-005 — Definir alcance mínimo de cada credencial` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materializada del mecanismo de autenticación o verificación técnica aplicable a cada frontera de `EXT-SYS-001` a `EXT-SYS-021`, preservando mecanismos observados, señalando controles parciales y dejando sin selección los bindings no acreditados, sin crear credenciales, secretos, cuentas, scopes, ambientes, almacenamiento, rotación, configuración ni cambios físicos
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

Definir, para las veintiuna identidades externas heredadas, el mecanismo técnico mediante el cual una frontera acredita al presentador, verifica autenticidad o demuestra posesión de material criptográfico cuando la evidencia vigente permite hacerlo.

La tarea distingue obligatoriamente:

```text
MECANISMO DE AUTENTICACIÓN O VERIFICACIÓN
≠
CREDENCIAL O MATERIAL CRIPTOGRÁFICO
≠
PRINCIPAL TÉCNICO
≠
ACTOR HUMANO
≠
AUTORIZACIÓN EMPRESARIAL
≠
IDENTIFICADOR DE DESTINO
```

Una API key, token, certificado, firma, DSN o secreto técnicamente válido nunca concede por sí solo una `PermissionKey`, propiedad sobre un dominio VENTO ni autorización para producir un efecto empresarial.

---

#### 2. Resultado sustantivo

Queda materializado `VENTO-EXTERNAL-AUTHENTICATION-MECHANISM-REGISTER-001` para `EXT-SYS-001` a `EXT-SYS-021`.

Balance de identidades:

| Control                                                                                       |    Resultado |
| --------------------------------------------------------------------------------------------- | -----------: |
| Identidades heredadas esperadas                                                               |       **21** |
| Decisiones documentales materializadas                                                        | **21 de 21** |
| Identidades faltantes                                                                         |        **0** |
| Identidades duplicadas                                                                        |        **0** |
| Identidades con uno o más mecanismos técnicos observados                                      |        **7** |
| Bindings observados sin autenticación externa de cliente en la llamada o bridge inspeccionado |        **2** |
| Configuraciones observadas sin mecanismo físico acreditado                                    |        **2** |
| Modelo de mecanismo documentado sin binding acreditado                                        |        **1** |
| Identidades sin binding actual y sin mecanismo seleccionable                                  |        **9** |
| OAuth acreditado en binding actual                                                            |        **0** |
| HMAC acreditado en binding actual                                                             |        **0** |
| mTLS acreditado en binding actual                                                             |        **0** |
| Cambios físicos                                                                               |        **0** |

Reconciliación:

```text
21 IDENTIDADES
= 7 CON_MECANISMO_OBSERVADO
+ 2 SIN_AUTENTICACION_EXTERNA_DE_CLIENTE_OBSERVADA
+ 2 CONFIGURACION_SIN_MECANISMO_ACREDITADO
+ 1 MODELO_DOCUMENTADO_SIN_BINDING
+ 9 NO_APLICA_ACTUAL
```

La clasificación se realiza por identidad y, cuando una plataforma posee varias superficies independientes, por superficie. Una plataforma no se fuerza a un único mecanismo.

---

#### 3. Entradas canónicas preservadas

La tarea conserva sin alterar:

- `EXT-SYS-001` a `EXT-SYS-021` y su identidad estable;
- la distribución heredada de evidencia **3 + 6 + 2 + 6 + 4 = 21**;
- la separación de `IntegrationPrincipal`, actor humano, autoridad empresarial, cuenta externa, endpoint, dispositivo y secreto;
- la procedencia de credenciales establecida por `INT-EXT-003`;
- la prohibición de entregar `service_role` a integraciones externas;
- la prohibición de tratar `service_role` como sesión humana, principal empresarial o autorización funcional;
- la obligación de conservar referencias de credencial sin exponer valores secretos en metadatos empresariales, respuestas ordinarias o logs;
- la obligación de autenticar o verificar de forma fail-closed las superficies que lo requieran antes de habilitar acceso privilegiado;
- la obligación de que un adaptador externo solicite el efecto a la aplicación propietaria y no utilice una credencial externa como escritor transversal.

Esta tarea no redefine alcance de credenciales, ambientes, custodia, rotación, expiración, revocación, contratos de payload, idempotencia ni conciliación.

---

#### 4. Vocabulario de mecanismos

La tarea usa las siguientes clases documentales sin convertirlas en una enumeración cerrada para proveedores futuros:

| Clase                              | Significado documental                                                                       |
| ---------------------------------- | -------------------------------------------------------------------------------------------- |
| `API_KEY`                          | clave de proyecto, aplicación o proveedor presentada según su contrato                       |
| `API_KEY_BEARER`                   | API key transportada como Bearer en la solicitud                                             |
| `BEARER_TOKEN`                     | token opaco o token de sesión presentado como Bearer o esquema equivalente                   |
| `BEARER_JWT`                       | JWT presentado como token portador y validado por la contraparte                             |
| `CHECKSUM_SHA256_SHARED_SECRET`    | huella SHA-256 construida con datos del mensaje y un secreto compartido; no se denomina HMAC |
| `SHARED_SECRET_HEADER`             | secreto compartido presentado en header y comparado por la contraparte                       |
| `INGESTION_DSN`                    | referencia de ingestión propia de un SDK; no equivale a permiso empresarial                  |
| `CERTIFICATE_SIGNATURE`            | firma de artefacto con certificado y clave privada; no equivale a mTLS                       |
| `SERVICE_ACCOUNT_KEY`              | material de cuenta de servicio documentado para autenticación máquina-a-máquina              |
| `NO_EXTERNAL_CLIENT_AUTH_OBSERVED` | la llamada externa o bridge inspeccionado no presenta credencial de cliente                  |
| `MECHANISM_NOT_ACCREDITED`         | existe sistema o configuración, pero las fuentes actuales no prueban mecanismo físico        |
| `NO_APLICA_ACTUAL`                 | no existe binding acreditado sobre el cual seleccionar mecanismo                             |

`OAuth`, `HMAC` y `mTLS` son mecanismos permitidos conceptualmente cuando un contrato concreto los exija, pero no se declaran activos por analogía, marca, costumbre o documentación genérica.

---

#### 5. Principio de selección por evidencia

La selección documental sigue esta precedencia:

```text
BINDING OBSERVADO
→ preservar mecanismo realmente consumido

CONFIGURACIÓN OBSERVADA SIN CREDENCIAL
→ no inferir mecanismo

DOCUMENTACIÓN SIN BINDING
→ conservar únicamente el modelo explícitamente documentado

PROVEEDOR O BINDING NO ACREDITADO
→ NO_APLICA_ACTUAL
```

Reglas:

1. no se declara OAuth porque un proveedor lo soporte en términos generales;
2. no se declara HMAC cuando el código concatena valores y calcula SHA-256 sin una construcción HMAC;
3. no se declara mTLS por la mera existencia de un certificado;
4. un certificado usado para firmar un pase se clasifica como firma de artefacto, no autenticación TLS mutua;
5. una API key pública continúa siendo API key aunque no deba tratarse como secreto;
6. un DSN de ingestión continúa siendo una referencia de ingestión aunque sea visible en cliente;
7. un push token de dispositivo es un identificador de destino mientras no exista evidencia de que autentica al llamador;
8. `projectId`, URL, `place_id`, UID, correo, número telefónico y tracking no son mecanismos de autenticación;
9. un secreto compartido solo autentica o verifica la frontera exacta para la cual fue establecido;
10. la ausencia de credencial externa en una llamada observada no convierte automáticamente la integración completa en anónima.

---

#### 6. Matriz materializada `VENTO-EXTERNAL-AUTHENTICATION-MECHANISM-REGISTER-001`

| ID            | Sistema / plataforma                     | Evidencia heredada                   | Superficie                                                  | Mecanismo definido                                                                                                                                                    | Estado físico                        | Decisión                                                                                                                                                                                                                                                                                                                                         |
| ------------- | ---------------------------------------- | ------------------------------------ | ----------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `EXT-SYS-001` | Supabase                                 | `BINDING_TECNICO_OBSERVADO`          | Data API/Auth y operaciones server-side                     | `API_KEY` de proyecto combinada con `BEARER_JWT` cuando existe actor; clave privilegiada de proyecto solo server-side para operaciones administrativas internas       | `OBSERVADO`                          | La clave de proyecto identifica la frontera Supabase; el JWT identifica sesión/usuario cuando aplica. La clave privilegiada no sustituye principal, actor ni autorización empresarial y no se comparte con terceros.                                                                                                                             |
| `EXT-SYS-002` | Wompi                                    | `BINDING_CONDICIONAL_OBSERVADO`      | checkout saliente y webhook entrante                        | `API_KEY` pública + `CHECKSUM_SHA256_SHARED_SECRET` para integridad de checkout; `CHECKSUM_SHA256_SHARED_SECRET` para evento entrante                                 | `OBSERVADO`                          | El código calcula SHA-256 sobre datos concatenados y secreto. Se prohíbe denominar este mecanismo HMAC mientras la implementación no use una construcción HMAC real.                                                                                                                                                                             |
| `EXT-SYS-003` | RevenueCat                               | `BINDING_CONDICIONAL_OBSERVADO`      | SDK móvil y webhook                                         | `API_KEY` de SDK por plataforma; `SHARED_SECRET_HEADER` para webhook                                                                                                  | `OBSERVADO`                          | El SDK se configura con API key. El webhook compara directamente el header recibido con el secreto esperado; no existe evidencia de HMAC en el binding observado.                                                                                                                                                                                |
| `EXT-SYS-004` | Resend                                   | `BINDING_CONDICIONAL_OBSERVADO`      | API de envío de correo                                      | `API_KEY_BEARER`                                                                                                                                                      | `OBSERVADO`                          | VENTO presenta la API key de Resend en `Authorization: Bearer`. La autenticación del actor que solicita la invitación permanece separada de la autenticación VENTO→Resend.                                                                                                                                                                       |
| `EXT-SYS-005` | Expo / EAS Update                        | `CONFIGURACION_OBSERVADA`            | proyecto y servicio de actualizaciones                      | `MECHANISM_NOT_ACCREDITED`                                                                                                                                            | `PENDIENTE_DE_EVIDENCIA`             | `projectId` y URL de actualización acreditan configuración, no el mecanismo de autenticación utilizado para publicar o administrar actualizaciones. No se inventa token, OAuth ni cuenta técnica.                                                                                                                                                |
| `EXT-SYS-006` | Expo Push Service                        | `BINDING_TECNICO_OBSERVADO`          | envío HTTP de push                                          | `NO_EXTERNAL_CLIENT_AUTH_OBSERVED`                                                                                                                                    | `OBSERVADO_NO_CREDENCIAL_EXTERNA`    | La llamada inspeccionada envía JSON y tokens de destino sin credencial externa de cliente. El token de dispositivo es destino, no autenticación del llamador. El ingreso al servicio VENTO que origina el envío conserva autenticación interna independiente.                                                                                    |
| `EXT-SYS-007` | Sentry                                   | `BINDING_CONDICIONAL_OBSERVADO`      | SDK de ingestión móvil                                      | `INGESTION_DSN`                                                                                                                                                       | `OBSERVADO`                          | ANIMA inicializa Sentry con DSN. El DSN habilita el canal de ingestión correspondiente, pero no se interpreta como secreto empresarial, actor, principal ni autorización funcional.                                                                                                                                                              |
| `EXT-SYS-008` | Google Maps / Google Reviews             | `BINDING_CONDICIONAL_OBSERVADO`      | vista cartográfica y navegación pública                     | `API_KEY` para Maps; sin autenticación técnica para enlaces públicos de navegación/reseña                                                                             | `OBSERVADO`                          | La API key solo aplica a la superficie cartográfica. URL, coordenadas, `place_id` y enlace de reseña no son credenciales ni mecanismos de autenticación.                                                                                                                                                                                         |
| `EXT-SYS-009` | Apple Wallet / PassKit y APNs            | `BINDING_CONDICIONAL_OBSERVADO`      | emisión inicial, firma de `.pkpass`, servicio Wallet y APNs | `BEARER_TOKEN` de sesión para emisión; `CERTIFICATE_SIGNATURE` para `.pkpass`; `BEARER_TOKEN` opaco VENTO por pase para servicio Wallet; `BEARER_JWT` ES256 para APNs | `OBSERVADO_PARCIALMENTE_CONFORME`    | Son cuatro superficies independientes. La firma del pase no es mTLS. APNs usa JWT ES256 firmado con clave P8. El servicio Wallet usa token VENTO por pase; registro, baja y obtención del pase comparan el token, pero la consulta de actualizaciones observada solo exige presencia de token y no acredita comparación contra un pase concreto. |
| `EXT-SYS-010` | Vercel                                   | `CONFIGURACION_OBSERVADA`            | hosting, rewrites y headers                                 | `MECHANISM_NOT_ACCREDITED`                                                                                                                                            | `PENDIENTE_DE_EVIDENCIA`             | La configuración inspeccionada acredita publicación de superficies y headers, no token, OAuth, certificado o cuenta técnica usada para administración/despliegue.                                                                                                                                                                                |
| `EXT-SYS-011` | Zebra BrowserPrint                       | `BINDING_TECNICO_OBSERVADO`          | bridge local de navegador hacia impresora                   | `NO_EXTERNAL_CLIENT_AUTH_OBSERVED`                                                                                                                                    | `OBSERVADO_NO_CREDENCIAL_EXTERNA`    | El código detecta `window.BrowserPrint`, enumera dispositivos y usa UID local. UID, nombre o tipo de impresora no autentican al actor ni constituyen credencial externa.                                                                                                                                                                         |
| `EXT-SYS-012` | Google Wallet / Google Pay & Wallet      | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | cuenta de servicio para Wallet                              | `SERVICE_ACCOUNT_KEY` documentada                                                                                                                                     | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | La guía vigente documenta issuer, class y una cuenta de servicio con material JSON. No existe binding actual acreditado en el repositorio inspeccionado; por tanto no se declara OAuth, JWT runtime ni implementación efectiva.                                                                                                                  |
| `EXT-SYS-013` | POS externo vigente                      | `PROVEEDOR_NO_ACREDITADO`            | proveedor e interfaz no acreditados                         | `NO_APLICA_ACTUAL`                                                                                                                                                    | `BLOQUEADO_POR_EVIDENCIA`            | `INT-POS-001` debe acreditar proveedor, interfaces y límites antes de que pueda seleccionarse mecanismo sin inventarlo.                                                                                                                                                                                                                          |
| `EXT-SYS-014` | Shopify / comercio electrónico           | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | integración no acreditada                                   | `NO_APLICA_ACTUAL`                                                                                                                                                    | `NO_APLICA`                          | Nombrar la plataforma no permite elegir API key, OAuth, HMAC, certificado u otro mecanismo. La activación futura deberá acreditar el binding antes de habilitarse.                                                                                                                                                                               |
| `EXT-SYS-015` | Rappi / marketplace                      | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | integración no acreditada                                   | `NO_APLICA_ACTUAL`                                                                                                                                                    | `NO_APLICA`                          | No se presume mecanismo a partir de la plataforma. La activación futura deberá acreditar el binding y su contrato técnico.                                                                                                                                                                                                                       |
| `EXT-SYS-016` | ManyChat / automatización conversacional | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | integración no acreditada                                   | `NO_APLICA_ACTUAL`                                                                                                                                                    | `NO_APLICA`                          | No se presume API key, OAuth ni token. La activación futura requiere evidencia de cuenta, binding y mecanismo.                                                                                                                                                                                                                                   |
| `EXT-SYS-017` | WhatsApp                                 | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | canal sin proveedor/API acreditados                         | `NO_APLICA_ACTUAL`                                                                                                                                                    | `NO_APLICA`                          | El nombre del canal no determina proveedor ni mecanismo. La activación futura debe acreditar proveedor, cuenta técnica y binding antes de seleccionar autenticación.                                                                                                                                                                             |
| `EXT-SYS-018` | Instagram / social                       | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | canal sin API/binding acreditados                           | `NO_APLICA_ACTUAL`                                                                                                                                                    | `NO_APLICA`                          | Un perfil social no determina OAuth, token ni cuenta técnica. No se selecciona mecanismo sin binding.                                                                                                                                                                                                                                            |
| `EXT-SYS-019` | Correo corporativo y alias funcionales   | `PROVEEDOR_NO_ACREDITADO`            | proveedor e integración no acreditados                      | `NO_APLICA_ACTUAL`                                                                                                                                                    | `BLOQUEADO_POR_EVIDENCIA`            | Dirección, buzón o alias no son mecanismo de autenticación. La selección depende de proveedor y binding acreditados.                                                                                                                                                                                                                             |
| `EXT-SYS-020` | Telefonía / voz                          | `PROVEEDOR_NO_ACREDITADO`            | operador e integración no acreditados                       | `NO_APLICA_ACTUAL`                                                                                                                                                    | `BLOQUEADO_POR_EVIDENCIA`            | Número, extensión o caller ID no autentican una integración. La selección depende del contrato del proveedor acreditado.                                                                                                                                                                                                                         |
| `EXT-SYS-021` | Transporte externo                       | `PROVEEDOR_NO_ACREDITADO`            | proveedor, tracking e interfaz no acreditados               | `NO_APLICA_ACTUAL`                                                                                                                                                    | `BLOQUEADO_POR_EVIDENCIA`            | Tracking, número de guía o portal no son credencial. `INT-EXT-004` no inventa un mecanismo antes de existir proveedor y binding acreditados.                                                                                                                                                                                                     |

---

#### 7. Decisiones por familia de mecanismo

##### 7.1. API key

`API_KEY` queda acreditada actualmente en superficies de Supabase, Wompi, RevenueCat, Resend y Google Maps.

Reglas:

- la API key se vincula a la integración exacta y nunca a un permiso empresarial;
- una API key publicable o destinada a cliente no se reetiqueta como secreto de servidor;
- una API key privilegiada permanece server-side;
- la presencia de una API key no habilita escrituras sobre dominios ajenos;
- los límites de operación concretos pertenecen a la tarea siguiente.

##### 7.2. OAuth

No existe binding actual de las veintiuna identidades cuya evidencia inspeccionada permita afirmar OAuth como mecanismo efectivo.

Por tanto:

```text
OAUTH_ACTUAL_ACREDITADO = 0
```

Un binding futuro solo podrá usar OAuth cuando el contrato del proveedor, la cuenta técnica y el flujo autorizado estén acreditados. No se selecciona OAuth por ser una práctica habitual del proveedor.

##### 7.3. HMAC

No existe binding actual cuya implementación inspeccionada utilice una construcción HMAC acreditada.

En particular, Wompi calcula SHA-256 sobre datos concatenados con un secreto compartido. Ese patrón queda clasificado como `CHECKSUM_SHA256_SHARED_SECRET` y no como HMAC.

```text
HMAC_ACTUAL_ACREDITADO = 0
```

##### 7.4. Certificado y clave privada

Apple Wallet acredita `CERTIFICATE_SIGNATURE` para firmar el artefacto `.pkpass` mediante certificado de Pass Type, clave privada y cadena WWDR.

La finalidad es autenticidad e integridad del artefacto firmado. No se declara TLS mutua.

```text
MTLS_ACTUAL_ACREDITADO = 0
```

##### 7.5. JWT firmado

APNs acredita un `BEARER_JWT` creado con:

```text
alg = ES256
kid = identificador de clave
iss = team identifier
iat = instante de emisión
firma = clave P8
```

El JWT autentica la llamada a APNs dentro de esa superficie. No sustituye el principal técnico VENTO ni autoriza el efecto empresarial que originó la notificación.

##### 7.6. Token opaco emitido por VENTO

El servicio Wallet de PASS acredita un token aleatorio por pase generado por VENTO.

Contrato objetivo:

```text
PASE EXACTO
+
TOKEN OPACO DEL PASE
+
SERVICIO WALLET
→ AUTENTICACIÓN TÉCNICA DE ESA RELACIÓN
```

El token puede presentarse mediante el esquema `ApplePass` o el esquema de portador admitido por el servicio, pero debe validarse contra el pase o registro exacto alcanzado antes de entregar información o modificar registros.

La implementación observada no demuestra esa comparación en la consulta de actualizaciones por dispositivo; por ello esa superficie permanece `PENDIENTE_DE_EVIDENCIA` para conformidad física completa.

##### 7.7. Secreto compartido

Los secretos compartidos observados se limitan a la frontera exacta que los consume.

Se distinguen:

- secreto usado como componente de checksum;
- secreto presentado directamente en un header;
- secreto interno VENTO usado para invocaciones entre servicios internos.

No se fusionan estas formas bajo una sola etiqueta y no se asume que un secreto compartido sea HMAC.

---

#### 8. Autenticación de entrada y de salida

Toda integración material deberá distinguir dirección:

```text
VENTO → PROVEEDOR
```

requiere autenticar a VENTO cuando el proveedor lo exija.

```text
PROVEEDOR / CLIENTE TÉCNICO → VENTO
```

requiere verificar origen o posesión de credencial cuando el contrato lo exija.

Una plataforma puede utilizar mecanismos distintos en cada dirección.

Ejemplos ya observados:

- Wompi: checkout saliente y webhook entrante usan superficies distintas aunque compartan familia de secreto;
- RevenueCat: API key de SDK y secreto de webhook son mecanismos independientes;
- Apple: emisión, firma, servicio Wallet y APNs son superficies independientes;
- Supabase: sesión de usuario y acceso privilegiado server-side no son intercambiables.

---

#### 9. Autenticación y autorización permanecen separadas

Secuencia obligatoria para un efecto protegido:

```text
SOLICITUD / EVENTO
→ mecanismo técnico válido
→ principal técnico identificable
→ contrato vigente
→ aplicación propietaria
→ autorización empresarial independiente
→ validación de recurso y estado
→ efecto o rechazo
→ auditoría
```

Reglas:

1. autenticación exitosa no implica `ALLOW` empresarial;
2. un webhook auténtico puede contener un evento inválido, duplicado, fuera de contrato o no aplicable;
3. una API key válida no habilita un RPC ajeno;
4. un JWT válido no concede propiedad de datos;
5. un certificado válido no convierte un artefacto en hecho empresarial;
6. un token de servicio válido no sustituye al actor humano cuando el contrato exige actor;
7. una respuesta técnica del proveedor no cierra conciliación ni resultado empresarial.

---

#### 10. Regla fail-closed

Cuando una superficie exija autenticación o verificación:

- ausencia de credencial requerida bloquea la operación;
- credencial inválida bloquea la operación;
- firma o checksum inválidos bloquean antes del uso privilegiado posterior;
- mecanismo desconocido no recibe fallback permisivo;
- una referencia de credencial sin material disponible no se interpreta como autenticada;
- indisponibilidad de la verificación no se convierte en autenticación exitosa;
- el error no habilita `service_role` hacia el solicitante;
- el proveedor no recibe una credencial interna VENTO para compensar una integración mal configurada.

La tarea no define todavía política de reintento, expiración ni rotación.

---

#### 11. Materiales que no deben confundirse con mecanismo

No constituyen por sí solos autenticación:

- `PermissionKey`;
- `IntegrationPrincipal`;
- `external_system_id`;
- `external_instance_id`;
- URL o endpoint;
- `projectId`;
- `place_id`;
- coordenadas;
- UID o nombre de impresora;
- push token usado como destino;
- número telefónico;
- alias o dirección de correo;
- tracking o número de guía;
- identificador de evento o transacción;
- `provider_account_ref`;
- nombre del proveedor;
- una firma ya calculada sin la regla que permite verificarla.

---

#### 12. Estado especial de Apple Wallet

`EXT-SYS-009` requiere preservar cuatro planos:

| Plano                                 | Mecanismo                                               | Evidencia documental                           |
| ------------------------------------- | ------------------------------------------------------- | ---------------------------------------------- |
| Solicitud inicial de pase por usuario | `BEARER_TOKEN` de sesión Supabase                       | observado                                      |
| Autenticidad del `.pkpass`            | `CERTIFICATE_SIGNATURE` con certificado y clave privada | observado                                      |
| Servicio web del pase                 | token opaco VENTO por pase                              | observado con control parcial en una operación |
| Push APNs                             | `BEARER_JWT` ES256 firmado con clave P8                 | observado                                      |

El fallback actual que permite recibir el token de sesión inicial por parámetro de consulta se registra como comportamiento observado y no amplía el mecanismo aprobado: el contrato objetivo exige un canal de autorización que no convierta el token en identificador de navegación, logging o referencia compartible.

La consulta de actualizaciones por dispositivo deberá demostrar validación del token contra el conjunto de pases autorizado; comprobar únicamente que el header contiene algún token no satisface el contrato objetivo.

---

#### 13. Estado especial de Google Wallet

`EXT-SYS-012` conserva únicamente el mecanismo documentado:

```text
CUENTA DE SERVICIO
+
MATERIAL JSON DE LA CUENTA
+
ISSUER / CLASS
```

La guía no acredita un binding runtime vigente en el estado inspeccionado. Por tanto:

- no se declara implementación;
- no se declara OAuth activo;
- no se declara JWT runtime activo;
- no se declara cuenta de servicio existente o vigente más allá del modelo documental;
- no se reutiliza el material Apple;
- la futura evidencia física deberá demostrar la cuenta, binding y mecanismo efectivo antes de cambiar el estado.

---

#### 14. Bindings sin autenticación externa observada

`EXT-SYS-006` y `EXT-SYS-011` no reciben un mecanismo ficticio.

Para Expo Push:

- la llamada externa inspeccionada no presenta credencial de cliente;
- los tokens de push son destinos;
- la función VENTO que origina el envío puede exigir autenticación propia en su frontera interna;
- esa autenticación interna no se reetiqueta como credencial de Expo.

Para Zebra BrowserPrint:

- el bridge local y el UID permiten descubrir/seleccionar dispositivo;
- no se observó handshake de credencial externa;
- identidad del dispositivo y autorización del actor permanecen problemas separados.

---

#### 15. Identidades sin binding acreditado

Para `EXT-SYS-013` a `EXT-SYS-021`, excepto los modelos documentales ya diferenciados, la decisión es deliberadamente no elegir un mecanismo.

Regla de activación futura:

```text
PROVEEDOR ACREDITADO
+
INSTANCIA ACREDITADA
+
BINDING ACREDITADO
+
DIRECCIÓN DE INTERCAMBIO
→ SELECCIÓN DEL MECANISMO REAL
→ REFERENCIA DE CREDENCIAL
→ PRUEBA FAIL-CLOSED
→ ACTIVACIÓN
```

No se habilitará una integración porque el proveedor soporte una lista conocida de mecanismos. El mecanismo debe corresponder al binding que VENTO realmente contrate y materialice.

---

#### 16. Handoffs y condiciones de salida

| Pendiente                                                                                        | Estado                    | Propietario / tarea responsable                                                                                        | Condición de salida                                                                                                       |
| ------------------------------------------------------------------------------------------------ | ------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| Referencia física de credencial asociada al mecanismo                                            | `FUERA_DE_ALCANCE`        | `SHELL-CON-018`                                                                                                        | contrato consumible enlaza principal, sistema, credencial y mecanismo sin exponer secreto                                 |
| Alcance técnico mínimo por credencial                                                            | `FUERA_DE_ALCANCE`        | `INT-EXT-005`                                                                                                          | cada credencial queda limitada a capacidades técnicas mínimas documentadas                                                |
| Separación por ambiente                                                                          | `FUERA_DE_ALCANCE`        | `INT-EXT-006`                                                                                                          | material y referencias independientes por ambiente según contrato aprobado                                                |
| Custodia de secretos                                                                             | `FUERA_DE_ALCANCE`        | `INT-EXT-007`                                                                                                          | mecanismo de almacenamiento y acceso aprobado sin exposición en cliente o metadata empresarial                            |
| Rotación, expiración y revocación                                                                | `FUERA_DE_ALCANCE`        | `INT-EXT-008`                                                                                                          | lifecycle completo definido por familia de credencial                                                                     |
| Proveedor y binding exactos del POS                                                              | `BLOQUEADO_POR_EVIDENCIA` | `INT-POS-001`                                                                                                          | proveedor, interfaces, credenciales y límites auditados con evidencia                                                     |
| Verificación completa del token del servicio Wallet en consulta de actualizaciones               | `PENDIENTE_DE_EVIDENCIA`  | `INT-EXT-004` como contrato de autenticación hasta que una fase de implementación autorizada materialice `EXT-SYS-009` | la consulta rechaza tokens ausentes o no vinculados al conjunto de pases solicitado y existe prueba negativa reproducible |
| Binding físico de Google Wallet                                                                  | `PENDIENTE_DE_EVIDENCIA`  | `INT-EXT-004` como contrato de autenticación hasta que una fase de implementación autorizada materialice `EXT-SYS-012` | cuenta de servicio, issuer, class y autenticación runtime acreditados sin exponer la clave                                |
| Mecanismos de Expo/EAS y Vercel administrativos                                                  | `PENDIENTE_DE_EVIDENCIA`  | `INT-EXT-004` para la decisión de mecanismo; BLOQUE Z conserva gobierno tecnológico de la plataforma                   | la automatización o cuenta técnica efectiva queda inventariada con principal, mecanismo y referencia de credencial        |
| Bindings futuros de Shopify, Rappi, ManyChat, WhatsApp, Instagram y demás canales no acreditados | `NO_APLICA` actualmente   | `INT-EXT-004` conserva la puerta de mecanismo hasta que exista una tarea canónica concreta que autorice el binding     | antes de activar, el binding vuelve con evidencia suficiente para materializar mecanismo y referencia de credencial       |

Los pendientes sin paquete ejecutable específico permanecen vinculados a `INT-EXT-004` como contrato de autenticación y no generan identificadores ficticios. Cuando la secuencia canónica cree o active una tarea de implementación aplicable, el handoff podrá trasladarse explícitamente sin perder la condición de salida.

---

#### 17. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Justificación: la tarea selecciona o clasifica documentalmente mecanismos sobre fronteras ya inventariadas y no incorpora una nueva capacidad ejecutable, una nueva credencial, un nuevo endpoint, una nueva autoridad, un nuevo transporte ni una nueva operación empresarial. El registro vigente ya protege autenticación mínima de integraciones, verificación de origen, separación entre principal técnico y actor, tratamiento fail-closed de servicios privilegiados, prohibición de exposición de secretos y prohibición de convertir credenciales técnicas en autoridad empresarial.

La brecha física observada en una operación del servicio Wallet es una falta de conformidad de implementación frente a controles ya existentes; no crea una regla protegida nueva.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

El registro canónico de requisitos permanece sin cambios.

---

#### 18. Prohibiciones

Queda prohibido:

1. declarar OAuth sin evidencia del flujo efectivo;
2. declarar HMAC cuando solo existe SHA-256 con secreto concatenado;
3. declarar mTLS por observar un certificado de firma;
4. convertir un push token en credencial de la integración;
5. convertir `projectId`, URL, UID, `place_id`, correo, teléfono o tracking en autenticación;
6. entregar `service_role` a un proveedor externo;
7. tratar `service_role` como actor, principal empresarial o permiso;
8. reutilizar una credencial técnica como `PermissionKey`;
9. inferir autenticación desde el nombre de una variable;
10. inferir autenticación desde una cuenta documentada que no tiene binding acreditado;
11. compartir un mecanismo o credencial entre integraciones únicamente por pertenecer al mismo proveedor;
12. asumir que autenticidad de mensaje equivale a autorización del efecto;
13. omitir validación del vínculo entre token y recurso cuando el mecanismo sea por recurso;
14. aceptar fallback permisivo cuando falta material requerido;
15. crear credenciales, secretos o cuentas dentro de esta tarea;
16. cambiar scopes dentro de esta tarea;
17. cambiar credenciales por ambiente dentro de esta tarea;
18. definir almacenamiento físico de secretos dentro de esta tarea;
19. rotar, revocar o expirar credenciales dentro de esta tarea;
20. modificar Supabase;
21. modificar código;
22. desplegar servicios;
23. cambiar las veintiuna identidades heredadas;
24. iniciar o desarrollar `INT-EXT-005`.

---

#### 19. Criterios de aceptación

1. se preservan exactamente `EXT-SYS-001` a `EXT-SYS-021`;
2. existen exactamente 21 decisiones materializadas;
3. faltantes = 0;
4. duplicados = 0;
5. se conserva la distribución heredada 3 + 6 + 2 + 6 + 4;
6. siete identidades conservan uno o más mecanismos observados;
7. dos bindings observados conservan ausencia de autenticación externa de cliente sin inventar credencial;
8. dos configuraciones observadas permanecen sin mecanismo acreditado;
9. un modelo de cuenta de servicio permanece documentado sin binding acreditado;
10. nueve identidades sin binding permanecen sin mecanismo seleccionado;
11. OAuth activo acreditado = 0;
12. HMAC activo acreditado = 0;
13. mTLS activo acreditado = 0;
14. Wompi se clasifica como API key y checksum SHA-256 con secreto, no HMAC;
15. RevenueCat separa API key de SDK y secreto compartido de webhook;
16. Resend conserva API key transportada como Bearer;
17. Sentry conserva DSN de ingestión;
18. Google Maps conserva API key y sus enlaces públicos no se convierten en credenciales;
19. Apple conserva emisión, firma, servicio Wallet y APNs como superficies distintas;
20. la firma `.pkpass` con certificado no se declara mTLS;
21. APNs conserva JWT ES256 firmado con clave P8;
22. el token Wallet permanece por pase y debe validarse contra el recurso alcanzado;
23. Expo Push no convierte push token en autenticación del llamador;
24. Zebra no convierte UID del dispositivo en credencial;
25. Google Wallet conserva solo el modelo de cuenta de servicio documentado;
26. no se crean credenciales;
27. no se crean secretos;
28. no se crean cuentas;
29. no se definen scopes;
30. no se definen ambientes;
31. no se define almacenamiento físico de secretos;
32. no se define rotación;
33. no se modifica Supabase;
34. no se modifica código;
35. no se ejecuta despliegue;
36. se crean cero requisitos de prueba;
37. se modifican cero requisitos de prueba;
38. `INT-EXT-005` permanece reservada.

---

#### 20. Resultado de la tarea

`INT-EXT-004` deja materializada la selección documental de mecanismos para las veintiuna identidades externas sin convertir soporte teórico del proveedor en implementación VENTO.

El modelo resultante exige conservar:

```text
SISTEMA / INSTANCIA
+
DIRECCIÓN DEL BINDING
+
PRINCIPAL TÉCNICO
+
REFERENCIA DE CREDENCIAL
+
PROCEDENCIA DE CREDENCIAL
+
MECANISMO REAL
+
RECURSO O MENSAJE ALCANZADO
+
AUTORIZACIÓN EMPRESARIAL INDEPENDIENTE
+
AUDITORÍA
```

sin transformar API key, token, firma, certificado, DSN, cuenta de servicio o secreto en autoridad empresarial.

---

ÚLTIMA TAREA APROBADA

`INT-EXT-003 — Diferenciar credenciales emitidas por proveedores y credenciales emitidas por Vento`

TAREA ACTUAL APROBADA

`INT-EXT-004 — Definir autenticación mediante API key, OAuth, HMAC, certificado u otro mecanismo`

SIGUIENTE TAREA RESERVADA

`INT-EXT-005 — Definir alcance mínimo de cada credencial`


### ✅ INT-EXT-005 — Definir alcance mínimo de cada credencial

**Estado:** APROBADA
**Tarea anterior:** `INT-EXT-004 — Definir autenticación mediante API key, OAuth, HMAC, certificado u otro mecanismo` — APROBADA
**Tarea siguiente:** `INT-EXT-006 — Separar credenciales de desarrollo, staging y producción` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materializada del alcance técnico mínimo aplicable a cada credencial o superficie de credencial de `EXT-SYS-001` a `EXT-SYS-021`, preservando mecanismos y bindings acreditados, cerrando por defecto los no acreditados y sin crear credenciales, secretos, cuentas, ambientes, almacenamiento, rotación, configuración ni cambios físicos
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

Esta tarea materializa el contrato `VENTO-EXTERNAL-CREDENTIAL-MINIMUM-SCOPE-001` para las veintiuna identidades `EXT-SYS-001..021` heredadas de `INT-EXT-001`.

El contrato fija, para cada identidad y para cada superficie de credencial acreditada o documentada, el **máximo alcance técnico permitido**. Una credencial técnica no concede autoridad empresarial por sí misma y no puede ampliar el principal, actor, recurso, dominio, sede, área, operación o efecto autorizado por los contratos internos de VENTO.

---

#### 2. Resultado sustantivo

Queda materializado `VENTO-EXTERNAL-CREDENTIAL-MINIMUM-SCOPE-001` para `EXT-SYS-001` a `EXT-SYS-021`.

- 21 identidades esperadas;
- 21 identidades materializadas;
- 0 identidades faltantes;
- 0 identidades duplicadas;
- 0 credenciales autorizadas con alcance global por defecto;
- 0 terceros autorizados a recibir `service_role`;
- 0 credenciales de lectura autorizadas para reutilización de escritura;
- 0 credenciales externas autorizadas para mutar múltiples dominios empresariales por el solo hecho de autenticarse correctamente.

---

#### 3. Entradas canónicas preservadas

La tarea conserva sin alterar:

- las veintiuna identidades `EXT-SYS-001` a `EXT-SYS-021` heredadas de `INT-EXT-001`;
- el principal técnico independiente definido por `INT-EXT-002`;
- la procedencia separada de credenciales establecida por `INT-EXT-003`;
- el mecanismo técnico o estado de mecanismo materializado por `INT-EXT-004`;
- la separación obligatoria entre `PermissionKey`, `IntegrationPrincipal`, `ExternalCredentialId` y valor secreto;
- la prohibición de entregar `service_role` a integraciones externas, aplicaciones cliente, navegadores o dispositivos;
- la obligación de que autenticación técnica y autorización empresarial permanezcan separadas;
- la regla de que una credencial de lectura no se reutiliza para escritura;
- la regla de que una credencial externa no convierte al proveedor en escritor transversal de dominios VENTO;
- la distribución heredada de 21 identidades sin faltantes ni duplicados.

Esta tarea no redefine ambientes, custodia, rotación, expiración, revocación, contratos de payload, idempotencia, rate limits, contingencia ni retiro de integración.

---

#### 4. Vocabulario de alcance

| Término                | Definición                                                                                                                                               |
| ---------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `minimum_scope`        | Conjunto mínimo de operaciones, recursos y superficies que justifican la existencia de una credencial.                                                   |
| `scope_ceiling`        | Techo que la credencial no puede superar aunque el proveedor o el secreto físico técnicamente permitan más.                                              |
| `provider_enforcement` | Restricción aplicada por el proveedor mediante scopes, permisos, roles, restricciones de API, proyecto, aplicación, issuer, clase, tópico o equivalente. |
| `vento_enforcement`    | Restricción adicional aplicada por adapter, función, contrato, RPC, RLS, allowlist de operación o validación server-side de VENTO.                       |
| `business_authority`   | Autorización empresarial de VENTO. Nunca se deriva de una API key, token, firma, certificado, DSN, service account o `service_role`.                     |
| `destination_token`    | Identificador de destino, como un push token. No se clasifica como credencial de autoridad del proveedor.                                                |
| `public_identifier`    | Identificador público o semipúblico usado para seleccionar proyecto, aplicación, issuer, clase o recurso. No se eleva a secreto por su sola presencia.   |

---

#### 5. Principio de mínimo privilegio

1. **Default deny de alcance.** Toda operación no listada en el contrato de una credencial se considera fuera de alcance.
2. **Separación de autenticación y autorización.** Una credencial válida acredita una relación técnica; no concede permiso empresarial sobre datos o acciones VENTO.
3. **Separación lectura/escritura.** Una credencial destinada exclusivamente a lectura, consulta, ingestión o verificación no puede reutilizarse para mutación.
4. **Separación inbound/outbound.** Un secreto usado para validar un webhook no puede convertirse en credencial de salida al proveedor.
5. **Separación por proveedor e integración.** Una credencial no puede reutilizarse para otra identidad `EXT-SYS-*` ni para otro proveedor.
6. **Separación por dominio.** Una credencial externa no puede justificar mutaciones laterales en varios dominios empresariales. El adapter propietario transforma el intercambio y el dueño del hecho aplica el efecto interno autorizado.
7. **`service_role` no sale de VENTO.** No se entrega a proveedores, aplicaciones cliente, navegadores, dispositivos ni integraciones externas. Cuando una función interna lo usa, el alcance permitido queda limitado por su contrato de invocación, operaciones server-side y recursos propietarios, aunque la clave física sea técnicamente más amplia.
8. **Restricción por proveedor cuando exista.** Si el proveedor soporta scopes, roles, APIs habilitadas, application restrictions, issuer/class, topic, proyecto o recurso, se deberá seleccionar la restricción mínima compatible con el uso aprobado.
9. **Restricción VENTO complementaria.** Cuando el mecanismo del proveedor no pueda expresar el mínimo privilegio requerido, el adapter VENTO deberá imponer una allowlist estricta de endpoint, método, recurso, acción y efecto.
10. **Nada implícito por `null`, ausencia o desconocido.** Falta de evidencia de scope no significa scope global; significa alcance físico no acreditado.
11. **Sin reutilización por conveniencia.** Una credencial con capacidad técnica sobrante no habilita usos futuros. Todo uso nuevo exige revisión contractual y nueva decisión de alcance.
12. **Sin mezcla con ambientes.** La separación entre desarrollo, staging y producción pertenece a `INT-EXT-006`; esta tarea define el alcance funcional, no la distribución ambiental.
13. **Custodia y rotación separadas.** Almacenamiento seguro pertenece a `INT-EXT-007` y rotación, expiración y revocación a `INT-EXT-008`; ninguna de esas tareas podrá ampliar el alcance aquí fijado.

---

#### 6. Matriz materializada `VENTO-EXTERNAL-CREDENTIAL-MINIMUM-SCOPE-001`

| ID            | Sistema / proveedor           | Superficie de credencial o mecanismo                                                                   | Alcance mínimo autorizado                                                                                                                                                                                                                                                                                                                                                              | Prohibiciones expresas                                                                                                                                                                                                                                      | Estado                                 | Evidencia / bloqueo y propietario                                                                                                                                                                                                                                                                                                                                                                                                                      |
| ------------- | ----------------------------- | ------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `EXT-SYS-001` | Supabase                      | project key pública o publishable/anon + bearer de usuario + credencial privilegiada server-side       | La clave cliente solo identifica el proyecto y accede a superficies permitidas por RLS/contratos; el bearer representa únicamente la sesión del actor autenticado; la credencial privilegiada solo puede ser consumida server-side por funciones/adapters propietarios para las operaciones exactas que su contrato requiera.                                                          | Nada de `service_role` en cliente o tercero; nada de bypass genérico; ninguna clave técnica sustituye permiso, actor, scope o recurso; ninguna función puede usar privilegio amplio para mutar dominios ajenos.                                             | `SCOPE_MATERIALIZADO_EN_USO_OBSERVADO` | Uso server-side amplio físicamente por naturaleza de `service_role`; la conformidad se demuestra en la frontera de función/RPC/grants. Gobierno y hardening: `SUPA-ARC-015`, `SUPA-AUD-014`, `SUPA-AUD-015`, `SHELL-CI-017`.                                                                                                                                                                                                                           |
| `EXT-SYS-002` | Wompi                         | `WOMPI_PUBLIC_KEY` + `WOMPI_INTEGRITY_SECRET` + secreto de eventos                                     | Checkout: construir exclusivamente la solicitud de checkout de una transacción VENTO ya autorizada con referencia, monto, moneda, expiración y redirect aprobados. Eventos: verificar exclusivamente autenticidad/checksum del webhook recibido.                                                                                                                                       | La public key o secreto de integridad no autorizan reembolsos, administración de comercio, lectura masiva, cambio de transacciones ni otras APIs; el secreto de eventos no puede usarse como credencial outbound; el webhook no muta directamente dominios. | `SCOPE_MATERIALIZADO_EN_USO_OBSERVADO` | Alcance funcional observable en `payments-create-intent` y `payments-webhook`; restricciones proveedor-side adicionales deberán reconciliarse en `INT-EXT-009` y auditarse en `INT-EXT-017`.                                                                                                                                                                                                                                                           |
| `EXT-SYS-003` | RevenueCat                    | API key pública de SDK por plataforma + secreto de webhook                                             | SDK: configurar exclusivamente la aplicación PASS/Club, consultar offerings disponibles, comprar el paquete seleccionado y restaurar compras del usuario de la aplicación. Webhook: autenticar exclusivamente eventos RevenueCat destinados al contrato Club.                                                                                                                          | Sin administración de proyecto/cuenta desde la app; sin API administrativa por la key pública; el secreto webhook no puede invocar APIs outbound; un evento válido solo habilita el adapter a evaluar el efecto Club previsto.                              | `SCOPE_MATERIALIZADO_EN_USO_OBSERVADO` | Uso observable en SDK y webhook. Restricciones exactas de proyecto/app del proveedor se reconcilian en `INT-EXT-009` y `INT-EXT-017`.                                                                                                                                                                                                                                                                                                                  |
| `EXT-SYS-004` | Resend                        | `RESEND_API_KEY` como bearer server-side                                                               | Enviar correo transaccional de invitación laboral ANIMA al destinatario exacto de una invitación autorizada, usando el remitente aprobado.                                                                                                                                                                                                                                             | Sin administración de dominios, contactos, listas, broadcasts, cuenta, usuarios ni lectura masiva; no usar desde cliente; no reutilizar para otros flujos de correo sin contrato explícito.                                                                 | `SCOPE_MATERIALIZADO_EN_USO_OBSERVADO` | El uso observado es `POST /emails`; no se acredita que la key física tenga restricciones provider-side equivalentes. Reconciliación de contrato: `INT-EXT-009`; auditoría de alcance: `INT-EXT-017`.                                                                                                                                                                                                                                                   |
| `EXT-SYS-005` | Expo / EAS Update             | proyecto/URL observados; credencial de publicación no acreditada                                       | No existe scope operativo acreditado para una credencial. Cualquier futura credencial solo podrá operar sobre el proyecto móvil VENTO expresamente vinculado y sobre acciones de build/update/publicación aprobadas.                                                                                                                                                                   | Sin administración global de organización/cuenta por defecto; sin asumir que `projectId`, owner o URL son credenciales.                                                                                                                                     | `CONFIGURACION_SIN_SCOPE_ACREDITADO`   | La credencial real y sus permisos deben acreditarse antes de activar el binding; contrato proveedor en `INT-EXT-009`, auditoría en `INT-EXT-017`.                                                                                                                                                                                                                                                                                                      |
| `EXT-SYS-006` | Expo Push Service             | sin credencial externa de cliente observada; push token = destino                                      | No aplica scope de credencial externa en el intercambio observado. El adapter solo puede enviar notificaciones a push tokens obtenidos desde el dominio propietario y para eventos autorizados.                                                                                                                                                                                        | Un push token no se interpreta como identidad, sesión, permiso ni credencial administrativa; la capacidad de enviar no autoriza el evento empresarial.                                                                                                      | `SIN_CREDENCIAL_EXTERNA_OBSERVADA`     | Envío observado sin auth de proveedor. Contrato del canal permanece sujeto a `INT-EXT-009`, idempotencia `INT-EXT-012` y auditoría `INT-EXT-017`.                                                                                                                                                                                                                                                                                                      |
| `EXT-SYS-007` | Sentry                        | DSN de ingestión                                                                                       | Ingerir errores/eventos de observabilidad únicamente en el proyecto Sentry configurado para ANIMA y con la metadata mínima necesaria para diagnóstico.                                                                                                                                                                                                                                 | El DSN no autoriza lectura de issues, administración de proyecto, releases, miembros, organizaciones ni otras APIs; no se convierte en secreto administrativo.                                                                                              | `SCOPE_MATERIALIZADO_EN_USO_OBSERVADO` | Uso de ingestión observable mediante `Sentry.init({ dsn })`. Minimización/observabilidad continúa en `INT-EXT-017`.                                                                                                                                                                                                                                                                                                                                    |
| `EXT-SYS-008` | Google Maps / Google Reviews  | API key de Maps; URLs públicas de Maps/Reviews                                                         | La API key solo puede habilitar las APIs de mapas estrictamente necesarias para la experiencia PASS que efectivamente las consuma; las URLs de mapas/reseñas siguen siendo enlaces públicos.                                                                                                                                                                                           | Sin APIs Google no requeridas; sin acceso a Cloud/IAM/Wallet; ninguna URL pública se clasifica como credencial; ningún key client-side debe recibir privilegios server-side.                                                                                | `SCOPE_MATERIALIZADO_EN_USO_OBSERVADO` | Uso de key para mapas observable; las restricciones provider-side por API/aplicación no están acreditadas. Reconciliación en `INT-EXT-009` y auditoría `INT-EXT-017`.                                                                                                                                                                                                                                                                                  |
| `EXT-SYS-009` | Apple Wallet / PassKit + APNs | bearer de usuario, certificado/clave de firma `.pkpass`, token opaco VENTO por pase, P8/JWT ES256 APNs | Bearer: emitir únicamente el pase propio del usuario autenticado. Certificado: firmar únicamente pases del Pass Type ID aprobado. Token por pase: registrar/desregistrar dispositivo, entregar y consultar actualizaciones exclusivamente del pase vinculado. P8/JWT: enviar pushes APNs exclusivamente al tópico/Pass Type ID del pase aprobado y a tokens registrados para ese pase. | Sin acceso de un pase a otro; sin usar certificado o P8 para otros productos/topics; sin usar bearer de usuario como credencial administrativa; sin usar token de pase para enumerar pases o registros ajenos.                                              | `SCOPE_MATERIALIZADO_EN_USO_OBSERVADO` | Registro/baja/obtención comparan token exacto, pero la consulta observada de actualizaciones solo exige presencia de token y no acredita vínculo exacto. Reconciliación contractual: `INT-EXT-009`; auditoría y cierre de brecha: `INT-EXT-017`; hardening de superficie privilegiada: `SUPA-ARC-015`/`SHELL-CI-017` cuando corresponda. El carné laboral Apple de ANIMA permanece fuera de este binding operativo: su endpoint actual responde `501`. |
| `EXT-SYS-010` | Vercel                        | configuración de hosting/routing observada; credencial operativa no acreditada                         | No existe scope de credencial Vercel acreditado. Una futura credencial solo podrá actuar sobre los proyectos/superficies VENTO expresamente vinculados y las acciones de despliegue necesarias.                                                                                                                                                                                        | Sin administración global de cuenta/team por defecto; un deployment URL, project name o rewrite no constituye credencial.                                                                                                                                   | `CONFIGURACION_SIN_SCOPE_ACREDITADO`   | Identidad de proyecto y token real deben acreditarse en `INT-EXT-009`; auditoría en `INT-EXT-017`.                                                                                                                                                                                                                                                                                                                                                     |
| `EXT-SYS-011` | Zebra BrowserPrint            | sin credencial externa observada; UID de dispositivo local                                             | No aplica scope de credencial externa. El cliente solo puede descubrir/seleccionar el dispositivo local presentado por BrowserPrint para la operación de impresión autorizada.                                                                                                                                                                                                         | UID, nombre, IP o detección local no se convierten en identidad empresarial, actor, permiso ni credencial de proveedor.                                                                                                                                     | `SIN_CREDENCIAL_EXTERNA_OBSERVADA`     | Binding local observado sin credencial externa. Contrato de operación externa, si se formaliza, continúa en `INT-EXT-009` y auditoría en `INT-EXT-017`.                                                                                                                                                                                                                                                                                                |
| `EXT-SYS-012` | Google Wallet                 | service account documentada; firma RS256 de JWT `savetowallet`                                         | Firmar únicamente JWT de guardado para objetos de carné laboral del issuer y clase de empleado aprobados, con datos mínimos del trabajador elegible y expiración corta del token de entrega.                                                                                                                                                                                           | Sin APIs Google Cloud/IAM no relacionadas; sin objetos de otras clases/issuers; sin administración global de Wallet; sin reutilizar la service account para otros proveedores o productos.                                                                  | `SCOPE_DOCUMENTADO_SIN_BINDING`        | Código actual materializa el JWT de una clase/issuer, pero no acredita despliegue o binding remoto operativo. Acreditación y contrato: `INT-EXT-009`; auditoría: `INT-EXT-017`.                                                                                                                                                                                                                                                                        |
| `EXT-SYS-013` | POS externo actual            | proveedor/credencial no acreditados                                                                    | No existe scope operativo autorizado. Antes de cualquier credencial deberá limitarse a los endpoints y operaciones del adapter de transición POS explícitamente auditados.                                                                                                                                                                                                             | Sin escritura directa en tablas internas, sin Supabase, sin `service_role`, sin autoridad sobre NEXO/NUMERA/PASS por la sola integración.                                                                                                                   | `NO_APLICA_ACTUAL`                     | Proveedor, API, endpoints y credenciales son responsabilidad de `INT-POS-001`; la activación deberá respetar esta política de mínimo privilegio.                                                                                                                                                                                                                                                                                                       |
| `EXT-SYS-014` | Shopify / e-commerce          | sin binding/credencial acreditados                                                                     | No existe scope operativo autorizado. Una futura credencial deberá cubrir únicamente las operaciones de e-commerce expresamente contratadas por el adapter VENTO.                                                                                                                                                                                                                      | Sin administración global de tienda/cuenta, datos no requeridos o escritura en dominios VENTO fuera del contrato.                                                                                                                                           | `NO_APLICA_ACTUAL`                     | Binding y contrato exactos deberán acreditarse en `INT-EXT-009`; auditoría en `INT-EXT-017`.                                                                                                                                                                                                                                                                                                                                                           |
| `EXT-SYS-015` | Rappi / marketplace           | sin binding/credencial acreditados                                                                     | No existe scope operativo autorizado. Una futura credencial deberá limitarse a las operaciones de marketplace expresamente contratadas.                                                                                                                                                                                                                                                | Sin acceso administrativo amplio, datos no requeridos o mutación directa de dominios internos.                                                                                                                                                              | `NO_APLICA_ACTUAL`                     | Binding y contrato exactos: `INT-EXT-009`; auditoría: `INT-EXT-017`.                                                                                                                                                                                                                                                                                                                                                                                   |
| `EXT-SYS-016` | ManyChat                      | sin binding/credencial acreditados                                                                     | No existe scope operativo autorizado. Una futura credencial deberá limitarse al flujo conversacional expresamente vinculado al adapter VENTO.                                                                                                                                                                                                                                          | Sin administración global de automatizaciones/audiencias ni acceso a canales no contratados.                                                                                                                                                                | `NO_APLICA_ACTUAL`                     | Binding y contrato exactos: `INT-EXT-009`; auditoría: `INT-EXT-017`.                                                                                                                                                                                                                                                                                                                                                                                   |
| `EXT-SYS-017` | WhatsApp                      | proveedor/API/credencial no acreditados                                                                | No existe scope operativo autorizado. Una futura credencial deberá limitarse al número/cuenta, plantillas, mensajes y eventos estrictamente requeridos por el canal aprobado.                                                                                                                                                                                                          | Sin administración de otras cuentas/números, contactos o activos; una conversación externa no concede autoridad empresarial.                                                                                                                                | `NO_APLICA_ACTUAL`                     | Proveedor y contrato exactos: `INT-EXT-009`; auditoría: `INT-EXT-017`.                                                                                                                                                                                                                                                                                                                                                                                 |
| `EXT-SYS-018` | Instagram / social            | cuenta/API/credencial no acreditados                                                                   | No existe scope operativo autorizado. Una futura credencial deberá limitarse a la cuenta y operaciones sociales expresamente aprobadas.                                                                                                                                                                                                                                                | Sin administración de otros activos, cuentas, publicidad o permisos Meta no requeridos.                                                                                                                                                                     | `NO_APLICA_ACTUAL`                     | Binding y contrato exactos: `INT-EXT-009`; auditoría: `INT-EXT-017`.                                                                                                                                                                                                                                                                                                                                                                                   |
| `EXT-SYS-019` | Correo corporativo / aliases  | proveedor/credencial no acreditados                                                                    | No existe scope operativo autorizado. Una futura credencial deberá limitarse a los buzones, aliases u operaciones de mensajería expresamente contratados.                                                                                                                                                                                                                              | Sin administración global del tenant, usuarios, dominios o buzones no necesarios.                                                                                                                                                                           | `NO_APLICA_ACTUAL`                     | Proveedor y contrato exactos: `INT-EXT-009`; auditoría: `INT-EXT-017`.                                                                                                                                                                                                                                                                                                                                                                                 |
| `EXT-SYS-020` | Telefonía / voz               | proveedor/credencial no acreditados                                                                    | No existe scope operativo autorizado. Una futura credencial deberá limitarse a números, llamadas, eventos y registros estrictamente requeridos por el flujo aprobado.                                                                                                                                                                                                                  | Sin administración global de cuenta, números o grabaciones ajenas al contrato; sin usar metadata telefónica como autoridad empresarial.                                                                                                                     | `NO_APLICA_ACTUAL`                     | Proveedor y contrato exactos: `INT-EXT-009`; auditoría: `INT-EXT-017`.                                                                                                                                                                                                                                                                                                                                                                                 |
| `EXT-SYS-021` | Transporte externo            | proveedor/credencial no acreditados                                                                    | No existe scope operativo autorizado. Una futura credencial deberá limitarse a cotización, solicitud, seguimiento y conciliación del servicio de transporte expresamente contratado.                                                                                                                                                                                                   | Sin administración global de cuenta, conductores, flota o datos no requeridos; sin mutación directa de estados internos ajenos al adapter.                                                                                                                  | `NO_APLICA_ACTUAL`                     | Proveedor y contrato exactos: `INT-EXT-009`; auditoría: `INT-EXT-017`.                                                                                                                                                                                                                                                                                                                                                                                 |

---

#### 7. Decisiones por familia y superficie de credencial

##### 7.1. Supabase

`EXT-SYS-001` conserva tres planos:

1. **clave pública/publishable o anon**: identifica el proyecto y queda subordinada a RLS, RPC y contratos cliente;
2. **bearer de usuario**: prueba la sesión del actor y no añade permisos empresariales;
3. **credencial privilegiada server-side**: habilita capacidades técnicas internas, pero cada función/adaptador debe reducir su uso a operaciones exactas y recursos propios.

La amplitud técnica de `service_role` no se acepta como `minimum_scope`; es una capacidad física de alto privilegio que debe quedar contenida por arquitectura, funciones, grants y pruebas negativas.

##### 7.2. Wompi

Se separan dos alcances que no son intercambiables:

- **checkout outbound**: construir la intención/redirección ya autorizada por VENTO;
- **webhook inbound**: verificar autenticidad del evento.

La validación correcta de un evento no autoriza por sí sola el estado final interno; el adapter debe resolver referencia, idempotencia y contrato propietario antes de aplicar el efecto.

##### 7.3. RevenueCat

Se separan:

- **SDK móvil**: offerings, compra y restauración para el usuario/app;
- **webhook**: autenticidad de eventos de suscripción/entitlement.

Ninguna de las dos superficies concede administración general de RevenueCat ni autoridad empresarial transversal en VENTO.

##### 7.4. Apple Wallet / PassKit / APNs

Se mantienen cuatro superficies independientes:

1. sesión/bearer para solicitar el pase propio;
2. certificado y clave privada para firmar el `.pkpass` del Pass Type ID aprobado;
3. token opaco por pase para el servicio web de ese pase;
4. clave APNs para generar JWT ES256 y notificar exclusivamente el tópico del Pass Type ID aprobado.

**Brecha física observada:** el flujo de consulta de actualizaciones del servicio Wallet acepta un token presente, pero la evidencia revisada no demuestra que lo compare contra el `auth_token` del conjunto de pases consultado. El contrato aquí aprobado exige vínculo exacto; `INT-EXT-017` deberá reconciliar y evidenciar la conformidad de todas las rutas del servicio, y `INT-EXT-009` deberá conservar el contrato de entrada/salida que impida enumeración transversal.

El endpoint laboral Apple actual de ANIMA responde `501` y, por tanto, no introduce una credencial activa adicional.

##### 7.5. Google Wallet

El código disponible construye un JWT `savetowallet` RS256 para un `genericObject` cuyo `id` y `classId` se derivan del issuer, clase laboral y usuario elegible. Esta evidencia permite fijar el **scope documental objetivo** de la service account: firmar únicamente pases laborales del issuer/clase aprobados. No acredita por sí sola despliegue, asociación remota de la cuenta de servicio ni aceptación operativa por Google Wallet.

---

#### 8. Autenticación, alcance y autorización permanecen separados

Secuencia obligatoria para cualquier efecto protegido asociado a una integración externa:

```text
MECANISMO TÉCNICO VÁLIDO
→ PRINCIPAL TÉCNICO IDENTIFICABLE
→ CREDENCIAL DENTRO DE SU MINIMUM_SCOPE
→ CONTRATO VIGENTE
→ APLICACIÓN O DOMINIO PROPIETARIO
→ AUTORIZACIÓN EMPRESARIAL INDEPENDIENTE
→ EFECTO O RECHAZO
→ AUDITORÍA
```

Una credencial técnicamente válida no amplía el alcance aprobado, no transforma un `scope_ceiling` en permiso y no autoriza recursos, dominios, sedes, áreas, acciones o efectos no incluidos expresamente.

Cuando el proveedor no permita expresar físicamente el alcance mínimo, VENTO deberá imponer el límite complementario en su adapter, función, RPC, RLS, allowlist o contrato server-side. La amplitud física de una credencial no se convierte en autorización documental.

---

#### 9. Estados de alcance

| Estado                                 | Semántica                                                                                                        |
| -------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| `SCOPE_MATERIALIZADO_EN_USO_OBSERVADO` | Existe mecanismo y uso técnico observables suficientes para fijar el techo funcional actual.                     |
| `SIN_CREDENCIAL_EXTERNA_OBSERVADA`     | Existe binding técnico, pero el intercambio observado no usa credencial externa de cliente.                      |
| `CONFIGURACION_SIN_SCOPE_ACREDITADO`   | Existe configuración o superficie, pero no se acredita una credencial de proveedor cuyo scope pueda verificarse. |
| `SCOPE_DOCUMENTADO_SIN_BINDING`        | Existe un modelo técnico concreto de credencial y alcance, pero no se acredita binding remoto/operativo.         |
| `NO_APLICA_ACTUAL`                     | No existe proveedor/binding/credencial actual acreditado; no hay scope operativo que conceder.                   |

---

#### 10. Reconciliación de cobertura

| Clasificación                          | Cantidad |
| -------------------------------------- | -------: |
| `SCOPE_MATERIALIZADO_EN_USO_OBSERVADO` |        7 |
| `SIN_CREDENCIAL_EXTERNA_OBSERVADA`     |        2 |
| `CONFIGURACION_SIN_SCOPE_ACREDITADO`   |        2 |
| `SCOPE_DOCUMENTADO_SIN_BINDING`        |        1 |
| `NO_APLICA_ACTUAL`                     |        9 |
| **TOTAL**                              |   **21** |

La distribución conserva la clasificación heredada de `INT-EXT-004`:

- siete identidades con mecanismos observados y alcance materializable;
- dos bindings observados sin autenticación externa de cliente;
- dos configuraciones sin mecanismo/scope acreditado;
- una identidad con modelo de credencial documentado sin binding;
- nueve identidades sin binding actual.

No se promueve ninguna identidad de `DOCUMENTADO_SIN_BINDING_ACREDITADO` o `PROVEEDOR_NO_ACREDITADO` a integración operativa por el solo hecho de existir código, guía, URL, variable o configuración.

---

#### 11. Handoffs y condiciones de salida

| Tarea         | Recibe de `INT-EXT-005`                                                                    | Prohibición de reinterpretación                                                              |
| ------------- | ------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------- |
| `INT-EXT-006` | Cada `minimum_scope` por identidad y superficie                                            | Separar ambientes no puede ampliar operaciones ni recursos.                                  |
| `INT-EXT-007` | Credenciales clasificadas y su sensibilidad                                                | Elegir custodia no altera scope.                                                             |
| `INT-EXT-008` | Credenciales y límites aprobados                                                           | Rotar/revocar no crea capacidades nuevas.                                                    |
| `INT-EXT-009` | Techo funcional que deberá aparecer en contratos/versiones de entrada y salida             | El contrato del proveedor no podrá convertir credencial técnica en autoridad empresarial.    |
| `INT-EXT-012` | Superficies con efecto potencial y límites de operación                                    | Idempotencia no autoriza efectos fuera del scope.                                            |
| `INT-EXT-017` | Casos donde debe demostrarse que provider/VENTO enforcement coincide con el scope aprobado | Métricas o evidencia no podrán cerrar una brecha sin prueba del límite efectivo.             |
| `INT-EXT-020` | Separación por integración y prohibición de reutilización                                  | Ninguna credencial podrá compartirse para eludir el scope individual.                        |
| `INT-POS-001` | `EXT-SYS-013` sin credencial activa y con scope cerrado por defecto                        | No se habilitará POS externo antes de auditar proveedor, API, endpoints, webhooks y límites. |

---

#### 12. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Esta tarea crea **0** requisitos `TREQ-*`, modifica **0**, difiere **0**, descarta **0** y declara obsoletos **0**.

Justificación: el mínimo privilegio, el control de scopes, la separación entre credencial técnica y autorización empresarial, la contención de `service_role`, la custodia con identidad mínima, la no expansión de autoridad durante refresh y la prohibición de usar credenciales externas para mutar múltiples dominios ya están protegidos por requisitos vigentes de `AUTH`, `SUPABASE` e `INTEGRATION`. `INT-EXT-005` materializa esos controles sobre las veintiuna identidades de integración sin introducir una regla de riesgo nueva.

---

#### 13. Prohibiciones

Queda prohibido:

1. interpretar una credencial válida como autorización empresarial;
2. conceder alcance global por ausencia, `null`, desconocimiento o falta de evidencia;
3. reutilizar una credencial de lectura para escritura;
4. reutilizar una credencial inbound como credencial outbound;
5. reutilizar una credencial entre identidades `EXT-SYS-*` distintas por conveniencia;
6. usar una credencial externa para justificar mutaciones laterales en múltiples dominios empresariales;
7. entregar `service_role` a proveedor, cliente, navegador, dispositivo o integración externa;
8. tratar `service_role` como actor humano, principal empresarial o `PermissionKey`;
9. convertir API key, token, secreto, certificado, DSN, service account, issuer, class o tópico en permiso empresarial;
10. ampliar el alcance porque el proveedor o la credencial física permitan capacidades adicionales;
11. inferir scopes de proveedor no acreditados;
12. afirmar restricciones provider-side que las fuentes actuales no demuestran;
13. habilitar operaciones futuras bajo una credencial actual sin revisión contractual;
14. convertir un push token o identificador de destino en credencial de autoridad;
15. convertir configuración, URL, `projectId`, issuer, class, UID o identificador público en scope operativo;
16. promover un binding documentado o candidato a integración activa por existir código o guía;
17. crear credenciales, secretos o cuentas dentro de esta tarea;
18. separar credenciales por ambiente dentro de esta tarea;
19. definir almacenamiento físico de secretos dentro de esta tarea;
20. rotar, revocar o expirar credenciales dentro de esta tarea;
21. modificar Supabase;
22. modificar código;
23. desplegar servicios;
24. cambiar las veintiuna identidades heredadas;
25. iniciar o desarrollar `INT-EXT-006`.

---

#### 14. Criterios de aceptación

1. Las veintiuna identidades heredadas tienen una decisión explícita de alcance.
2. Las superficies multiclave se descomponen y no comparten autoridad por inferencia.
3. Cada credencial observada tiene operaciones mínimas y prohibiciones expresas.
4. Los bindings sin credencial externa no reciben un scope artificial.
5. Las configuraciones sin credencial acreditada permanecen cerradas por defecto.
6. Los proveedores futuros permanecen `NO_APLICA_ACTUAL` hasta acreditar binding, credencial y contrato.
7. `service_role` queda explícitamente excluido de terceros y clientes.
8. La autenticación técnica no sustituye permisos, scopes empresariales ni dueño del hecho.
9. La distribución total reconcilia exactamente 21 identidades sin faltantes ni duplicados.
10. Los handoffs posteriores conservan el scope como techo y no pueden ampliarlo silenciosamente.

---

#### 15. Resultado de la tarea

`INT-EXT-005` deja materializado el alcance técnico mínimo permitido para las veintiuna identidades externas sin transformar la capacidad física de una credencial en autoridad empresarial.

El modelo resultante exige conservar:

```text
SISTEMA / INSTANCIA
+
PRINCIPAL TÉCNICO
+
REFERENCIA DE CREDENCIAL
+
PROCEDENCIA DE CREDENCIAL
+
MECANISMO REAL
+
MINIMUM_SCOPE
+
SCOPE_CEILING
+
RECURSO / OPERACIÓN ALCANZADOS
+
AUTORIZACIÓN EMPRESARIAL INDEPENDIENTE
+
AUDITORÍA
```

Los límites aquí definidos constituyen un techo para `INT-EXT-006` a `INT-EXT-020`; ninguna tarea posterior podrá ampliarlos silenciosamente.

---

ÚLTIMA TAREA APROBADA

`INT-EXT-004 — Definir autenticación mediante API key, OAuth, HMAC, certificado u otro mecanismo`

TAREA ACTUAL APROBADA

`INT-EXT-005 — Definir alcance mínimo de cada credencial`

SIGUIENTE TAREA RESERVADA

`INT-EXT-006 — Separar credenciales de desarrollo, staging y producción`


### ✅ INT-EXT-006 — Separar credenciales de desarrollo, staging y producción

**Estado:** APROBADA
**Tarea anterior:** `INT-EXT-005 — Definir alcance mínimo de cada credencial` — APROBADA
**Tarea siguiente:** `INT-EXT-007 — Definir almacenamiento seguro de secretos` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materializada de la separación de credenciales por ambiente para cada identidad `EXT-SYS-001` a `EXT-SYS-021`, distinguiendo los ambientes VENTO de las etiquetas propias de proveedores, preservando bindings, mecanismos y alcances ya aprobados, sin crear credenciales, secretos, cuentas, proyectos, ambientes, almacenamiento, rotación, configuración ni cambios físicos
**Bloque:** X — Integraciones
**Mini-bloque:** Integraciones externas y credenciales
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/02_INTEGRACIONES_EXTERNAS_Y_CREDENCIALES.md`
**Fase:** exclusivamente documental
**Implementación física autorizada:** ninguna
**Cambios de código, DDL, DML, migraciones, RLS, RPC, secretos, cuentas externas, proveedores, configuración remota, despliegues o datos:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Materializar la separación obligatoria de credenciales entre `DEVELOPMENT`, `STAGING` y `PRODUCTION` para las veintiuna identidades externas ya inventariadas, sin inferir cumplimiento a partir de nombres de variables, perfiles de build, etiquetas de telemetría, proyectos, URLs o convenciones del proveedor.

La tarea debe impedir cuatro ambigüedades:

```text
AMBIENTE VENTO
≠ ETIQUETA DE AMBIENTE DEL PROVEEDOR
```

```text
PERFIL / CANAL / PROYECTO
≠ CREDENCIAL SEPARADA
```

```text
MISMO NOMBRE DE VARIABLE
≠ MISMO VALOR DE CREDENCIAL
```

```text
CREDENCIAL VÁLIDA EN UN AMBIENTE
≠ AUTORIDAD EN OTRO AMBIENTE
```

La separación definida aquí es una frontera de autoridad técnica. No sustituye el alcance mínimo aprobado en `INT-EXT-005`, no define almacenamiento de secretos, no define lifecycle y no acredita por sí sola que una credencial exista o esté desplegada.

---

#### 2. Resultado sustantivo

Se aprueban dos artefactos documentales internos de esta tarea:

- `VENTO-EXTERNAL-CREDENTIAL-ENVIRONMENT-CONTRACT-001`, que define la semántica y las reglas de aislamiento por ambiente;
- `VENTO-EXTERNAL-CREDENTIAL-ENVIRONMENT-MATRIX-001`, que materializa una decisión para cada `EXT-SYS-001` a `EXT-SYS-021`.

Balance materializado:

| Control                                                                | Resultado |
| ---------------------------------------------------------------------- | --------: |
| Identidades heredadas esperadas                                        |    **21** |
| Identidades materializadas                                             | **21/21** |
| Identificadores únicos                                                 |    **21** |
| Identidades faltantes                                                  |     **0** |
| Identidades duplicadas                                                 |     **0** |
| Tríadas completas `DEVELOPMENT` / `STAGING` / `PRODUCTION` acreditadas |     **0** |
| Separaciones parciales acreditadas                                     |     **1** |
| Separaciones especificadas pendientes de evidencia                     |     **6** |
| Configuraciones de ambiente sin separación de credencial acreditada    |     **2** |
| Bindings observados sin credencial externa                             |     **2** |
| Modelos documentados sin binding acreditado                            |     **1** |
| Identidades sin binding actual a las que no aplica separación física   |     **9** |
| Credenciales o secretos creados                                        |     **0** |
| Cuentas, proyectos o ambientes creados                                 |     **0** |
| Requisitos de prueba creados o modificados                             |     **0** |

La distribución de evidencia heredada de `INT-EXT-001` se conserva sin cambios:

```text
3 BINDING_TECNICO_OBSERVADO
+
6 BINDING_CONDICIONAL_OBSERVADO
+
2 CONFIGURACION_OBSERVADA
+
6 DOCUMENTADO_SIN_BINDING_ACREDITADO
+
4 PROVEEDOR_NO_ACREDITADO
=
21
```

El resultado no presenta ninguna identidad como físicamente conforme con la tríada completa cuando las fuentes actuales solo acreditan una parte, una configuración, un modelo o ningún binding.

---

#### 3. Fuentes y contratos preservados

La tarea consume y conserva sin redefinir:

- `INT-EXT-001`, incluidas las veintiuna identidades, sus proveedores acreditados o no acreditados, propietarios funcionales, custodios técnicos, finalidades y clasificación de evidencia;
- `INT-EXT-002`, incluida la separación entre actor humano, `IntegrationPrincipal`, cuenta del proveedor, referencia de credencial, valor secreto y autoridad empresarial;
- `INT-EXT-003`, incluida la procedencia por superficie y la distinción entre credenciales emitidas por proveedor, emitidas por VENTO, no acreditadas y artefactos que no son credenciales;
- `INT-EXT-004`, incluidos los mecanismos reales observados, sus límites, la separación entre autenticación y autorización y el comportamiento fail-closed;
- `INT-EXT-005`, incluido el alcance mínimo por credencial y la prohibición de ampliar autoridad técnica por reutilización de una credencial;
- la obligación canónica ya existente de que cada ambiente use una credencial independiente;
- la regla de que `service_role` permanece como credencial interna privilegiada de VENTO y no se entrega a proveedores externos;
- el registro `04A` vigente y su cobertura de mínimo privilegio, contexto de ejecución técnica por ambiente, custodia de secretos, trazabilidad y separación entre autenticación técnica y autoridad empresarial.

Como evidencia técnica actual se consideran, sin convertirlos en prueba de operación remota:

- validación `test` / `prod` observada en el checkout de Wompi;
- configuración local de Supabase y uso de credenciales server-side en funciones;
- variables de RevenueCat, Resend, Sentry, Google Maps, Apple Wallet y Google Wallet;
- perfiles EAS `development`, `preview` y `production` observados en aplicaciones móviles;
- bindings sin credencial externa observada de Expo Push y Zebra BrowserPrint;
- configuraciones de plataforma que no acreditan por sí solas una credencial separada.

---

#### 4. Semántica de ambiente VENTO

`VENTO-EXTERNAL-CREDENTIAL-ENVIRONMENT-CONTRACT-001` define exactamente tres identidades lógicas de ambiente para esta tarea:

| Ambiente VENTO | Finalidad documental de la frontera de credencial |
| -------------- | ------------------------------------------------- |
| `DEVELOPMENT`  | desarrollo y prueba técnica no productiva         |
| `STAGING`      | validación preproductiva aislada                  |
| `PRODUCTION`   | operación productiva autorizada                   |

Estas identidades no se derivan automáticamente de etiquetas externas.

Por tanto:

- `test` de un proveedor no equivale automáticamente a `DEVELOPMENT` ni a `STAGING`;
- `preview` de Expo/EAS no equivale automáticamente a `STAGING`;
- `development` o `production` usados como tags de telemetría no acreditan una credencial distinta;
- un branch, deployment, URL, proyecto, canal, `projectId`, `place_id`, UID, token de dispositivo o identificador de cuenta no prueba por sí mismo la existencia de una credencial separada;
- una misma cuenta externa puede contener varios ambientes únicamente cuando el proveedor permite aislar de forma verificable credenciales, recursos y autoridad; de lo contrario, se requerirá una instancia, proyecto, aplicación o cuenta externa separada antes de habilitar el ambiente afectado.

La tarea no crea esas instancias externas ni determina todavía dónde se almacenan sus secretos.

---

#### 5. `VENTO-EXTERNAL-CREDENTIAL-ENVIRONMENT-CONTRACT-001`

Cuando una superficie de integración materialice una credencial, la relación lógica mínima queda definida como:

```text
AMBIENTE VENTO
+
SISTEMA EXTERNO
+
INTEGRATION PRINCIPAL
+
SUPERFICIE DE CREDENCIAL
+
REFERENCIA DE CREDENCIAL
+
INSTANCIA / ENDPOINT EXTERNO ALCANZADO
+
DESTINO INTERNO AUTORIZADO
→ BINDING DE AMBIENTE
```

Reglas:

1. la identidad del ambiente se resuelve antes de buscar o presentar material de credencial;
2. una referencia de credencial materializada pertenece a un único ambiente VENTO;
3. el valor secreto alcanzado por esa referencia no puede ser reutilizado como credencial de otro ambiente;
4. un `IntegrationPrincipal` puede existir lógicamente en varios ambientes solo mediante bindings de credencial independientes;
5. una credencial de `PRODUCTION` no puede ser cargada, presentada ni usada desde `DEVELOPMENT` o `STAGING`;
6. una credencial de `STAGING` no puede ser cargada, presentada ni usada desde `DEVELOPMENT` o `PRODUCTION`;
7. una credencial de `DEVELOPMENT` no puede ser cargada, presentada ni usada desde `STAGING` o `PRODUCTION`;
8. compartir nombre de variable entre runtimes no prueba compartir valor y tampoco prueba aislamiento; la conformidad requiere evidencia de la referencia o material efectivo por ambiente;
9. compartir cuenta de proveedor no elimina la obligación de aislamiento de credencial y recurso;
10. compartir proyecto o aplicación externa solo es admisible cuando la plataforma permite separar efectivamente credenciales y autoridad por ambiente sin acceso cruzado;
11. si el proveedor no permite aislamiento suficiente dentro de una misma instancia, el ambiente permanece bloqueado hasta usar una instancia externa separada;
12. `service_role` conserva binding estricto al ambiente interno de VENTO y no se transforma en credencial del proveedor;
13. el alcance mínimo aprobado en `INT-EXT-005` se aplica dentro de cada ambiente y nunca se amplía por el hecho de separar credenciales;
14. almacenamiento, acceso humano/técnico y custodia del valor secreto pertenecen a `INT-EXT-007`;
15. rotación, expiración y revocación pertenecen a `INT-EXT-008`.

La tarea no inventa valores físicos de `ExternalCredentialId`, `IntegrationPrincipal`, cuenta, proyecto o secreto.

---

#### 6. Regla de coherencia extremo a extremo

La separación no se considera correcta si únicamente cambia la variable o el secreto, pero la operación sigue cruzando ambientes.

Toda integración aplicable deberá conservar coherencia entre:

```text
RUNTIME VENTO
→ AMBIENTE VENTO
→ INTEGRATION PRINCIPAL
→ REFERENCIA DE CREDENCIAL
→ CREDENCIAL DEL MISMO AMBIENTE
→ INSTANCIA / ENDPOINT / RECURSO EXTERNO COMPATIBLE
→ DESTINO INTERNO DEL MISMO AMBIENTE
```

Se prohíben, entre otros, estos cruces:

- desarrollo con credencial de producción;
- staging con credencial de producción;
- producción con credencial de test;
- credencial no productiva escribiendo en datos productivos;
- credencial productiva usada contra recursos de desarrollo o staging;
- webhook de un ambiente aceptado y aplicado sobre transacciones de otro;
- aplicación móvil no productiva configurada para una credencial productiva por fallback;
- secreto interno privilegiado compartido entre ambientes para simplificar despliegues.

Una etiqueta de entorno recibida del cliente o del proveedor no es autoridad suficiente para seleccionar credencial o destino interno.

---

#### 7. Clasificación documental de evidencia

Los estados de `INT-EXT-006` describen exclusivamente evidencia de separación por ambiente:

| Estado documental                                                    | Significado                                                                                                                                                                |
| -------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `SEPARACION_PARCIAL_ACREDITADA`                                      | Existe evidencia física de separación o validación entre al menos dos clases de entorno, pero no la tríada VENTO completa.                                                 |
| `SEPARACION_ESPECIFICADA_PENDIENTE_DE_EVIDENCIA`                     | Existe una credencial o superficie material y la separación VENTO queda normada, pero las fuentes no acreditan valores/referencias independientes para los tres ambientes. |
| `CONFIGURACION_DE_AMBIENTES_SIN_SEPARACION_DE_CREDENCIAL_ACREDITADA` | Existen perfiles, canales o configuración diferenciada por ambiente, pero no evidencia suficiente de credenciales independientes.                                          |
| `SIN_CREDENCIAL_EXTERNA_OBSERVADA`                                   | El binding observado no presenta credencial externa de cliente sobre la cual materializar separación actual.                                                               |
| `MODELO_DOCUMENTADO_SIN_BINDING`                                     | Existe un modelo de credencial o cuenta documentado, pero no un binding remoto acreditado sobre el cual comprobar separación.                                              |
| `NO_APLICA_ACTUAL`                                                   | No existe binding/credencial actual acreditado; no se fabrica una separación física inexistente.                                                                           |

Ninguno de estos estados equivale a `IMPLEMENTADO`, `VALIDADO` o conformidad remota salvo que exista evidencia suficiente para esa afirmación.

---

#### 8. Observaciones técnicas actuales por familia

##### 8.1. Supabase

La configuración local observada acredita un contexto de desarrollo local y el código usa credenciales Supabase diferenciadas por función o nivel de privilegio. No acredita tres proyectos o tres juegos remotos de credenciales VENTO para `DEVELOPMENT`, `STAGING` y `PRODUCTION`.

Decisión: la separación completa queda especificada y pendiente de evidencia física.

##### 8.2. Wompi

El checkout observado:

- infiere `test` o `prod` desde la clave pública;
- infiere `test` o `prod` desde el secreto de integridad;
- rechaza cuando ambos materiales no pertenecen a la misma clase;
- puede exigir coherencia adicional con `WOMPI_ENVIRONMENT`.

Esto acredita una separación parcial entre familias `test` y `prod`, no una tríada VENTO completa. El webhook usa una referencia de secreto genérica y no acredita discriminación independiente para `DEVELOPMENT`, `STAGING` y `PRODUCTION`.

##### 8.3. RevenueCat y Resend

Las superficies observadas usan nombres genéricos de credencial para el runtime que las consume. No existe evidencia suficiente en las fuentes inspeccionadas para demostrar referencias o valores independientes por los tres ambientes VENTO.

##### 8.4. Expo / EAS Update

ANIMA y PASS contienen perfiles `development`, `preview` y `production`.

La existencia de esos perfiles acredita separación de configuración/build, pero:

```text
preview ≠ STAGING por inferencia
```

ni acredita que los secretos utilizados por esos perfiles sean distintos.

##### 8.5. Sentry

El runtime observado puede etiquetar eventos como `development` o `production`, pero consume una referencia `EXPO_PUBLIC_SENTRY_DSN`. La etiqueta del evento no demuestra que existan DSN independientes.

##### 8.6. Google Maps / Google Reviews

La API key opcional observada no contiene una discriminación de ambiente acreditada en el código inspeccionado. URLs públicas, coordenadas y `place_id` siguen fuera del concepto de credencial.

##### 8.7. Apple Wallet / PassKit y APNs

Las superficies observadas usan material de certificado/clave para firma de pases, material P8 para APNs y token VENTO por pase. Los nombres de variables inspeccionados no acreditan pares o tríadas independientes por ambiente.

##### 8.8. Expo Push Service y Zebra BrowserPrint

No se observó una credencial externa de cliente en los bindings inspeccionados. Los push tokens de dispositivo, UID o nombre de impresora no se convierten en credenciales para satisfacer artificialmente esta tarea.

##### 8.9. Google Wallet

Existe un modelo técnico con issuer, class y cuenta de servicio para una superficie de Wallet, pero el binding remoto actual no queda acreditado. No se declara separación de credencial por ambiente sin demostrar primero el binding efectivo.

##### 8.10. Vercel y sistemas sin binding

La existencia de despliegues o configuración Vercel no acredita por sí misma credenciales administrativas distintas por ambiente. Para las identidades sin binding actual no se asignan credenciales de desarrollo, staging o producción por inferencia.

---

#### 9. `VENTO-EXTERNAL-CREDENTIAL-ENVIRONMENT-MATRIX-001`

| ID            | Sistema / plataforma                     | Evidencia heredada                   | Evidencia ambiental actual                                                                     | Decisión `INT-EXT-006`                                               | Estado físico            | Bloqueo / condición de salida                                                                                                          |
| ------------- | ---------------------------------------- | ------------------------------------ | ---------------------------------------------------------------------------------------------- | -------------------------------------------------------------------- | ------------------------ | -------------------------------------------------------------------------------------------------------------------------------------- |
| `EXT-SYS-001` | Supabase                                 | `BINDING_TECNICO_OBSERVADO`          | configuración local y credenciales runtime observadas; tríada remota no acreditada             | `SEPARACION_ESPECIFICADA_PENDIENTE_DE_EVIDENCIA`                     | `PENDIENTE_DE_EVIDENCIA` | demostrar referencias/material independiente y targets coherentes para `DEVELOPMENT`, `STAGING` y `PRODUCTION`                         |
| `EXT-SYS-002` | Wompi                                    | `BINDING_CONDICIONAL_OBSERVADO`      | checkout distingue `test` / `prod`; webhook y tríada VENTO completa no quedan discriminados    | `SEPARACION_PARCIAL_ACREDITADA`                                      | `PENDIENTE_DE_EVIDENCIA` | acreditar mapping VENTO de los tres ambientes y credenciales independientes en checkout/webhook sin reutilización cruzada              |
| `EXT-SYS-003` | RevenueCat                               | `BINDING_CONDICIONAL_OBSERVADO`      | API keys por plataforma y secreto de webhook observados; separación por ambiente no acreditada | `SEPARACION_ESPECIFICADA_PENDIENTE_DE_EVIDENCIA`                     | `PENDIENTE_DE_EVIDENCIA` | demostrar credenciales/referencias independientes por ambiente para SDK y webhook                                                      |
| `EXT-SYS-004` | Resend                                   | `BINDING_CONDICIONAL_OBSERVADO`      | `RESEND_API_KEY` observada sin discriminación ambiental acreditada                             | `SEPARACION_ESPECIFICADA_PENDIENTE_DE_EVIDENCIA`                     | `PENDIENTE_DE_EVIDENCIA` | demostrar credencial y remitente/configuración compatibles e independientes por ambiente                                               |
| `EXT-SYS-005` | Expo / EAS Update                        | `CONFIGURACION_OBSERVADA`            | perfiles `development`, `preview`, `production`; separación de credencial no demostrada        | `CONFIGURACION_DE_AMBIENTES_SIN_SEPARACION_DE_CREDENCIAL_ACREDITADA` | `PENDIENTE_DE_EVIDENCIA` | acreditar mapping de perfiles a ambientes VENTO y material/referencias de credencial independientes donde exista autenticación externa |
| `EXT-SYS-006` | Expo Push Service                        | `BINDING_TECNICO_OBSERVADO`          | llamada externa observada sin credencial de cliente                                            | `SIN_CREDENCIAL_EXTERNA_OBSERVADA`                                   | `NO_APLICA`              | si el proveedor/binding futuro exige credencial, materializar su binding ambiental antes de habilitarla                                |
| `EXT-SYS-007` | Sentry                                   | `BINDING_CONDICIONAL_OBSERVADO`      | tag de entorno observado; una referencia DSN genérica en código                                | `SEPARACION_ESPECIFICADA_PENDIENTE_DE_EVIDENCIA`                     | `PENDIENTE_DE_EVIDENCIA` | demostrar DSN/proyecto o aislamiento equivalente que impida ingestión cruzada entre ambientes                                          |
| `EXT-SYS-008` | Google Maps / Google Reviews             | `BINDING_CONDICIONAL_OBSERVADO`      | API key opcional observada sin discriminación ambiental                                        | `SEPARACION_ESPECIFICADA_PENDIENTE_DE_EVIDENCIA`                     | `PENDIENTE_DE_EVIDENCIA` | demostrar claves/restricciones independientes o aislamiento equivalente por ambiente cuando la API key esté habilitada                 |
| `EXT-SYS-009` | Apple Wallet / PassKit y APNs            | `BINDING_CONDICIONAL_OBSERVADO`      | certificados, clave P8 y token por pase observados; tríada ambiental no acreditada             | `SEPARACION_ESPECIFICADA_PENDIENTE_DE_EVIDENCIA`                     | `PENDIENTE_DE_EVIDENCIA` | demostrar material y referencias por ambiente para firma/APNs/servicio Wallet sin cruce de pases o endpoints                           |
| `EXT-SYS-010` | Vercel                                   | `CONFIGURACION_OBSERVADA`            | hosting/configuración observados; credencial administrativa por ambiente no acreditada         | `CONFIGURACION_DE_AMBIENTES_SIN_SEPARACION_DE_CREDENCIAL_ACREDITADA` | `PENDIENTE_DE_EVIDENCIA` | demostrar identidad/credencial de despliegue o administración aislada cuando el contrato operativo la materialice                      |
| `EXT-SYS-011` | Zebra BrowserPrint                       | `BINDING_TECNICO_OBSERVADO`          | bridge local observado sin credencial externa                                                  | `SIN_CREDENCIAL_EXTERNA_OBSERVADA`                                   | `NO_APLICA`              | si se introduce autenticación del bridge o proveedor, materializar binding ambiental antes de uso                                      |
| `EXT-SYS-012` | Google Wallet / Google Pay & Wallet      | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | modelo de issuer/class/cuenta de servicio; binding remoto no acreditado                        | `MODELO_DOCUMENTADO_SIN_BINDING`                                     | `NO_APLICA_ACTUAL`       | acreditar binding efectivo y después demostrar credenciales/recursos independientes por ambiente                                       |
| `EXT-SYS-013` | POS externo vigente                      | `PROVEEDOR_NO_ACREDITADO`            | proveedor e interfaz no acreditados                                                            | `NO_APLICA_ACTUAL`                                                   | `BLOQUEADO`              | `INT-POS-001` acredita proveedor, interfaces y binding; después se materializa separación antes de activación                          |
| `EXT-SYS-014` | Shopify / comercio electrónico           | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | integración no acreditada                                                                      | `NO_APLICA_ACTUAL`                                                   | `NO_APLICA`              | acreditar binding real; si se activa, separar credenciales antes de cualquier uso multientorno                                         |
| `EXT-SYS-015` | Rappi / marketplace                      | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | integración no acreditada                                                                      | `NO_APLICA_ACTUAL`                                                   | `NO_APLICA`              | acreditar proveedor/binding y materializar separación ambiental antes de activación                                                    |
| `EXT-SYS-016` | ManyChat / automatización conversacional | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | integración no acreditada                                                                      | `NO_APLICA_ACTUAL`                                                   | `NO_APLICA`              | acreditar cuenta/binding y materializar separación ambiental antes de activación                                                       |
| `EXT-SYS-017` | WhatsApp                                 | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | proveedor/API no acreditados                                                                   | `NO_APLICA_ACTUAL`                                                   | `NO_APLICA`              | acreditar proveedor, cuenta técnica y binding; después separar credenciales por ambiente                                               |
| `EXT-SYS-018` | Instagram / social                       | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | API/binding no acreditados                                                                     | `NO_APLICA_ACTUAL`                                                   | `NO_APLICA`              | acreditar cuenta técnica/binding y separar credenciales antes de activación multientorno                                               |
| `EXT-SYS-019` | Correo corporativo y alias funcionales   | `PROVEEDOR_NO_ACREDITADO`            | proveedor e integración no acreditados                                                         | `NO_APLICA_ACTUAL`                                                   | `BLOQUEADO`              | acreditar proveedor y binding; posteriormente aplicar el contrato ambiental a cualquier credencial técnica                             |
| `EXT-SYS-020` | Telefonía / voz                          | `PROVEEDOR_NO_ACREDITADO`            | operador e integración no acreditados                                                          | `NO_APLICA_ACTUAL`                                                   | `BLOQUEADO`              | acreditar operador, cuenta e interfaz; posteriormente separar credenciales por ambiente                                                |
| `EXT-SYS-021` | Transporte externo                       | `PROVEEDOR_NO_ACREDITADO`            | proveedor, tracking e interfaz no acreditados                                                  | `NO_APLICA_ACTUAL`                                                   | `BLOQUEADO`              | acreditar proveedor y binding; posteriormente separar credenciales por ambiente antes de activar efectos                               |

---

#### 10. Reconciliación de cobertura

La matriz conserva las veintiuna identidades heredadas y produce una decisión única por cada una.

Distribución de `INT-EXT-006`:

```text
1 SEPARACION_PARCIAL_ACREDITADA
+
6 SEPARACION_ESPECIFICADA_PENDIENTE_DE_EVIDENCIA
+
2 CONFIGURACION_DE_AMBIENTES_SIN_SEPARACION_DE_CREDENCIAL_ACREDITADA
+
2 SIN_CREDENCIAL_EXTERNA_OBSERVADA
+
1 MODELO_DOCUMENTADO_SIN_BINDING
+
9 NO_APLICA_ACTUAL
=
21
```

Resultado de conformidad física completa:

```text
TRIADAS DEVELOPMENT / STAGING / PRODUCTION ACREDITADAS = 0
```

Esta cifra no significa que las credenciales sean necesariamente compartidas. Significa exclusivamente que las fuentes inspeccionadas no permiten afirmar la existencia y aislamiento verificable de las tres credenciales/referencias requeridas.

---

#### 11. Comportamiento fail-closed ante mismatch de ambiente

Cuando una integración aplicable materialice separación física, el runtime deberá resolver el ambiente antes de producir un efecto externo o de usar autoridad privilegiada posterior.

Se rechaza la operación cuando:

- el ambiente VENTO no puede resolverse de forma autoritativa;
- la referencia de credencial pertenece a otro ambiente;
- el proveedor devuelve o identifica un ambiente incompatible con el esperado;
- endpoint, cuenta, proyecto o recurso externo no corresponde al binding del ambiente;
- el destino interno pertenece a otro ambiente;
- solo existe una credencial productiva para un runtime no productivo;
- el sistema intenta hacer fallback a una credencial de otro ambiente;
- la evidencia de entorno proviene únicamente de un parámetro manipulable del cliente.

El rechazo debe ocurrir antes del efecto externo irreversible o del efecto interno privilegiado que dependa de esa integración.

Esta tarea no define el código de error público, mecanismo de retry, circuit breaker, cuarentena ni lifecycle de la credencial.

---

#### 12. Separación de datos, recursos y cuentas

Separar el secreto sin separar el recurso alcanzado no satisface el objetivo cuando el mismo recurso permite contaminación cruzada.

Por ello:

1. una credencial no productiva no podrá apuntar a datos productivos por configuración;
2. una credencial productiva no podrá usarse como fallback de desarrollo o staging;
3. cuando el proveedor ofrezca recursos aislables dentro de una cuenta, cada ambiente deberá quedar limitado a su recurso autorizado;
4. cuando el proveedor no ofrezca aislamiento suficiente, deberá existir una instancia/proyecto/aplicación/cuenta separada antes de considerar habilitado ese ambiente;
5. la decisión de crear o contratar esa instancia externa no se ejecuta en `INT-EXT-006`;
6. el ambiente forma parte del contexto técnico y de auditoría, pero nunca se registran valores secretos para demostrarlo;
7. un identificador de recurso externo puede conservarse como referencia, pero no sustituye la referencia de credencial ni la prueba de aislamiento.

---

#### 13. Trazabilidad de handoff

| Pendiente                                                                  | Estado                    | Propietario / tarea responsable                                                          | Condición de salida                                                                                            |
| -------------------------------------------------------------------------- | ------------------------- | ---------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| Referencia física de credencial con ambiente explícito y sin valor secreto | `FUERA_DE_ALCANCE`        | `SHELL-CON-018`                                                                          | contrato consumible representa sistema, principal, superficie, ambiente y referencia sin exponer secreto       |
| Almacenamiento, custodia y acceso a secretos separados por ambiente        | `FUERA_DE_ALCANCE`        | `INT-EXT-007`                                                                            | ubicación y permisos de acceso aprobados impiden exposición o lectura cruzada no autorizada                    |
| Rotación, expiración y revocación independientes por ambiente              | `FUERA_DE_ALCANCE`        | `INT-EXT-008`                                                                            | lifecycle permite retirar una credencial sin reutilizar ni afectar indebidamente otros ambientes               |
| Proveedor y binding exactos del POS vigente                                | `BLOQUEADO_POR_EVIDENCIA` | `INT-POS-001`                                                                            | proveedor, interfaces, cuentas y credenciales quedan acreditados antes de aplicar separación ambiental física  |
| Evidencia física de tríada completa para bindings ya observados            | `PENDIENTE_DE_EVIDENCIA`  | tarea de implementación propietaria de cada binding + `SHELL-CON-018` cuando corresponda | cada runtime demuestra referencia/material independiente y coherencia de endpoint/recurso/destino por ambiente |
| Mapping de `preview` u otras etiquetas de proveedor a `STAGING`            | `PENDIENTE_DE_EVIDENCIA`  | configuración propietaria de la aplicación/integración correspondiente                   | existe decisión explícita de ambiente VENTO; no se deriva por nombre del perfil                                |

No queda pendiente narrativo sin propietario, tarea responsable o condición de salida.

---

#### 14. Prohibiciones

Queda prohibido:

1. usar una credencial de `PRODUCTION` en `DEVELOPMENT` o `STAGING`;
2. usar una credencial de `STAGING` en `DEVELOPMENT` o `PRODUCTION`;
3. usar una credencial de `DEVELOPMENT` en `STAGING` o `PRODUCTION`;
4. compartir el mismo valor secreto entre ambientes aunque las variables tengan nombres distintos;
5. considerar separados dos ambientes únicamente porque usan distintos nombres de variable;
6. considerar `preview` equivalente a `STAGING` sin decisión VENTO explícita;
7. considerar un tag de Sentry, canal EAS, branch, URL, `projectId`, account ID o endpoint como prueba suficiente de credencial separada;
8. permitir fallback a una credencial de otro ambiente cuando falta la credencial correcta;
9. usar `service_role` de un ambiente desde otro o entregarlo a un proveedor externo;
10. presentar push tokens, UIDs, números, aliases, `place_id`, tracking o identificadores de proyecto como credenciales;
11. documentar valores secretos para probar separación;
12. inventar que existe staging físico cuando solo existe una etiqueta `preview` o un entorno de test del proveedor;
13. declarar conformidad completa con una tríada si solo se acreditan `test` y `prod`;
14. crear cuentas, proyectos, claves, certificados, secretos o ambientes durante esta fase documental;
15. adelantar almacenamiento/custodia de `INT-EXT-007` o lifecycle de `INT-EXT-008`.

---

#### 15. Criterios de aceptación

`INT-EXT-006` queda documentalmente completa cuando se cumplen simultáneamente estos criterios:

1. existen exactamente veintiuna decisiones, una por `EXT-SYS-001` a `EXT-SYS-021`;
2. no existen identidades faltantes ni duplicadas;
3. se preserva la distribución heredada `3 + 6 + 2 + 6 + 4 = 21`;
4. `DEVELOPMENT`, `STAGING` y `PRODUCTION` quedan definidos como identidades VENTO y no como aliases automáticos del proveedor;
5. cada credencial material futura queda limitada a un único ambiente VENTO;
6. la coherencia abarca runtime, principal, credencial, recurso externo y destino interno;
7. los bindings sin evidencia suficiente permanecen pendientes o no aplicables, sin declarar cumplimiento ficticio;
8. Wompi queda reconocido como separación parcial `test` / `prod`, no como tríada VENTO completa;
9. Expo/EAS conserva sus perfiles observados sin convertir `preview` en `STAGING` por inferencia;
10. Expo Push y Zebra no reciben credenciales ficticias;
11. Google Wallet no se presenta como binding remoto acreditado;
12. se registran propietarios y condiciones de salida para toda evidencia física pendiente;
13. no se crea, expone, almacena, rota ni revoca ningún secreto;
14. no se modifica código, Supabase, proveedor, configuración remota ni datos;
15. la tarea produce cero cambios en requisitos de prueba porque materializa por identidad una obligación ambiental ya cubierta por los controles canónicos vigentes y no introduce una nueva superficie ejecutable.

---

#### 16. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Justificación:

- la obligación de credencial independiente por ambiente ya forma parte de los contratos canónicos consumidos por esta tarea;
- los controles vigentes ya exigen mínimo privilegio, ambiente dentro del contexto de ejecución técnica, separación de autoridad, protección de credenciales y trazabilidad sin exposición de secretos;
- `INT-EXT-006` materializa esa obligación sobre las veintiuna identidades y clasifica la evidencia actual, pero no crea una credencial, endpoint, mecanismo, permiso, esquema, cambio de datos, almacenamiento, lifecycle ni comportamiento ejecutable nuevo;
- las brechas físicas quedan asignadas a tareas propietarias y condiciones de salida explícitas, sin declararlas satisfechas.

---

#### 17. Resultado de la tarea

`INT-EXT-006` queda **APROBADA** como definición documental completa de separación de credenciales por ambiente para las veintiuna identidades externas.

Resultado consolidado:

- `VENTO-EXTERNAL-CREDENTIAL-ENVIRONMENT-CONTRACT-001`: **ESPECIFICADO**;
- `VENTO-EXTERNAL-CREDENTIAL-ENVIRONMENT-MATRIX-001`: **21/21 decisiones materializadas**;
- faltantes: **0**;
- duplicados: **0**;
- tríadas `DEVELOPMENT` / `STAGING` / `PRODUCTION` físicamente acreditadas: **0**;
- separación parcial acreditada: **1** (`EXT-SYS-002` Wompi, `test` / `prod` sin equivalencia automática a la tríada VENTO);
- separaciones especificadas pendientes de evidencia: **6**;
- configuraciones de ambiente sin separación de credencial acreditada: **2**;
- bindings observados sin credencial externa: **2**;
- modelo documentado sin binding: **1**;
- identidades `NO_APLICA_ACTUAL`: **9**;
- credenciales, secretos, cuentas, proyectos o ambientes creados: **0**;
- cambios físicos: **0**;
- requisitos de prueba creados o modificados: **0**.

La siguiente tarea queda reservada exclusivamente para almacenamiento seguro de secretos; esta tarea no adelanta esa decisión.

---

ÚLTIMA TAREA APROBADA

`INT-EXT-005 — Definir alcance mínimo de cada credencial`

TAREA ACTUAL APROBADA

`INT-EXT-006 — Separar credenciales de desarrollo, staging y producción`

SIGUIENTE TAREA RESERVADA

`INT-EXT-007 — Definir almacenamiento seguro de secretos`


### ✅ INT-EXT-007 — Definir almacenamiento seguro de secretos

**Estado:** APROBADA
**Tarea anterior:** `INT-EXT-006 — Separar credenciales de desarrollo, staging y producción` — APROBADA
**Tarea siguiente:** `INT-EXT-008 — Definir rotación, expiración y revocación de credenciales` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materializada de la custodia segura de secretos para cada identidad `EXT-SYS-001` a `EXT-SYS-021`, distinguiendo material secreto, credenciales públicas, configuración no secreta, referencias de credencial y tokens operativos, sin crear, mover, rotar, revocar ni desplegar secretos o modificar código, datos, proveedores o configuración remota
**Bloque:** X — Integraciones
**Mini-bloque:** Integraciones externas y credenciales
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`

---

#### 1. Objetivo

Definir la frontera canónica de custodia para todo material sensible usado por las veintiuna identidades externas ya inventariadas, preservando procedencia, mecanismo, alcance y ambiente aprobados en `INT-EXT-003` a `INT-EXT-006`.

La tarea debe impedir estas ambigüedades:

```text
REFERENCIA DE CREDENCIAL
≠ VALOR SECRETO
```

```text
CREDENCIAL PUBLICABLE / CONFIGURACIÓN PÚBLICA
≠ SECRETO CONFIDENCIAL
```

```text
VARIABLE DE ENTORNO
≠ EVIDENCIA AUTOMÁTICA DE CUSTODIA SEGURA
```

```text
TABLA EMPRESARIAL PRIVADA
≠ SECRET STORE
```

```text
SECRETO DISPONIBLE EN RUNTIME
≠ SECRETO DISPONIBLE PARA USUARIO, CLIENTE O LOG
```

El objetivo es que cada secreto tenga una única custodia aprobada por ambiente, sea alcanzado únicamente por el principal técnico que lo necesita y nunca se materialice en clientes, código versionado, tablas empresariales, comandos persistidos, artefactos, logs o respuestas.

La tarea no define todavía rotación, expiración o revocación; esos elementos pertenecen a `INT-EXT-008`.

---

#### 2. Resultado sustantivo

Se aprueban dos artefactos documentales internos de esta tarea:

- `VENTO-EXTERNAL-SECRET-CUSTODY-CONTRACT-001`, que define clasificación, ubicaciones admisibles, accesos, referencias y prohibiciones de custodia;
- `VENTO-EXTERNAL-SECRET-CUSTODY-MATRIX-001`, que materializa una decisión para cada `EXT-SYS-001` a `EXT-SYS-021`.

Balance materializado:

| Control                                                            | Resultado |
| ------------------------------------------------------------------ | --------: |
| Identidades heredadas esperadas                                    |    **21** |
| Identidades materializadas                                         | **21/21** |
| Identificadores únicos                                             |    **21** |
| Identidades faltantes                                              |     **0** |
| Identidades duplicadas                                             |     **0** |
| Custodias server-side especificadas pendientes de evidencia física |     **4** |
| Configuraciones públicas que no deben tratarse como secretos       |     **2** |
| Configuraciones de plataforma sin secreto externo acreditado       |     **2** |
| Bindings observados sin secreto externo de cliente                 |     **2** |
| Identidad con brecha de custodia observada                         |     **1** |
| Modelo de secret store documentado sin binding acreditado          |     **1** |
| Identidades sin binding actual a las que no aplica custodia física |     **9** |
| Valores secretos creados, copiados, movidos o expuestos            |     **0** |
| Requisitos de prueba creados o modificados                         |     **0** |

Distribución de `INT-EXT-007`:

```text
4 CUSTODIA_SERVER_SIDE_ESPECIFICADA_PENDIENTE_DE_EVIDENCIA
+
2 CONFIGURACION_PUBLICA_NO_SECRETA
+
2 CONFIGURACION_DE_PLATAFORMA_SIN_SECRETO_ACREDITADO
+
2 SIN_SECRETO_EXTERNO_OBSERVADO
+
1 CUSTODIA_CON_BRECHA_OBSERVADA
+
1 MODELO_DOCUMENTADO_SIN_BINDING
+
9 NO_APLICA_ACTUAL
=
21
```

La distribución de evidencia heredada de `INT-EXT-001` permanece sin cambios:

```text
3 BINDING_TECNICO_OBSERVADO
+
6 BINDING_CONDICIONAL_OBSERVADO
+
2 CONFIGURACION_OBSERVADA
+
6 DOCUMENTADO_SIN_BINDING_ACREDITADO
+
4 PROVEEDOR_NO_ACREDITADO
=
21
```

---

#### 3. Fuentes y contratos preservados

La tarea consume y conserva sin redefinir:

- `INT-EXT-001`, incluidas las veintiuna identidades externas, sus proveedores, propietarios, custodios técnicos, finalidades y clases de evidencia;
- `INT-EXT-002`, incluida la separación entre actor humano, `IntegrationPrincipal`, cuenta externa, referencia de credencial, valor secreto y autoridad empresarial;
- `INT-EXT-003`, incluida la procedencia por superficie de credencial;
- `INT-EXT-004`, incluidos los mecanismos de autenticación acreditados y la separación entre autenticación técnica y autorización empresarial;
- `INT-EXT-005`, incluido el alcance técnico mínimo por credencial;
- `INT-EXT-006`, incluida la obligación de referencias y materiales independientes por ambiente;
- `SHELL-CON-018`, como handoff de la referencia física de credencial sin inclusión del valor secreto;
- el registro canónico vigente de requisitos de prueba, que ya exige inventario no sensible, custodia cifrada y separada, prohibición de secretos en código, tablas legibles por cliente, comandos persistidos, migraciones, logs y artefactos, y mínimo privilegio para credenciales externas.

La evidencia técnica actual acredita, sin revelar valores:

- secretos server-side consumidos desde el runtime de funciones para Supabase, Wompi, RevenueCat y Resend;
- credenciales o configuraciones publicables incorporadas a clientes para RevenueCat, Sentry y Google Maps;
- material de certificado y clave privada de Apple consumido en servidor;
- un token opaco VENTO por pase almacenado actualmente en el registro de Wallet;
- un modelo documental de cuenta de servicio de Google Wallet destinado a secretos de servidor;
- bindings de Expo Push y Zebra BrowserPrint sin secreto externo de cliente observado;
- plataformas o sistemas sin binding suficiente para inventar un secreto inexistente.

La presencia de `Deno.env`, `process.env`, un nombre de variable o una instrucción documental de configuración demuestra consumo o intención, pero no acredita por sí sola cifrado, control de lectura, auditoría, separación ambiental o conformidad física del secret store.

---

#### 4. Clasificación canónica del material

`VENTO-EXTERNAL-SECRET-CUSTODY-CONTRACT-001` distingue estas clases:

| Clase                             | Definición                                                                                                      | Tratamiento de custodia                                                        |
| --------------------------------- | --------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------ |
| `SECRET_STATIC_SERVER_SIDE`       | API secret, private key, password, webhook secret, service-role key o material equivalente que debe recuperarse | secret store cifrado y acceso solo server-side                                 |
| `SECRET_DYNAMIC_VERIFIER`         | token opaco o secreto generado cuya comprobación no requiere necesariamente recuperar el valor original         | hash/verificador unidireccional cuando sea técnicamente suficiente             |
| `SECRET_DYNAMIC_RECOVERABLE`      | secreto dinámico que debe volver a presentarse o reconstruirse con el mismo valor                               | custodia cifrada separada y referencia no sensible                             |
| `PUBLIC_CREDENTIAL_RESTRICTED`    | API key o identificador diseñado para distribuirse en cliente, pero sujeto a alcance y restricciones            | configuración pública; nunca se reetiqueta como secreto ocultable              |
| `PUBLIC_CONFIGURATION`            | URL, DSN publicable, issuer, class, project ID, place ID u otro dato no secreto                                 | configuración versionable o pública según contrato                             |
| `CREDENTIAL_REFERENCE`            | identificador no sensible que permite resolver una credencial sin contener su valor                             | puede persistirse o versionarse conforme al contrato                           |
| `DESTINATION_TOKEN_OR_IDENTIFIER` | token de push, UID o identificador de destino que no autentica al cliente frente al proveedor                   | tratar según sensibilidad/privacidad, no como secreto de autenticación externo |
| `NO_SECRET_APPLICABLE`            | binding que no presenta material secreto externo actual                                                         | no se inventa un secret store                                                  |

Una misma identidad puede contener varias superficies y, por tanto, varias clases simultáneas.

---

#### 5. `VENTO-EXTERNAL-SECRET-CUSTODY-CONTRACT-001`

Toda superficie con material secreto deberá representar al menos:

```text
AMBIENTE VENTO
+
SISTEMA EXTERNO
+
INTEGRATION PRINCIPAL
+
SUPERFICIE DE CREDENCIAL
+
REFERENCIA NO SENSIBLE
+
CLASE DE SECRETO
+
CUSTODIO TÉCNICO
+
SECRET STORE APROBADO
+
POLÍTICA DE ACCESO MÍNIMO
→ MATERIAL SECRETO RESUELTO SOLO EN RUNTIME AUTORIZADO
```

Reglas obligatorias:

1. el valor secreto no forma parte de `ExternalCredentialId`, `IntegrationPrincipal`, `PermissionKey`, `external_system_id`, `provider_account_ref` ni metadata empresarial;
2. el repositorio puede contener nombres de variables, contratos, referencias, schemas de configuración y ejemplos inequívocamente no sensibles, pero nunca valores funcionales;
3. un secreto server-side está prohibido en bundles web o móviles, variables `EXPO_PUBLIC_*`, JavaScript entregado a navegador, respuestas API o artefactos descargables;
4. el valor secreto no se persiste en tablas empresariales, configuración legible por cliente, comandos de cron, migraciones, comentarios, fixtures o logs;
5. una tabla con RLS, un schema privado o una fila no expuesta no se convierte automáticamente en secret store;
6. el secret store debe cifrar material en reposo mediante la capacidad administrada o técnica aprobada de la plataforma;
7. el acceso al valor se concede al principal técnico mínimo que lo consume, no a una aplicación completa por conveniencia;
8. un runtime solo puede resolver secretos de su propio ambiente conforme a `INT-EXT-006`;
9. una referencia de credencial puede ser compartida documentalmente cuando sea no sensible, pero debe resolver a un material distinto por ambiente cuando el contrato lo exija;
10. los secretos no se copian entre proveedores, aplicaciones o funciones para evitar configurar un binding independiente;
11. si dos consumidores requieren el mismo material por contrato externo, el acceso se declara explícitamente y no se presume por estar en el mismo repositorio o proyecto;
12. la lectura humana ordinaria del valor secreto no es requisito operativo; la administración humana excepcional debe limitarse a funciones autorizadas y dejar evidencia de acceso cuando la plataforma lo permita;
13. CI/CD puede inyectar un secreto únicamente desde un store aprobado y debe impedir su impresión, persistencia en artefactos o paso a jobs no autorizados;
14. desarrollo local puede usar material no productivo mediante mecanismos locales no versionados; ningún mecanismo local acredita custodia de staging o producción;
15. si el proveedor diseña una clave como publicable o una credencial debe incorporarse al cliente, el control se traslada a alcance, restricción por aplicación/API/dominio/cuota y separación ambiental; ocultarla dentro del bundle no constituye seguridad;
16. tokens dinámicos destinados únicamente a comparación deben preferir un verificador criptográfico no reversible cuando el flujo no requiera recuperar el original;
17. secretos dinámicos que deban recuperarse conservan el material cifrado en una custodia separada de la entidad empresarial y la entidad guarda únicamente una referencia no sensible;
18. ningún valor secreto debe aparecer en auditoría; la evidencia usa identificador de credencial, versión o fingerprint no reversible apropiado;
19. la indisponibilidad del secret store, ausencia del material o falta de autorización para leerlo debe bloquear la operación que lo requiere;
20. lifecycle de alta, rotación, expiración, revocación y destrucción del valor queda reservado a `INT-EXT-008`.

---

#### 6. Secret stores admisibles por superficie

La custodia se selecciona por runtime y no por preferencia de lenguaje o repositorio.

| Superficie de ejecución                              | Custodia objetivo admisible                                                                                              | Material prohibido                                               |
| ---------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------- |
| Supabase Edge Functions                              | secretos administrados del proyecto o mecanismo cifrado privado aprobado, separados por ambiente                         | tablas empresariales, configuración cliente, migraciones, código |
| Backend/serverless desplegado en Vercel              | variables/secretos server-side administrados por el proyecto y ambiente de Vercel u otro secret store integrado aprobado | variables publicables, bundle cliente, repositorio               |
| GitHub Actions / CI autorizado                       | secretos o ambientes protegidos del sistema CI, limitados al workflow y ambiente autorizados                             | YAML con valor literal, output de job, artefactos                |
| Expo/EAS cuando una credencial privada sea necesaria | secret/environment store administrado por Expo/EAS y restringido al perfil/ambiente correspondiente                      | `EXPO_PUBLIC_*` o bundle de aplicación                           |
| Runtime local                                        | mecanismo local no versionado con credenciales exclusivamente no productivas                                             | archivo versionado, ejemplo funcional, secreto productivo        |
| Token dinámico verificable sin recuperación          | hash/verificador fuerte asociado a la relación autorizada                                                                | valor original persistido en tabla empresarial                   |
| Token dinámico que deba recuperarse                  | secret store cifrado separado, con referencia desde la entidad empresarial                                               | valor original directamente en la fila empresarial               |

Esta lista define clases de custodia. No afirma que la configuración remota actual de cada plataforma haya sido inspeccionada o certificada.

---

#### 7. Acceso mínimo y separación de responsabilidades

La custodia segura exige separar:

```text
PROPIETARIO FUNCIONAL
≠ CUSTODIO TÉCNICO
≠ ADMINISTRADOR DEL SECRET STORE
≠ PRINCIPAL TÉCNICO CONSUMIDOR
≠ ACTOR HUMANO
```

Reglas:

1. el propietario funcional aprueba finalidad y necesidad, no recibe el secreto por defecto;
2. el custodio técnico administra la integración, pero no obtiene autoridad empresarial por custodiar la credencial;
3. el principal técnico consumidor recibe únicamente capacidad de resolver los secretos de sus superficies;
4. el administrador del secret store puede gestionar la custodia sin convertirse en consumidor funcional;
5. soporte, analítica, operaciones y usuarios finales no reciben lectura del valor por conveniencia;
6. un secreto privilegiado de Supabase no se comparte con un proveedor externo ni con aplicaciones cliente;
7. la cuenta personal de un desarrollador no sustituye una identidad técnica del runtime;
8. la auditoría registra acceso o cambio de la referencia cuando sea posible, nunca el valor.

---

#### 8. Tratamiento de credenciales publicables

No todo material llamado `key`, `token`, `dsn` o `id` es un secreto ocultable.

Para credenciales diseñadas para cliente:

- se declara explícitamente su clase `PUBLIC_CREDENTIAL_RESTRICTED` o `PUBLIC_CONFIGURATION`;
- se acepta que el valor pueda inspeccionarse en el bundle o tráfico del cliente;
- la seguridad depende de alcance mínimo, restricciones del proveedor, identidad de aplicación, dominios, APIs permitidas, cuotas y controles server-side posteriores;
- una credencial publicable nunca se usa como prueba suficiente de actor, permiso empresarial o acceso privilegiado interno;
- moverla a un archivo aparentemente oculto dentro del cliente no cambia su naturaleza;
- una contraparte privada asociada, si existe, se custodia separadamente como secreto server-side.

Aplicaciones actuales de esta regla incluyen las claves SDK publicables de RevenueCat, el DSN de Sentry y la API key de Google Maps usada desde cliente.

---

#### 9. `VENTO-EXTERNAL-SECRET-CUSTODY-MATRIX-001`

| ID            | Sistema / plataforma                     | Material o superficie relevante                                                                                    | Decisión `INT-EXT-007`                                     | Estado físico            | Custodia objetivo / condición de salida                                                                                                                                                                                                                                                                                                                                                                          |
| ------------- | ---------------------------------------- | ------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------- | ------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `EXT-SYS-001` | Supabase                                 | clave publicable/anon para cliente; clave privilegiada `service_role` o secret key para backend                    | `CUSTODIA_SERVER_SIDE_ESPECIFICADA_PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | la clave publicable permanece como configuración cliente; toda clave privilegiada se resuelve únicamente desde secret store server-side del ambiente y nunca desde bundle, tabla empresarial o proveedor externo; acreditar custodia remota y consumidores                                                                                                                                                       |
| `EXT-SYS-002` | Wompi                                    | public key; secreto de integridad; secreto de eventos/webhook                                                      | `CUSTODIA_SERVER_SIDE_ESPECIFICADA_PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | public key se conserva como credencial publicable; secretos de integridad y webhook se resuelven server-side desde secret store independiente por ambiente; acreditar valores/referencias remotas sin exponerlos                                                                                                                                                                                                 |
| `EXT-SYS-003` | RevenueCat                               | API keys SDK Apple/Google publicables; secreto de webhook                                                          | `CUSTODIA_SERVER_SIDE_ESPECIFICADA_PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | API keys SDK permanecen como credenciales publicables; secreto de webhook solo en secret store server-side del ambiente; acreditar custodia física del webhook secret                                                                                                                                                                                                                                            |
| `EXT-SYS-004` | Resend                                   | `RESEND_API_KEY` server-side                                                                                       | `CUSTODIA_SERVER_SIDE_ESPECIFICADA_PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | API key exclusivamente en secret store del runtime server-side correspondiente; acreditar custodia y acceso mínimo sin valor en repositorio, respuesta o log                                                                                                                                                                                                                                                     |
| `EXT-SYS-005` | Expo / EAS Update                        | perfiles, canales, project ID y configuración observados; credencial administrativa no acreditada                  | `CONFIGURACION_DE_PLATAFORMA_SIN_SECRETO_ACREDITADO`       | `PENDIENTE_DE_EVIDENCIA` | no se inventa secreto; si una operación futura requiere token privado de Expo/EAS deberá residir en secret store de CI/EAS del ambiente y no en `EXPO_PUBLIC_*`                                                                                                                                                                                                                                                  |
| `EXT-SYS-006` | Expo Push Service                        | push tokens como destinos; llamada externa inspeccionada sin credencial de cliente Expo                            | `SIN_SECRETO_EXTERNO_OBSERVADO`                            | `NO_APLICA`              | no se crea secret store ficticio para Expo; secretos internos VENTO que protejan la función permanecen bajo gobierno de secretos internos y no se reetiquetan como credenciales de Expo                                                                                                                                                                                                                          |
| `EXT-SYS-007` | Sentry                                   | `EXPO_PUBLIC_SENTRY_DSN`                                                                                           | `CONFIGURACION_PUBLICA_NO_SECRETA`                         | `ESPECIFICADO`           | DSN se trata como configuración de ingestión publicable y restringida; no se usa como secreto ni autoridad empresarial; cualquier token administrativo futuro deberá tener custodia server-side independiente                                                                                                                                                                                                    |
| `EXT-SYS-008` | Google Maps / Google Reviews             | `EXPO_PUBLIC_GOOGLE_MAPS_API_KEY`; URLs públicas; coordenadas; place ID                                            | `CONFIGURACION_PUBLICA_NO_SECRETA`                         | `ESPECIFICADO`           | API key cliente se protege mediante restricciones del proveedor y alcance mínimo, no mediante ocultación en bundle; cualquier credencial server-side futura requerirá secret store independiente                                                                                                                                                                                                                 |
| `EXT-SYS-009` | Apple Wallet / PassKit + APNs            | certificado/clave privada P12, password P12, clave APNs P8, identificadores de clave/equipo y token opaco por pase | `CUSTODIA_CON_BRECHA_OBSERVADA`                            | `NO_CONFORME_OBSERVADO`  | P12/password/P8 únicamente en secret store server-side por ambiente; certificados públicos e identificadores se distinguen del secreto; el token opaco por pase no debe persistirse como valor original en la entidad empresarial: usar verificador no reversible cuando baste para comparar o custodia cifrada separada cuando deba recuperarse; retirar la persistencia directa del valor antes de conformidad |
| `EXT-SYS-010` | Vercel                                   | configuración de hosting observada; credencial administrativa/deploy no acreditada                                 | `CONFIGURACION_DE_PLATAFORMA_SIN_SECRETO_ACREDITADO`       | `PENDIENTE_DE_EVIDENCIA` | no se inventa token de Vercel; cualquier token de despliegue o secreto server-side futuro deberá residir en secret store de CI/Vercel limitado al ambiente y proyecto exactos                                                                                                                                                                                                                                    |
| `EXT-SYS-011` | Zebra BrowserPrint                       | UID/nombre/tipo de dispositivo; sin secreto externo de cliente observado                                           | `SIN_SECRETO_EXTERNO_OBSERVADO`                            | `NO_APLICA`              | UID o nombre de impresora no se convierten en secreto; cualquier autenticación futura del bridge deberá acreditarse antes de seleccionar custodia                                                                                                                                                                                                                                                                |
| `EXT-SYS-012` | Google Wallet / Google Pay & Wallet      | modelo documental con JSON de cuenta de servicio, issuer y class                                                   | `MODELO_DOCUMENTADO_SIN_BINDING`                           | `PENDIENTE_DE_EVIDENCIA` | JSON de cuenta de servicio se define como secreto server-side en secret store de la función/ambiente; issuer y class son configuración no secreta; acreditar binding runtime antes de declarar implementación                                                                                                                                                                                                    |
| `EXT-SYS-013` | POS externo vigente                      | proveedor, interfaz y credenciales no acreditados                                                                  | `NO_APLICA_ACTUAL`                                         | `BLOQUEADO`              | `INT-POS-001` debe acreditar proveedor, cuenta, binding y material antes de asignar custodia                                                                                                                                                                                                                                                                                                                     |
| `EXT-SYS-014` | Shopify / comercio electrónico           | integración no acreditada                                                                                          | `NO_APLICA_ACTUAL`                                         | `NO_APLICA`              | acreditar binding y clase real de credencial antes de definir secret store                                                                                                                                                                                                                                                                                                                                       |
| `EXT-SYS-015` | Rappi / marketplace                      | integración no acreditada                                                                                          | `NO_APLICA_ACTUAL`                                         | `NO_APLICA`              | acreditar binding y clase real de credencial antes de definir secret store                                                                                                                                                                                                                                                                                                                                       |
| `EXT-SYS-016` | ManyChat / automatización conversacional | integración no acreditada                                                                                          | `NO_APLICA_ACTUAL`                                         | `NO_APLICA`              | acreditar binding y clase real de credencial antes de definir secret store                                                                                                                                                                                                                                                                                                                                       |
| `EXT-SYS-017` | WhatsApp                                 | proveedor/API no acreditados                                                                                       | `NO_APLICA_ACTUAL`                                         | `NO_APLICA`              | acreditar proveedor, cuenta y binding antes de definir secret store                                                                                                                                                                                                                                                                                                                                              |
| `EXT-SYS-018` | Instagram / social                       | API/binding no acreditados                                                                                         | `NO_APLICA_ACTUAL`                                         | `NO_APLICA`              | acreditar proveedor, aplicación y binding antes de definir secret store                                                                                                                                                                                                                                                                                                                                          |
| `EXT-SYS-019` | Correo corporativo y alias funcionales   | proveedor e integración no acreditados                                                                             | `NO_APLICA_ACTUAL`                                         | `BLOQUEADO`              | acreditar proveedor, cuenta técnica e interfaz antes de definir secret store                                                                                                                                                                                                                                                                                                                                     |
| `EXT-SYS-020` | Telefonía / voz                          | operador e integración no acreditados                                                                              | `NO_APLICA_ACTUAL`                                         | `BLOQUEADO`              | acreditar operador, cuenta e interfaz antes de definir secret store                                                                                                                                                                                                                                                                                                                                              |
| `EXT-SYS-021` | Transporte externo                       | proveedor e interfaz no acreditados                                                                                | `NO_APLICA_ACTUAL`                                         | `BLOQUEADO`              | acreditar proveedor, cuenta e interfaz antes de definir secret store                                                                                                                                                                                                                                                                                                                                             |

---

#### 10. Reconciliación de cobertura

La matriz conserva exactamente las veintiuna identidades heredadas y produce una única decisión primaria por identidad.

```text
4 CUSTODIA_SERVER_SIDE_ESPECIFICADA_PENDIENTE_DE_EVIDENCIA
+
2 CONFIGURACION_PUBLICA_NO_SECRETA
+
2 CONFIGURACION_DE_PLATAFORMA_SIN_SECRETO_ACREDITADO
+
2 SIN_SECRETO_EXTERNO_OBSERVADO
+
1 CUSTODIA_CON_BRECHA_OBSERVADA
+
1 MODELO_DOCUMENTADO_SIN_BINDING
+
9 NO_APLICA_ACTUAL
=
21
```

La clasificación primaria no elimina superficies secundarias. Wompi y RevenueCat, por ejemplo, combinan material publicable y material secreto; Apple combina secretos estáticos, identificadores no secretos y un secreto dinámico por pase.

Faltantes = `0`.

Duplicados = `0`.

Identificadores únicos = `21`.

---

#### 11. Estado especial de secretos server-side consumidos por runtime

El uso actual de `Deno.env` o `process.env` permite afirmar que el código espera obtener ciertos valores desde el entorno del runtime, pero no permite afirmar por sí solo:

- qué producto o mecanismo físico custodia el valor;
- si el valor está cifrado en reposo;
- qué humanos pueden verlo;
- qué principals técnicos pueden resolverlo;
- si el mismo valor se reutiliza en otro ambiente;
- si existen copias fuera del runtime;
- si CI/CD imprime o conserva el valor;
- si el remoto actual coincide con el contrato documental.

Por tanto, Supabase, Wompi, RevenueCat y Resend permanecen `PENDIENTE_DE_EVIDENCIA` en custodia física aunque el consumo server-side esté observado.

La conformidad futura requiere demostrar referencia, plataforma de custodia, ambiente y consumidor sin revelar el valor.

---

#### 12. Estado especial de Apple Wallet

`EXT-SYS-009` contiene varias clases y no puede resolverse con una sola política genérica.

| Material                                             | Clase                                                                         | Decisión de custodia                                                                            |
| ---------------------------------------------------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| certificado de Pass Type cuando sea material público | `PUBLIC_CONFIGURATION`                                                        | puede conservarse como certificado cuando no incluya clave privada                              |
| clave privada asociada al P12                        | `SECRET_STATIC_SERVER_SIDE`                                                   | secret store server-side por ambiente                                                           |
| password del P12                                     | `SECRET_STATIC_SERVER_SIDE`                                                   | secret store server-side por ambiente                                                           |
| clave privada P8 para APNs                           | `SECRET_STATIC_SERVER_SIDE`                                                   | secret store server-side por ambiente                                                           |
| key ID / team ID / pass type ID                      | `PUBLIC_CONFIGURATION`                                                        | referencia/configuración no secreta                                                             |
| token opaco VENTO por pase                           | `SECRET_DYNAMIC_VERIFIER` o `SECRET_DYNAMIC_RECOVERABLE` según necesidad real | nunca como valor original directamente en la entidad empresarial                                |
| push token de dispositivo                            | `DESTINATION_TOKEN_OR_IDENTIFIER`                                             | dato técnico sensible de destino; no se reetiqueta como secreto que autentica a VENTO ante APNs |

La implementación observada genera un token aleatorio por pase y lo persiste directamente como `auth_token` en el registro del pase. Esa persistencia no satisface el contrato objetivo de `INT-EXT-007`.

Condición de conformidad:

```text
SI SOLO SE NECESITA VERIFICAR
→ GUARDAR VERIFICADOR / HASH NO REVERSIBLE
```

```text
SI EL MISMO VALOR DEBE RECUPERARSE
→ GUARDAR VALOR EN SECRET STORE CIFRADO
→ ENTIDAD EMPRESARIAL CONSERVA REFERENCIA NO SENSIBLE
```

La decisión entre ambos patrones depende del consumo técnico real y deberá implementarse sin debilitar el contrato de autenticación de `INT-EXT-004`.

---

#### 13. Trazabilidad de handoff

| Pendiente                                                                                     | Estado                        | Propietario / tarea responsable                                                             | Condición de salida                                                                                                                                                          |
| --------------------------------------------------------------------------------------------- | ----------------------------- | ------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Referencia física de credencial sin valor secreto                                             | `FUERA_DE_ALCANCE`            | `SHELL-CON-018`                                                                             | contrato consumible enlaza sistema, principal, superficie, ambiente y referencia sin contener material secreto                                                               |
| Evidencia física del secret store y permisos de lectura de cada superficie server-side        | `PENDIENTE_DE_EVIDENCIA`      | `INT-EXT-007` como contrato; implementación en la tarea técnica propietaria que corresponda | evidencia identifica plataforma de custodia, ambiente y principal consumidor sin revelar valor, y prueba denegación a consumidor no autorizado                               |
| Retiro de persistencia directa del token opaco Apple desde la entidad empresarial             | `PENDIENTE_DE_IMPLEMENTACION` | `SUPA-TRANS-010` y paquete propietario de PASS según el registro canónico de seguridad      | el valor original deja de residir directamente en la fila empresarial y el flujo funciona mediante verificador o referencia a custodia cifrada                               |
| Remediación de secretos ya identificados fuera de custodia aprobada en la línea base Supabase | `PENDIENTE_DE_IMPLEMENTACION` | `SUPA-TRANS-010` / `SUPA-ARC-024` conforme al registro canónico vigente                     | secretos identificados dejan tablas/configuración/comandos persistidos, pasan a custodia aprobada y la exposición anterior queda cerrada por la tarea de lifecycle aplicable |
| Lifecycle de alta, rotación, expiración, revocación y destrucción de credenciales             | `FUERA_DE_ALCANCE`            | `INT-EXT-008`                                                                               | cada familia de credencial dispone de reglas de lifecycle y evidencia de invalidez del material retirado                                                                     |
| Proveedor, binding y credenciales exactas del POS                                             | `BLOQUEADO_POR_EVIDENCIA`     | `INT-POS-001`                                                                               | proveedor, cuenta, interfaz y credenciales quedan acreditados antes de seleccionar custodia                                                                                  |
| Secretos futuros de identidades actualmente sin binding                                       | `BLOQUEADO_POR_EVIDENCIA`     | tarea que materialice el binding de cada integración                                        | binding real acredita clase de credencial, runtime, ambiente y consumidor antes de crear la referencia de secret store                                                       |

No queda pendiente narrativo sin propietario, tarea responsable o condición de salida.

---

#### 14. Prohibiciones

Queda prohibido:

1. almacenar valores secretos en tablas empresariales aunque tengan RLS;
2. almacenar secretos en configuración legible por cliente;
3. incluir secretos en código, migraciones, comentarios, ejemplos funcionales, fixtures o artefactos;
4. incluir secretos en comandos persistidos de cron o automatización;
5. incluir valores secretos en logs, métricas, trazas, errores, respuestas o auditoría;
6. usar `EXPO_PUBLIC_*` para una credencial que deba permanecer confidencial;
7. tratar una API key cliente, DSN o identificador publicable como secreto y asumir que ocultarlo en el bundle lo protege;
8. tratar una variable de entorno como prueba suficiente de cifrado o mínimo privilegio;
9. tratar una tabla privada, schema privado o registro restringido como secret store sin un contrato específico de custodia;
10. compartir un secreto de `PRODUCTION` con `DEVELOPMENT` o `STAGING`;
11. compartir secretos entre integraciones para simplificar configuración salvo que el contrato externo exija exactamente el mismo material y el acceso compartido quede acreditado;
12. entregar `service_role`, private keys o secretos de webhook a aplicaciones cliente o proveedores externos;
13. guardar el valor secreto dentro de una referencia, identificador, metadata empresarial o nombre de archivo;
14. conservar un token verificable en forma recuperable si el flujo solo necesita comprobar posesión y un verificador seguro satisface el contrato;
15. afirmar custodia remota conforme únicamente porque el código llama `Deno.env` o `process.env`;
16. inventar secretos, cuentas, stores, proyectos, bindings o consumidores para identidades no acreditadas;
17. ejecutar durante esta fase documental movimientos, rotaciones, revocaciones, cambios de secretos o modificaciones físicas de configuración;
18. adelantar las decisiones de lifecycle reservadas a `INT-EXT-008`.

---

#### 15. Criterios de aceptación

`INT-EXT-007` queda documentalmente completa cuando se cumplen simultáneamente estos criterios:

1. existen exactamente veintiuna decisiones, una por `EXT-SYS-001` a `EXT-SYS-021`;
2. faltantes = `0`;
3. duplicados = `0`;
4. se distingue valor secreto de referencia no sensible;
5. se distingue credencial publicable de secreto confidencial;
6. se especifica custodia server-side para toda superficie secreta acreditada;
7. la custodia se separa por ambiente conforme a `INT-EXT-006`;
8. el valor no puede residir en código, tabla empresarial, configuración cliente, comando persistido, log o artefacto;
9. los principals técnicos reciben acceso mínimo por superficie;
10. los sistemas sin secreto observado no reciben uno ficticio;
11. los sistemas sin binding no reciben una ubicación de custodia inventada;
12. Apple Wallet conserva clasificación separada para claves privadas, configuraciones públicas, token por pase y token de dispositivo;
13. la persistencia directa del token opaco Apple queda registrada como brecha y con condición de salida explícita;
14. la evidencia actual de variables de runtime no se eleva indebidamente a conformidad física;
15. no se modifica código, Supabase, datos, secretos, proveedores ni configuración remota;
16. no se adelanta rotación, expiración o revocación;
17. la tarea produce cero cambios de requisitos porque materializa sobre las veintiuna identidades controles de custodia ya protegidos por el registro canónico vigente.

---

#### 16. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Justificación:

- el registro vigente ya exige inventario de secretos sin almacenar valores, custodia cifrada y separada, mínimo privilegio, secret scanning, prohibición de persistencia en tablas/configuración/comandos/código/logs y gobierno de credenciales externas;
- `INT-EXT-007` aplica y materializa esas obligaciones sobre las veintiuna identidades externas y sus superficies ya acreditadas;
- la tarea no crea una nueva credencial, endpoint, autoridad, mecanismo de autenticación, almacenamiento físico, dato, transporte u operación empresarial;
- la brecha observada del token Apple y las exposiciones ya registradas en la línea base de seguridad son no conformidades frente a controles existentes, no reglas protegidas nuevas;
- lifecycle permanece reservado a la tarea siguiente.

El registro canónico de requisitos permanece sin cambios.

---

#### 17. Resultado de la tarea

`INT-EXT-007` queda **APROBADA** como definición documental completa de almacenamiento y custodia segura de secretos para las veintiuna identidades externas.

Resultado consolidado:

- `VENTO-EXTERNAL-SECRET-CUSTODY-CONTRACT-001` aprobado;
- `VENTO-EXTERNAL-SECRET-CUSTODY-MATRIX-001` materializada `21/21`;
- faltantes `0`;
- duplicados `0`;
- cuatro identidades con custodia server-side especificada y evidencia física pendiente;
- dos configuraciones públicas clasificadas expresamente como no secretas;
- dos plataformas sin secreto externo acreditado en su configuración observada;
- dos bindings observados sin secreto externo de cliente;
- una identidad con brecha de custodia observada: Apple Wallet / PassKit + APNs;
- un modelo documental de secret store sin binding acreditado: Google Wallet;
- nueve identidades sin binding actual mantienen `NO_APLICA_ACTUAL`;
- cero valores secretos creados, copiados, movidos, rotados, revocados o expuestos;
- cero cambios de requisitos de prueba;
- `INT-EXT-008` permanece reservada exclusivamente para rotación, expiración y revocación.

---

ÚLTIMA TAREA APROBADA

`INT-EXT-006 — Separar credenciales de desarrollo, staging y producción`

TAREA ACTUAL APROBADA

`INT-EXT-007 — Definir almacenamiento seguro de secretos`

SIGUIENTE TAREA RESERVADA

`INT-EXT-008 — Definir rotación, expiración y revocación de credenciales`


### ✅ INT-EXT-008 — Definir rotación, expiración y revocación

**Estado:** APROBADA
**Tarea anterior:** `INT-EXT-007 — Definir almacenamiento seguro de secretos` — APROBADA
**Tarea siguiente:** `INT-EXT-009 — Definir contratos de entrada y salida versionados` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materializada del lifecycle de rotación, expiración, revocación y retiro aplicable a las credenciales o superficies de credencial de `EXT-SYS-001` a `EXT-SYS-021`, preservando principal técnico, mecanismo, alcance mínimo, separación por ambiente y custodia ya aprobados, sin crear, rotar, revocar, reemplazar ni destruir credenciales físicas
**Bloque:** X — Integraciones
**Mini-bloque:** Integraciones externas y credenciales
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/02_INTEGRACIONES_EXTERNAS_Y_CREDENCIALES.md`
**Implementación física autorizada:** ninguna
**Cambios de código, DDL, DML, migraciones, RLS, RPC, secretos, credenciales, cuentas externas, configuración productiva, despliegues o datos:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Materializar un contrato único de lifecycle para las credenciales externas y superficies de credencial ya clasificadas en `INT-EXT-001` a `INT-EXT-007`, sin confundir cuatro operaciones distintas:

```text
ROTAR
≠
EXPIRAR
≠
REVOCAR
≠
RETIRAR LOCALMENTE
```

La tarea establece cuándo una credencial puede seguir activa, cuándo debe sustituirse, qué significa que haya expirado, cómo se invalida realmente en su autoridad emisora y cuándo puede retirarse de consumidores y custodia.

La tarea también elimina estas ambigüedades:

```text
CAMBIAR UNA VARIABLE
≠
REVOCAR LA CREDENCIAL ANTERIOR
```

```text
BORRAR UNA COPIA LOCAL
≠
INVALIDARLA EN EL PROVEEDOR
```

```text
CREAR UNA CREDENCIAL SUCESORA
≠
COMPLETAR LA ROTACIÓN
```

```text
TOKEN DERIVADO EXPIRADO
≠
CLAVE RAÍZ REVOCADA
```

No se fijan periodos universales arbitrarios de 30, 60, 90 días ni equivalentes. La cadencia depende de la clase de material, reglas del emisor, riesgo, contrato aprobado y evidencia real.

---

#### 2. Resultado sustantivo

Se aprueban dos artefactos documentales internos:

- `VENTO-EXTERNAL-CREDENTIAL-LIFECYCLE-CONTRACT-001`;
- `VENTO-EXTERNAL-CREDENTIAL-LIFECYCLE-MATRIX-001`.

Balance materializado:

| Control                                                      | Resultado |
| ------------------------------------------------------------ | --------: |
| Identidades heredadas esperadas                              |    **21** |
| Identidades materializadas                                   | **21/21** |
| Identificadores únicos                                       |    **21** |
| Identidades faltantes                                        |     **0** |
| Identidades duplicadas                                       |     **0** |
| Lifecycle server-side especificado pendiente de evidencia    |     **4** |
| Lifecycle de configuración publicable especificado           |     **2** |
| Plataformas sin credencial administrativa acreditada         |     **2** |
| Bindings observados sin credencial externa                   |     **2** |
| Identidades con brecha de lifecycle observada                |     **1** |
| Modelos documentados sin binding acreditado                  |     **1** |
| Identidades sin binding actual a las que no aplica lifecycle |     **9** |
| Credenciales creadas, sustituidas, revocadas o destruidas    |     **0** |
| Requisitos de prueba creados o modificados                   |     **0** |

Distribución:

```text
4 LIFECYCLE_SERVER_SIDE_ESPECIFICADO_PENDIENTE_DE_EVIDENCIA
+
2 LIFECYCLE_PUBLICABLE_ESPECIFICADO
+
2 LIFECYCLE_DE_PLATAFORMA_SIN_CREDENCIAL_ACREDITADA
+
2 SIN_CREDENCIAL_EXTERNA_OBSERVADA
+
1 LIFECYCLE_CON_BRECHA_OBSERVADA
+
1 MODELO_DOCUMENTADO_SIN_BINDING
+
9 NO_APLICA_ACTUAL
=
21
```

Ninguna clasificación documental equivale por sí sola a una rotación ejecutada, una revocación remota, una fecha de expiración conocida o una prueba operativa.

---

#### 3. Fuentes y contratos preservados

La tarea consume y conserva sin redefinir:

- `INT-EXT-001`, incluidas las veintiuna identidades, proveedores acreditados o no acreditados, propietarios, finalidades y nivel de evidencia;
- `INT-EXT-002`, incluida la separación entre actor humano, principal técnico, cuenta externa, referencia de credencial y autoridad empresarial;
- `INT-EXT-003`, incluida la procedencia de cada credencial o superficie de credencial;
- `INT-EXT-004`, incluidos los mecanismos reales observados y la obligación fail-closed;
- `INT-EXT-005`, incluido el techo de alcance mínimo de cada credencial;
- `INT-EXT-006`, incluida la prohibición de reutilizar material entre `DEVELOPMENT`, `STAGING` y `PRODUCTION`;
- `INT-EXT-007`, incluida la separación entre configuración publicable, secreto server-side, identificador técnico, destino y custodia segura;
- la regla de que `service_role` y cualquier secret key privilegiada permanecen exclusivamente server-side;
- el registro canónico vigente de requisitos de prueba, que ya exige inventario de secretos, rotación posterior a exposición, revocación, trazabilidad de claves privadas y gobierno de credenciales externas.

La tarea no cambia mecanismos, scopes, ambientes, secret stores, proveedores, endpoints ni consumidores.

---

#### 4. Semántica de lifecycle

`VENTO-EXTERNAL-CREDENTIAL-LIFECYCLE-CONTRACT-001` usa estas definiciones:

| Concepto                  | Definición documental                                                                                                                                |
| ------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ROTACION`                | sustitución controlada de una credencial o material por un sucesor independiente, seguida de migración de consumidores e invalidación del predecesor |
| `EXPIRACION`              | pérdida de validez por una fecha, duración o condición definida por el emisor o por un contrato aprobado                                             |
| `REVOCACION`              | invalidación activa de la credencial en la autoridad, cuenta, proyecto o mecanismo que puede aceptarla                                               |
| `RETIRO_LOCAL`            | eliminación de referencias, copias y material obsoleto en consumidores o custodia una vez ya no debe utilizarse                                      |
| `SOLAPAMIENTO_CONTROLADO` | periodo temporal en el que predecesor y sucesor pueden coexistir únicamente cuando el proveedor lo soporta y es necesario para migración segura      |
| `COMPROMISO`              | exposición confirmada o razonablemente sospechada que invalida la confianza en la exclusividad o integridad del material                             |

Reglas:

1. una rotación no termina al generar el sucesor;
2. una revocación no se demuestra eliminando una variable local;
3. una expiración no se extiende localmente si el emisor ya considera inválido el material;
4. una credencial revocada o expirada no vuelve al estado activo;
5. la retirada local ocurre después de que el consumidor ya no necesita el material y la invalidez del predecesor está resuelta;
6. si una credencial no tiene expiración nativa acreditada, no se inventa una fecha de expiración;
7. la ausencia de expiración nativa no elimina revisión, rotación por evento ni capacidad de revocación;
8. cada superficie conserva lifecycle independiente aunque pertenezca al mismo proveedor;
9. cada ambiente conserva lifecycle independiente aunque use el mismo nombre de variable;
10. una credencial publicable puede requerir reemplazo o revocación sin convertirse por ello en secreto confidencial.

---

#### 5. `VENTO-EXTERNAL-CREDENTIAL-LIFECYCLE-CONTRACT-001`

Para toda credencial materializada, la representación documental mínima deberá poder relacionar:

```text
SISTEMA EXTERNO
+
INTEGRATION PRINCIPAL
+
AMBIENTE
+
SUPERFICIE DE CREDENCIAL
+
REFERENCIA NO SENSIBLE
+
CLASE DE MATERIAL
+
ESTADO LÓGICO
+
EMISOR / AUTORIDAD DE REVOCACIÓN
+
CONSUMIDORES
+
FECHAS CONOCIDAS
+
PREDECESOR / SUCESOR CUANDO APLIQUE
→ LIFECYCLE TRAZABLE
```

La información de lifecycle no contiene el valor secreto.

Campos lógicos mínimos:

- referencia no sensible de credencial;
- sistema/proveedor;
- principal técnico;
- ambiente;
- superficie;
- clase de material;
- estado lógico VENTO;
- fecha de emisión o creación cuando exista evidencia;
- fecha de activación cuando exista evidencia;
- fecha de expiración cuando la credencial la tenga;
- última rotación cuando exista;
- próxima revisión o rotación cuando esté definida por política o proveedor;
- autoridad o procedimiento de revocación;
- consumidores autorizados;
- referencia de predecesor y sucesor cuando exista una rotación;
- motivo de rotación o revocación;
- evidencia no sensible de cierre.

Estados lógicos VENTO aplicables al lifecycle:

```text
ACTIVA
ROTACION_EN_CURSO
SOLAPAMIENTO_CONTROLADO
REVOCADA
EXPIRADA
RETIRADA
```

Son estados contractuales internos y no pretenden sustituir los estados nativos de cada proveedor.

---

#### 6. Regla de rotación coordinada y corte

Una rotación planificada se considera completa únicamente cuando ocurre esta secuencia lógica:

```text
PREDECESOR ACTIVO
→
SUCESOR EMITIDO / ACREDITADO
→
SUCESOR EN CUSTODIA CORRECTA
→
CONSUMIDORES MIGRADOS
→
SUCESOR FUNCIONALMENTE ACREDITADO
→
PREDECESOR REVOCADO
→
PREDECESOR RECHAZADO
→
COPIAS Y REFERENCIAS OBSOLETAS RETIRADAS
```

Reglas:

1. el sucesor mantiene el mismo ambiente y no amplía el scope aprobado;
2. un cambio de secreto no puede cambiar silenciosamente `IntegrationPrincipal`, proveedor, cuenta o autoridad empresarial;
3. el solapamiento solo existe cuando el emisor permite credenciales concurrentes y la migración lo necesita;
4. el solapamiento tiene inicio, propietario y condición de cierre explícitos;
5. queda prohibida la validez dual indefinida;
6. el consumidor no puede seleccionar silenciosamente entre clave antigua y nueva por fallback permanente;
7. después de revocar el predecesor debe existir evidencia de que ya no autoriza el efecto protegido;
8. si un consumidor no puede migrar, la rotación permanece incompleta y el bloqueo se registra antes de retirar el predecesor;
9. una credencial de otro ambiente no puede usarse como sucesor temporal;
10. la continuidad operativa no convierte en válido un material comprometido.

La tarea no ejecuta esta secuencia; define el contrato que deberá respetar la implementación propietaria.

---

#### 7. Expiración, revocación y retiro

##### 7.1. Expiración

Cuando el emisor provea expiración verificable:

- se registra la fecha real o metadato equivalente;
- la preparación del sucesor debe ocurrir antes del vencimiento según la política aplicable;
- una credencial expirada queda inutilizable aunque todavía exista una copia local;
- una credencial sin fecha acreditada no recibe una fecha ficticia.

##### 7.2. Revocación

La revocación es obligatoria cuando aplique al menos una de estas condiciones:

- exposición confirmada o sospecha razonable de compromiso;
- copia o almacenamiento fuera de la custodia aprobada;
- acceso no autorizado al material;
- principal técnico, cuenta, aplicación, ambiente o binding retirado;
- cambio de alcance que exige reemisión;
- proveedor o mecanismo declara el material comprometido, retirado o no válido;
- consumidor huérfano o credencial sin propietario;
- incidente que rompe la confianza en la integridad del material.

La revocación se ejecutará en la autoridad que acepta la credencial. Deshabilitar un consumidor sin invalidar el material no equivale a revocación.

##### 7.3. Retiro

Una credencial anterior solo puede considerarse `RETIRADA` cuando:

- ya no existe consumidor autorizado que dependa de ella;
- la revocación o expiración está acreditada;
- las referencias activas ya apuntan al sucesor cuando exista;
- las copias obsoletas fueron eliminadas de los lugares no necesarios;
- la evidencia de auditoría conserva únicamente referencias no sensibles.

---

#### 8. Observaciones técnicas actuales por familia

##### 8.1. Supabase

Se observan superficies cliente publicables y superficies privilegiadas server-side.

Decisión:

- la clave publicable y la credencial privilegiada conservan lifecycle independiente;
- una rotación de material privilegiado exige migrar todos sus consumidores del mismo ambiente y acreditar rechazo del material anterior;
- no se presume qué mecanismo específico de rotación soporta el proyecto remoto sin evidencia administrativa;
- no se asigna una fecha de expiración inexistente o no acreditada.

##### 8.2. Wompi

Se preservan por separado:

- public key;
- secreto de integridad;
- secreto de eventos/webhook.

El código observado distingue familias `test` y `prod`, pero no materializa un registro de lifecycle completo.

Decisión:

- cada superficie rota y se revoca independientemente;
- cualquier solapamiento de secretos debe estar soportado por el proveedor y acotado;
- la rotación no puede mezclar ambientes;
- el webhook no puede conservar indefinidamente un secreto anterior como fallback.

##### 8.3. RevenueCat

Se distinguen:

- API key publicable del SDK Apple;
- API key publicable del SDK Google;
- secreto server-side de webhook.

La sustitución de una API key cliente no se reetiqueta como rotación de secreto confidencial. El webhook sí requiere lifecycle server-side con revocación del valor anterior.

##### 8.4. Resend

`RESEND_API_KEY` es material server-side.

Su lifecycle objetivo exige referencia trazable, sucesor, migración del consumidor, invalidación en el proveedor y rechazo del material anterior. Las fuentes inspeccionadas no acreditan un lifecycle físico vigente.

##### 8.5. Expo / EAS Update y Vercel

Existen configuraciones de plataforma, perfiles o despliegues, pero no se acredita una credencial administrativa actual sobre la cual afirmar un lifecycle físico.

No se inventan tokens ni fechas. Cualquier futura credencial administrativa deberá disponer de lifecycle antes de habilitarse.

##### 8.6. Expo Push Service y Zebra BrowserPrint

No se observó credencial externa de cliente.

- un push token es un destino que puede quedar inválido, no una credencial de VENTO ante Expo;
- UID, nombre o dirección de impresora son identificadores técnicos, no credenciales.

Su mantenimiento no se convierte artificialmente en rotación de credenciales.

##### 8.7. Sentry y Google Maps / Google Reviews

`EXPO_PUBLIC_SENTRY_DSN` y `EXPO_PUBLIC_GOOGLE_MAPS_API_KEY` son configuración/credenciales publicables con restricciones.

Decisión:

- pueden reemplazarse, deshabilitarse o revocarse cuando el proveedor lo permita;
- su lifecycle conserva referencia, ambiente, consumidor y restricciones;
- no se exige ocultación imposible en el bundle como criterio de seguridad;
- cualquier token administrativo futuro sí requerirá lifecycle server-side independiente.

##### 8.8. Apple Wallet / PassKit y APNs

Existen varias clases con lifecycle distinto:

- certificado y clave privada para firma del pase;
- password asociado al P12;
- clave P8 para APNs;
- JWT derivado para autenticación APNs;
- token opaco VENTO por pase.

El código actual reutiliza el `auth_token` existente cuando vuelve a emitir el pase para el mismo serial; por tanto, la reemisión ordinaria del pase no acredita una rotación de ese token.

La expiración de un JWT derivado de APNs no equivale a revocar o rotar la clave P8 que lo firma.

##### 8.9. Google Wallet

Existe un modelo documental de cuenta de servicio, issuer y class, pero no un binding runtime acreditado.

El lifecycle de la clave privada de la cuenta de servicio queda definido como requisito de activación del binding, no como operación actualmente implementada.

##### 8.10. Identidades sin binding acreditado

Para `EXT-SYS-013` a `EXT-SYS-021` no se materializan credenciales ficticias.

La activación de cualquier binding futuro deberá acreditar simultáneamente:

```text
CREDENCIAL REAL
+
AMBIENTE
+
CUSTODIA
+
PROPIETARIO
+
CONSUMIDORES
+
MECANISMO DE ROTACIÓN
+
MECANISMO DE REVOCACIÓN
+
EXPIRACIÓN SI EXISTE
→ HABILITACIÓN
```

---

#### 9. `VENTO-EXTERNAL-CREDENTIAL-LIFECYCLE-MATRIX-001`

| ID            | Sistema / plataforma                     | Superficie de lifecycle                                                | Decisión `INT-EXT-008`                                      | Estado físico            | Regla / condición de salida                                                                                                                                                                 |
| ------------- | ---------------------------------------- | ---------------------------------------------------------------------- | ----------------------------------------------------------- | ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `EXT-SYS-001` | Supabase                                 | clave publicable/anon; secret key o `service_role` server-side         | `LIFECYCLE_SERVER_SIDE_ESPECIFICADO_PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | registrar lifecycle por ambiente y superficie; rotar material privilegiado mediante mecanismo soportado, migrar consumidores y acreditar invalidez del predecesor sin exponer valores       |
| `EXT-SYS-002` | Wompi                                    | public key; secreto de integridad; secreto de eventos/webhook          | `LIFECYCLE_SERVER_SIDE_ESPECIFICADO_PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | lifecycle independiente por superficie y ambiente; cualquier rollover debe ser acotado; el predecesor debe quedar inválido al cerrar la rotación                                            |
| `EXT-SYS-003` | RevenueCat                               | API keys SDK Apple/Google; secreto de webhook                          | `LIFECYCLE_SERVER_SIDE_ESPECIFICADO_PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | separar lifecycle de claves publicables por plataforma del secreto server-side; revocar el material sustituido en su autoridad emisora                                                      |
| `EXT-SYS-004` | Resend                                   | `RESEND_API_KEY` server-side                                           | `LIFECYCLE_SERVER_SIDE_ESPECIFICADO_PENDIENTE_DE_EVIDENCIA` | `PENDIENTE_DE_EVIDENCIA` | sucesor, migración del consumidor, revocación en proveedor y rechazo del predecesor; sin fecha ficticia de expiración                                                                       |
| `EXT-SYS-005` | Expo / EAS Update                        | credencial administrativa no acreditada; perfiles y canales observados | `LIFECYCLE_DE_PLATAFORMA_SIN_CREDENCIAL_ACREDITADA`         | `PENDIENTE_DE_EVIDENCIA` | no inventar token; cualquier credencial administrativa futura debe declarar lifecycle por ambiente antes de activarse                                                                       |
| `EXT-SYS-006` | Expo Push Service                        | push tokens como destinos; sin credencial externa observada            | `SIN_CREDENCIAL_EXTERNA_OBSERVADA`                          | `NO_APLICA`              | invalidez de destination tokens se gobierna como lifecycle de destino, no como rotación de credencial externa                                                                               |
| `EXT-SYS-007` | Sentry                                   | `EXPO_PUBLIC_SENTRY_DSN`                                               | `LIFECYCLE_PUBLICABLE_ESPECIFICADO`                         | `ESPECIFICADO`           | referencia publicable reemplazable/revocable cuando aplique; conservar restricciones y ambiente; futuros tokens administrativos tendrán lifecycle independiente                             |
| `EXT-SYS-008` | Google Maps / Google Reviews             | `EXPO_PUBLIC_GOOGLE_MAPS_API_KEY`; enlaces e identificadores públicos  | `LIFECYCLE_PUBLICABLE_ESPECIFICADO`                         | `ESPECIFICADO`           | API key cliente puede reemplazarse o revocarse manteniendo restricciones; URLs, coordenadas y place ID quedan fuera del lifecycle de credencial                                             |
| `EXT-SYS-009` | Apple Wallet / PassKit + APNs            | P12/private key/password; P8; JWT APNs; token opaco por pase           | `LIFECYCLE_CON_BRECHA_OBSERVADA`                            | `NO_CONFORME_OBSERVADO`  | registrar expiración real del certificado cuando exista; separar lifecycle P8/JWT; materializar revocación/rotación del token por pase y corregir la custodia heredada antes de conformidad |
| `EXT-SYS-010` | Vercel                                   | credencial administrativa/deploy no acreditada                         | `LIFECYCLE_DE_PLATAFORMA_SIN_CREDENCIAL_ACREDITADA`         | `PENDIENTE_DE_EVIDENCIA` | no inventar token; futura credencial de deploy debe tener lifecycle ligado al ambiente y proyecto exactos                                                                                   |
| `EXT-SYS-011` | Zebra BrowserPrint                       | UID/nombre/dispositivo; sin secreto externo observado                  | `SIN_CREDENCIAL_EXTERNA_OBSERVADA`                          | `NO_APLICA`              | identificadores de dispositivo no se convierten en credenciales; cualquier autenticación futura debe acreditarse antes de definir lifecycle                                                 |
| `EXT-SYS-012` | Google Wallet / Google Pay & Wallet      | modelo de cuenta de servicio con material JSON                         | `MODELO_DOCUMENTADO_SIN_BINDING`                            | `PENDIENTE_DE_EVIDENCIA` | cuando el binding exista, la clave de cuenta de servicio deberá disponer de rotación/revocación y consumidores trazables; no se declara lifecycle físico vigente                            |
| `EXT-SYS-013` | POS externo vigente                      | proveedor, interfaz y credenciales no acreditados                      | `NO_APLICA_ACTUAL`                                          | `BLOQUEADO`              | `INT-POS-001` debe acreditar proveedor, cuenta, binding y credencial antes de instanciar el lifecycle                                                                                       |
| `EXT-SYS-014` | Shopify / comercio electrónico           | binding no acreditado                                                  | `NO_APLICA_ACTUAL`                                          | `NO_APLICA`              | no existe credencial actual acreditada sobre la cual ejecutar lifecycle                                                                                                                     |
| `EXT-SYS-015` | Rappi / marketplace                      | binding no acreditado                                                  | `NO_APLICA_ACTUAL`                                          | `NO_APLICA`              | no existe credencial actual acreditada sobre la cual ejecutar lifecycle                                                                                                                     |
| `EXT-SYS-016` | ManyChat / automatización conversacional | binding no acreditado                                                  | `NO_APLICA_ACTUAL`                                          | `NO_APLICA`              | no existe credencial actual acreditada sobre la cual ejecutar lifecycle                                                                                                                     |
| `EXT-SYS-017` | WhatsApp                                 | proveedor/API no acreditados                                           | `NO_APLICA_ACTUAL`                                          | `NO_APLICA`              | no existe credencial actual acreditada sobre la cual ejecutar lifecycle                                                                                                                     |
| `EXT-SYS-018` | Instagram / social                       | API/binding no acreditados                                             | `NO_APLICA_ACTUAL`                                          | `NO_APLICA`              | no existe credencial actual acreditada sobre la cual ejecutar lifecycle                                                                                                                     |
| `EXT-SYS-019` | Correo corporativo y alias funcionales   | proveedor e integración no acreditados                                 | `NO_APLICA_ACTUAL`                                          | `BLOQUEADO`              | acreditar proveedor, cuenta técnica, interfaz y credencial antes de instanciar lifecycle                                                                                                    |
| `EXT-SYS-020` | Telefonía / voz                          | operador e integración no acreditados                                  | `NO_APLICA_ACTUAL`                                          | `BLOQUEADO`              | acreditar operador, cuenta, interfaz y credencial antes de instanciar lifecycle                                                                                                             |
| `EXT-SYS-021` | Transporte externo                       | proveedor e interfaz no acreditados                                    | `NO_APLICA_ACTUAL`                                          | `BLOQUEADO`              | acreditar proveedor, cuenta, interfaz y credencial antes de instanciar lifecycle                                                                                                            |

---

#### 10. Reconciliación de cobertura

La matriz conserva exactamente las veintiuna identidades y una decisión primaria por identidad.

```text
4 LIFECYCLE_SERVER_SIDE_ESPECIFICADO_PENDIENTE_DE_EVIDENCIA
+
2 LIFECYCLE_PUBLICABLE_ESPECIFICADO
+
2 LIFECYCLE_DE_PLATAFORMA_SIN_CREDENCIAL_ACREDITADA
+
2 SIN_CREDENCIAL_EXTERNA_OBSERVADA
+
1 LIFECYCLE_CON_BRECHA_OBSERVADA
+
1 MODELO_DOCUMENTADO_SIN_BINDING
+
9 NO_APLICA_ACTUAL
=
21
```

Faltantes = `0`.

Duplicados = `0`.

Identificadores únicos = `21`.

La clasificación primaria no elimina sub-superficies. Wompi, RevenueCat y Apple mantienen lifecycles distintos dentro de una misma identidad porque una credencial publicable, un secreto de webhook, un certificado, una private key y un token dinámico no comparten necesariamente emisor, expiración ni mecanismo de revocación.

---

#### 11. Evidencia y estados del lifecycle

Ninguna credencial se declara rotada, revocada o expirada únicamente porque:

- cambió el nombre de una variable;
- existe una segunda variable;
- el código acepta un alias;
- se publicó un nuevo build;
- cambió una URL o endpoint;
- se regeneró un artefacto derivado;
- se eliminó una copia local;
- existe una fecha en documentación sin vínculo con el material real.

La evidencia mínima de una rotación completa deberá permitir demostrar, sin mostrar valores secretos:

1. referencia del predecesor;
2. referencia del sucesor;
3. sistema, superficie y ambiente;
4. consumidores afectados;
5. momento de activación del sucesor;
6. migración del consumidor;
7. revocación o expiración del predecesor;
8. rechazo posterior del predecesor;
9. retiro de copias obsoletas cuando corresponda;
10. actor técnico o procedimiento autorizado que ejecutó el cambio.

La evidencia de revocación no exige conservar el valor secreto.

---

#### 12. Estado especial de Apple Wallet

`EXT-SYS-009` conserva lifecycles separados:

| Material                                             | Lifecycle objetivo                                                                                          |
| ---------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| certificado de Pass Type / material público asociado | registrar identidad y validez real cuando sea observable                                                    |
| private key del P12                                  | rotación y revocación coordinadas con el certificado y consumidores server-side                             |
| password del P12                                     | sustituible con el paquete de credencial al que protege; no se usa como identidad independiente             |
| clave P8 de APNs                                     | rotación/revocación de la clave raíz mediante su autoridad; independiente del JWT derivado                  |
| JWT APNs derivado                                    | vida corta propia del token; su expiración no prueba revocación de la P8                                    |
| token opaco VENTO por pase                           | lifecycle por recurso: emisión, validación, sustitución/revocación y retiro ligados al pase correspondiente |

La implementación observada conserva el `auth_token` existente al emitir nuevamente el pase para el mismo serial. Por tanto, **reemitir el `.pkpass` no constituye por sí mismo rotación del token del servicio web**.

Además, permanece vigente la brecha de custodia heredada de `INT-EXT-007`: el valor original del token no debe residir directamente como secreto recuperable en la entidad empresarial cuando basta un verificador no reversible.

Condición de salida del lifecycle del token por pase:

```text
TOKEN NUEVO / VERIFICADOR NUEVO CUANDO APLIQUE
+
PASE / RECURSO VINCULADO
+
CONSUMIDORES ACTUALIZADOS
+
TOKEN PREDECESOR INVÁLIDO
+
CUSTODIA CONFORME
→ LIFECYCLE CERRADO
```

No se declara que el certificado P12, la P8 o el token actual estén vencidos o comprometidos; las fuentes inspeccionadas no acreditan esa afirmación.

---

#### 13. Trazabilidad de handoff

| Pendiente                                                                             | Estado                        | Propietario / tarea responsable   | Condición de salida                                                                                                                                                                    |
| ------------------------------------------------------------------------------------- | ----------------------------- | --------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Referencia física de credencial con metadata de lifecycle y sin valor secreto         | `FUERA_DE_ALCANCE`            | `SHELL-CON-018`                   | contrato consumible representa ambiente, superficie, estado, predecesor/sucesor y fechas conocidas sin exponer material                                                                |
| Remediación de secretos identificados fuera de custodia aprobada y rotación posterior | `PENDIENTE_DE_IMPLEMENTACION` | `SUPA-TRANS-010` / `SUPA-ARC-024` | material expuesto queda sustituido cuando corresponda, invalidado en origen y retirado de ubicaciones no aprobadas con evidencia no sensible                                           |
| Lifecycle físico del token opaco de Apple Wallet y corrección de su custodia          | `PENDIENTE_DE_IMPLEMENTACION` | `SUPA-TRANS-010`                  | el token por pase dispone de mecanismo efectivo de sustitución/revocación, el predecesor deja de ser válido y el valor original deja la entidad empresarial cuando no deba recuperarse |
| Evidencia de lifecycle de credenciales server-side ya observadas                      | `PENDIENTE_DE_EVIDENCIA`      | `SUPA-TRANS-013` / `SHELL-CI-017` | cada superficie acredita referencia, estado, fechas conocidas, consumidores, mecanismo de revocación y prueba de invalidez del material retirado sin revelar valores                   |
| Binding y credenciales del POS externo vigente                                        | `BLOQUEADO_POR_EVIDENCIA`     | `INT-POS-001`                     | proveedor, cuenta, interfaz y credenciales quedan acreditados antes de instanciar lifecycle                                                                                            |
| Contratos de payload y versionado de las integraciones                                | `FUERA_DE_ALCANCE`            | `INT-EXT-009`                     | entradas y salidas quedan versionadas sin alterar el lifecycle definido aquí                                                                                                           |

No queda pendiente material sin propietario, tarea responsable o condición de salida.

---

#### 14. Prohibiciones

Queda prohibido:

1. fijar una cadencia universal de rotación sin base canónica, contractual o del proveedor;
2. inventar fecha de expiración cuando el material no la tenga acreditada;
3. considerar rotación completa solo porque existe una credencial nueva;
4. considerar revocada una credencial porque se eliminó una variable o copia local;
5. conservar indefinidamente credenciales predecesoras válidas como fallback;
6. mantener solapamiento sin propietario y condición de cierre;
7. reactivar una credencial revocada o expirada;
8. usar credencial de otro ambiente como reemplazo temporal;
9. ampliar scope durante una rotación;
10. cambiar `IntegrationPrincipal` silenciosamente durante la sustitución;
11. registrar el valor secreto como evidencia de rotación;
12. registrar private keys, webhook secrets, tokens o passwords en logs o auditoría;
13. tratar la expiración de un JWT derivado como revocación de su clave raíz;
14. tratar un push token de dispositivo como credencial que deba rotarse;
15. tratar UID, URL, `place_id`, project ID, issuer ID o class ID como secreto;
16. rotar material de producción durante esta fase documental;
17. revocar credenciales reales durante esta fase documental;
18. crear credenciales sucesoras durante esta fase documental;
19. cambiar secret stores durante esta fase documental;
20. modificar código, Supabase, proveedores, cuentas, configuración remota o datos;
21. adelantar contratos de payload de `INT-EXT-009`;
22. cambiar las veintiuna identidades heredadas.

---

#### 15. Criterios de aceptación

`INT-EXT-008` queda documentalmente completa cuando se cumplen simultáneamente:

1. se preservan exactamente `EXT-SYS-001` a `EXT-SYS-021`;
2. existen exactamente 21 decisiones;
3. faltantes = 0;
4. duplicados = 0;
5. identificadores únicos = 21;
6. se materializa la distribución `4 + 2 + 2 + 2 + 1 + 1 + 9 = 21`;
7. rotación, expiración, revocación y retiro quedan definidos como operaciones distintas;
8. una rotación exige sucesor, migración de consumidores e invalidez del predecesor;
9. la revocación ocurre en la autoridad que puede aceptar la credencial;
10. la retirada local no se presenta como revocación;
11. no se inventan periodos universales de rotación;
12. no se inventan fechas de expiración;
13. el solapamiento solo se admite cuando el proveedor lo soporta y tiene cierre explícito;
14. se preserva separación por ambiente;
15. se preserva alcance mínimo;
16. se preserva custodia segura;
17. credenciales publicables y secretos confidenciales conservan lifecycles diferenciados;
18. Wompi conserva lifecycle independiente para public key, integridad y webhook;
19. RevenueCat conserva lifecycle independiente para SDK Apple, SDK Google y webhook;
20. Resend conserva lifecycle server-side;
21. Expo/EAS y Vercel no reciben credenciales administrativas ficticias;
22. Expo Push y Zebra no convierten destinos o identificadores en credenciales;
23. Sentry y Google Maps conservan lifecycle publicable sin falsa confidencialidad;
24. Apple separa certificado/P12, P8, JWT derivado y token por pase;
25. la reemisión ordinaria del pase no se presenta como rotación del token por pase;
26. Google Wallet permanece como modelo documentado sin binding;
27. las nueve identidades sin binding permanecen `NO_APLICA_ACTUAL`;
28. no se crean, rotan ni revocan credenciales físicas;
29. no se modifica código;
30. no se modifica Supabase;
31. no se ejecutan despliegues;
32. se crean cero requisitos de prueba;
33. se modifican cero requisitos de prueba;
34. `INT-EXT-009` permanece reservada.

---

#### 16. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa por identidad un lifecycle ya protegido por el registro canónico vigente: inventario de secretos y fechas de rotación, revocación, sustitución posterior a exposición, invalidación del material anterior, gobierno de claves privadas, separación por ambiente y lifecycle de credenciales externas. No introduce una nueva credencial, endpoint, operación empresarial, algoritmo, permiso, mecanismo de autenticación ni comportamiento ejecutable.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

El registro canónico de requisitos permanece sin cambios.

---

#### 17. Resultado de la tarea

`INT-EXT-008` queda **APROBADA** como definición documental completa de rotación, expiración, revocación y retiro para las veintiuna identidades externas.

Resultado consolidado:

- lifecycle materializado para **21/21** identidades;
- faltantes: **0**;
- duplicados: **0**;
- fechas de expiración inventadas: **0**;
- periodos universales de rotación inventados: **0**;
- credenciales físicas rotadas o revocadas: **0**;
- TREQ creados o modificados: **0**.

La tarea deja como invariante:

```text
ROTACIÓN COMPLETA
=
SUCESOR ACREDITADO
+
CONSUMIDORES MIGRADOS
+
PREDECESOR INVALIDADO
+
PREDECESOR RECHAZADO
+
COPIAS OBSOLETAS RETIRADAS
```

sin ampliar scope, ambiente, principal técnico ni autoridad empresarial.

---

ÚLTIMA TAREA APROBADA

`INT-EXT-007 — Definir almacenamiento seguro de secretos`

TAREA ACTUAL APROBADA

`INT-EXT-008 — Definir rotación, expiración y revocación`

SIGUIENTE TAREA RESERVADA

`INT-EXT-009 — Definir contratos de entrada y salida versionados`


### ✅ INT-EXT-009 — Definir contratos de entrada y salida versionados

**Estado:** APROBADA
**Tarea anterior:** `INT-EXT-008 — Definir rotación, expiración y revocación` — APROBADA
**Tarea siguiente:** `INT-EXT-010 — Definir estrategia webhook, polling o híbrida` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materializada de contratos versionados de entrada y salida para las integraciones externas `EXT-SYS-001` a `EXT-SYS-021`, preservando proveedor, principal técnico, mecanismo, alcance mínimo, separación por ambiente, custodia y lifecycle ya aprobados, sin modificar payloads ejecutables, endpoints, proveedores, transporte, credenciales, código ni datos
**Bloque:** X — Integraciones
**Mini-bloque:** Integraciones externas y credenciales
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/02_INTEGRACIONES_EXTERNAS_Y_CREDENCIALES.md`
**Implementación física autorizada:** ninguna
**Cambios de código, DDL, DML, migraciones, RLS, RPC, secretos, credenciales, cuentas externas, configuración productiva, despliegues o datos:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Materializar un contrato único de gobierno para las entradas y salidas de las veintiuna identidades externas heredadas de `INT-EXT-001` a `INT-EXT-008`.

La tarea separa explícitamente:

```text
CREDENCIAL
≠
CONTRATO DE PAYLOAD
≠
TRANSPORTE
≠
HECHO EMPRESARIAL
≠
EVIDENCIA
```

y también:

```text
VERSIÓN DEL PROVEEDOR
≠
VERSIÓN DEL CONTRATO VENTO
```

El objetivo es que cada intercambio externo que exista o llegue a activarse pueda responder, antes de producir un efecto empresarial, qué estructura recibe o emite VENTO, qué significado tiene cada campo, qué versión contractual aplica, qué cambios son compatibles y qué cambios obligan a una nueva versión mayor.

Esta tarea no decide todavía si una integración usa webhook, polling o modalidad híbrida; tampoco define firma, replay, deduplicación, mapeo canónico de identificadores, conservación del payload original, retry, cuarentena, conciliación, contingencia o retiro. Esas decisiones permanecen en sus tareas propietarias posteriores.

---

#### 2. Resultado sustantivo

Se aprueban dos artefactos documentales internos:

- `VENTO-EXTERNAL-IO-CONTRACT-001`;
- `VENTO-EXTERNAL-IO-CONTRACT-MATRIX-001`.

Balance materializado:

| Control                                                     | Resultado |
| ----------------------------------------------------------- | --------: |
| Identidades heredadas esperadas                             |    **21** |
| Identidades materializadas                                  | **21/21** |
| Identificadores `EXT-SYS-*` únicos                          |    **21** |
| Identidades faltantes                                       |     **0** |
| Identidades duplicadas                                      |     **0** |
| Identidades con familia, contrato o modelo I/O documentable |    **10** |
| Configuraciones de plataforma sin contrato I/O acreditado   |     **2** |
| Identidades sin binding actual acreditado                   |     **9** |
| Contratos físicos alterados                                 |     **0** |
| Payloads de runtime alterados                               |     **0** |
| Endpoints alterados                                         |     **0** |
| Requisitos de prueba creados o modificados                  |     **0** |

Distribución primaria:

```text
2 FAMILIA_IO_VERSIONADA
+
2 CONTRATO_BIDIRECCIONAL_VERSIONADO
+
3 CONTRATO_SALIDA_VERSIONADO
+
1 CONTRATO_CONSULTA_VERSIONADO
+
1 CONTRATO_ADAPTADOR_LOCAL_VERSIONADO
+
1 MODELO_PAYLOAD_VERSIONADO_SIN_BINDING_REMOTO_ACREDITADO
+
2 CONFIGURACION_PLATAFORMA_SIN_CONTRATO_IO_ACREDITADO
+
9 NO_APLICA_ACTUAL
=
21
```

La versión documental inicial de los contratos o modelos materializados por esta tarea es `1.0.0`. Esa versión expresa la primera definición VENTO de la superficie observada; no afirma que el proveedor publique esa misma versión ni que el runtime actual transmita un campo `contract_version`.

---

#### 3. Fuentes y contratos preservados

La tarea consume y conserva sin redefinir:

- `INT-EXT-001`, incluidas las veintiuna identidades, proveedores acreditados o no acreditados, propietarios, finalidades y nivel de evidencia;
- `INT-EXT-002`, incluida la separación entre actor humano, principal técnico, cuenta externa y autoridad empresarial;
- `INT-EXT-003`, incluida la procedencia de credenciales;
- `INT-EXT-004`, incluidos los mecanismos reales observados y la obligación fail-closed;
- `INT-EXT-005`, incluido el techo de alcance mínimo;
- `INT-EXT-006`, incluida la separación entre `DEVELOPMENT`, `STAGING` y `PRODUCTION`;
- `INT-EXT-007`, incluida la separación entre configuración publicable, secretos server-side, identificadores técnicos, destinos y custodia;
- `INT-EXT-008`, incluido el lifecycle independiente de cada superficie de credencial;
- `TREQ-INTEGRATION-001`, que ya protege coherencia entre esquemas, dominios, URLs, ambiente y contrato;
- `TREQ-INTEGRATION-004`, que ya exige trazabilidad del payload y del efecto en cadenas de integración;
- `TREQ-INTEGRATION-049`, que ya protege la adaptación de afirmaciones externas antes de convertirlas en hechos internos;
- `TREQ-INTEGRATION-051`, que ya prohíbe secretos y credenciales dentro de esquemas o ejemplos;
- `TREQ-INTEGRATION-052`, que ya gobierna cambios incompatibles y versionado mayor;
- `TREQ-INTEGRATION-213`, que ya exige conservar versión, transformación, respuesta y correlación en intercambios externos;
- las fronteras de propiedad que impiden que un proveedor o adaptador externo se convierta en escritor universal de dominios internos.

Ninguna decisión de esta tarea cambia un proveedor, cuenta, ambiente, principal, credential store, scope, endpoint ni fuente de verdad ya aprobados.

---

#### 4. Semántica de contrato de entrada y salida

`VENTO-EXTERNAL-IO-CONTRACT-001` usa estas definiciones:

| Concepto              | Definición documental                                                                                                                                                            |
| --------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `CONTRATO_DE_ENTRADA` | estructura que VENTO acepta desde un sistema, SDK, adaptador o superficie externa antes de validarla y convertirla en un resultado interno                                       |
| `CONTRATO_DE_SALIDA`  | estructura que VENTO construye y envía hacia una superficie externa                                                                                                              |
| `RESPUESTA_EXTERNA`   | respuesta, receipt, estado o error producido por el proveedor; por sí solo no equivale a un hecho empresarial interno                                                            |
| `PAYLOAD_PROVEEDOR`   | representación nativa del tercero; no se convierte automáticamente en el modelo canónico de VENTO                                                                                |
| `CONTRATO_VENTO`      | interpretación estable y versionada que VENTO aplica sobre una superficie externa                                                                                                |
| `VERSION_PROVEEDOR`   | versión publicada, declarada o inferible de forma acreditada por la interfaz externa                                                                                             |
| `VERSION_VENTO`       | versión del contrato con el que VENTO valida, adapta, emite o interpreta el intercambio                                                                                          |
| `ADAPTADOR`           | frontera que traduce entre el contrato del proveedor y el contrato o hecho propietario de VENTO sin adquirir autoridad empresarial por esa traducción                            |
| `CAMBIO_COMPATIBLE`   | cambio que conserva significado previo y puede ser consumido por las partes soportadas sin reinterpretar historia                                                                |
| `CAMBIO_INCOMPATIBLE` | cambio que altera significado, obligatoriedad, cardinalidad, interpretación o comportamiento de forma que un consumidor anterior puede producir un resultado distinto o inválido |

Reglas:

1. toda superficie materializada tiene dirección explícita;
2. una misma identidad externa puede tener varios contratos independientes;
3. el contrato de entrada no se presume simétrico al de salida;
4. una respuesta técnica no acredita por sí sola un efecto empresarial;
5. la estructura del proveedor no se adopta como modelo interno por conveniencia;
6. el valor de una credencial nunca forma parte del contrato ni de sus ejemplos;
7. ambiente y contrato se vinculan explícitamente;
8. el contrato conserva unidad, moneda, zona temporal, formato y semántica cuando sean materiales;
9. un campo desconocido no adquiere significado por inferencia;
10. una versión no soportada no se interpreta silenciosamente como la versión vigente.

---

#### 5. `VENTO-EXTERNAL-IO-CONTRACT-001`

Para toda superficie de intercambio materializada, la representación mínima deberá poder relacionar:

```text
EXT-SYS
+
SUPERFICIE
+
DIRECCIÓN
+
AMBIENTE
+
VERSIÓN VENTO
+
VERSIÓN / REFERENCIA DEL PROVEEDOR CUANDO EXISTA
+
PRODUCTOR
+
CONSUMIDOR
+
SCHEMA DE ENTRADA O SALIDA
+
SEMÁNTICA DE CAMPOS
+
RESULTADOS / ERRORES
+
COMPATIBILIDAD
→ CONTRATO TRAZABLE
```

Campos lógicos mínimos:

- `external_system_id`;
- nombre estable de la superficie;
- dirección: `VENTO_TO_EXTERNAL`, `EXTERNAL_TO_VENTO`, `BIDIRECTIONAL` o `LOCAL_ADAPTER`;
- ambiente aplicable;
- versión VENTO;
- versión, release, endpoint generation o referencia contractual del proveedor cuando exista evidencia;
- aplicación, servicio o adaptador VENTO que produce o recibe;
- media type y encoding cuando sean materiales;
- campos requeridos;
- campos opcionales;
- tipo de cada campo;
- nullabilidad;
- cardinalidad;
- unidad o moneda cuando aplique;
- semántica temporal y zona cuando aplique;
- enumeraciones cerradas cuando aplique;
- restricciones y límites estructurales conocidos;
- forma de respuesta o resultado;
- forma de error conocida;
- sensibilidad de datos;
- referencia no sensible a la clase de credencial cuando aplique;
- compatibilidad con versiones VENTO anteriores;
- predecesor y sucesor contractuales cuando exista una evolución.

El contrato no contiene valores secretos, passwords, private keys, webhook secrets, tokens, credenciales de proveedor ni URLs firmadas persistentes.

---

#### 6. Gobierno de versiones

La versión VENTO usa:

```text
MAJOR.MINOR.PATCH
```

La primera definición documental materializada por `INT-EXT-009` es:

```text
1.0.0
```

Reglas:

##### 6.1. `MAJOR`

Requiere una nueva versión mayor cualquier cambio que pueda modificar la interpretación o validez de un intercambio existente, incluidos:

- cambio de significado empresarial de un campo;
- cambio de nombre sin alias contractual compatible;
- campo opcional convertido en obligatorio;
- cambio de tipo;
- cambio de cardinalidad;
- cambio de unidad o moneda;
- cambio de semántica temporal;
- cambio de nullabilidad que invalide datos antes válidos;
- eliminación de un campo consumido;
- cambio incompatible de enumeración cerrada;
- cambio de resultado o error que altere la decisión del consumidor;
- cambio de sensibilidad que exija controles distintos;
- reinterpretación incompatible de la misma estructura.

##### 6.2. `MINOR`

Puede usar una nueva versión menor un cambio aditivo que conserve la interpretación histórica y sea compatible de manera demostrable.

Un campo opcional nuevo solo se considera compatible cuando:

- los consumidores soportados toleran el campo adicional, o
- un adaptador versionado aísla a los consumidores que no lo toleran.

Si esa compatibilidad no está acreditada, el cambio no se presume menor.

##### 6.3. `PATCH`

Se limita a correcciones documentales o metadata contractual que no cambian:

- validación;
- significado;
- obligatoriedad;
- tipo;
- unidad;
- cardinalidad;
- sensibilidad;
- resultado;
- comportamiento ejecutable.

##### 6.4. Versionado del proveedor

Si el proveedor publica una versión nativa, esta se registra por separado de `VERSION_VENTO`.

Si el proveedor no expone una versión acreditada:

- no se inventa una versión externa;
- se conserva la referencia verificable disponible al contrato, SDK, endpoint o documentación aplicable;
- VENTO sigue versionando su propia interpretación.

Un cambio de URL no implica automáticamente cambio de contrato, y un contrato incompatible puede requerir nueva versión aunque la URL no cambie.

---

#### 7. Compatibilidad y evolución

Estados documentales de compatibilidad:

| Estado                         | Significado                                                                 |
| ------------------------------ | --------------------------------------------------------------------------- |
| `COMPATIBLE`                   | la versión nueva mantiene la interpretación soportada por la anterior       |
| `COMPATIBLE_CON_ADAPTADOR`     | la compatibilidad depende de una traducción explícita y versionada          |
| `INCOMPATIBLE_MAYOR`           | el consumidor debe adoptar una nueva versión mayor o un adaptador explícito |
| `COMPATIBILIDAD_NO_ACREDITADA` | las fuentes actuales no permiten afirmar compatibilidad                     |

Reglas:

1. el productor declara la versión VENTO que emite o el adaptador declara la versión que materializa;
2. el consumidor valida la versión antes de aplicar un efecto;
3. una versión desconocida falla cerrada respecto del efecto protegido;
4. no se usa heurística de nombres para reinterpretar una versión incompatible;
5. las versiones históricas no cambian de significado;
6. una corrección incompatible crea una versión sucesora;
7. el mismo contrato no puede significar cosas distintas entre `DEVELOPMENT`, `STAGING` y `PRODUCTION`;
8. diferencias de valores de configuración entre ambientes no crean por sí solas otro contrato si el significado y schema son los mismos;
9. si un proveedor cambia de forma incompatible sin versión explícita, VENTO crea una nueva versión mayor de su interpretación;
10. la compatibilidad de una respuesta se gobierna con el mismo rigor que la compatibilidad de una solicitud.

---

#### 8. Frontera entre payload externo y hecho interno

Un intercambio externo seguirá esta separación conceptual:

```text
PAYLOAD / RESPUESTA DEL PROVEEDOR
→
VALIDACIÓN DEL CONTRATO VENTO
→
ADAPTACIÓN
→
CONTRATO DEL DOMINIO PROPIETARIO
→
HECHO O RESULTADO INTERNO
```

Reglas:

1. recibir un payload no convierte al proveedor en fuente de verdad interna;
2. el adaptador puede conservar referencias, receipts y metadata propios, pero no adquirir propiedad funcional del proceso;
3. una integración externa no escribe directamente estados privados de múltiples aplicaciones por usar una credencial privilegiada;
4. una respuesta HTTP, ACK, SDK callback, receipt o respuesta de dispositivo no se equipara a un efecto empresarial salvo que el contrato propietario lo establezca y ese efecto quede confirmado;
5. los campos externos que no tengan mapping acreditado permanecen externos hasta que su tarea propietaria defina la correspondencia;
6. esta tarea no materializa ese mapping; `INT-EXT-013` permanece responsable de identificadores externos y canónicos.

---

#### 9. Superficies observadas que fija la versión `1.0.0`

La versión inicial preserva las estructuras observadas sin modificarlas.

##### 9.1. Wompi

Se separan dos superficies:

**Salida de checkout**

Entrada VENTO actual hacia la construcción del checkout:

```text
transaction_id
→
reference
amount_minor
currency
expiration_time
redirect_url
customer_email cuando exista
```

Representación observada hacia Wompi:

```text
public-key
currency
amount-in-cents
reference
expiration-time
signature:integrity
redirect-url cuando aplique
customer-data:email cuando aplique
```

La respuesta VENTO observada del flujo contiene referencias como:

```text
transaction_id
order_id
provider
amount_minor
currency
reference
checkout_url
expires_at
environment
```

**Entrada de evento de pago**

Campos observados del payload:

```text
event
id
data.id
data.transaction_id
data.status
data.reference
data.transaction.id
data.transaction.status
data.transaction.reference
data.transaction.metadata
signature.properties
signature.checksum
timestamp
```

Checkout y evento conservan contratos distintos dentro de `EXT-SYS-002`. Esta tarea no decide la estrategia de entrega del evento, la validación de replay ni la deduplicación.

##### 9.2. RevenueCat

La interacción cliente conserva como contrato de SDK:

```text
configure(apiKey, appUserID)
getOfferings()
purchasePackage(package)
restorePurchases()
```

La entrada de webhook observada admite un evento con campos:

```text
type
app_user_id
product_id
entitlement_ids
expiration_at_ms
purchased_at_ms
event_timestamp_ms
original_transaction_id
aliases
```

La forma de entrada puede llegar como `payload.event` o como payload directo en la implementación observada.

SDK y webhook no comparten un único contrato por pertenecer al mismo proveedor.

##### 9.3. Resend

La salida de correo observada usa una solicitud JSON con:

```text
from
to[]
subject
html
```

La autenticación se mantiene fuera del payload contractual. La respuesta del proveedor permanece una respuesta externa y no se convierte por sí sola en confirmación empresarial de lectura, entrega final o aceptación humana.

##### 9.4. Expo Push Service

La salida observada usa mensajes con:

```text
to
title
body
data cuando aplique
```

La respuesta técnica observada expone elementos de `data[]` con estado y detalle de error; `DeviceNotRegistered` se utiliza actualmente para identificar un destino inválido.

El push token continúa siendo un destino, no una credencial de VENTO ante Expo.

##### 9.5. Google Maps / Google Reviews

Para búsqueda de direcciones se observan dos contratos de consulta:

**Autocomplete**

Entrada VENTO relevante:

```text
query
latitude cuando aplique
longitude cuando aplique
```

Salida normalizada VENTO:

```text
predictions[]
  place_id
  description
  main_text
  secondary_text
  distance_meters
```

**Detalle de lugar**

Entrada:

```text
place_id
```

Salida normalizada:

```text
place
  place_id
  label
  address
  latitude
  longitude
```

Los enlaces de Google Reviews, coordenadas y `place_id` publicables no se convierten por ello en secretos.

##### 9.6. Apple Wallet / PassKit + APNs

Se conservan contratos independientes para:

- generación y entrega de `.pkpass`;
- web service de PassKit;
- registro y retiro de dispositivos;
- consulta de seriales actualizados;
- descarga del pase;
- logging técnico del servicio;
- notificación APNs asociada al pase.

El web service observado ya usa una familia `v1` y admite:

```text
POST registro de dispositivo → pushToken → 201
DELETE registro de dispositivo → 200
GET actualizaciones → serialNumbers[] + lastUpdated, o 204
GET pase → application/vnd.apple.pkpass, con 304 cuando corresponde
POST log técnico → 200
```

El contrato del pase utiliza referencias como serial, pass type, nombre de cuenta, puntos, nivel, token de autenticación del pase, web service y barcode. El valor secreto del token no se documenta en ejemplos.

La superficie APNs conserva contrato independiente; esta tarea no redefine firma JWT, lifecycle de P8 ni estrategia de entrega.

##### 9.7. Zebra BrowserPrint

La integración local observada distingue:

- descubrimiento de dispositivos con `getLocalDevices(..., "printer")`;
- identificación de dispositivo mediante atributos como `uid`, nombre y tipo;
- generación de contenido ZPL;
- selección del dispositivo local.

El payload ZPL es contenido de impresión dirigido a un dispositivo local. El UID de la impresora sigue siendo identificador técnico y no credencial.

##### 9.8. Supabase

`EXT-SYS-001` se gobierna como familia de contratos, no como un payload universal.

Las superficies de Auth, consultas autorizadas, RPC, Edge Functions y demás interfaces consumidas por VENTO conservan:

- contrato propio;
- ambiente;
- productor y consumidor;
- esquema de solicitud y respuesta;
- error;
- versión VENTO.

Compartir una instancia de Supabase no autoriza a una aplicación a interpretar todas las tablas, funciones o respuestas como parte de un contrato externo único.

##### 9.9. Sentry

La telemetría enviada por SDK se trata como contrato de salida gobernado por la versión VENTO y por la referencia del SDK/proveedor utilizada.

La DSN publicable identifica el destino de ingestión; no define por sí sola el schema empresarial ni convierte datos arbitrarios en contenido permitido.

La versión `1.0.0` exige que la superficie conserve minimización y sensibilidad, sin inventar un payload nativo de Sentry que las fuentes inspeccionadas no acreditan.

##### 9.10. Google Wallet

El código observado materializa un modelo de payload para un objeto genérico y un JWT de guardado, incluyendo referencias como:

```text
id
classId
state
cardTitle
subheader
textModulesData
barcode
```

y claims de JWT como:

```text
iss
aud
typ
iat
exp
payload.genericObjects[]
```

Sin embargo, las tareas anteriores no acreditan un binding remoto operativo completo. Por ello se fija un **modelo contractual `1.0.0`**, no una afirmación de integración remota validada.

---

#### 10. `VENTO-EXTERNAL-IO-CONTRACT-MATRIX-001`

| ID            | Sistema / plataforma                     | Superficie contractual                                                        | Decisión `INT-EXT-009`                                    | Versión VENTO | Estado físico / evidencia                            | Regla / condición de salida                                                                                                                  |
| ------------- | ---------------------------------------- | ----------------------------------------------------------------------------- | --------------------------------------------------------- | ------------- | ---------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| `EXT-SYS-001` | Supabase                                 | Auth, consultas autorizadas, RPC, Edge Functions y demás fronteras consumidas | `FAMILIA_IO_VERSIONADA`                                   | `1.0.0`       | `ESPECIFICADO_SOBRE_INTERCAMBIOS_OBSERVADOS`         | cada superficie debe conservar request, response, error, ambiente y versión propios; compartir Supabase no crea un contrato universal        |
| `EXT-SYS-002` | Wompi                                    | checkout de pago; retorno; evento de pago                                     | `CONTRATO_BIDIRECCIONAL_VERSIONADO`                       | `1.0.0`       | `OBSERVADO_SIN_VERSION_VENTO_EXPLICITA_EN_RUNTIME`   | checkout y evento permanecen contratos distintos; cualquier cambio incompatible crea nueva versión mayor                                     |
| `EXT-SYS-003` | RevenueCat                               | SDK Apple/Google; compra/restauración; webhook de entitlement                 | `CONTRATO_BIDIRECCIONAL_VERSIONADO`                       | `1.0.0`       | `OBSERVADO_SIN_VERSION_VENTO_EXPLICITA_EN_RUNTIME`   | separar contrato del SDK del contrato de webhook y no interpretar una respuesta técnica como entitlement confirmado sin frontera propietaria |
| `EXT-SYS-004` | Resend                                   | envío server-side de correo                                                   | `CONTRATO_SALIDA_VERSIONADO`                              | `1.0.0`       | `OBSERVADO_SIN_VERSION_VENTO_EXPLICITA_EN_RUNTIME`   | conservar body, respuesta y errores por versión; autenticación fuera del payload                                                             |
| `EXT-SYS-005` | Expo / EAS Update                        | configuración, perfiles, canales y plataforma                                 | `CONFIGURACION_PLATAFORMA_SIN_CONTRATO_IO_ACREDITADO`     | `NO_APLICA`   | `SIN_CONTRATO_IO_ACREDITADO_ACTUAL`                  | no inventar payload de API; si se acredita una interfaz programática, deberá instanciar contrato antes de habilitar efectos                  |
| `EXT-SYS-006` | Expo Push Service                        | mensajes push y respuesta técnica                                             | `CONTRATO_SALIDA_VERSIONADO`                              | `1.0.0`       | `OBSERVADO_SIN_VERSION_VENTO_EXPLICITA_EN_RUNTIME`   | mensaje y respuesta técnica quedan tipados; los destinos inválidos no se convierten en fallo de credencial                                   |
| `EXT-SYS-007` | Sentry                                   | telemetría SDK hacia ingestión                                                | `CONTRATO_SALIDA_VERSIONADO`                              | `1.0.0`       | `ESPECIFICADO_SOBRE_SUPERFICIE_PUBLICABLE_OBSERVADA` | gobernar versión y contenido permitido sin inventar schema nativo no acreditado ni enviar secretos                                           |
| `EXT-SYS-008` | Google Maps / Google Reviews             | autocomplete; detalle de lugar; navegación pública a reviews                  | `CONTRATO_CONSULTA_VERSIONADO`                            | `1.0.0`       | `OBSERVADO_SIN_VERSION_VENTO_EXPLICITA_EN_RUNTIME`   | consultas estructuradas se versionan; enlaces de navegación pública permanecen configuración, no respuesta empresarial                       |
| `EXT-SYS-009` | Apple Wallet / PassKit + APNs            | `.pkpass`; web service `v1`; registro; actualización; APNs                    | `FAMILIA_IO_VERSIONADA`                                   | `1.0.0`       | `OBSERVADO_CON_SEPARACION_DE_SUBCONTRATOS`           | PassKit, web service y APNs conservan contratos separados; no mezclar lifecycle de credenciales con versión de payload                       |
| `EXT-SYS-010` | Vercel                                   | plataforma y despliegue                                                       | `CONFIGURACION_PLATAFORMA_SIN_CONTRATO_IO_ACREDITADO`     | `NO_APLICA`   | `SIN_CONTRATO_IO_ACREDITADO_ACTUAL`                  | no inventar API de administración o deploy; cualquier binding futuro deberá declarar contrato y ambiente                                     |
| `EXT-SYS-011` | Zebra BrowserPrint                       | descubrimiento local de impresora; dispositivo; ZPL                           | `CONTRATO_ADAPTADOR_LOCAL_VERSIONADO`                     | `1.0.0`       | `OBSERVADO_SIN_VERSION_VENTO_EXPLICITA_EN_RUNTIME`   | BrowserPrint y ZPL se gobiernan como adaptador local; UID y nombre siguen siendo identificadores técnicos                                    |
| `EXT-SYS-012` | Google Wallet / Google Pay & Wallet      | objeto genérico y JWT de guardado                                             | `MODELO_PAYLOAD_VERSIONADO_SIN_BINDING_REMOTO_ACREDITADO` | `1.0.0`       | `MODELO_DOCUMENTADO_SIN_BINDING_REMOTO`              | preservar el modelo observado; no declarar operación remota hasta acreditar issuer, class, cuenta y respuesta del proveedor                  |
| `EXT-SYS-013` | POS externo vigente                      | proveedor, interfaz y payload no acreditados                                  | `NO_APLICA_ACTUAL`                                        | `NO_APLICA`   | `BLOQUEADO`                                          | `INT-POS-001` debe acreditar proveedor e interfaz antes de instanciar el contrato                                                            |
| `EXT-SYS-014` | Shopify / comercio electrónico           | binding no acreditado                                                         | `NO_APLICA_ACTUAL`                                        | `NO_APLICA`   | `NO_APLICA`                                          | no existe intercambio actual acreditado sobre el cual versionar entradas o salidas                                                           |
| `EXT-SYS-015` | Rappi / marketplace                      | binding no acreditado                                                         | `NO_APLICA_ACTUAL`                                        | `NO_APLICA`   | `NO_APLICA`                                          | no existe intercambio actual acreditado sobre el cual versionar entradas o salidas                                                           |
| `EXT-SYS-016` | ManyChat / automatización conversacional | binding no acreditado                                                         | `NO_APLICA_ACTUAL`                                        | `NO_APLICA`   | `NO_APLICA`                                          | no existe intercambio actual acreditado sobre el cual versionar entradas o salidas                                                           |
| `EXT-SYS-017` | WhatsApp                                 | proveedor/API no acreditados                                                  | `NO_APLICA_ACTUAL`                                        | `NO_APLICA`   | `NO_APLICA`                                          | no existe intercambio actual acreditado sobre el cual versionar entradas o salidas                                                           |
| `EXT-SYS-018` | Instagram / social                       | API/binding no acreditados                                                    | `NO_APLICA_ACTUAL`                                        | `NO_APLICA`   | `NO_APLICA`                                          | no existe intercambio actual acreditado sobre el cual versionar entradas o salidas                                                           |
| `EXT-SYS-019` | Correo corporativo y alias funcionales   | proveedor e integración no acreditados                                        | `NO_APLICA_ACTUAL`                                        | `NO_APLICA`   | `NO_APLICA`                                          | no existe intercambio actual acreditado sobre el cual versionar entradas o salidas                                                           |
| `EXT-SYS-020` | Telefonía / voz                          | operador e integración no acreditados                                         | `NO_APLICA_ACTUAL`                                        | `NO_APLICA`   | `BLOQUEADO`                                          | acreditar operador, interfaz y payload antes de instanciar contrato                                                                          |
| `EXT-SYS-021` | Transporte externo                       | proveedor e interfaz no acreditados                                           | `NO_APLICA_ACTUAL`                                        | `NO_APLICA`   | `NO_APLICA`                                          | no existe intercambio actual acreditado sobre el cual versionar entradas o salidas                                                           |

---

#### 11. Reconciliación de cobertura

La matriz conserva exactamente las veintiuna identidades y una decisión primaria por identidad:

```text
2 FAMILIA_IO_VERSIONADA
+
2 CONTRATO_BIDIRECCIONAL_VERSIONADO
+
3 CONTRATO_SALIDA_VERSIONADO
+
1 CONTRATO_CONSULTA_VERSIONADO
+
1 CONTRATO_ADAPTADOR_LOCAL_VERSIONADO
+
1 MODELO_PAYLOAD_VERSIONADO_SIN_BINDING_REMOTO_ACREDITADO
+
2 CONFIGURACION_PLATAFORMA_SIN_CONTRATO_IO_ACREDITADO
+
9 NO_APLICA_ACTUAL
=
21
```

Faltantes = `0`.

Duplicados = `0`.

Identificadores únicos = `21`.

Una clasificación primaria no fusiona subcontratos. Wompi, RevenueCat, Apple Wallet y Supabase conservan varias superficies porque sus entradas, salidas, respuestas y autoridades técnicas no comparten necesariamente schema, dirección ni evolución.

---

#### 12. Regla de activación de un contrato externo

Una nueva superficie no puede habilitar efectos empresariales únicamente porque exista conectividad o una credencial.

Debe quedar materializada como mínimo esta secuencia documental:

```text
IDENTIDAD EXT-SYS ACREDITADA
+
PROVEEDOR / CUENTA / AMBIENTE ACREDITADOS
+
SUPERFICIE IDENTIFICADA
+
DIRECCIÓN
+
SCHEMA DE ENTRADA / SALIDA
+
VERSIÓN VENTO
+
REFERENCIA DE VERSIÓN DEL PROVEEDOR CUANDO EXISTA
+
PRODUCTOR / CONSUMIDOR
+
RESULTADOS Y ERRORES
+
COMPATIBILIDAD
→ CONTRATO HABILITABLE
```

Reglas:

1. una credencial válida no sustituye este contrato;
2. un endpoint accesible no sustituye este contrato;
3. un SDK instalado no sustituye este contrato;
4. un ejemplo de payload no sustituye este contrato;
5. una prueba manual exitosa no sustituye el contrato versionado;
6. una futura integración de `EXT-SYS-013` a `EXT-SYS-021` deberá instanciar este modelo antes de producir efectos internos;
7. si la fuente actual no acredita campos o respuesta, se mantiene `PENDIENTE_DE_EVIDENCIA` y no se fabrican propiedades.

---

#### 13. Fronteras reservadas a `INT-EXT-010` a `INT-EXT-020`

`INT-EXT-009` define **qué** contrato entra o sale y **cómo se versiona**. No consume decisiones que pertenecen a tareas posteriores.

| Materia                                            | Tarea propietaria |
| -------------------------------------------------- | ----------------- |
| webhook, polling o modalidad híbrida               | `INT-EXT-010`     |
| firma, origen, timestamp y replay                  | `INT-EXT-011`     |
| idempotencia y deduplicación                       | `INT-EXT-012`     |
| mapeo de identificadores externos y canónicos      | `INT-EXT-013`     |
| conservación controlada del payload original       | `INT-EXT-014`     |
| rate limits, reintentos, backoff y circuit breaker | `INT-EXT-015`     |
| cuarentena o dead-letter                           | `INT-EXT-016`     |
| auditoría, métricas, alertas y conciliación        | `INT-EXT-017`     |
| contingencia ante indisponibilidad del proveedor   | `INT-EXT-018`     |
| retiro de integración y revocación de credenciales | `INT-EXT-019`     |
| credenciales compartidas entre integraciones       | `INT-EXT-020`     |

La presencia de campos como `timestamp`, `signature`, `id`, `reference`, `receipt` o `status` en un payload observado no resuelve por adelantado las políticas de esas tareas.

---

#### 14. Trazabilidad de handoff

| Pendiente                                                           | Estado                    | Propietario / tarea responsable                   | Condición de salida                                                                                                               |
| ------------------------------------------------------------------- | ------------------------- | ------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| Contrato consumible de evento externo recibido                      | `FUERA_DE_ALCANCE`        | `SHELL-CON-019`                                   | el contrato compartido representa versión, proveedor, recepción y payload adaptado sin convertir al tercero en fuente empresarial |
| Contratos canónicos de venta y línea para integraciones comerciales | `FUERA_DE_ALCANCE`        | `INT-POS-005` / `SHELL-CON-020` / `SHELL-CON-021` | ventas y líneas externas convergen en contratos canónicos propietarios                                                            |
| Mapeo contractual de identificadores                                | `FUERA_DE_ALCANCE`        | `INT-EXT-013` / `SHELL-CON-022`                   | cada identificador externo y canónico queda relacionado sin inferencia por nombre                                                 |
| Idempotencia y conciliación consumibles                             | `FUERA_DE_ALCANCE`        | `INT-EXT-012` / `SHELL-CON-023`                   | los contratos disponen de claves y resultados recuperables según alcance aprobado                                                 |
| Cuarentena, rechazo y compensación                                  | `FUERA_DE_ALCANCE`        | `INT-EXT-016` / `SHELL-CON-024`                   | payloads incompatibles o no aplicables tienen disposición explícita sin efecto silencioso                                         |
| Estrategia de recepción por proveedor                               | `FUERA_DE_ALCANCE`        | `INT-EXT-010`                                     | cada superficie define webhook, polling o modalidad híbrida con base acreditada                                                   |
| Binding del POS externo vigente                                     | `BLOQUEADO_POR_EVIDENCIA` | `INT-POS-001`                                     | proveedor e interfaz quedan acreditados antes de crear versión de payload                                                         |

No queda una decisión sustantiva de versionado sin regla de salida. Las políticas de transporte, seguridad, resiliencia y operación conservan sus propietarios posteriores.

---

#### 15. Prohibiciones

Queda prohibido:

1. tratar la versión del proveedor como si fuera la versión VENTO;
2. inventar una versión nativa cuando el proveedor no la exponga de forma acreditada;
3. usar un mismo contrato para request y response si sus significados son distintos;
4. usar un mismo contrato para varias superficies solo porque comparten proveedor;
5. considerar compatible un campo nuevo si no está acreditada la tolerancia del consumidor;
6. reutilizar una versión mayor después de cambiar significado incompatible;
7. reinterpretar historia para acomodar un schema nuevo;
8. asumir unidad, moneda, zona temporal, nullabilidad o enumeración no acreditadas;
9. convertir un ACK o respuesta técnica en efecto empresarial sin contrato propietario;
10. permitir que el payload del proveedor escriba directamente varias fuentes internas;
11. incluir secretos, passwords, private keys, tokens, webhook secrets o credenciales en el schema o ejemplos;
12. usar el valor de una credencial como discriminador de versión;
13. mezclar `DEVELOPMENT`, `STAGING` y `PRODUCTION` dentro de una misma instancia contractual;
14. inventar payloads para Expo/EAS, Vercel o las identidades sin binding acreditado;
15. presentar Google Wallet como binding remoto validado solo porque existe un modelo de payload en código;
16. convertir `place_id`, UID de impresora, DSN publicable o push token en secreto por aparecer en un contrato;
17. adelantar webhook/polling de `INT-EXT-010`;
18. adelantar firma, timestamp o replay de `INT-EXT-011`;
19. adelantar idempotencia de `INT-EXT-012`;
20. adelantar mapeo canónico de `INT-EXT-013`;
21. adelantar conservación de payload de `INT-EXT-014`;
22. adelantar retry o circuit breaker de `INT-EXT-015`;
23. adelantar cuarentena, conciliación, contingencia o retiro de `INT-EXT-016` a `INT-EXT-019`;
24. modificar código, Supabase, proveedores, cuentas, endpoints, credenciales o datos durante esta fase documental;
25. cambiar las veintiuna identidades heredadas.

---

#### 16. Criterios de aceptación

`INT-EXT-009` queda documentalmente completa cuando se cumplen simultáneamente:

1. se preservan exactamente `EXT-SYS-001` a `EXT-SYS-021`;
2. existen exactamente 21 decisiones primarias;
3. faltantes = 0;
4. duplicados = 0;
5. identificadores únicos = 21;
6. se materializa la distribución `2 + 2 + 3 + 1 + 1 + 1 + 2 + 9 = 21`;
7. contrato de entrada, contrato de salida y respuesta externa quedan diferenciados;
8. versión VENTO y versión del proveedor quedan diferenciadas;
9. la primera versión documental se fija en `1.0.0` para las superficies o modelos materializados;
10. se define `MAJOR.MINOR.PATCH`;
11. todo cambio incompatible obliga nueva versión mayor;
12. un cambio aditivo solo se considera menor cuando la compatibilidad está acreditada;
13. `PATCH` no puede cambiar comportamiento ejecutable;
14. cada contrato conserva ambiente, productor, consumidor, schema y resultados;
15. el valor de una credencial queda fuera del contrato;
16. una respuesta técnica no se presenta como resultado empresarial;
17. Wompi conserva checkout y evento como contratos separados;
18. RevenueCat conserva SDK y webhook como contratos separados;
19. Resend conserva contrato de salida server-side;
20. Expo Push conserva mensaje y respuesta técnica sin convertir push token en credencial;
21. Google Maps conserva autocomplete y detalle como consultas versionadas;
22. Apple Wallet separa `.pkpass`, web service y APNs;
23. Supabase no se presenta como un contrato universal por compartir plataforma;
24. Sentry se gobierna sin inventar un payload nativo no acreditado;
25. Zebra se conserva como adaptador local con contenido ZPL;
26. Google Wallet queda como modelo versionado sin acreditar binding remoto;
27. Expo/EAS y Vercel no reciben contratos de API ficticios;
28. las nueve identidades sin binding permanecen `NO_APLICA_ACTUAL`;
29. no se decide webhook, polling o modalidad híbrida;
30. no se decide firma, replay, deduplicación, mapeo, retención, retry, cuarentena, conciliación, contingencia o retiro;
31. no se modifica código;
32. no se modifica Supabase;
33. no se cambian endpoints;
34. no se ejecutan despliegues;
35. se crean cero requisitos de prueba;
36. se modifican cero requisitos de prueba;
37. `INT-EXT-010` permanece reservada.

---

#### 17. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa por identidad y superficie el contrato documental de entrada, salida y versionado ya protegido por requisitos de integración vigentes sobre coherencia de schema, ambiente, versión, transformación, compatibilidad, minimización, trazabilidad y fronteras de propiedad. No introduce un nuevo endpoint, proveedor, operación empresarial, permiso, algoritmo, credencial, mecanismo de transporte ni comportamiento ejecutable.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

El registro canónico de requisitos permanece sin cambios.

---

#### 18. Resultado de la tarea

`INT-EXT-009` queda **APROBADA** como definición documental completa de contratos de entrada y salida versionados para las veintiuna identidades externas.

Resultado consolidado:

- identidades materializadas: **21/21**;
- contratos o modelos I/O documentables: **10**;
- configuraciones de plataforma sin contrato I/O acreditado: **2**;
- identidades sin binding actual: **9**;
- faltantes: **0**;
- duplicados: **0**;
- versiones nativas de proveedor inventadas: **0**;
- cambios de runtime: **0**;
- TREQ creados o modificados: **0**.

La tarea deja como invariante:

```text
INTERCAMBIO EXTERNO VÁLIDO
=
IDENTIDAD EXTERNA ACREDITADA
+
AMBIENTE
+
SUPERFICIE
+
DIRECCIÓN
+
SCHEMA
+
VERSIÓN VENTO
+
COMPATIBILIDAD
+
FRONTERA PROPIETARIA
```

sin convertir credenciales, endpoints, ACKs, SDKs o payloads de proveedor en sustitutos del contrato empresarial.

---

ÚLTIMA TAREA APROBADA

`INT-EXT-008 — Definir rotación, expiración y revocación`

TAREA ACTUAL APROBADA

`INT-EXT-009 — Definir contratos de entrada y salida versionados`

SIGUIENTE TAREA RESERVADA

`INT-EXT-010 — Definir estrategia webhook, polling o híbrida`


### ✅ INT-EXT-010 — Definir estrategia webhook, polling o híbrida

**Estado:** APROBADA
**Tarea anterior:** `INT-EXT-009 — Definir contratos de entrada y salida versionados` — APROBADA
**Tarea siguiente:** `INT-EXT-011 — Definir validación de firma, origen, timestamp y replay` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materializada de la estrategia de intercambio asíncrono para las integraciones externas `EXT-SYS-001` a `EXT-SYS-021`, preservando identidades, proveedores, contratos de entrada/salida, ambiente, credenciales y fronteras de propiedad ya aprobados, sin modificar endpoints, jobs, SDKs, webhooks, proveedores, código, Supabase, configuración ni datos
**Bloque:** X — Integraciones
**Mini-bloque:** Integraciones externas y credenciales
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/02_INTEGRACIONES_EXTERNAS_Y_CREDENCIALES.md`
**Implementación física autorizada:** ninguna
**Cambios de código, DDL, DML, migraciones, RLS, RPC, secretos, credenciales, cuentas externas, configuración productiva, despliegues o datos:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Materializar una decisión explícita de estrategia de intercambio asíncrono para cada una de las veintiuna identidades externas heredadas y contratadas documentalmente por `INT-EXT-001` a `INT-EXT-009`.

La tarea distingue expresamente:

```text
WEBHOOK
≠
POLLING
≠
PUSH
≠
REQUEST / RESPONSE
≠
REDIRECCIÓN
≠
SDK BAJO DEMANDA
≠
DESCUBRIMIENTO LOCAL
```

La selección documental responde únicamente a la forma en la que VENTO obtiene o propaga cambios externos cuando existe una superficie acreditada. No convierte en polling una consulta request/response, no convierte una URL de retorno en webhook y no convierte un servicio de push saliente en una fuente externa de hechos.

Esta tarea tampoco decide firma, origen confiable, ventana temporal, protección contra replay, idempotencia, conservación del payload, cadence numérica, rate limits, retry, backoff, circuit breaker, cuarentena, auditoría, conciliación, contingencia o retiro. Esas materias permanecen en `INT-EXT-011` a `INT-EXT-019`.

---

#### 2. Resultado sustantivo

Se aprueban dos artefactos documentales internos:

- `VENTO-EXTERNAL-DELIVERY-STRATEGY-001`;
- `VENTO-EXTERNAL-DELIVERY-STRATEGY-MATRIX-001`.

Balance materializado:

| Control                                    | Resultado |
| ------------------------------------------ | --------: |
| Identidades heredadas esperadas            |    **21** |
| Identidades materializadas                 | **21/21** |
| Identificadores `EXT-SYS-*` únicos         |    **21** |
| Identidades faltantes                      |     **0** |
| Identidades duplicadas                     |     **0** |
| Estrategias `WEBHOOK`                      |     **2** |
| Estrategias `POLLING`                      |     **0** |
| Estrategias `HIBRIDA_PUSH_PULL`            |     **1** |
| Casos `NO_APLICA_RECEPCION_ASINCRONA`      |    **16** |
| Casos `BLOQUEADA_SIN_BINDING`              |     **2** |
| Endpoints alterados                        |     **0** |
| Jobs o schedulers creados                  |     **0** |
| Webhooks creados                           |     **0** |
| Requisitos de prueba creados o modificados |     **0** |

Distribución primaria:

```text
2 WEBHOOK
+
0 POLLING
+
1 HIBRIDA_PUSH_PULL
+
16 NO_APLICA_RECEPCION_ASINCRONA
+
2 BLOQUEADA_SIN_BINDING
=
21
```

La inexistencia de una estrategia `POLLING` pura en el corte actual es una decisión material: no existe evidencia suficiente para inventar un sondeo periódico hacia un proveedor solo para completar la taxonomía.

---

#### 3. Fuentes y decisiones preservadas

La tarea consume y conserva sin redefinir:

- `INT-EXT-001`, incluidas las veintiuna identidades externas y sus niveles de evidencia;
- `INT-EXT-002`, incluida la separación entre actor humano, principal técnico y cuenta externa;
- `INT-EXT-003`, incluida la procedencia de credenciales;
- `INT-EXT-004`, incluidos los mecanismos reales observados y la obligación fail-closed;
- `INT-EXT-005`, incluido el alcance mínimo de cada credencial;
- `INT-EXT-006`, incluida la separación de ambientes;
- `INT-EXT-007`, incluida la custodia de secretos y configuración publicable;
- `INT-EXT-008`, incluido el lifecycle independiente de credenciales;
- `INT-EXT-009`, incluidos `VENTO-EXTERNAL-IO-CONTRACT-001`, `VENTO-EXTERNAL-IO-CONTRACT-MATRIX-001`, sus veintiuna decisiones y su versión documental `1.0.0`;
- `TREQ-INTEGRATION-003`, que protege operaciones asíncronas, webhooks, reintentos, resultado recuperable e idempotencia;
- `TREQ-INTEGRATION-004`, que exige identificar, versionar, probar y hacer trazable el disparador efectivo de una cadena trigger, función, job, webhook o notificación;
- `TREQ-INTEGRATION-049`, que gobierna la adaptación de eventos originados en proveedores o sistemas externos antes de producir un hecho interno;
- `TREQ-INTEGRATION-050`, que mantiene separados el contrato empresarial y la selección física de topics, colas, triggers, webhooks, endpoints, jobs y transporte;
- las fronteras de propiedad que impiden que el mecanismo de entrega convierta a un tercero o adaptador en propietario de un proceso VENTO.

Ninguna decisión de esta tarea cambia el schema versionado de `INT-EXT-009`, la cuenta externa, el ambiente, el principal técnico, el scope, la credencial ni la fuente de verdad.

---

#### 4. Vocabulario cerrado de estrategia

`VENTO-EXTERNAL-DELIVERY-STRATEGY-001` usa exactamente estas decisiones primarias para el corte documental:

| Estrategia                      | Definición                                                                                                                                                                                                     |
| ------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `WEBHOOK`                       | el proveedor o sistema externo inicia una entrega asíncrona hacia una frontera VENTO acreditada; la recepción no requiere sondeo periódico para enterarse del cambio                                           |
| `POLLING`                       | VENTO consulta de forma periódica una superficie externa acreditada para descubrir cambios o estado nuevo; requiere una lectura autoritativa consultable y no se infiere desde una llamada bajo demanda        |
| `HIBRIDA_PUSH_PULL`             | una señal push o mecanismo equivalente despierta o acelera la actualización y una lectura pull obtiene o confirma el contenido; ambas partes pertenecen a una sola estrategia y no crean dos fuentes de verdad |
| `NO_APLICA_RECEPCION_ASINCRONA` | la superficie actual es exclusivamente request/response, salida, configuración, navegación, adaptador local o carece de recepción asíncrona acreditada; no se inventa webhook o polling                        |
| `BLOQUEADA_SIN_BINDING`         | existe una identidad que requiere integración futura, pero proveedor, interfaz o binding aún no permiten seleccionar de forma verificable webhook, polling o híbrida                                           |

No se autoriza ningún valor alternativo, alias ambiguo ni estrategia implícita.

---

#### 5. Reglas de selección

##### 5.1. `WEBHOOK`

Solo se selecciona cuando existe evidencia actual de una frontera de recepción asíncrona iniciada por el proveedor o sistema externo.

La existencia de una URL de redirección, un callback de interfaz de usuario, un deep link o un endpoint que VENTO invoca no basta para clasificar una superficie como webhook.

##### 5.2. `POLLING`

Solo puede seleccionarse cuando están acreditados:

- una superficie de lectura del proveedor;
- un estado o conjunto de cambios consultable;
- una identidad o criterio que permita distinguir el avance sin fabricar hechos;
- una semántica que no convierta la consulta en mutación repetida.

La cadence, intervalos, jitter, límites, `Retry-After`, backoff y circuit breaker no se fijan aquí; pertenecen a `INT-EXT-015`.

##### 5.3. `HIBRIDA_PUSH_PULL`

Solo se usa cuando ambos mecanismos están acreditados y tienen roles distintos:

```text
SEÑAL / AVISO
+
LECTURA / RECUPERACIÓN DE CONTENIDO
→
UNA SOLA ESTRATEGIA
```

La señal no se convierte en fuente de verdad por sí sola y la lectura no se ejecuta como polling ciego si el protocolo no lo requiere.

##### 5.4. `NO_APLICA_RECEPCION_ASINCRONA`

Es una decisión explícita y no un pendiente. Se usa cuando el contrato actual no necesita una estrategia de recepción asíncrona.

Si una tarea posterior incorpora un binding asíncrono real, esa tarea deberá versionar la matriz y resolver nuevamente esta decisión antes de habilitar el nuevo flujo.

##### 5.5. `BLOQUEADA_SIN_BINDING`

No permite seleccionar por preferencia tecnológica. La salida del bloqueo exige evidencia del proveedor, interfaz y contrato suficiente para decidir el mecanismo sin suposición.

---

#### 6. Reglas transversales

1. una misma identidad externa puede tener varias superficies, pero cada superficie asíncrona debe heredar una estrategia explícita;
2. una estrategia de entrega no modifica la propiedad del hecho empresarial;
3. `WEBHOOK` no significa automáticamente confirmación empresarial;
4. `POLLING` no significa automáticamente reconciliación;
5. `HIBRIDA_PUSH_PULL` no permite tratar la señal y la lectura como dos fuentes competidoras;
6. request/response sin repetición programada no es polling;
7. una consulta iniciada por el usuario no es polling por el solo hecho de usar HTTP GET;
8. un SDK que compra, restaura o consulta bajo demanda no es polling;
9. una redirección del navegador no es webhook;
10. un servicio que VENTO usa para enviar push no es por ello un webhook de entrada;
11. un temporizador local que espera disponibilidad de una librería o periférico no es polling de estado empresarial externo;
12. un webhook no habilita automáticamente fallback a polling;
13. un polling no habilita automáticamente un webhook paralelo;
14. una modalidad híbrida requiere que ambos mecanismos estén acreditados;
15. ningún mecanismo crea autoridad para escribir varias fuentes internas;
16. un ACK técnico no reemplaza el resultado empresarial;
17. todo cambio de estrategia sobre una superficie activa debe conservar compatibilidad con `INT-EXT-009` y producir una nueva revisión de esta matriz;
18. activar una identidad actualmente sin binding exige primero materializar su contrato de `INT-EXT-009` o su sucesor versionado;
19. seguridad de firma, autenticidad, timestamp y replay queda reservada a `INT-EXT-011`;
20. idempotencia y deduplicación por proveedor queda reservada a `INT-EXT-012`.

---

#### 7. Estrategia de Wompi — `EXT-SYS-002`

Decisión:

```text
WEBHOOK
```

La superficie observada de recepción de cambios de pago es el webhook de pagos. El retorno del checkout hacia VENTO permanece como redirección de experiencia y no se convierte en confirmación autoritativa del pago.

Reglas específicas:

- el evento iniciado por Wompi es la entrada asíncrona acreditada del corte;
- la URL de retorno no constituye un segundo canal de confirmación;
- no existe polling puro acreditado en el código inspeccionado para descubrir el estado de pago;
- no se crea un fallback de polling por inferencia;
- firma y checksum se documentarán en `INT-EXT-011` sin cambiar la elección de transporte;
- deduplicación del evento se especializará en `INT-EXT-012`.

---

#### 8. Estrategia de RevenueCat — `EXT-SYS-003`

Decisión:

```text
WEBHOOK
```

La recepción server-side observada de cambios de entitlement se realiza mediante webhook.

Las operaciones del SDK de compra y restauración permanecen llamadas bajo demanda del cliente y no se clasifican como polling.

Reglas específicas:

- el webhook constituye la recepción asíncrona acreditada;
- compra y restore mediante SDK no crean un segundo mecanismo asíncrono;
- no se inventa polling periódico de RevenueCat;
- autenticación del webhook queda en `INT-EXT-011`;
- identidad externa, deduplicación y correlación quedan en `INT-EXT-012` y `INT-EXT-013` según corresponda.

---

#### 9. Estrategia de Apple Wallet / PassKit + APNs — `EXT-SYS-009`

Decisión:

```text
HIBRIDA_PUSH_PULL
```

La familia observada separa dos roles:

```text
APNs
→ señal de actualización

Apple Wallet / PassKit Web Service v1
→ registro y lectura pull del pase actualizado
```

La estrategia es híbrida porque la señal push acelera el ciclo y el contenido actualizado se obtiene mediante la superficie de lectura del web service.

Reglas específicas:

- APNs no constituye el contenido autoritativo del pase;
- el GET del pase no se interpreta como polling periódico de VENTO contra Apple;
- registro, baja, consulta de cambios y descarga del pase permanecen subconjuntos del contrato versionado de `INT-EXT-009`;
- `If-Modified-Since` y `passesUpdatedSince` se preservan como semántica de lectura observada, sin fijar aquí ventanas operativas adicionales;
- no se crea una segunda fuente de datos para el pase;
- lifecycle de certificados y credenciales sigue separado de la estrategia de entrega.

---

#### 10. `VENTO-EXTERNAL-DELIVERY-STRATEGY-MATRIX-001`

| ID            | Sistema / proveedor preservado           | Superficie acreditada de `INT-EXT-009`                                  | Estrategia primaria             | Estado documental         | Decisión materializada                                                                                                                                    |
| ------------- | ---------------------------------------- | ----------------------------------------------------------------------- | ------------------------------- | ------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `EXT-SYS-001` | Supabase                                 | Auth, consultas autorizadas, RPC, Edge Functions y fronteras observadas | `NO_APLICA_RECEPCION_ASINCRONA` | `ESPECIFICADO`            | las superficies heredadas son request/response o plataforma VENTO; no se acredita aquí un proveedor externo que origine hechos mediante webhook o polling |
| `EXT-SYS-002` | Wompi                                    | checkout, retorno y evento de pago                                      | `WEBHOOK`                       | `ESPECIFICADO`            | el evento de pago recibido por webhook es la entrada asíncrona; el retorno del checkout no confirma el hecho y no existe polling acreditado               |
| `EXT-SYS-003` | RevenueCat                               | SDK Apple/Google, compra/restauración y webhook de entitlement          | `WEBHOOK`                       | `ESPECIFICADO`            | entitlement server-side se recibe por webhook; compra y restore del SDK permanecen operaciones bajo demanda, no polling                                   |
| `EXT-SYS-004` | Resend                                   | envío server-side de correo                                             | `NO_APLICA_RECEPCION_ASINCRONA` | `ESPECIFICADO`            | contrato actual de salida; no existe ingestión asíncrona acreditada desde Resend                                                                          |
| `EXT-SYS-005` | Expo / EAS Update                        | configuración, perfiles, canales y plataforma                           | `NO_APLICA_RECEPCION_ASINCRONA` | `ESPECIFICADO`            | `INT-EXT-009` no acredita contrato I/O de administración sobre el cual seleccionar webhook o polling                                                      |
| `EXT-SYS-006` | Expo Push Service                        | mensaje push y respuesta técnica                                        | `NO_APLICA_RECEPCION_ASINCRONA` | `ESPECIFICADO`            | es una superficie de salida; la entrega push no se transforma en webhook de entrada por analogía                                                          |
| `EXT-SYS-007` | Sentry                                   | telemetría SDK hacia ingestión                                          | `NO_APLICA_RECEPCION_ASINCRONA` | `ESPECIFICADO`            | la superficie observada es salida de telemetría; no se acredita recepción asíncrona de estado empresarial                                                 |
| `EXT-SYS-008` | Google Maps / Google Reviews             | autocomplete, detalle de lugar y navegación pública                     | `NO_APLICA_RECEPCION_ASINCRONA` | `ESPECIFICADO`            | autocomplete y detalle son consultas bajo demanda; no se convierten en polling periódico                                                                  |
| `EXT-SYS-009` | Apple Wallet / PassKit + APNs            | `.pkpass`, web service `v1`, registro, actualización y APNs             | `HIBRIDA_PUSH_PULL`             | `ESPECIFICADO`            | APNs actúa como señal y el dispositivo usa la lectura del web service para obtener cambios; no hay dos fuentes de verdad                                  |
| `EXT-SYS-010` | Vercel                                   | plataforma y despliegue                                                 | `NO_APLICA_RECEPCION_ASINCRONA` | `ESPECIFICADO`            | no existe contrato I/O acreditado por `INT-EXT-009` para seleccionar modalidad                                                                            |
| `EXT-SYS-011` | Zebra BrowserPrint                       | descubrimiento local, dispositivo y ZPL                                 | `NO_APLICA_RECEPCION_ASINCRONA` | `ESPECIFICADO`            | adaptador local; detección de librería o impresora no constituye polling de proveedor empresarial                                                         |
| `EXT-SYS-012` | Google Wallet / Google Pay & Wallet      | objeto genérico y JWT de guardado                                       | `NO_APLICA_RECEPCION_ASINCRONA` | `ESPECIFICADO`            | existe modelo de payload, pero no binding remoto acreditado; no se inventa una estrategia asíncrona                                                       |
| `EXT-SYS-013` | POS externo vigente                      | proveedor, interfaz y payload no acreditados                            | `BLOQUEADA_SIN_BINDING`         | `BLOQUEADO_POR_EVIDENCIA` | `INT-POS-001` debe acreditar proveedor, endpoints, webhooks y límites antes de seleccionar modalidad                                                      |
| `EXT-SYS-014` | Shopify / comercio electrónico           | binding no acreditado                                                   | `NO_APLICA_RECEPCION_ASINCRONA` | `NO_APLICA_EN_CORTE`      | no existe intercambio actual acreditado; cualquier binding futuro deberá versionar esta decisión antes de activarse                                       |
| `EXT-SYS-015` | Rappi / marketplace                      | binding no acreditado                                                   | `NO_APLICA_RECEPCION_ASINCRONA` | `NO_APLICA_EN_CORTE`      | no existe intercambio actual acreditado; no se presume webhook ni polling                                                                                 |
| `EXT-SYS-016` | ManyChat / automatización conversacional | binding no acreditado                                                   | `NO_APLICA_RECEPCION_ASINCRONA` | `NO_APLICA_EN_CORTE`      | no existe intercambio actual acreditado; no se presume webhook ni polling                                                                                 |
| `EXT-SYS-017` | WhatsApp                                 | proveedor/API no acreditados                                            | `NO_APLICA_RECEPCION_ASINCRONA` | `NO_APLICA_EN_CORTE`      | no existe proveedor/API acreditado sobre el cual decidir modalidad                                                                                        |
| `EXT-SYS-018` | Instagram / social                       | API/binding no acreditados                                              | `NO_APLICA_RECEPCION_ASINCRONA` | `NO_APLICA_EN_CORTE`      | no existe API/binding acreditado; no se presume webhook de Meta u otra tecnología                                                                         |
| `EXT-SYS-019` | Correo corporativo y alias funcionales   | proveedor e integración no acreditados                                  | `NO_APLICA_RECEPCION_ASINCRONA` | `NO_APLICA_EN_CORTE`      | no existe proveedor de correo integrado acreditado; no se inventa IMAP, webhook o polling                                                                 |
| `EXT-SYS-020` | Telefonía / voz                          | operador e integración no acreditados                                   | `BLOQUEADA_SIN_BINDING`         | `BLOQUEADO_POR_EVIDENCIA` | operador, interfaz y payload deben acreditarse antes de elegir estrategia; la decisión no habilita trabajo técnico                                        |
| `EXT-SYS-021` | Transporte externo                       | proveedor e interfaz no acreditados                                     | `NO_APLICA_RECEPCION_ASINCRONA` | `NO_APLICA_EN_CORTE`      | no existe proveedor o interfaz acreditados; una futura integración deberá versionar esta matriz antes de activarse                                        |

Comprobación de distribución:

```text
WEBHOOK                    = 2
POLLING                    = 0
HIBRIDA_PUSH_PULL          = 1
NO_APLICA_RECEPCION_ASINCRONA = 16
BLOQUEADA_SIN_BINDING      = 2
--------------------------------
TOTAL                      = 21
```

---

#### 11. Criterios para futuros bindings

Cuando una identidad actualmente `NO_APLICA_RECEPCION_ASINCRONA` o `BLOQUEADA_SIN_BINDING` obtenga un binding real, la tarea que materialice ese binding deberá comprobar, antes de activar tráfico:

1. proveedor exacto;
2. superficie o endpoint acreditado;
3. dirección del intercambio;
4. contrato VENTO de `INT-EXT-009` o sucesor compatible;
5. si el proveedor inicia entrega o VENTO debe consultar;
6. si existe una lectura autoritativa utilizable después de una señal;
7. si la estrategia resultante es `WEBHOOK`, `POLLING` o `HIBRIDA_PUSH_PULL`;
8. que la nueva decisión no introduzca una segunda fuente empresarial;
9. que la matriz de estrategia quede versionada antes de producción;
10. que las tareas de seguridad, idempotencia, retry y observabilidad se apliquen según sus propietarios.

No se permite activar primero y documentar después.

---

#### 12. Cambio de estrategia

Cambiar una superficie activa de:

- `WEBHOOK` a `POLLING`;
- `POLLING` a `WEBHOOK`;
- cualquiera de las anteriores a `HIBRIDA_PUSH_PULL`;
- `HIBRIDA_PUSH_PULL` a una sola vía;
- `NO_APLICA_RECEPCION_ASINCRONA` a una modalidad activa;
- `BLOQUEADA_SIN_BINDING` a una modalidad activa;

requiere una nueva revisión del artefacto `VENTO-EXTERNAL-DELIVERY-STRATEGY-MATRIX-001` y verificación de compatibilidad con el contrato I/O vigente.

El cambio no se ejecuta silenciosamente mediante variable de entorno, feature flag, endpoint adicional, job, cron o fallback local no documentado.

La materialización física posterior deberá preservar rollback del mecanismo anterior cuando el paquete de implementación lo exija, pero esta tarea no define ni ejecuta dicho rollback.

---

#### 13. Fronteras reservadas a `INT-EXT-011` a `INT-EXT-020`

| Materia                                            | Tarea propietaria |
| -------------------------------------------------- | ----------------- |
| firma, origen, timestamp y replay                  | `INT-EXT-011`     |
| idempotencia y deduplicación                       | `INT-EXT-012`     |
| mapeo de identificadores externos y canónicos      | `INT-EXT-013`     |
| conservación controlada del payload original       | `INT-EXT-014`     |
| rate limits, reintentos, backoff y circuit breaker | `INT-EXT-015`     |
| cuarentena o dead-letter                           | `INT-EXT-016`     |
| auditoría, métricas, alertas y conciliación        | `INT-EXT-017`     |
| contingencia ante indisponibilidad del proveedor   | `INT-EXT-018`     |
| retiro de integración y revocación de credenciales | `INT-EXT-019`     |
| credenciales compartidas entre integraciones       | `INT-EXT-020`     |

`INT-EXT-010` no adelanta ninguna de esas políticas por el hecho de identificar el mecanismo de transporte.

---

#### 14. Trazabilidad de handoff

| Trabajo derivado                                                  | Estado                    | Propietario / tarea responsable | Condición de salida                                                                                         |
| ----------------------------------------------------------------- | ------------------------- | ------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| Validar autenticidad de webhooks Wompi y RevenueCat               | `FUERA_DE_ALCANCE`        | `INT-EXT-011`                   | firma, origen, timestamp y protección contra replay quedan definidos sin cambiar la modalidad seleccionada  |
| Deduplicar entregas repetidas                                     | `FUERA_DE_ALCANCE`        | `INT-EXT-012`                   | cada sistema externo dispone de identidad y alcance idempotente verificables                                |
| Fijar intervalos, backoff y límites de cualquier consulta o retry | `FUERA_DE_ALCANCE`        | `INT-EXT-015`                   | cadence y presupuestos quedan definidos sin convertir request/response en polling                           |
| Acreditar proveedor e interfaz del POS vigente                    | `BLOQUEADO_POR_EVIDENCIA` | `INT-POS-001`                   | documentación, endpoints, webhooks y límites del POS quedan inspeccionados y permiten seleccionar modalidad |
| Materializar contratos compartidos de evento externo              | `FUERA_DE_ALCANCE`        | `SHELL-CON-019`                 | la integración consume un contrato compartido sin transferir propiedad empresarial                          |
| Materializar idempotencia y conciliación compartidas              | `FUERA_DE_ALCANCE`        | `SHELL-CON-023`                 | operaciones repetidas y resultados recuperables utilizan el contrato compartido aprobado                    |
| Materializar cuarentena y rechazo                                 | `FUERA_DE_ALCANCE`        | `SHELL-CON-024`                 | entradas inválidas o incompatibles tienen disposición explícita                                             |

Las identidades sin binding no se convierten en pendientes ejecutables por esta tarea. Permanecen `NO_APLICA_EN_CORTE` hasta que una tarea canónica futura introduzca de forma explícita el binding correspondiente.

---

#### 15. Prohibiciones

Queda prohibido:

1. declarar polling solo porque una integración usa HTTP GET;
2. declarar webhook solo porque existe una URL de retorno;
3. declarar webhook solo porque existe un endpoint HTTP;
4. declarar híbrida sin dos mecanismos acreditados y roles distintos;
5. usar polling como fallback silencioso de un webhook;
6. usar webhook como fallback silencioso de polling;
7. sondear un endpoint mutante como mecanismo de descubrimiento;
8. ejecutar polling periódico sin superficie de lectura autoritativa acreditada;
9. tratar ACK técnico como confirmación empresarial;
10. tratar la redirección de Wompi como confirmación del pago;
11. tratar `purchase` o `restore` de RevenueCat como polling;
12. tratar Expo Push como webhook de entrada;
13. tratar consultas de Google Maps como polling empresarial;
14. tratar detección local de BrowserPrint como polling de proveedor;
15. tratar APNs como contenido autoritativo del pase;
16. presentar Google Wallet como integración asíncrona operativa sin binding remoto acreditado;
17. inventar estrategia para POS, telefonía u otra identidad sin interfaz acreditada;
18. fijar firma, checksum, timestamp o replay de `INT-EXT-011`;
19. fijar claves idempotentes o deduplicación de `INT-EXT-012`;
20. fijar cadence, retries o circuit breaker de `INT-EXT-015`;
21. modificar código, Supabase, endpoints, cron, jobs, proveedores, cuentas, credenciales o datos durante esta fase documental;
22. cambiar las veintiuna identidades heredadas;
23. modificar los contratos I/O de `INT-EXT-009` por conveniencia de transporte;
24. iniciar `INT-EXT-011`.

---

#### 16. Criterios de aceptación

`INT-EXT-010` queda documentalmente completa cuando se cumplen simultáneamente:

1. se preservan exactamente `EXT-SYS-001` a `EXT-SYS-021`;
2. existen exactamente 21 decisiones primarias;
3. faltantes = 0;
4. duplicados = 0;
5. identificadores únicos = 21;
6. la distribución es exactamente `2 WEBHOOK + 0 POLLING + 1 HIBRIDA_PUSH_PULL + 16 NO_APLICA_RECEPCION_ASINCRONA + 2 BLOQUEADA_SIN_BINDING = 21`;
7. Wompi queda `WEBHOOK`;
8. el retorno de Wompi no se presenta como confirmación autoritativa;
9. RevenueCat queda `WEBHOOK`;
10. compra y restore de RevenueCat no se presentan como polling;
11. Apple Wallet queda `HIBRIDA_PUSH_PULL`;
12. APNs se conserva como señal y la lectura del pase como pull de contenido;
13. no existe una estrategia `POLLING` inventada;
14. request/response queda separado de polling;
15. redirección queda separada de webhook;
16. push saliente queda separado de webhook de entrada;
17. adaptador local queda separado de polling de proveedor;
18. `EXT-SYS-013` permanece bloqueada hasta `INT-POS-001`;
19. `EXT-SYS-020` permanece bloqueada por falta de operador, interfaz y payload acreditados;
20. las identidades sin binding no reciben una modalidad ficticia;
21. una futura activación exige versionar la matriz;
22. cambio de modalidad no puede ejecutarse silenciosamente;
23. propiedad empresarial no cambia por la estrategia de transporte;
24. firma, origen, timestamp y replay no se adelantan;
25. idempotencia y deduplicación no se adelantan;
26. cadence, rate limits, retry y circuit breaker no se adelantan;
27. no se modifica código;
28. no se modifica Supabase;
29. no se crean webhooks, jobs, cron ni schedulers;
30. no se modifican endpoints ni proveedores;
31. se crean cero requisitos de prueba;
32. se modifican cero requisitos de prueba;
33. `INT-EXT-011` permanece reservada.

---

#### 17. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea no introduce un nuevo comportamiento ejecutable. Materializa, para las veintiuna identidades ya gobernadas, qué mecanismo asíncrono observado corresponde al corte actual y cuáles superficies no tienen recepción asíncrona o permanecen bloqueadas. Los comportamientos verificables asociados ya están cubiertos por requisitos vigentes de integración que protegen operaciones asíncronas y webhooks, trazabilidad del disparador efectivo, adaptación de eventos externos y separación entre contrato empresarial y mecanismo físico. Las especializaciones de seguridad, idempotencia, retry y observabilidad permanecen en sus tareas posteriores y requisitos vigentes.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

El registro canónico de requisitos permanece sin cambios.

---

#### 18. Resultado de la tarea

`INT-EXT-010` queda **APROBADA** como definición documental completa de estrategia webhook, polling o híbrida para las veintiuna identidades externas.

Resultado consolidado:

- identidades materializadas: **21/21**;
- `WEBHOOK`: **2**;
- `POLLING`: **0**;
- `HIBRIDA_PUSH_PULL`: **1**;
- `NO_APLICA_RECEPCION_ASINCRONA`: **16**;
- `BLOQUEADA_SIN_BINDING`: **2**;
- faltantes: **0**;
- duplicados: **0**;
- webhooks creados: **0**;
- jobs o schedulers creados: **0**;
- cambios de runtime: **0**;
- TREQ creados o modificados: **0**.

La tarea deja como invariante:

```text
ESTRATEGIA ASINCRONA VÁLIDA
=
IDENTIDAD EXTERNA ACREDITADA
+
CONTRATO I/O VIGENTE
+
SUPERFICIE REAL
+
MECANISMO OBSERVADO
+
UNA SOLA AUTORIDAD EMPRESARIAL
```

sin usar mecanismos inexistentes para completar una taxonomía y sin adelantar las políticas de seguridad, idempotencia, resiliencia u operación de las tareas siguientes.

---

ÚLTIMA TAREA APROBADA

`INT-EXT-009 — Definir contratos de entrada y salida versionados`

TAREA ACTUAL APROBADA

`INT-EXT-010 — Definir estrategia webhook, polling o híbrida`

SIGUIENTE TAREA RESERVADA

`INT-EXT-011 — Definir validación de firma, origen, timestamp y replay`


### ✅ INT-EXT-011 — Definir validación de firma, origen, timestamp y replay

**Estado:** APROBADA
**Tarea anterior:** `INT-EXT-010 — Definir estrategia webhook, polling o híbrida` — APROBADA
**Tarea siguiente:** `INT-EXT-012 — Definir idempotencia y deduplicación por sistema externo` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materializada de autenticidad, origen, firma o MAC, semántica temporal y protección contra replay para las integraciones externas `EXT-SYS-001` a `EXT-SYS-021`, preservando identidades, contratos I/O y estrategias de transporte ya aprobados, sin modificar código, endpoints, Supabase, secretos, proveedores, cuentas, datos ni configuración remota
**Bloque:** X — Integraciones
**Mini-bloque:** Integraciones externas y credenciales
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/02_INTEGRACIONES_EXTERNAS_Y_CREDENCIALES.md`
**Implementación física autorizada:** ninguna
**Cambios de código, DDL, DML, migraciones, RLS, RPC, Edge Functions, secretos, credenciales, cuentas externas, endpoints, webhooks, despliegues o datos:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Materializar para cada una de las veintiuna identidades externas el contrato de seguridad que determina si una entrada puede considerarse auténtica, atribuible al origen esperado y temporalmente válida antes de que VENTO permita cualquier interpretación empresarial.

La tarea separa obligatoriamente:

```text
AUTENTICIDAD
≠
AUTORIZACIÓN EMPRESARIAL
≠
INTEGRIDAD
≠
ORIGEN DE RED
≠
FRESCURA TEMPORAL
≠
IDEMPOTENCIA
≠
DEDUPLICACIÓN
```

Una firma válida no convierte al proveedor en fuente de verdad interna, no concede autorización sobre un dominio VENTO y no demuestra que la entrega sea nueva.

La tarea define controles documentales para:

- firma, HMAC, checksum o secreto de autenticación cuando la superficie los soporte;
- identificación del proveedor, cuenta, ambiente y superficie esperados;
- tratamiento de timestamps de firma, evento, envío, recepción y procesamiento;
- clasificación de entregas firmadas pero antiguas;
- separación entre replay de seguridad y repetición legítima del proveedor;
- fail-closed ante autenticidad no verificable;
- fronteras exactas con idempotencia, deduplicación, payload original, retry y cuarentena.

---

#### 2. Resultado sustantivo

Se aprueban dos artefactos documentales internos:

- `VENTO-EXTERNAL-INGRESS-AUTHENTICITY-001`;
- `VENTO-EXTERNAL-INGRESS-AUTHENTICITY-MATRIX-001`.

Balance materializado:

| Control                                                               | Resultado |
| --------------------------------------------------------------------- | --------: |
| Identidades heredadas esperadas                                       |    **21** |
| Identidades materializadas                                            | **21/21** |
| Identificadores `EXT-SYS-*` únicos                                    |    **21** |
| Identidades faltantes                                                 |     **0** |
| Identidades duplicadas                                                |     **0** |
| Perfiles Wompi con checksum firmado                                   |     **1** |
| Perfiles RevenueCat con HMAC obligatorio                              |     **1** |
| Perfiles PassKit de autenticación de recurso                          |     **1** |
| Casos `NO_APLICA_INGRESO_AUTONOMO`                                    |    **16** |
| Casos `BLOQUEADA_SIN_BINDING`                                         |     **2** |
| Integraciones con cumplimiento físico total acreditado por esta tarea |     **0** |
| Cambios físicos                                                       |     **0** |
| Requisitos de prueba creados o modificados                            |     **0** |

Distribución primaria:

```text
1 WOMPI_CHECKSUM_TIMESTAMP
+
1 REVENUECAT_HMAC_TIMESTAMP
+
1 PASSKIT_RESOURCE_AUTH
+
16 NO_APLICA_INGRESO_AUTONOMO
+
2 BLOQUEADA_SIN_BINDING
=
21
```

La clasificación describe el control aplicable, no certifica que el runtime actual ya lo cumpla por completo.

---

#### 3. Entradas canónicas preservadas

La tarea consume y conserva sin redefinir:

- `INT-EXT-001`, incluidas las veintiuna identidades `EXT-SYS-001` a `EXT-SYS-021`;
- `INT-EXT-002`, incluida la separación entre principal técnico, actor humano y cuenta externa;
- `INT-EXT-003`, incluida la procedencia verificable de credenciales;
- `INT-EXT-004`, incluidos los mecanismos reales de autenticación observados y la regla fail-closed;
- `INT-EXT-005`, incluidos scopes mínimos y prohibición de convertir autenticación en autoridad empresarial;
- `INT-EXT-006`, incluida la separación `DEVELOPMENT`, `STAGING` y `PRODUCTION`;
- `INT-EXT-007`, incluida la custodia de secretos y referencias sin exponer valores;
- `INT-EXT-008`, incluido el lifecycle de credenciales, rotación, expiración y revocación;
- `INT-EXT-009`, incluidos `VENTO-EXTERNAL-IO-CONTRACT-001` y `VENTO-EXTERNAL-IO-CONTRACT-MATRIX-001`;
- `INT-EXT-010`, incluidos `VENTO-EXTERNAL-DELIVERY-STRATEGY-001` y `VENTO-EXTERNAL-DELIVERY-STRATEGY-MATRIX-001`;
- `TREQ-INTEGRATION-003`, para operación asíncrona recuperable, reintentos e idempotencia;
- `TREQ-INTEGRATION-004`, para trazabilidad del disparador efectivo y sus efectos;
- `TREQ-INTEGRATION-042`, para entrega al menos una vez y deduplicación por identidad estable;
- `TREQ-INTEGRATION-049`, para conservar y validar afirmación externa, mecanismo de autenticidad, proveedor, identificador, recepción y correlación antes de producir un hecho interno;
- `TREQ-INTEGRATION-051`, para impedir que secretos o credenciales entren en eventos, ejemplos o contratos;
- `TREQ-INTEGRATION-061`, para impedir que una afirmación externa se publique como verdad interna sin validación del adaptador y de la aplicación propietaria;
- `TREQ-PASS-009`, para impedir doble efecto, regresión de estado y replay con efectos repetidos en pagos.

Esta tarea no cambia la identidad de proveedor, el contrato I/O, la modalidad webhook/polling/híbrida, la cuenta, el ambiente, el principal técnico ni el scope de credencial ya aprobados.

---

#### 4. Vocabulario cerrado de decisión primaria

`VENTO-EXTERNAL-INGRESS-AUTHENTICITY-001` usa exactamente estas decisiones primarias:

| Decisión                     | Significado                                                                                                                                                                             |
| ---------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `WOMPI_CHECKSUM_TIMESTAMP`   | entrada webhook Wompi cuya autenticidad depende del checksum SHA-256 construido con propiedades dinámicas, timestamp firmado y secreto de eventos del ambiente correspondiente          |
| `REVENUECAT_HMAC_TIMESTAMP`  | entrada webhook RevenueCat que deberá usar HMAC-SHA256 sobre timestamp de entrega y cuerpo raw, con comparación de tiempo constante y ventana temporal explícita                        |
| `PASSKIT_RESOURCE_AUTH`      | llamadas estandarizadas del PassKit Web Service autenticadas por `authenticationToken` o `deviceLibraryIdentifier` según la operación; no se tratan como eventos empresariales firmados |
| `NO_APLICA_INGRESO_AUTONOMO` | no existe en el corte una entrada autónoma externa que requiera firma, timestamp o replay gate de esta tarea                                                                            |
| `BLOQUEADA_SIN_BINDING`      | proveedor, interfaz o payload no están acreditados y no es posible seleccionar de forma verificable el mecanismo de autenticidad                                                        |

No se autoriza inferir HMAC, mTLS, OAuth, allowlist de IP, firma asimétrica o nonce cuando el binding actual no los acredita.

---

#### 5. `VENTO-EXTERNAL-INGRESS-AUTHENTICITY-001`

Toda entrada externa que pueda producir, directa o indirectamente, una afirmación empresarial deberá atravesar conceptualmente este orden:

```text
1. RESOLVER IDENTIDAD EXTERNA Y AMBIENTE
2. VALIDAR SUPERFICIE Y MÉTODO ESPERADOS
3. CAPTURAR RECEIVED_AT DE VENTO
4. PRESERVAR MATERIAL DE VERIFICACIÓN
5. VALIDAR FIRMA / MAC / CHECKSUM / TOKEN SEGÚN PERFIL
6. VALIDAR ORIGEN LÓGICO DEL PROVEEDOR
7. VALIDAR TIMESTAMP DE SEGURIDAD CUANDO EXISTA
8. CLASIFICAR FRESCURA / REPLAY
9. ENTREGAR SOLO UNA AFIRMACIÓN EXTERNA AUTENTICADA
10. APLICAR IDEMPOTENCIA / DEDUPLICACIÓN EN SU FRONTERA PROPIA
11. VALIDAR SEMÁNTICA Y AUTORIDAD EMPRESARIAL
12. PRODUCIR O RECHAZAR EL HECHO INTERNO
```

Reglas:

1. la validación de autenticidad ocurre antes de cualquier mutación empresarial;
2. una entrada no verificable falla cerrada;
3. un secreto no se registra junto al payload, digest, log o evidencia;
4. una firma válida no concede permisos;
5. una firma válida no sustituye la validación de ambiente;
6. una firma válida no convierte el timestamp del hecho en timestamp de entrega;
7. una entrega auténtica repetida no se interpreta automáticamente como ataque ni como hecho nuevo;
8. el control de replay no sustituye la deduplicación de `INT-EXT-012`;
9. el control de autenticidad no sustituye la cuarentena de `INT-EXT-016`;
10. cualquier material de seguridad que dependa de una credencial conserva el lifecycle aprobado por `INT-EXT-008`.

---

#### 6. Regla canónica de origen

VENTO distingue:

```text
ORIGEN LÓGICO VERIFICADO
=
IDENTIDAD EXTERNA
+
AMBIENTE
+
SUPERFICIE ESPERADA
+
MECANISMO DE AUTENTICIDAD VÁLIDO
```

No constituyen prueba suficiente de origen por sí solos:

- `Origin` HTTP;
- CORS;
- `User-Agent`;
- nombre de un header;
- dirección IP no gobernada por un rango oficial estable;
- reverse DNS;
- URL de retorno del navegador;
- correo, teléfono o identificador visible del proveedor;
- un payload que "parece" tener la forma esperada.

TLS protege el canal hacia un endpoint HTTPS, pero no sustituye una firma, MAC, token o secreto cuando una petición autónoma entra a VENTO.

Una allowlist de IP solo podrá usarse como defensa adicional cuando el proveedor publique rangos autoritativos, estables y operables; nunca será la única prueba de autenticidad de un webhook si existe un mecanismo criptográfico soportado.

CORS no se usa como control de autenticidad de webhook.

---

#### 7. Regla canónica de firma, MAC y checksum

Para cada perfil que soporte material criptográfico:

1. se usa exactamente el algoritmo y canonicalización documentados para ese proveedor;
2. no se reserializa un cuerpo si la firma cubre los bytes raw;
3. no se fija una lista de propiedades si el proveedor envía dinámicamente las propiedades firmadas;
4. si dos representaciones del mismo checksum o firma llegan simultáneamente y discrepan, la entrada se rechaza;
5. los campos requeridos por el material firmado deben existir y tener semántica compatible con el contrato del proveedor;
6. la comparación se realizará en tiempo constante cuando el runtime lo permita;
7. no se registran secreto, clave privada ni signing secret;
8. el identificador de secreto o referencia de versión puede conservarse sin exponer el valor;
9. una rotación no habilita aceptación indefinida de secreto anterior;
10. una firma que no puede verificarse produce `INVALID_SIGNATURE_OR_MAC` y no alcanza la lógica empresarial.

El nombre de un header que contenga la palabra `signature` no demuestra que exista una firma criptográfica.

---

#### 8. Semántica temporal obligatoria

Se mantienen separados:

| Tiempo               | Significado                                          | Uso de seguridad                                                                       |
| -------------------- | ---------------------------------------------------- | -------------------------------------------------------------------------------------- |
| `provider_event_at`  | momento del hecho según el proveedor                 | contexto del hecho; no es anti-replay por defecto                                      |
| `provider_signed_at` | timestamp incluido dentro del material firmado o MAC | puede gobernar frescura cuando el protocolo lo permite                                 |
| `provider_sent_at`   | momento declarado de envío o primera notificación    | evidencia de transporte; solo es prueba de seguridad si está criptográficamente ligado |
| `vento_received_at`  | instante registrado por VENTO al recibir la petición | referencia local para medir edad, skew y retraso                                       |
| `vento_processed_at` | instante de procesamiento interno                    | auditoría; no reemplaza el tiempo recibido                                             |

Reglas:

1. ningún timestamp se corrige silenciosamente para hacerlo parecer actual;
2. el timestamp de negocio no se usa como nonce;
3. la fecha de recepción local no convierte una firma vieja en una firma nueva;
4. un timestamp de seguridad debe estar incluido en el material firmado o MAC para usarse como freshness gate;
5. timezone y unidad deben normalizarse explícitamente;
6. un timestamp imposible, no parseable o fuera del perfil aceptado falla cerrado;
7. la ausencia de timestamp firmado no se compensa inventando uno del lado de VENTO;
8. si el protocolo del proveedor admite reentregas legítimas del mismo material firmado, no se impone un TTL que destruya esas reentregas sin evidencia del proveedor.

---

#### 9. Estados de autenticidad y replay

Una entrada evaluada por esta tarea puede terminar únicamente en uno de estos resultados de seguridad:

| Resultado                        | Significado                                                                                                                                               |
| -------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `AUTHENTIC_FRESH_DELIVERY`       | autenticidad y origen verificados, timestamp de seguridad dentro del perfil aplicable                                                                     |
| `AUTHENTIC_REDELIVERY_ALLOWED`   | autenticidad verificada y protocolo compatible con reentrega legítima; la repetición debe pasar a idempotencia/deduplicación sin adquirir un efecto nuevo |
| `STALE_SIGNED_DELIVERY`          | firma válida, pero timestamp de seguridad excede la ventana autorizada del perfil                                                                         |
| `INVALID_SIGNATURE_OR_MAC`       | firma, MAC o checksum no coincide o no puede verificarse                                                                                                  |
| `ORIGIN_OR_ENVIRONMENT_MISMATCH` | material criptográfico o token puede ser válido, pero identidad, ambiente o superficie no corresponden al binding esperado                                |
| `INVALID_SECURITY_TIMESTAMP`     | timestamp requerido falta, es inválido o no puede evaluarse conforme al perfil                                                                            |
| `UNVERIFIABLE_AUTHENTICITY`      | el binding exige autenticidad, pero faltan los elementos necesarios para demostrarla                                                                      |
| `NOT_APPLICABLE`                 | la superficie no es una entrada autónoma gobernada por este contrato                                                                                      |

`AUTHENTIC_REDELIVERY_ALLOWED` no significa `DUPLICATE`. La decisión de si dos entregas representan el mismo evento y si deben devolver el mismo resultado pertenece a `INT-EXT-012`.

---

#### 10. Perfil Wompi — `EXT-SYS-002`

##### 10.1. Contrato objetivo

Se fija `WOMPI_EVENT_AUTH_PROFILE_001`:

```text
proveedor             = WOMPI
dirección             = INBOUND_WEBHOOK
método                 = POST
authenticity_profile   = WOMPI_CHECKSUM_TIMESTAMP
checksum_source        = signature.checksum OR X-Event-Checksum
algorithm              = SHA-256
signed_material        = ordered(signature.properties from data) + timestamp + event_secret
environment_binding    = REQUIRED
hard_timestamp_ttl     = NOT_DEFINED_BY_PROVIDER_CONTRACT
replay_outcome         = AUTHENTIC_REDELIVERY_ALLOWED when signature remains valid
```

Reglas materiales:

1. `signature.properties` se consume en el orden recibido; no se codifica una lista fija;
2. cada path firmado debe resolverse desde `data` conforme al contrato Wompi;
3. el `timestamp` forma parte del material usado para calcular el checksum;
4. se usa el secreto de eventos correspondiente al ambiente exacto;
5. si `signature.checksum` y `X-Event-Checksum` están presentes, ambos deben representar el mismo checksum;
6. el checksum calculado se compara sin fuga temporal evitable;
7. `environment` debe corresponder al ambiente VENTO configurado para ese endpoint;
8. una URL de eventos de producción no acepta eventos declarados como sandbox ni a la inversa;
9. CORS no participa en la decisión de origen;
10. el retorno del checkout no participa en la autenticidad del webhook;
11. `timestamp`, `sent_at` y `vento_received_at` se preservan como tiempos distintos;
12. no se usa una ventana rígida genérica sobre `timestamp`, porque Wompi admite reentregas del evento y el contrato vigente no acredita que ese timestamp cambie por intento;
13. una reentrega con checksum válido se clasifica como entrega auténtica potencialmente repetida y pasa a la frontera de `INT-EXT-012` antes de producir un efecto nuevo;
14. la ausencia de una expiración rígida no permite reescribir estados terminales ni omitir idempotencia;
15. checksum inválido, secreto ausente o ambiente incompatible bloquean la entrada antes del efecto empresarial.

##### 10.2. Estado técnico observado

La implementación actual de `payments-webhook`:

- obtiene el secreto desde `WOMPI_EVENTS_SECRET` con fallback a `WOMPI_WEBHOOK_SECRET`;
- extrae dinámicamente `signature.properties`;
- incorpora `timestamp` al material calculado;
- calcula SHA-256;
- acepta el checksum del body o `X-Event-Checksum`;
- rechaza checksum inválido con respuesta no autorizada;
- registra y consulta una identidad de evento antes de aplicar el estado.

No queda acreditado en el código observado:

- validar que `environment` del payload coincida con el ambiente del endpoint;
- comprobar inconsistencia entre checksum de header y checksum de body cuando ambos existen;
- comparación de digest en tiempo constante;
- una clasificación explícita de temporalidad/replay separada de la deduplicación;
- tratamiento diferenciado entre entrega nueva y reentrega auténtica antes de la lógica empresarial.

Resultado del corte:

`WOMPI_AUTH_RUNTIME_STATE = IMPLEMENTADO_PARCIAL`

La definición documental queda completa; la evidencia actual no permite declarar cumplimiento físico total.

---

#### 11. Perfil RevenueCat — `EXT-SYS-003`

##### 11.1. Contrato objetivo

Se fija `REVENUECAT_WEBHOOK_AUTH_PROFILE_001`:

```text
proveedor             = REVENUECAT
dirección             = INBOUND_WEBHOOK
authenticity_profile   = REVENUECAT_HMAC_TIMESTAMP
signature_header       = X-RevenueCat-Webhook-Signature
header_shape           = t=<unix_timestamp>,v1=<hmac_sha256_hex>
algorithm              = HMAC-SHA256
signed_material        = <t>.<raw_json_body>
comparison             = CONSTANT_TIME
freshness_tolerance    = 300 seconds
authorization_header   = SECONDARY_ORIGIN_GUARD_WHEN_CONFIGURED
```

Reglas materiales:

1. el HMAC signing de RevenueCat será obligatorio para el binding VENTO activo;
2. el cuerpo debe obtenerse en bytes raw antes de cualquier `JSON.parse` o reserialización;
3. se extraen `t` y `v1` del header oficial de firma;
4. se calcula HMAC-SHA256 sobre `t + "." + raw_body`;
5. la comparación usa una función de tiempo constante;
6. `abs(vento_received_at - t)` no puede superar **300 segundos**;
7. una firma válida con `t` fuera de la ventana produce `STALE_SIGNED_DELIVERY` y no alcanza lógica empresarial;
8. `event_timestamp_ms`, `purchased_at_ms` y `expiration_at_ms` son tiempos del dominio de suscripción y no sustituyen `t` como freshness gate;
9. el authorization header configurado en RevenueCat puede mantenerse como defensa adicional de origen, pero no se presenta como HMAC ni sustituye la firma;
10. sandbox y producción se validan contra el perfil de webhook configurado y la información de ambiente que exponga el evento;
11. una entrega HMAC válida dentro de ventana todavía puede ser duplicada; la identidad del evento y el efecto repetido pertenecen a `INT-EXT-012`;
12. la rotación del signing secret conserva el lifecycle de `INT-EXT-008` y no admite fallback indefinido a secretos revocados.

##### 11.2. Estado técnico observado

La implementación actual de `club-revenuecat-webhook`:

- obtiene `REVENUECAT_WEBHOOK_SECRET`;
- lee `x-revenuecat-signature`;
- compara directamente el valor recibido con el secreto;
- rechaza si falta o no coincide;
- parsea después el JSON y procesa entitlement, suscripción y auditoría.

El nombre del header actual no constituye evidencia de firma criptográfica. El código observado no implementa el perfil HMAC vigente del proveedor.

No queda acreditado:

- `X-RevenueCat-Webhook-Signature` con `t` y `v1`;
- acceso al cuerpo raw antes de parsear;
- HMAC-SHA256 sobre `t.raw_body`;
- comparación de tiempo constante;
- ventana de **300 segundos**;
- distinción entre authorization header y signing secret;
- clasificación explícita de replay temporal.

Resultado del corte:

`REVENUECAT_AUTH_RUNTIME_STATE = NO_CONFORME_CONTRATO_OBJETIVO`

Esta tarea no modifica el runtime. La no conformidad permanece como gate de implementación y certificación; no se presenta como seguridad ya materializada.

---

#### 12. Perfil Apple Wallet / PassKit — `EXT-SYS-009`

##### 12.1. Naturaleza del flujo

La estrategia `HIBRIDA_PUSH_PULL` aprobada en `INT-EXT-010` no convierte las llamadas del PassKit Web Service en webhooks de hechos empresariales.

Se fija `PASSKIT_RESOURCE_AUTH_PROFILE_001`:

| Operación                                      | Prueba de autenticidad/origen aplicable                                                                  |
| ---------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| registrar pase en dispositivo                  | `Authorization: ApplePass <authenticationToken>` debe coincidir con el token del pase                    |
| desregistrar pase                              | mismo `authenticationToken` del pase                                                                     |
| obtener pase actualizado                       | mismo `authenticationToken` del pase                                                                     |
| listar seriales actualizados de un dispositivo | `deviceLibraryIdentifier` actúa como secreto compartido de dispositivo según el protocolo PassKit        |
| registrar log                                  | no produce por sí solo hecho empresarial y no adquiere autoridad por provenir del endpoint estándar      |
| APNs saliente                                  | autenticación hacia Apple pertenece a la salida; no es evidencia de autenticidad de una llamada entrante |
| `.pkpass` firmado                              | firma del artefacto entregado; no equivale a firma de la petición entrante                               |

Reglas:

1. `authenticationToken` y `deviceLibraryIdentifier` no son intercambiables;
2. un token de un pase no autoriza otro `serialNumber` o `passTypeIdentifier`;
3. `passesUpdatedSince` es un cursor/tag de actualización, no un timestamp anti-replay;
4. `If-Modified-Since` es semántica HTTP de cache/actualización, no una firma temporal;
5. el `iat` del JWT usado para APNs autentica la salida VENTO → Apple y no valida una entrada Apple → VENTO;
6. el replay de una lectura no se trata como un nuevo hecho empresarial;
7. operaciones repetidas con efecto material se someten a la frontera idempotente de `INT-EXT-012` cuando corresponda;
8. no se inventa HMAC de request donde el protocolo PassKit usa shared secrets de recurso.

##### 12.2. Estado técnico observado

El web service actual:

- valida `authenticationToken` contra el pase para registro, desregistro y obtención del pase;
- acepta `ApplePass` y también `Bearer` en el parser de autorización;
- usa `deviceLibraryIdentifier` para consultar registros del dispositivo;
- exige además un token no vacío en la consulta de seriales, pero el valor de ese token no se vincula a un recurso en ese handler;
- firma el `.pkpass` mediante certificados;
- crea JWT ES256 con `iat` para autenticarse ante APNs.

La documentación oficial de PassKit asigna el `deviceLibraryIdentifier` como secreto compartido de la consulta de seriales actualizados. Por ello, el requisito adicional de un token arbitrario no verificado en ese handler no se considera evidencia de autenticación correcta ni se incorpora al contrato canónico.

Resultado del corte:

`PASSKIT_AUTH_RUNTIME_STATE = IMPLEMENTADO_PARCIAL_CON_DIVERGENCIA_DE_PROTOCOLO`

La tarea define la semántica correcta y no declara validación física del servicio.

---

#### 13. `VENTO-EXTERNAL-INGRESS-AUTHENTICITY-MATRIX-001`

| ID            | Sistema / proveedor preservado           | Estrategia heredada de `INT-EXT-010` | Decisión de autenticidad     | Estado documental         | Estado técnico / decisión materializada                                                                                                                                                                             |
| ------------- | ---------------------------------------- | ------------------------------------ | ---------------------------- | ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `EXT-SYS-001` | Supabase                                 | `NO_APLICA_RECEPCION_ASINCRONA`      | `NO_APLICA_INGRESO_AUTONOMO` | `ESPECIFICADO`            | las superficies heredadas son plataforma VENTO y request/response; JWT, sesión, anon/service role y autorización Supabase pertenecen a sus contratos propios, no a un webhook externo de esta tarea                 |
| `EXT-SYS-002` | Wompi                                    | `WEBHOOK`                            | `WOMPI_CHECKSUM_TIMESTAMP`   | `ESPECIFICADO`            | checksum SHA-256 con propiedades dinámicas, timestamp y secreto de eventos; runtime observado implementa validación parcial, pero no acredita ambiente, equivalencia header/body ni clasificación temporal completa |
| `EXT-SYS-003` | RevenueCat                               | `WEBHOOK`                            | `REVENUECAT_HMAC_TIMESTAMP`  | `ESPECIFICADO`            | VENTO exige HMAC-SHA256 del proveedor sobre timestamp y raw body con tolerancia 300 s; runtime actual usa comparación estática de secreto y queda no conforme al contrato objetivo                                  |
| `EXT-SYS-004` | Resend                                   | `NO_APLICA_RECEPCION_ASINCRONA`      | `NO_APLICA_INGRESO_AUTONOMO` | `ESPECIFICADO`            | superficie actual de salida de correo; no existe callback de entrada acreditado sobre el cual validar firma o replay                                                                                                |
| `EXT-SYS-005` | Expo / EAS Update                        | `NO_APLICA_RECEPCION_ASINCRONA`      | `NO_APLICA_INGRESO_AUTONOMO` | `ESPECIFICADO`            | configuración/plataforma sin contrato de evento entrante acreditado por `INT-EXT-009`                                                                                                                               |
| `EXT-SYS-006` | Expo Push Service                        | `NO_APLICA_RECEPCION_ASINCRONA`      | `NO_APLICA_INGRESO_AUTONOMO` | `ESPECIFICADO`            | la superficie observada es salida de push y respuesta técnica; no se convierte en webhook de entrada                                                                                                                |
| `EXT-SYS-007` | Sentry                                   | `NO_APLICA_RECEPCION_ASINCRONA`      | `NO_APLICA_INGRESO_AUTONOMO` | `ESPECIFICADO`            | telemetría SDK saliente; no existe afirmación empresarial autónoma entrante acreditada                                                                                                                              |
| `EXT-SYS-008` | Google Maps / Google Reviews             | `NO_APLICA_RECEPCION_ASINCRONA`      | `NO_APLICA_INGRESO_AUTONOMO` | `ESPECIFICADO`            | consultas HTTPS bajo demanda; la identidad del endpoint remoto se protege por el canal y configuración, pero no existe webhook firmado de entrada                                                                   |
| `EXT-SYS-009` | Apple Wallet / PassKit + APNs            | `HIBRIDA_PUSH_PULL`                  | `PASSKIT_RESOURCE_AUTH`      | `ESPECIFICADO`            | las llamadas de actualización usan shared secrets de recurso según operación; `.pkpass` firmado y JWT APNs son salientes y no se confunden con firma de request entrante                                            |
| `EXT-SYS-010` | Vercel                                   | `NO_APLICA_RECEPCION_ASINCRONA`      | `NO_APLICA_INGRESO_AUTONOMO` | `ESPECIFICADO`            | no existe contrato I/O entrante acreditado para esta materia                                                                                                                                                        |
| `EXT-SYS-011` | Zebra BrowserPrint                       | `NO_APLICA_RECEPCION_ASINCRONA`      | `NO_APLICA_INGRESO_AUTONOMO` | `ESPECIFICADO`            | adaptador local de periférico; no es un proveedor remoto que emita webhook de negocio                                                                                                                               |
| `EXT-SYS-012` | Google Wallet / Google Pay & Wallet      | `NO_APLICA_RECEPCION_ASINCRONA`      | `NO_APLICA_INGRESO_AUTONOMO` | `ESPECIFICADO`            | existe modelo de JWT de guardado saliente, pero no binding remoto entrante acreditado; no se inventa validación de callback                                                                                         |
| `EXT-SYS-013` | POS externo vigente                      | `BLOQUEADA_SIN_BINDING`              | `BLOQUEADA_SIN_BINDING`      | `BLOQUEADO_POR_EVIDENCIA` | `INT-POS-001` debe acreditar proveedor, endpoints, webhooks, autenticación y payload antes de seleccionar firma, origen o replay gate                                                                               |
| `EXT-SYS-014` | Shopify / comercio electrónico           | `NO_APLICA_RECEPCION_ASINCRONA`      | `NO_APLICA_INGRESO_AUTONOMO` | `NO_APLICA_EN_CORTE`      | binding no acreditado; cualquier integración futura deberá versionar esta matriz antes de activar una entrada                                                                                                       |
| `EXT-SYS-015` | Rappi / marketplace                      | `NO_APLICA_RECEPCION_ASINCRONA`      | `NO_APLICA_INGRESO_AUTONOMO` | `NO_APLICA_EN_CORTE`      | no existe intercambio actual acreditado; no se presume firma, token, HMAC o allowlist                                                                                                                               |
| `EXT-SYS-016` | ManyChat / automatización conversacional | `NO_APLICA_RECEPCION_ASINCRONA`      | `NO_APLICA_INGRESO_AUTONOMO` | `NO_APLICA_EN_CORTE`      | no existe bot/API activo acreditado; no se selecciona mecanismo de autenticidad por nombre de plataforma                                                                                                            |
| `EXT-SYS-017` | WhatsApp                                 | `NO_APLICA_RECEPCION_ASINCRONA`      | `NO_APLICA_INGRESO_AUTONOMO` | `NO_APLICA_EN_CORTE`      | proveedor/API no acreditados; el canal no determina firma, token ni tecnología de webhook                                                                                                                           |
| `EXT-SYS-018` | Instagram / social                       | `NO_APLICA_RECEPCION_ASINCRONA`      | `NO_APLICA_INGRESO_AUTONOMO` | `NO_APLICA_EN_CORTE`      | API/binding no acreditados; no se presume mecanismo Meta ni callback                                                                                                                                                |
| `EXT-SYS-019` | Correo corporativo y alias funcionales   | `NO_APLICA_RECEPCION_ASINCRONA`      | `NO_APLICA_INGRESO_AUTONOMO` | `NO_APLICA_EN_CORTE`      | proveedor e integración no acreditados; no se inventa firma de inbound mail, IMAP, webhook o polling                                                                                                                |
| `EXT-SYS-020` | Telefonía / voz                          | `BLOQUEADA_SIN_BINDING`              | `BLOQUEADA_SIN_BINDING`      | `BLOQUEADO_POR_EVIDENCIA` | operador, interfaz y payload deben acreditarse antes de definir firma, origen, timestamp o replay; un caller ID no constituye autenticidad                                                                          |
| `EXT-SYS-021` | Transporte externo                       | `NO_APLICA_RECEPCION_ASINCRONA`      | `NO_APLICA_INGRESO_AUTONOMO` | `NO_APLICA_EN_CORTE`      | proveedor e interfaz no acreditados; tracking o número de guía no se convierten en prueba de origen                                                                                                                 |

Comprobación:

```text
WOMPI_CHECKSUM_TIMESTAMP       = 1
REVENUECAT_HMAC_TIMESTAMP      = 1
PASSKIT_RESOURCE_AUTH          = 1
NO_APLICA_INGRESO_AUTONOMO     = 16
BLOQUEADA_SIN_BINDING          = 2
----------------------------------
TOTAL                          = 21
```

---

#### 14. Reglas para futuros bindings

Cuando una identidad actualmente `NO_APLICA_INGRESO_AUTONOMO` o `BLOQUEADA_SIN_BINDING` obtenga una entrada real, la tarea que materialice ese binding deberá decidir antes de activar tráfico:

1. proveedor y cuenta exactos;
2. ambiente exacto;
3. endpoint, método y dirección del intercambio;
4. material que prueba origen;
5. algoritmo de firma, MAC o token cuando exista;
6. bytes o campos exactos cubiertos por la firma;
7. canonicalización exacta;
8. timestamp de seguridad y unidad;
9. ventana de frescura solo cuando el protocolo la soporte;
10. tratamiento de retries legítimos;
11. condición de replay inválido;
12. relación con la identidad idempotente de `INT-EXT-012`;
13. secreto y lifecycle sin exponer valores;
14. ambiente de sandbox/staging/producción sin mezcla;
15. condición fail-closed cuando falte evidencia.

No se hereda automáticamente la política de Wompi, RevenueCat o PassKit a otro proveedor.

---

#### 15. Handoffs y fronteras exactas

| Trabajo derivado                                                                   | Estado                    | Propietario / tarea responsable | Condición de salida                                                                                                  |
| ---------------------------------------------------------------------------------- | ------------------------- | ------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| Materializar contrato compartido de evento externo recibido                        | `FUERA_DE_ALCANCE`        | `SHELL-CON-019`                 | el contrato compartido puede conservar proveedor, ambiente, autenticidad, tiempos y correlación sin incluir secretos |
| Definir identidad estable y deduplicación de reentregas Wompi/RevenueCat           | `FUERA_DE_ALCANCE`        | `INT-EXT-012`                   | una misma entrega lógica no produce dos efectos y una repetición legítima conserva resultado estable                 |
| Materializar contrato compartido de idempotencia y conciliación                    | `FUERA_DE_ALCANCE`        | `SHELL-CON-023`                 | la repetición autenticada queda separada del efecto empresarial y es recuperable                                     |
| Conservar payload original protegido                                               | `FUERA_DE_ALCANCE`        | `INT-EXT-014`                   | evidencia original se conserva con minimización, retención y acceso controlados                                      |
| Definir retries y backoff del proveedor                                            | `FUERA_DE_ALCANCE`        | `INT-EXT-015`                   | reintentos legítimos no se confunden con un nuevo hecho ni crean loops                                               |
| Definir disposición de entradas inválidas                                          | `FUERA_DE_ALCANCE`        | `INT-EXT-016`                   | firma inválida, ambiente incompatible o payload no procesable tienen rechazo/cuarentena explícitos                   |
| Definir auditoría y reconciliación                                                 | `FUERA_DE_ALCANCE`        | `INT-EXT-017`                   | se puede reconstruir autenticidad, recepción, resultado, rechazo y conciliación sin exponer secretos                 |
| Acreditar binding del POS vigente                                                  | `BLOQUEADO_POR_EVIDENCIA` | `INT-POS-001`                   | proveedor, endpoints, webhooks, autenticación y límites permiten instanciar este contrato                            |
| Certificar seguridad de cualquier paquete Supabase que materialice estas fronteras | `FUERA_DE_ALCANCE`        | `SUPA-TRANS-010`                | el paquete no amplía superficie de ataque y los casos no autorizados permanecen en cero                              |
| Verificar paridad local/staging/producción de cambios Supabase relacionados        | `FUERA_DE_ALCANCE`        | `SUPA-TRANS-013`                | el mismo candidato y configuración intencional quedan demostrados por ambiente antes de promoción                    |

Las dos no conformidades observadas en Edge Functions no autorizan cambios físicos durante esta tarea. Cualquier corrección Supabase posterior deberá originarse, versionarse, probarse y ejecutarse desde `vento-shell`.

---

#### 16. Fronteras reservadas a `INT-EXT-012` a `INT-EXT-020`

| Materia                                                     | Tarea propietaria |
| ----------------------------------------------------------- | ----------------- |
| identidad idempotente y deduplicación                       | `INT-EXT-012`     |
| mapeo de identificadores externos/canónicos                 | `INT-EXT-013`     |
| conservación controlada del payload original                | `INT-EXT-014`     |
| rate limits, retry, backoff y circuit breaker               | `INT-EXT-015`     |
| cuarentena o dead-letter                                    | `INT-EXT-016`     |
| auditoría, métricas, alertas y conciliación                 | `INT-EXT-017`     |
| contingencia ante indisponibilidad del proveedor            | `INT-EXT-018`     |
| retiro de integración y revocación de credenciales          | `INT-EXT-019`     |
| prohibición de credenciales compartidas entre integraciones | `INT-EXT-020`     |

`INT-EXT-011` puede declarar que una entrega es auténtica, inválida, antigua o reentregada conforme al perfil, pero no define todavía la clave idempotente del proveedor ni el algoritmo de deduplicación del efecto.

---

#### 17. Prohibiciones

Queda prohibido:

1. tratar CORS como autenticidad de webhook;
2. confiar solo en `Origin`, `User-Agent`, reverse DNS o IP no gobernada;
3. aceptar una entrada solo porque contiene un header llamado `signature`;
4. llamar HMAC a una comparación estática de secreto;
5. reserializar JSON cuando la firma cubre el cuerpo raw;
6. usar el timestamp del hecho empresarial como timestamp anti-replay sin contrato del proveedor;
7. sustituir un timestamp firmado por `Date.now()`;
8. aceptar silenciosamente firma de body y header cuando ambos difieren;
9. registrar el valor del secreto usado para verificar una firma;
10. compartir el mismo secreto entre ambientes;
11. usar una credencial revocada como fallback indefinido;
12. asumir que firma válida equivale a autorización empresarial;
13. asumir que firma válida equivale a entrega nueva;
14. rechazar reintentos legítimos de Wompi mediante un TTL inventado no soportado por el protocolo observado;
15. aceptar RevenueCat como conforme solo por comparar un secreto estático;
16. usar `event_timestamp_ms` de RevenueCat como sustituto del timestamp HMAC `t`;
17. confundir `passesUpdatedSince` o `If-Modified-Since` de PassKit con mecanismo anti-replay;
18. confundir JWT APNs saliente con firma de entrada;
19. inventar firma, HMAC, mTLS, OAuth o allowlist para identidades sin binding;
20. definir claves idempotentes o algoritmo de deduplicación de `INT-EXT-012`;
21. definir retención del payload de `INT-EXT-014`;
22. definir cadence, retry o backoff de `INT-EXT-015`;
23. definir cuarentena de `INT-EXT-016`;
24. modificar código, Supabase, proveedor, dashboard, secreto, endpoint, webhook o datos durante esta fase;
25. cambiar las veintiuna identidades heredadas;
26. cambiar las estrategias de transporte aprobadas en `INT-EXT-010`;
27. iniciar `INT-EXT-012`.

---

#### 18. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea no introduce una nueva familia de comportamiento ejecutable ni altera el registro de requisitos. Especializa, por identidad externa y con evidencia actual, cómo se satisfacen controles de autenticidad de afirmaciones externas, seguridad de operaciones asíncronas, tratamiento de reentregas y ausencia de doble efecto que ya están protegidos por requisitos vigentes. Las brechas observadas permanecen como estado de implementación no acreditado y como gates de los contratos y paquetes responsables; no se declara ninguna prueba satisfecha sin evidencia.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

El registro canónico de requisitos permanece sin cambios.

---

#### 19. Criterios de aceptación

`INT-EXT-011` queda documentalmente completa cuando se cumplen simultáneamente:

1. se preservan exactamente `EXT-SYS-001` a `EXT-SYS-021`;
2. existen exactamente 21 decisiones primarias;
3. faltantes = 0;
4. duplicados = 0;
5. identificadores únicos = 21;
6. la distribución es exactamente `1 WOMPI_CHECKSUM_TIMESTAMP + 1 REVENUECAT_HMAC_TIMESTAMP + 1 PASSKIT_RESOURCE_AUTH + 16 NO_APLICA_INGRESO_AUTONOMO + 2 BLOQUEADA_SIN_BINDING = 21`;
7. Wompi usa propiedades dinámicas del evento y no una lista fija;
8. Wompi incorpora el timestamp dentro del checksum;
9. Wompi valida el ambiente como parte de su origen lógico;
10. Wompi no recibe un TTL rígido inventado que invalide reentregas legítimas;
11. una reentrega Wompi auténtica no se interpreta como hecho nuevo;
12. RevenueCat exige el HMAC oficial sobre timestamp y cuerpo raw;
13. RevenueCat usa comparación de tiempo constante;
14. RevenueCat usa una tolerancia de **300 segundos** sobre el timestamp HMAC;
15. `event_timestamp_ms` no sustituye el timestamp HMAC;
16. el authorization header de RevenueCat queda separado del signing secret;
17. la implementación RevenueCat actual no se presenta como HMAC válida;
18. PassKit conserva `authenticationToken` para operaciones de pase que lo requieren;
19. PassKit conserva `deviceLibraryIdentifier` como secreto de dispositivo para consulta de seriales actualizados;
20. `.pkpass` firmado y JWT APNs permanecen clasificados como salidas;
21. cursores de actualización PassKit no se presentan como anti-replay;
22. CORS no se presenta como seguridad de webhook;
23. TLS no sustituye la firma de una entrada autónoma cuando el proveedor ofrece mecanismo criptográfico;
24. no se inventan mecanismos para identidades sin binding;
25. `EXT-SYS-013` permanece bloqueada hasta `INT-POS-001`;
26. `EXT-SYS-020` permanece bloqueada hasta acreditar operador, interfaz y payload;
27. autenticidad permanece separada de autorización empresarial;
28. freshness/replay permanece separado de deduplicación del efecto;
29. `INT-EXT-012` conserva propiedad exclusiva de identidad idempotente y deduplicación;
30. no se modifica código;
31. no se modifica Supabase;
32. no se rotan ni crean secretos;
33. no se modifica configuración de proveedor;
34. se crean cero requisitos de prueba;
35. se modifican cero requisitos de prueba;
36. `INT-EXT-012` permanece reservada.

---

#### 20. Resultado de la tarea

`INT-EXT-011` queda **APROBADA** como definición documental completa de validación de firma, origen, timestamp y replay para las veintiuna identidades externas.

Resultado consolidado:

- identidades materializadas: **21/21**;
- `WOMPI_CHECKSUM_TIMESTAMP`: **1**;
- `REVENUECAT_HMAC_TIMESTAMP`: **1**;
- `PASSKIT_RESOURCE_AUTH`: **1**;
- `NO_APLICA_INGRESO_AUTONOMO`: **16**;
- `BLOQUEADA_SIN_BINDING`: **2**;
- faltantes: **0**;
- duplicados: **0**;
- runtimes declarados totalmente conformes por esta tarea: **0**;
- cambios físicos: **0**;
- TREQ creados o modificados: **0**.

La tarea deja como invariante:

```text
AFIRMACIÓN EXTERNA ACEPTABLE
=
IDENTIDAD Y AMBIENTE ESPERADOS
+
MECANISMO DE AUTENTICIDAD VÁLIDO
+
SEMÁNTICA TEMPORAL CORRECTA
+
CLASIFICACIÓN DE REPLAY
+
AUTORIDAD EMPRESARIAL REVALIDADA
```

sin tratar firma válida como hecho nuevo, sin confundir autenticidad con autorización y sin adelantar la identidad idempotente o la deduplicación de la tarea siguiente.

---

ÚLTIMA TAREA APROBADA

`INT-EXT-010 — Definir estrategia webhook, polling o híbrida`

TAREA ACTUAL APROBADA

`INT-EXT-011 — Definir validación de firma, origen, timestamp y replay`

SIGUIENTE TAREA RESERVADA

`INT-EXT-012 — Definir idempotencia y deduplicación por sistema externo`


### ✅ INT-EXT-012 — Definir idempotencia y deduplicación por sistema externo

**Estado:** APROBADA
**Tarea anterior:** `INT-EXT-011 — Definir validación de firma, origen, timestamp y replay` — APROBADA
**Tarea siguiente:** `INT-EXT-013 — Definir mapeo de identificadores externos y canónicos` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materialización por las veintiuna identidades externas de la clave idempotente, el alcance de deduplicación, el hash lógico, la reclamación durable, el resultado recuperable y la separación entre retry técnico y repetición intencional, sin implementar cambios físicos
**Bloque:** X — Integraciones
**Mini-bloque:** Integraciones externas y credenciales
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/02_INTEGRACIONES_EXTERNAS_Y_CREDENCIALES.md`
**Fase:** exclusivamente documental
**Implementación física autorizada:** ninguna
**Cambios de código, DDL, DML, migraciones, RLS, RPC, secretos, configuración remota, despliegues o datos:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir, para cada identidad `EXT-SYS-001` a `EXT-SYS-021`, cómo VENTO distingue una operación nueva de una repetición de la misma operación y cómo impide que reintentos, redeliveries, concurrencia o incertidumbre de red produzcan más de un efecto lógico o físico.

La tarea separa obligatoriamente:

```text
AUTENTICIDAD DE LA ENTREGA
≠
IDENTIDAD IDEMPOTENTE
≠
DEDUPLICACIÓN
≠
RETRY
≠
REPETICIÓN INTENCIONAL
≠
CONCILIACIÓN
```

`INT-EXT-011` decide si una entrada puede aceptarse como auténtica o como redelivery válida. `INT-EXT-012` decide si esa entrega representa una operación ya reclamada y qué resultado debe recuperar. No redefine firma, autenticación, mapeo externo, retención de payload, backoff, cuarentena ni conciliación.

---

#### 2. Resultado sustantivo

Se aprueban dos artefactos documentales:

1. `VENTO-EXTERNAL-IDEMPOTENCY-CONTRACT-001`, contrato común de identidad idempotente y deduplicación.
2. `VENTO-EXTERNAL-IDEMPOTENCY-MATRIX-001`, decisión materializada para las veintiuna identidades externas heredadas.

Balance:

| Control                                             |    Resultado |
| --------------------------------------------------- | -----------: |
| Identidades esperadas                               |       **21** |
| Identidades materializadas                          | **21 de 21** |
| Identificadores únicos                              |       **21** |
| Faltantes                                           |        **0** |
| Duplicados                                          |        **0** |
| `IDEMPOTENCIA_DE_EFECTO_REQUERIDA`                  |        **6** |
| `SIN_DEDUP_DURABLE_POR_NO_HABER_EFECTO_EMPRESARIAL` |        **2** |
| `GOBERNADA_POR_CONTRATO_INTERNO_VENTO`              |        **1** |
| `NO_APLICA_EN_CORTE`                                |       **10** |
| `BLOQUEADA_SIN_BINDING`                             |        **2** |
| Cambios físicos                                     |        **0** |
| Requisitos de prueba creados o modificados          |        **0** |

La distribución es exactamente:

```text
6 + 2 + 1 + 10 + 2 = 21
```

---

#### 3. Entradas canónicas preservadas

La tarea consume y conserva sin redefinir:

- `VENTO-EXTERNAL-SYSTEM-INVENTORY-001` y sus veintiuna identidades;
- las decisiones de principal técnico, procedencia, mecanismos de autenticación, mínimo privilegio, separación de ambientes, secretos y lifecycle aprobadas en `INT-EXT-002` a `INT-EXT-008`;
- los contratos I/O versionados de `INT-EXT-009`;
- las estrategias `WEBHOOK`, `HIBRIDA_PUSH_PULL`, `NO_APLICA_RECEPCION_ASINCRONA` y `BLOQUEADA_SIN_BINDING` de `INT-EXT-010`;
- la clasificación de autenticidad, origen, timestamp y replay de `INT-EXT-011`;
- el contrato transversal ya protegido por `TREQ-INTEGRATION-003`, que exige clave estable, hash de contenido lógico, estado durable, resultado recuperable, conflicto ante reutilización incompatible y claim/lock equivalente;
- la reconstrucción de intentos y efectos protegida por `TREQ-INTEGRATION-004`;
- el invariante de deduplicación de entregas repetidas protegido por `TREQ-INTEGRATION-042`;
- el tratamiento seguro de replay/backfill protegido por `TREQ-INTEGRATION-045`;
- la conservación de identidad externa y correlación protegida por `TREQ-INTEGRATION-049` y `TREQ-INTEGRATION-061`;
- el requisito específico de pagos `TREQ-PASS-009`, que exige convergencia de intentos concurrentes, claim atómico de eventos de proveedor y ausencia de doble efecto;
- `SHELL-CON-023` como contrato compartido posterior de idempotencia y conciliación;
- `PRINT-ARC-010` como autoridad ya aprobada sobre prevención de impresiones duplicadas.

Esta tarea especializa esos invariantes por sistema externo; no crea una semántica paralela.

---

#### 4. `VENTO-EXTERNAL-IDEMPOTENCY-CONTRACT-001`

Toda operación con efecto externo, efecto interno derivado de una entrada externa o efecto físico deberá poder representar como mínimo:

| Campo conceptual       | Regla                                                                              |
| ---------------------- | ---------------------------------------------------------------------------------- |
| `external_system_id`   | identidad `EXT-SYS-*` exacta                                                       |
| `environment`          | ambiente exacto; una clave nunca cruza ambientes                                   |
| `surface`              | webhook, envío, registro, impresión u otra superficie materializada                |
| `operation_kind`       | clase estable del efecto solicitado                                                |
| `operation_key`        | identidad estable asignada antes del primer efecto                                 |
| `logical_content_hash` | huella determinista del contenido lógico que la clave protege                      |
| `resource_ref`         | recurso interno o externo aplicable sin sustituir el mapping de `INT-EXT-013`      |
| `generation`           | versión intencional del envío/efecto cuando una repetición voluntaria sea legítima |
| `claim_state`          | estado durable de reclamación de la operación                                      |
| `result_ref`           | resultado recuperable o referencia durable al resultado original                   |
| `provider_ref`         | identificador de proveedor cuando exista y esté acreditado                         |
| `first_received_at`    | primera recepción o creación de la operación                                       |
| `last_seen_at`         | última repetición observada sin convertirla en nuevo efecto                        |

La denominación física final pertenece a la implementación posterior. La obligación es semántica y no prescribe todavía tabla, índice, RPC, cola o proveedor de almacenamiento.

---

#### 5. Regla universal de identidad y contenido

La clave idempotente se evalúa dentro de este namespace:

```text
external_system_id
+ environment
+ surface
+ operation_kind
+ operation_key
```

Reglas:

1. la clave se determina antes del primer efecto;
2. la clave no se genera de nuevo en cada retry de la misma operación;
3. `logical_content_hash` se calcula sobre contenido lógico normalizado, no sobre metadatos variables como hora local de retry, contador de intento o latencia;
4. mismo namespace + misma clave + mismo hash devuelve el resultado durable original y no produce un segundo efecto;
5. mismo namespace + misma clave + hash distinto produce `IDEMPOTENCY_KEY_REUSE_CONFLICT`;
6. una clave aleatoria creada después de recibir un evento sin identidad no convierte ese evento en deduplicable;
7. una clave de staging jamás deduplica producción ni a la inversa;
8. un identificador de usuario, correo, teléfono, token de dispositivo o `site_id` aislado no es por sí solo una clave idempotente válida;
9. el hash lógico no sustituye la autenticidad de `INT-EXT-011` ni el mapping de `INT-EXT-013`;
10. una colisión o inconsistencia de identidad falla cerrado antes de repetir el efecto.

---

#### 6. Reclamación durable y estados

Antes de producir un efecto cubierto se requiere una reclamación durable o mecanismo equivalente capaz de excluir carreras concurrentes.

Estados conceptuales cerrados:

| Estado                           | Significado                                                                    |
| -------------------------------- | ------------------------------------------------------------------------------ |
| `CLAIMED`                        | la clave y su hash fueron aceptados como primera operación                     |
| `IN_PROGRESS`                    | el efecto comenzó y todavía no existe resultado definitivo                     |
| `SUCCEEDED`                      | existe resultado durable recuperable                                           |
| `FAILED_FINAL`                   | el intento terminó sin efecto recuperable y no debe reinterpretarse como éxito |
| `OUTCOME_UNKNOWN`                | el canal no permite saber todavía si el efecto ocurrió                         |
| `DUPLICATE_SAME_CONTENT`         | la misma operación vuelve a presentarse y debe recuperar el resultado conocido |
| `IDEMPOTENCY_KEY_REUSE_CONFLICT` | la misma clave intenta proteger contenido lógico distinto                      |

Reglas:

1. consultar si existe una fila y después ejecutar el efecto sin claim exclusivo no satisface el contrato;
2. un `UNIQUE` evita duplicar registros, pero no basta si el efecto puede ocurrir antes de adquirir esa unicidad;
3. cuando el efecto interno pueda quedar dentro de la misma frontera transaccional que el claim, ambos deberán converger atómicamente;
4. cuando el efecto ocurre en un proveedor o periférico externo y no puede ser atómico con VENTO, el estado durable se crea antes de la llamada y el resultado se persiste después;
5. `OUTCOME_UNKNOWN` nunca autoriza un segundo efecto ciego;
6. la política temporal de retry pertenece a `INT-EXT-015`;
7. la resolución operativa de resultados desconocidos pertenece a `INT-EXT-017`;
8. la disposición de conflictos o entradas no procesables pertenece a `INT-EXT-016`.

---

#### 7. Retry técnico frente a repetición intencional

Se distinguen dos casos:

```text
RETRY DE LA MISMA OPERACIÓN
→ misma operation_key
→ mismo logical_content_hash
→ mismo efecto máximo
→ resultado original recuperable
```

```text
NUEVA REPETICIÓN INTENCIONAL
→ nueva generation o nueva operación explícita
→ nueva operation_key derivada de esa intención
→ actor/razón cuando el efecto lo requiera
```

Ejemplos:

- reintentar automáticamente el mismo correo después de timeout conserva la misma generación;
- pulsar una acción explícita de reenviar invitación crea una nueva generación;
- reintentar un push por un fallo de transporte conserva la misma operación;
- solicitar deliberadamente reenviar una comunicación crea una nueva operación;
- reintentar una impresión cuyo resultado físico es desconocido no es equivalente a solicitar una reimpresión autorizada.

---

#### 8. Wompi — `EXT-SYS-002`

##### 8.1. Checkout saliente

Se fija `WOMPI-CHECKOUT-IDEMPOTENCY-001`:

```text
operation_kind        = CREATE_CHECKOUT
authoritative_key     = payments.transactions.idempotency_key
provider_reference    = misma referencia Wompi derivada de la operación
environment_scope     = REQUIRED
logical_content       = transaction_id + order_id + amount_minor + currency + reference
result_rule           = misma clave y mismo contenido recuperan el checkout ya creado
```

Reglas:

1. la expiración y firma generadas para el primer checkout forman parte del resultado durable, no una razón para regenerar silenciosamente una URL en cada retry;
2. si se requiere un checkout nuevo tras expirar el anterior, deberá existir una nueva operación o generación autorizada;
3. monto, moneda, orden o referencia distintos bajo la misma clave producen conflicto;
4. `provider_reference` no reemplaza la clave interna si todavía no existe al iniciar la operación.

Estado técnico observado:

- `payments.transactions` contiene `idempotency_key` y unicidad por `(provider, idempotency_key)`;
- el checkout usa esa clave como `reference` estable;
- `payments-create-intent` vuelve a calcular expiración, firma y URL en cada invocación y luego actualiza `raw_request`;
- no se acredita un resultado de checkout durable que sea recuperado sin reconstrucción en una repetición concurrente.

Resultado:

`WOMPI_CHECKOUT_IDEMPOTENCY_STATE = IMPLEMENTADO_PARCIAL`

##### 8.2. Webhook entrante

Se fija `WOMPI-WEBHOOK-DEDUP-001`:

```text
operation_kind        = APPLY_PROVIDER_EVENT
event_key             = provider + environment + provider_event_id
provider_event_id     = payload.id OR data.id, únicamente cuando exista identidad acreditada
logical_content_hash  = hash de la afirmación externa autenticada y normalizada
claim_rule             = claim durable antes de aplicar el estado de pago
result_rule            = redelivery válida devuelve el resultado del procesamiento original
```

Reglas:

1. no se permite `crypto.randomUUID()` como fallback para un evento que necesita deduplicación;
2. ausencia de identidad de evento suficiente produce `UNRESOLVED_EVENT_IDENTITY` y no habilita un efecto nuevo;
3. la unicidad por proveedor e identificador de evento debe adquirirse antes del efecto;
4. dos entregas concurrentes del mismo evento no pueden atravesar simultáneamente el gate de primera ejecución;
5. la redelivery auténtica admitida por `INT-EXT-011` se convierte aquí en `DUPLICATE_SAME_CONTENT` cuando ya existe resultado estable.

Estado técnico observado:

- existe unicidad `(provider, provider_event_id)` en `payments.webhook_events`;
- el runtime consulta primero si el evento está procesado;
- si ya está procesado devuelve `duplicate: true`;
- sin embargo, el runtime aplica `mark_payment_transaction_status` antes de registrar el evento como procesado;
- el lookup, el efecto y el registro final no constituyen una única reclamación atómica;
- si no existe `payload.id` ni `data.id`, genera un UUID nuevo, impidiendo reconocer una redelivery idéntica.

Resultado:

`WOMPI_WEBHOOK_IDEMPOTENCY_STATE = IMPLEMENTADO_PARCIAL_NO_ATOMICO`

---

#### 9. RevenueCat — `EXT-SYS-003`

Se fija `REVENUECAT-WEBHOOK-DEDUP-001`.

El contrato de payload observado no acredita todavía un identificador estable nativo de evento. Por ello, VENTO no inventa un `event_id` del proveedor.

Mientras no exista un identificador nativo acreditado y versionado, la identidad documental de deduplicación será un fingerprint determinista `RC-FP-v1` calculado sobre la afirmación normalizada disponible:

```text
type
app_user_id
original_transaction_id
product_id
event_timestamp_ms
purchased_at_ms
expiration_at_ms
entitlement_ids ordenados
aliases ordenados
```

incluyendo de forma explícita valores ausentes/nulos para impedir ambigüedad de canonicalización.

Reglas:

1. el namespace incluye `revenuecat + environment + inbound_webhook`;
2. dos redeliveries con la misma afirmación normalizada generan el mismo `RC-FP-v1`;
3. si un contrato posterior acredita un identificador de evento estable del proveedor, ese identificador tendrá precedencia en una nueva versión del contrato y el hash de contenido permanecerá separado;
4. el claim se adquiere antes de insertar suscripción, actualizar entitlement o registrar auditoría;
5. una repetición no inserta una segunda suscripción ni un segundo registro de procesamiento;
6. la proyección `entitlements` convergente por usuario no se usa como prueba de deduplicación del evento;
7. la firma/frescura de `INT-EXT-011` se verifica antes de esta etapa.

Estado técnico observado:

- el webhook actual no conserva identidad de evento;
- inserta una fila nueva en `club.subscriptions` por cada invocación;
- hace `upsert` de `club.entitlements` por usuario;
- inserta una fila nueva en `club.audit_events` por cada invocación;
- la tabla de suscripciones observada no tiene restricción de unicidad por evento de proveedor;
- no existe claim durable antes de los efectos.

Resultado:

`REVENUECAT_WEBHOOK_IDEMPOTENCY_STATE = NO_IMPLEMENTADO`

---

#### 10. Resend — `EXT-SYS-004`

Se fija `RESEND-DELIVERY-IDEMPOTENCY-001`:

```text
operation_kind        = SEND_STAFF_INVITATION
operation_key         = invitation_id + delivery_generation + channel=email
logical_content_hash  = recipient + template/version + asunto + contenido lógico de invitación
retry_rule             = mismo intento conserva key y generación
explicit_resend        = incrementa generation y crea una nueva operación
```

Reglas:

1. la identidad de invitación no basta para distinguir un retry de un reenvío voluntario;
2. el contador de reenvío puede expresar la generación, pero debe participar en una reclamación durable antes de llamar al proveedor;
3. si el proveedor devuelve una referencia de mensaje, se conserva como resultado de la operación, no como clave inicial;
4. una respuesta desconocida no se resuelve enviando otro correo ciegamente;
5. reenviar explícitamente requiere una nueva generación y no reutiliza la clave de la entrega anterior con contenido distinto.

Estado técnico observado:

- existe persistencia de invitación, estado, `resend_count` y `last_sent_at`;
- el flujo distingue invitaciones ya existentes y reenvíos;
- la llamada a la API de Resend es un POST externo;
- no se acredita un claim durable de entrega alrededor de la llamada externa ni recuperación del mismo resultado ante retry.

Resultado:

`RESEND_DELIVERY_IDEMPOTENCY_STATE = IMPLEMENTADO_PARCIAL_WORKFLOW_SIN_CLAIM_DE_ENVIO`

---

#### 11. Expo Push Service — `EXT-SYS-006`

Se fija `EXPO-PUSH-DELIVERY-IDEMPOTENCY-001`:

```text
operation_kind        = DELIVER_ANNOUNCEMENT_PUSH
operation_key         = announcement_id + destination_ref + delivery_generation
logical_content_hash  = announcement_id + title/body logical version + tag + destination_ref
retry_rule             = mismo destino y misma generación no producen un segundo push lógico
explicit_resend        = nueva generation
```

`destination_ref` es una referencia segura al destino; el contrato no obliga a persistir el push token en claro dentro de la clave.

Estado técnico observado:

- `announcement-notify` construye mensajes por token y los envía directamente a Expo en lotes;
- desactiva tokens que responden `DeviceNotRegistered`;
- no persiste una reclamación por anuncio/destino antes del envío;
- no conserva un resultado durable que permita responder a un retry sin volver a llamar al proveedor.

Resultado:

`EXPO_PUSH_IDEMPOTENCY_STATE = NO_IMPLEMENTADO`

---

#### 12. Apple Wallet / PassKit y APNs — `EXT-SYS-009`

Se fija `PASSKIT-RESOURCE-IDEMPOTENCY-001`.

Operaciones con mutación:

| Operación                     | Alcance idempotente                                                                         |
| ----------------------------- | ------------------------------------------------------------------------------------------- |
| registrar dispositivo/pase    | `deviceLibraryIdentifier + passTypeIdentifier + serialNumber + desired_registration_digest` |
| desregistrar dispositivo/pase | `deviceLibraryIdentifier + passTypeIdentifier + serialNumber + desired_state=ABSENT`        |
| señal APNs de actualización   | `passTypeIdentifier + serialNumber + pass_version_or_data_hash + destination_ref`           |

Operaciones de lectura como obtener un pase o consultar seriales actualizados no requieren un ledger de deduplicación para evitar un efecto empresarial; conservan semántica de lectura y cache.

Reglas:

1. registrar dos veces exactamente el mismo estado converge en una sola relación de dispositivo/pase;
2. cambiar el push token representa una nueva versión del estado deseado, no reutilización incompatible de una clave anterior;
3. desregistrar repetidamente converge en ausencia sin producir un efecto adicional;
4. una señal APNs repetida para la misma versión no crea una nueva versión del pase;
5. una actualización real del pase usa una nueva versión/hash y puede generar una nueva señal;
6. `If-Modified-Since` y `passesUpdatedSince` no son claves idempotentes de mutación.

Estado técnico observado:

- el web service valida el recurso y usa `upsertDeviceRegistration` para registrar;
- elimina la relación exacta al desregistrar;
- `updatePassRecordIfChanged` evita actualizar la versión del pase cuando el hash de datos no cambió;
- se observa convergencia parcial de recurso, pero no se acredita un ledger común de operación/resultados ni un claim durable de cada señal APNs.

Resultado:

`PASSKIT_IDEMPOTENCY_STATE = IMPLEMENTADO_PARCIAL_POR_CONVERGENCIA_DE_RECURSO`

---

#### 13. Zebra BrowserPrint — `EXT-SYS-011`

Se fija `ZEBRA-PRINT-IDEMPOTENCY-001`:

```text
operation_kind        = PRINT_LABEL
operation_key         = print_job_id + printer_uid + normalized_zpl_hash + print_generation
logical_content_hash  = normalized_zpl_hash + documento/plantilla/version + datos lógicos
retry_rule             = una incertidumbre de envío no habilita una segunda impresión ciega
explicit_reprint       = nueva print_generation con razón y actor aplicables
```

Reglas:

1. un callback de “enviado” no demuestra por sí solo impresión física;
2. `OUTCOME_UNKNOWN` se conserva hasta evidencia o decisión de reimpresión;
3. un retry técnico del mismo job no crea una segunda etiqueta;
4. una reimpresión voluntaria es una operación nueva y trazable;
5. la implementación física posterior debe conservar el contrato aprobado por `PRINT-ARC-010`.

Estado técnico observado:

- NEXO mantiene una cola local de datos y genera ZPL;
- la impresión usa directamente `device.send(zpl, success, error)` de BrowserPrint;
- no se observa `print_job_id` durable, claim previo, resultado recuperable ni gate contra doble clic/concurrencia;
- el estado visible “Impresión enviada” acredita envío al adaptador, no impresión física.

Resultado:

`ZEBRA_PRINT_IDEMPOTENCY_STATE = NO_IMPLEMENTADO`

---

#### 14. Superficies sin deduplicación durable de efecto

##### 14.1. Sentry — `EXT-SYS-007`

La telemetría puede contener observaciones repetidas legítimas y no es fuente del hecho empresarial. Esta tarea no deduplica errores por usuario, mensaje, stack o ventana temporal porque esa aproximación podría borrar evidencia distinta.

Decisión:

`SENTRY_IDEMPOTENCY_DECISION = SIN_DEDUP_DURABLE_POR_NO_HABER_EFECTO_EMPRESARIAL`

La política de agrupación, sampling o cardinalidad del proveedor no se convierte en idempotencia empresarial VENTO.

##### 14.2. Google Maps / Google Reviews — `EXT-SYS-008`

El binding observado de búsqueda/detalle es request/response de lectura. Repetir una consulta no produce una mutación empresarial ni un efecto físico que necesite ledger idempotente.

Decisión:

`GOOGLE_MAPS_IDEMPOTENCY_DECISION = SIN_DEDUP_DURABLE_POR_NO_HABER_EFECTO_EMPRESARIAL`

Cache, cuota y rate limiting pueden existir, pero no se presentan como deduplicación de efecto y pertenecen a sus contratos técnicos correspondientes.

---

#### 15. Supabase — `EXT-SYS-001`

Supabase permanece inventariado como plataforma externa utilizada por VENTO, pero las operaciones observadas pertenecen a contratos internos de Auth, RPC, base de datos, Storage, Realtime y Edge Functions y no forman una única frontera externa homogénea.

Decisión:

`SUPABASE_IDEMPOTENCY_DECISION = GOBERNADA_POR_CONTRATO_INTERNO_VENTO`

Reglas:

1. no se crea una “clave Supabase” universal;
2. cada operación interna conserva el contrato idempotente de su dominio, recurso y RPC;
3. el uso físico de Supabase no convierte a la plataforma en propietaria del efecto empresarial;
4. las futuras materializaciones compartidas deberán converger con `SHELL-CON-023` y las arquitecturas E3/E4 aplicables.

---

#### 16. `VENTO-EXTERNAL-IDEMPOTENCY-MATRIX-001`

| ID            | Sistema / plataforma                     | Clasificación primaria                              | Alcance idempotente materializado                                                                    | Estado técnico actual                              | Decisión / bloqueo                                                                                                                                                      |
| ------------- | ---------------------------------------- | --------------------------------------------------- | ---------------------------------------------------------------------------------------------------- | -------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `EXT-SYS-001` | Supabase                                 | `GOBERNADA_POR_CONTRATO_INTERNO_VENTO`              | por operación propietaria, RPC o frontera interna; no existe clave global de plataforma              | `SEGUN_CONTRATO_PROPIETARIO`                       | no se inventa una política única para Auth, DB, Storage, Realtime y Edge                                                                                                |
| `EXT-SYS-002` | Wompi                                    | `IDEMPOTENCIA_DE_EFECTO_REQUERIDA`                  | checkout por `idempotency_key`; webhook por proveedor+ambiente+`provider_event_id` y hash            | `IMPLEMENTADO_PARCIAL_NO_ATOMICO`                  | unicidades existen, pero el claim del webhook no precede atómicamente al efecto y hay fallback aleatorio de event ID                                                    |
| `EXT-SYS-003` | RevenueCat                               | `IDEMPOTENCIA_DE_EFECTO_REQUERIDA`                  | `RC-FP-v1` mientras no exista ID nativo acreditado; claim previo a suscripción/entitlement/auditoría | `NO_IMPLEMENTADO`                                  | invocaciones repetidas pueden insertar suscripciones y auditorías duplicadas                                                                                            |
| `EXT-SYS-004` | Resend                                   | `IDEMPOTENCIA_DE_EFECTO_REQUERIDA`                  | invitación + generación de entrega + canal                                                           | `IMPLEMENTADO_PARCIAL_WORKFLOW_SIN_CLAIM_DE_ENVIO` | estado/reenvío existen, pero no se acredita claim durable alrededor del POST externo                                                                                    |
| `EXT-SYS-005` | Expo / EAS Update                        | `NO_APLICA_EN_CORTE`                                | ninguno                                                                                              | `SIN_CONTRATO_IO_ACREDITADO_ACTUAL`                | no existe binding de API administrativa que permita instanciar una operación idempotente                                                                                |
| `EXT-SYS-006` | Expo Push Service                        | `IDEMPOTENCIA_DE_EFECTO_REQUERIDA`                  | anuncio + destino + generación                                                                       | `NO_IMPLEMENTADO`                                  | envío por lotes directo, sin claim por destino ni resultado durable recuperable                                                                                         |
| `EXT-SYS-007` | Sentry                                   | `SIN_DEDUP_DURABLE_POR_NO_HABER_EFECTO_EMPRESARIAL` | no aplica ledger de efecto empresarial                                                               | `NO_APLICA_EFECTO_EMPRESARIAL`                     | observaciones repetidas pueden ser evidencia distinta; grouping del proveedor no sustituye este contrato                                                                |
| `EXT-SYS-008` | Google Maps / Google Reviews             | `SIN_DEDUP_DURABLE_POR_NO_HABER_EFECTO_EMPRESARIAL` | consultas read-only observadas                                                                       | `LECTURA_REPETIBLE`                                | repetir autocomplete/details no muta un hecho VENTO; cache no se confunde con idempotencia                                                                              |
| `EXT-SYS-009` | Apple Wallet / PassKit y APNs            | `IDEMPOTENCIA_DE_EFECTO_REQUERIDA`                  | registro/desregistro por recurso y estado deseado; señal por versión de pase+destino                 | `IMPLEMENTADO_PARCIAL_POR_CONVERGENCIA_DE_RECURSO` | upsert/delete/hash evitan parte de la repetición, pero no se acredita ledger común de operaciones y resultados                                                          |
| `EXT-SYS-010` | Vercel                                   | `NO_APLICA_EN_CORTE`                                | ninguno                                                                                              | `SIN_CONTRATO_IO_ACREDITADO_ACTUAL`                | hosting/configuración no acreditan una API administrativa de efecto para esta tarea                                                                                     |
| `EXT-SYS-011` | Zebra BrowserPrint                       | `IDEMPOTENCIA_DE_EFECTO_REQUERIDA`                  | trabajo de impresión + impresora + hash ZPL + generación                                             | `NO_IMPLEMENTADO`                                  | `device.send` puede ejecutarse otra vez sin claim durable; `PRINT-ARC-010` conserva la prevención canónica de duplicados                                                |
| `EXT-SYS-012` | Google Wallet / Google Pay & Wallet      | `NO_APLICA_EN_CORTE`                                | ninguno                                                                                              | `MODELO_DOCUMENTADO_SIN_BINDING_REMOTO`            | existe modelo de payload, no binding remoto acreditado que permita afirmar un efecto idempotente actual                                                                 |
| `EXT-SYS-013` | POS externo vigente                      | `BLOQUEADA_SIN_BINDING`                             | no instanciable                                                                                      | `BLOQUEADO`                                        | `INT-POS-001` debe acreditar proveedor, endpoints, IDs, callbacks y semántica antes de definir la clave concreta                                                        |
| `EXT-SYS-014` | Shopify / comercio electrónico           | `NO_APLICA_EN_CORTE`                                | ninguno                                                                                              | `SIN_BINDING_ACREDITADO_ACTUAL`                    | no se inventa idempotencia para una integración no materializada                                                                                                        |
| `EXT-SYS-015` | Rappi / marketplace                      | `NO_APLICA_EN_CORTE`                                | ninguno                                                                                              | `SIN_BINDING_ACREDITADO_ACTUAL`                    | no se inventa idempotencia para una integración no materializada                                                                                                        |
| `EXT-SYS-016` | ManyChat / automatización conversacional | `NO_APLICA_EN_CORTE`                                | ninguno                                                                                              | `SIN_BINDING_ACREDITADO_ACTUAL`                    | no se inventa idempotencia para una integración no materializada                                                                                                        |
| `EXT-SYS-017` | WhatsApp                                 | `NO_APLICA_EN_CORTE`                                | ninguno                                                                                              | `SIN_BINDING_ACREDITADO_ACTUAL`                    | no se inventa idempotencia para una integración no materializada                                                                                                        |
| `EXT-SYS-018` | Instagram / social                       | `NO_APLICA_EN_CORTE`                                | ninguno                                                                                              | `SIN_BINDING_ACREDITADO_ACTUAL`                    | no se inventa idempotencia para una integración no materializada                                                                                                        |
| `EXT-SYS-019` | Correo corporativo y alias funcionales   | `NO_APLICA_EN_CORTE`                                | ninguno                                                                                              | `SIN_BINDING_ACREDITADO_ACTUAL`                    | la existencia de correo/alias no acredita API o efecto automatizado gobernado por esta frontera                                                                         |
| `EXT-SYS-020` | Telefonía / voz                          | `BLOQUEADA_SIN_BINDING`                             | no instanciable                                                                                      | `BLOQUEADO`                                        | `TI-INT-003` conserva la frontera para proveedor tecnológico/operador; se requiere operador, interfaz, identidad y payload acreditados antes de instanciar idempotencia |
| `EXT-SYS-021` | Transporte externo                       | `NO_APLICA_EN_CORTE`                                | ninguno                                                                                              | `SIN_BINDING_ACREDITADO_ACTUAL`                    | no se inventa proveedor, endpoint, orden externa ni clave                                                                                                               |

Reconciliación de cobertura:

```text
IDEMPOTENCIA_DE_EFECTO_REQUERIDA = 002,003,004,006,009,011 = 6
SIN_DEDUP_DURABLE_POR_NO_HABER_EFECTO_EMPRESARIAL = 007,008 = 2
GOBERNADA_POR_CONTRATO_INTERNO_VENTO = 001 = 1
NO_APLICA_EN_CORTE = 005,010,012,014,015,016,017,018,019,021 = 10
BLOQUEADA_SIN_BINDING = 013,020 = 2
TOTAL = 21
```

---

#### 17. Reglas por tipo de efecto

##### 17.1. Entrada externa que muta estado interno

Orden obligatorio:

```text
AUTENTICAR ENTRADA
→ RESOLVER IDENTIDAD IDEMPOTENTE
→ CALCULAR HASH LÓGICO
→ RECLAMAR DURABLEMENTE
→ DETERMINAR NUEVA / DUPLICADA / CONFLICTIVA
→ APLICAR EFECTO SOLO SI ES NUEVA
→ PERSISTIR RESULTADO
```

La deduplicación no se ejecuta antes de autenticidad para permitir que una entrada falsa aprenda o bloquee claves válidas.

##### 17.2. Salida a proveedor

Orden conceptual:

```text
RESOLVER OPERACIÓN
→ CREAR/RECUPERAR CLAIM
→ VALIDAR HASH
→ SI SUCCEEDED: DEVOLVER RESULTADO
→ SI OUTCOME_UNKNOWN: NO DUPLICAR CIEGAMENTE
→ SI NUEVA: LLAMAR PROVEEDOR
→ PERSISTIR REFERENCIA Y RESULTADO
```

##### 17.3. Efecto físico

Una impresión, apertura, activación o efecto físico no se considera seguro para retry solo porque la llamada técnica falló o perdió el callback. La evidencia de ejecución y la reimpresión autorizada conservan operación distinta.

##### 17.4. Lecturas

Una consulta read-only no necesita por defecto un ledger idempotente. Puede tener cache, rate limit o memoización sin cambiar su clasificación.

---

#### 18. Cambios de contenido bajo la misma clave

`IDEMPOTENCY_KEY_REUSE_CONFLICT` se aplica cuando una clave previamente reclamada reaparece con significado lógico distinto.

Ejemplos que deben fallar:

- misma clave de pago con monto distinto;
- misma clave de pago con moneda distinta;
- misma generación de correo con destinatario o plantilla lógica distinta;
- mismo job de impresión con ZPL lógico distinto;
- mismo identificador nativo de evento con payload lógico incompatible;
- misma clave de push con destinatario distinto.

No se corrige el conflicto sobrescribiendo silenciosamente el hash anterior.

---

#### 19. Identidad derivada y prohibición de claves débiles

Cuando el proveedor no entregue una identidad estable acreditada, una clave derivada solo podrá usarse cuando:

1. el conjunto de campos esté versionado;
2. la canonicalización sea determinista;
3. arrays y conjuntos se normalicen de manera explícita;
4. `null`, ausencia y string vacío no se intercambien silenciosamente;
5. timezone y unidades temporales estén definidos;
6. el hash use un algoritmo criptográfico aprobado por la implementación;
7. el riesgo residual de no disponer de un ID nativo quede visible.

No son claves suficientes por sí solas:

- `Date.now()`;
- UUID generado al recibir un evento no identificado;
- email;
- teléfono;
- `app_user_id`;
- `site_id`;
- status;
- nombre de producto;
- IP;
- índice del elemento dentro de un lote.

---

#### 20. Handoffs y fronteras exactas

| Trabajo derivado                                                              | Estado                    | Propietario / tarea responsable | Condición de salida                                                                                      |
| ----------------------------------------------------------------------------- | ------------------------- | ------------------------------- | -------------------------------------------------------------------------------------------------------- |
| Materializar contrato compartido de idempotencia y conciliación               | `FUERA_DE_ALCANCE`        | `SHELL-CON-023`                 | existe tipo/contrato consumible para clave, hash, estado, resultado y conflicto sin exponer secretos     |
| Resolver mapeo de IDs externos y canónicos                                    | `FUERA_DE_ALCANCE`        | `INT-EXT-013`                   | una clave idempotente no se usa como sustituto del mapping de recursos                                   |
| Conservar payload original protegido                                          | `FUERA_DE_ALCANCE`        | `INT-EXT-014`                   | evidencia original puede correlacionarse con la operación sin convertir payload completo en clave        |
| Definir política de retry/backoff y límites                                   | `FUERA_DE_ALCANCE`        | `INT-EXT-015`                   | retry conserva la misma operación y no crea un efecto nuevo                                              |
| Definir cuarentena o dead-letter                                              | `FUERA_DE_ALCANCE`        | `INT-EXT-016`                   | conflictos, identidad insuficiente y entradas no procesables tienen disposición explícita                |
| Definir auditoría, métricas, alertas y conciliación                           | `FUERA_DE_ALCANCE`        | `INT-EXT-017`                   | `OUTCOME_UNKNOWN`, duplicados y resultados finales quedan reconstruibles y conciliables                  |
| Materializar prevención de impresión duplicada en la arquitectura transversal | `FUERA_DE_ALCANCE`        | `PRINT-ARC-010`                 | trabajo de impresión usa identidad estable y evita reimpresión accidental                                |
| Acreditar binding del POS vigente                                             | `BLOQUEADO_POR_EVIDENCIA` | `INT-POS-001`                   | proveedor, endpoints, eventos, IDs y operaciones permiten instanciar el contrato                         |
| Acreditar proveedor tecnológico/operador para telefonía o voz                 | `BLOQUEADO_POR_EVIDENCIA` | `TI-INT-003`                    | operador/proveedor, interfaz, credencial, dirección, payload y semántica de operación quedan acreditados |

Ningún handoff autoriza implementación física durante `INT-EXT-012`.

---

#### 21. Fronteras reservadas a `INT-EXT-013` a `INT-EXT-020`

| Materia                                                     | Tarea propietaria |
| ----------------------------------------------------------- | ----------------- |
| mapeo de identificadores externos/canónicos                 | `INT-EXT-013`     |
| conservación controlada del payload original                | `INT-EXT-014`     |
| rate limits, retry, backoff y circuit breaker               | `INT-EXT-015`     |
| cuarentena o dead-letter                                    | `INT-EXT-016`     |
| auditoría, métricas, alertas y conciliación                 | `INT-EXT-017`     |
| contingencia ante indisponibilidad del proveedor            | `INT-EXT-018`     |
| retiro de integración y revocación de credenciales          | `INT-EXT-019`     |
| prohibición de credenciales compartidas entre integraciones | `INT-EXT-020`     |

Esta tarea define identidad y deduplicación; no absorbe las responsabilidades posteriores.

---

#### 22. Prohibiciones

Queda prohibido:

1. llamar idempotencia a un simple `SELECT` previo sin reclamación exclusiva;
2. considerar que una restricción `UNIQUE` basta cuando el efecto puede ocurrir antes del insert/claim;
3. generar un UUID nuevo para cada redelivery y presentarlo como deduplicación;
4. usar timestamp de recepción como identidad de evento;
5. usar email, teléfono, usuario o sede aislados como clave idempotente;
6. reutilizar una clave con contenido lógico diferente;
7. mezclar claves entre development, staging y producción;
8. tratar firma válida como prueba de que la operación es nueva;
9. tratar una redelivery legítima como autorización para repetir el efecto;
10. tratar retry técnico y reenvío/reimpresión voluntarios como la misma intención;
11. reintentar ciegamente un efecto en estado `OUTCOME_UNKNOWN`;
12. considerar un `upsert` de proyección como deduplicación del evento que lo originó;
13. considerar un callback de envío a impresora como evidencia de impresión física;
14. deduplicar telemetría Sentry por semejanza semántica y perder observaciones distintas;
15. convertir cache de Google Maps en ledger idempotente empresarial;
16. inventar IDs nativos de RevenueCat no acreditados por el contrato observado;
17. inventar idempotencia para Expo/EAS, Vercel, Google Wallet remoto o sistemas sin binding;
18. modificar código o Supabase durante esta tarea;
19. crear tablas, índices, RPC, colas o locks durante esta tarea;
20. adelantar mapping de `INT-EXT-013`;
21. adelantar retención de `INT-EXT-014`;
22. adelantar retry/backoff de `INT-EXT-015`;
23. adelantar cuarentena de `INT-EXT-016`;
24. adelantar conciliación operativa de `INT-EXT-017`;
25. cambiar las veintiuna identidades heredadas;
26. iniciar `INT-EXT-013`.

---

#### 23. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa por identidad externa comportamientos ya protegidos por el registro vigente: clave estable antes del primer efecto, hash de contenido lógico, resultado recuperable, rechazo de reutilización incompatible, claim o locking equivalente, deduplicación de redeliveries, ausencia de doble efecto y convergencia específica del flujo de pagos. No introduce una familia verificable nueva, no cambia la severidad ni el alcance de las pruebas existentes y no declara ningún control ya satisfecho. Las diferencias encontradas se conservan como estados técnicos y handoffs de implementación bajo tareas ya existentes.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

El registro canónico de requisitos permanece sin cambios.

---

#### 24. Criterios de aceptación

`INT-EXT-012` queda documentalmente completa cuando se cumplen simultáneamente:

1. se preservan exactamente `EXT-SYS-001` a `EXT-SYS-021`;
2. existen exactamente 21 decisiones primarias;
3. faltantes = 0;
4. duplicados = 0;
5. identificadores únicos = 21;
6. la distribución es exactamente `6 IDEMPOTENCIA_DE_EFECTO_REQUERIDA + 2 SIN_DEDUP_DURABLE_POR_NO_HABER_EFECTO_EMPRESARIAL + 1 GOBERNADA_POR_CONTRATO_INTERNO_VENTO + 10 NO_APLICA_EN_CORTE + 2 BLOQUEADA_SIN_BINDING = 21`;
7. toda operación con efecto tiene clave estable antes del primer efecto;
8. toda clave protegida tiene hash lógico determinista;
9. misma clave y mismo hash no producen más de un efecto;
10. misma clave y hash diferente producen conflicto;
11. los namespaces incluyen sistema, ambiente, superficie y operación;
12. retry de la misma operación conserva la misma clave;
13. repetición intencional usa nueva generación/operación;
14. `OUTCOME_UNKNOWN` no habilita efecto ciego;
15. Wompi conserva `payments.transactions.idempotency_key` como identidad del checkout;
16. Wompi no regenera silenciosamente un resultado distinto para un retry del mismo checkout;
17. Wompi webhook exige identidad estable de evento y elimina el fallback aleatorio del contrato objetivo;
18. Wompi reclama el evento antes del efecto en el contrato objetivo;
19. RevenueCat usa fingerprint derivado versionado solo mientras no exista ID nativo acreditado;
20. RevenueCat adquiere claim antes de suscripción, entitlement y auditoría en el contrato objetivo;
21. Resend distingue retry de reenvío explícito mediante generación;
22. Expo Push deduplica por anuncio, destino y generación;
23. PassKit distingue mutación de recurso de lecturas/cache;
24. Zebra distingue retry de reimpresión explícita y conserva resultado desconocido;
25. Sentry no pierde evidencia por una deduplicación empresarial inventada;
26. Google Maps no recibe ledger idempotente innecesario para lectura;
27. Supabase no recibe una clave global de plataforma;
28. POS externo conserva bloqueo hasta `INT-POS-001`;
29. telefonía/voz conserva bloqueo hasta la acreditación de proveedor/interfaz vinculada a `TI-INT-003`;
30. la implementación Zebra conserva `PRINT-ARC-010`;
31. `SHELL-CON-023` conserva la materialización compartida posterior;
32. no se modifica código;
33. no se modifica Supabase;
34. no se crean ni modifican requisitos de prueba;
35. `INT-EXT-013` permanece reservada.

---

#### 25. Resultado de la tarea

`INT-EXT-012` queda **APROBADA** como definición documental completa de idempotencia y deduplicación por sistema externo.

Resultado consolidado:

- identidades materializadas: **21/21**;
- idempotencia de efecto requerida: **6**;
- superficies sin ledger durable por ausencia de efecto empresarial: **2**;
- plataforma gobernada por contrato interno: **1**;
- no aplica en el corte: **10**;
- bloqueadas sin binding: **2**;
- faltantes: **0**;
- duplicados: **0**;
- runtimes declarados totalmente conformes por esta tarea: **0**;
- cambios físicos: **0**;
- requisitos creados o modificados: **0**.

Invariante final:

```text
UNA OPERACIÓN LÓGICA
+
UNA IDENTIDAD IDEMPOTENTE ESTABLE
+
UN HASH LÓGICO COMPATIBLE
+
UN CLAIM DURABLE
=
COMO MÁXIMO UN EFECTO
+
UN RESULTADO RECUPERABLE
```

---

ÚLTIMA TAREA APROBADA

`INT-EXT-011 — Definir validación de firma, origen, timestamp y replay`

TAREA ACTUAL APROBADA

`INT-EXT-012 — Definir idempotencia y deduplicación por sistema externo`

SIGUIENTE TAREA RESERVADA

`INT-EXT-013 — Definir mapeo de identificadores externos y canónicos`


### ✅ INT-EXT-013 — Definir mapeo de identificadores externos y canónicos

**Estado:** APROBADA
**Tarea anterior:** `INT-EXT-012 — Definir idempotencia y deduplicación por sistema externo` — APROBADA
**Tarea siguiente:** `INT-EXT-014 — Definir conservación controlada del payload original` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materializada del mapeo entre identificadores externos, identificadores canónicos VENTO, referencias técnicas, claves de correlación e identificadores propagados para las integraciones `EXT-SYS-001` a `EXT-SYS-021`, preservando identidad, contrato I/O, autenticidad e idempotencia ya aprobados, sin modificar código, Supabase, proveedores, datos, endpoints ni configuración remota
**Bloque:** X — Integraciones
**Mini-bloque:** Integraciones externas y credenciales
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/02_INTEGRACIONES_EXTERNAS_Y_CREDENCIALES.md`
**Implementación física autorizada:** ninguna
**Cambios de código, DDL, DML, migraciones, RLS, RPC, Edge Functions, contratos ejecutables, secretos, credenciales, cuentas externas, endpoints, despliegues o datos:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir cómo VENTO relaciona identificadores emitidos, administrados o utilizados por sistemas externos con los recursos canónicos internos sin asumir equivalencia por coincidencia de texto, UUID, correo, teléfono, nombre, coordenadas, alias, referencia, token o posición dentro de un payload.

La tarea separa obligatoriamente:

```text
IDENTIFICADOR EXTERNO
≠
IDENTIFICADOR CANÓNICO VENTO
≠
IDENTIFICADOR CANÓNICO PROPAGADO AL TERCERO
≠
REFERENCIA TÉCNICA DE ENRUTAMIENTO
≠
CLAVE IDEMPOTENTE
≠
ATRIBUTO DE BÚSQUEDA O PRESENTACIÓN
≠
CREDENCIAL
```

El mapeo permite determinar qué recurso VENTO corresponde a una referencia externa cuando esa relación existe y está acreditada. No concede autorización empresarial, no sustituye autenticidad, no deduplica por sí solo una operación y no convierte al proveedor en fuente de verdad interna.

---

#### 2. Resultado sustantivo

Se aprueban dos artefactos documentales internos:

1. `VENTO-EXTERNAL-ID-MAPPING-CONTRACT-001`, contrato común de identidad externa, identidad canónica y estado de resolución.
2. `VENTO-EXTERNAL-ID-MAPPING-MATRIX-001`, decisión materializada para las veintiuna identidades externas heredadas.

Balance:

| Control                                                       |    Resultado |
| ------------------------------------------------------------- | -----------: |
| Identidades esperadas                                         |       **21** |
| Identidades materializadas                                    | **21 de 21** |
| Identificadores `EXT-SYS-*` únicos                            |       **21** |
| Identidades faltantes                                         |        **0** |
| Identidades duplicadas                                        |        **0** |
| `MAPEO_CANONICO_PARCIALMENTE_ACREDITADO`                      |        **4** |
| `MAPEO_CANONICO_REQUERIDO_SIN_VINCULO_PERSISTENTE_ACREDITADO` |        **1** |
| `REFERENCIA_EXTERNA_TRANSITORIA_SIN_MAPEO_CANONICO`           |        **1** |
| `SIN_IDENTIFICADOR_EXTERNO_PERSISTIDO_ACREDITADO`             |        **2** |
| `REFERENCIA_DE_PLATAFORMA_SIN_MAPEO_EMPRESARIAL`              |        **3** |
| `MODELO_DE_IDENTIFICADOR_SIN_BINDING_REMOTO`                  |        **1** |
| `NO_APLICA_SIN_BINDING`                                       |        **7** |
| `BLOQUEADA_SIN_BINDING`                                       |        **2** |
| Cambios físicos                                               |        **0** |
| Requisitos de prueba creados o modificados                    |        **0** |

Reconciliación:

```text
4 + 1 + 1 + 2 + 3 + 1 + 7 + 2 = 21
```

La clasificación describe el estado de resolución documental y la evidencia técnica actual. No declara conformidad física completa de ningún registro compartido de mapeo.

---

#### 3. Entradas canónicas preservadas

La tarea consume y conserva sin redefinir:

- `VENTO-EXTERNAL-SYSTEM-INVENTORY-001` y sus veintiuna identidades `EXT-SYS-001` a `EXT-SYS-021`;
- la separación entre actor humano, `IntegrationPrincipal`, cuenta externa, credencial, endpoint y autoridad empresarial aprobada en `INT-EXT-002` a `INT-EXT-008`;
- `VENTO-EXTERNAL-IO-CONTRACT-001` y su regla de que un campo externo permanece externo hasta que exista correspondencia acreditada;
- las estrategias de transporte aprobadas en `INT-EXT-010`;
- los perfiles de autenticidad, origen, timestamp y replay de `INT-EXT-011`;
- `VENTO-EXTERNAL-IDEMPOTENCY-CONTRACT-001` de `INT-EXT-012`, incluida la prohibición de usar una clave idempotente como sustituto del mapeo del recurso;
- la cobertura vigente que exige coherencia de ambiente y contrato, separación de identidades, correlación, equivalencia demostrable antes de mapear material legacy y conservación del identificador externo antes de producir un hecho interno;
- `SHELL-CON-022` como destino del contrato compartido consumible de mapeo de identificadores externos;
- `SHELL-CON-019` como destino del contrato compartido de evento externo recibido;
- `SHELL-CON-023` como contrato separado de idempotencia y conciliación;
- la propiedad de cada dominio VENTO sobre sus identificadores canónicos.

Ninguna relación definida aquí altera el dueño del hecho, la autoridad empresarial ni los contratos de origen.

---

#### 4. Vocabulario canónico de identificadores

`VENTO-EXTERNAL-ID-MAPPING-CONTRACT-001` distingue las siguientes clases:

| Clase                      | Significado                                                                                                                                             |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `EXTERNAL_OBJECT_ID`       | identificador emitido o administrado por el sistema externo para un objeto, evento, transacción, dispositivo o recurso de su namespace                  |
| `CANONICAL_VENTO_ID`       | identificador propietario de VENTO para el recurso interno canónico                                                                                     |
| `PROPAGATED_CANONICAL_ID`  | identificador canónico VENTO que se envía deliberadamente al tercero y puede regresar posteriormente dentro de un contrato aprobado                     |
| `EXTERNAL_ROUTING_REF`     | referencia externa usada para alcanzar un destino o recurso técnico, sin equivaler por ello a la identidad empresarial del destino                      |
| `IDEMPOTENCY_REF`          | referencia estable que identifica una operación o generación; protege repetición pero no constituye por sí sola identidad del recurso                   |
| `CORRELATION_REF`          | referencia que vincula intercambios o artefactos sin declarar identidad entre los objetos enlazados                                                     |
| `DISPLAY_SEARCH_ATTRIBUTE` | correo, teléfono, nombre, dirección, coordenadas, etiqueta, descripción u otro atributo utilizable para búsqueda o presentación, nunca equivalencia     |
| `TECHNICAL_NAMESPACE_ID`   | identificador técnico de proyecto, clase, pass type, aplicación, tenant, bridge o namespace que delimita una frontera pero no es un recurso empresarial |
| `EXTERNAL_ALIAS`           | alias externo que puede relacionarse con una identidad externa principal, pero no autoriza fusión automática de identidades VENTO                       |
| `MAPPING_RECORD`           | relación versionada y trazable entre una referencia externa tipada y un recurso canónico VENTO cuando la equivalencia o asociación ha sido acreditada   |

La misma cadena de caracteres puede aparecer en más de una clase sin que las clases se fusionen. El significado se determina por contrato, namespace, ambiente, emisor y relación, no por formato.

---

#### 5. `VENTO-EXTERNAL-ID-MAPPING-CONTRACT-001`

Toda correspondencia material entre un identificador externo y un recurso canónico deberá poder representar, como mínimo:

```text
EXTERNAL_SYSTEM_ID
+
AMBIENTE
+
SUPERFICIE / CONTRATO
+
NAMESPACE EXTERNO
+
TIPO DE IDENTIFICADOR EXTERNO
+
VALOR EXTERNO NORMALIZADO
+
TIPO DE RELACIÓN
+
TIPO DE RECURSO CANÓNICO
+
CANONICAL_VENTO_ID
+
ESTADO DE MAPEO
+
VERSIÓN DE CONTRATO
+
EVIDENCIA / PROCEDENCIA
→ RELACIÓN TRAZABLE
```

Campos conceptuales mínimos:

- `external_system_id`;
- `environment`;
- `surface` o contrato que produjo/consume el identificador;
- `external_namespace`;
- `external_id_kind`;
- `external_id_value` normalizado sin reinterpretar su significado;
- `canonical_resource_type`;
- `canonical_id`;
- `relation_kind`;
- `mapping_state`;
- `contract_version`;
- referencia de evidencia o procedencia;
- `valid_from` cuando la vigencia sea material;
- `retired_at` cuando una relación haya sido sustituida o retirada;
- referencia de predecesor/sucesor cuando una relación cambie de forma controlada;
- correlación con el evento, operación o intercambio que acreditó la relación cuando corresponda.

La definición no prescribe tabla, índice, RPC, base de datos o tecnología física.

---

#### 6. Tipos de relación permitidos

La relación entre una referencia externa y VENTO deberá declarar explícitamente uno de estos significados o un sucesor versionado igualmente inequívoco:

| Tipo de relación                | Semántica                                                                                                                      |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| `EXTERNAL_TO_CANONICAL`         | un identificador de objeto del proveedor se asocia con un recurso canónico VENTO                                               |
| `CANONICAL_PROPAGATED_EXTERNAL` | VENTO entregó su ID canónico al tercero y el tercero lo devolvió como correlación; el ID sigue siendo de VENTO                 |
| `EXTERNAL_ROUTE_TO_OWNER`       | una referencia de destino externa se vincula con el registro técnico y propietario canónico que la administra                  |
| `EXTERNAL_EVENT_TO_RECEIPT`     | un identificador de evento externo se vincula con el registro interno de recepción, no con el hecho empresarial como identidad |
| `EXTERNAL_NAMESPACE_BINDING`    | un namespace, class, pass type, project o identificador técnico se vincula con una frontera VENTO sin equivalencia empresarial |
| `CORRELATION_ONLY`              | dos referencias se relacionan para reconstrucción o búsqueda, pero no representan el mismo objeto                              |
| `NO_EQUIVALENCE`                | la referencia se conserva deliberadamente sin declarar identidad canónica                                                      |

Una relación `CORRELATION_ONLY` no puede reutilizarse como `EXTERNAL_TO_CANONICAL` sin una nueva decisión acreditada.

---

#### 7. Estados de resolución

Toda relación o intento de resolución queda en uno de estos estados conceptuales:

| Estado               | Significado                                                                                                                                  |
| -------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| `RESOLVED`           | existe una relación única y acreditada para el namespace, ambiente y contrato aplicables                                                     |
| `PARTIALLY_RESOLVED` | existen relaciones acreditadas para una parte de los identificadores de la superficie, pero otras permanecen no resueltas o sin persistencia |
| `UNRESOLVED`         | existe referencia externa, pero no hay evidencia suficiente para vincularla a un recurso canónico                                            |
| `AMBIGUOUS`          | más de un candidato canónico cumple parcialmente los criterios y no existe evidencia para elegir uno                                         |
| `CONFLICT`           | la referencia ya está vinculada de forma incompatible o la nueva evidencia contradice una relación vigente                                   |
| `RETIRED`            | una relación histórica dejó de estar activa, conservando trazabilidad                                                                        |
| `NOT_APPLICABLE`     | el intercambio no requiere relación entre un identificador externo y un recurso canónico VENTO en el corte actual                            |
| `BLOCKED`            | no existe proveedor, binding, namespace o contrato suficiente para materializar una decisión concreta                                        |

`UNRESOLVED`, `AMBIGUOUS` y `CONFLICT` no pueden degradarse silenciosamente a `RESOLVED` mediante coincidencia de nombre o valor.

---

#### 8. Reglas de namespace, cardinalidad y unicidad

1. El namespace mínimo de resolución incluye `external_system_id + environment + surface + external_namespace + external_id_kind`.
2. Un identificador externo no se considera globalmente único fuera de su namespace acreditado.
3. La misma cadena puede existir en dos proveedores, ambientes o tipos sin crear colisión canónica.
4. Para una relación de identidad exacta, una referencia externa activa resuelve como máximo a un recurso canónico dentro de su namespace.
5. Varias referencias externas pueden apuntar al mismo recurso canónico cuando el contrato lo permita y cada relación esté tipada, por ejemplo varios destinos técnicos de una persona o recurso.
6. Una referencia técnica con cardinalidad naturalmente múltiple no se convierte en identidad exacta del propietario; un push token puede pertenecer a un registro de destino administrado por un trabajador sin ser el trabajador.
7. Una relación many-to-many solo puede existir cuando el contrato propietario la defina expresamente; nunca se infiere por datos repetidos.
8. La resolución inversa desde ID canónico hacia proveedor no se presume única si existen varios bindings o instancias.
9. La misma referencia no cruza `DEVELOPMENT`, `STAGING` y `PRODUCTION` por conveniencia.
10. La baja o sustitución de un identificador externo conserva historia; no se sobrescribe una relación pasada para hacer parecer que siempre apuntó al recurso nuevo.

---

#### 9. Prohibición de equivalencia por coincidencia

No constituyen prueba suficiente de identidad o mapeo:

- mismo UUID textual sin prueba de que VENTO lo propagó al tercero;
- mismo correo;
- mismo teléfono;
- mismo nombre o razón social;
- mismo `display_name`;
- misma dirección;
- mismas coordenadas;
- mismo alias;
- mismo `status`;
- mismo monto o moneda;
- mismo timestamp;
- misma IP;
- mismo nombre de producto;
- mismo UID visible sin namespace;
- misma referencia encontrada en otra integración;
- parecido estructural del payload.

Cuando alguno de esos atributos participe como evidencia auxiliar, la relación deberá seguir soportada por un identificador o vínculo contractual suficientemente fuerte y por el propietario del recurso.

---

#### 10. Identificador canónico propagado

VENTO puede enviar un `CANONICAL_VENTO_ID` a un tercero para facilitar correlación. Cuando ese valor regresa, se clasifica `PROPAGATED_CANONICAL_ID`, no `EXTERNAL_OBJECT_ID`.

Reglas:

1. el valor debe validarse contra el tipo de recurso esperado;
2. debe pertenecer al ambiente correcto;
3. debe pertenecer al contrato y propietario esperados;
4. su mera forma UUID no demuestra que haya sido emitido por VENTO;
5. el proveedor no adquiere propiedad del ID por devolverlo;
6. si el valor contradice otro identificador externo autenticado del mismo intercambio, la relación queda `CONFLICT` y no se elige silenciosamente uno;
7. el ID propagado no sustituye autenticidad de la entrada;
8. el ID propagado no sustituye autorización sobre el recurso resuelto.

---

#### 11. Wompi — `EXT-SYS-002`

Se fijan cuatro planos distintos:

##### 11.1. Transacción externa

```text
Wompi data.transaction.id
→ EXTERNAL_OBJECT_ID
→ payments.transactions.provider_reference
→ payments.transactions.id como CANONICAL_VENTO_ID
```

La relación es `EXTERNAL_TO_CANONICAL` y queda scoped por proveedor y ambiente.

Reglas:

- un `provider_reference` no se acepta como `order_id`;
- la unicidad de `provider_reference` se interpreta dentro del proveedor acreditado;
- si dos transacciones canónicas reclaman el mismo identificador externo, el estado es `CONFLICT`;
- la relación debe conservar el identificador externo aunque el estado de pago cambie.

##### 11.2. Referencia de checkout

```text
Wompi reference
↔ payments.transactions.idempotency_key
→ CORRELATION_REF + IDEMPOTENCY_REF
→ resolución hacia payments.transactions.id
```

La `reference` permite localizar la transacción actual, pero no se redefine como identificador canónico de orden o pago. Su función principal sigue siendo operación/correlación.

##### 11.3. ID canónico propagado

Cuando `data.transaction_id` o `data.transaction.metadata.transaction_id` contienen el UUID VENTO que fue propagado por el contrato:

```text
valor recibido
→ PROPAGATED_CANONICAL_ID
→ validar como payments.transactions.id
```

No se clasifica como ID emitido por Wompi.

##### 11.4. Evento externo

```text
payload.id o data.id acreditado como evento
→ EXTERNAL_OBJECT_ID de evento
→ payments.webhook_events.provider_event_id
→ payments.webhook_events.id como receipt interno
```

La relación es `EXTERNAL_EVENT_TO_RECEIPT`. El evento puede correlacionarse con una transacción, pero el event ID no se convierte en transaction ID.

Estado del corte:

`WOMPI_ID_MAPPING_STATE = MAPEO_CANONICO_PARCIALMENTE_ACREDITADO`

Existen relaciones estructuradas, pero la tarea no certifica un registro compartido de mapeo ni corrige las brechas de claim documentadas por `INT-EXT-012`.

---

#### 12. RevenueCat — `EXT-SYS-003`

Se fijan cuatro familias:

##### 12.1. `app_user_id`

PASS configura el SDK enviando el ID del usuario VENTO como `appUserID`. Por tanto:

```text
VENTO auth user id
→ CANONICAL_VENTO_ID
→ se propaga a RevenueCat
→ regresa como app_user_id
→ PROPAGATED_CANONICAL_ID
```

La resolución válida exige verificar que el ID corresponde al usuario esperado dentro del contrato Club/PASS; no se interpreta como ID originalmente emitido por RevenueCat.

##### 12.2. `product_id`

`product_id` es un identificador externo de producto/store. VENTO dispone de la relación estructural, scoped por plataforma/store para evitar equivalencias por coincidencia de código:

```text
platform + store_product_id
→ club.store_products.id
→ club.store_products.plan_id
→ club.plans.id
```

El contrato objetivo exige resolver por ese mapping acreditado cuando el producto determine el plan. Si la plataforma/store necesaria para desambiguar no está disponible en el contexto, el resultado permanece `UNRESOLVED`. La implementación de webhook observada no realiza esta resolución y usa un plan fijo por código.

Estado:

`REVENUECAT_PRODUCT_MAPPING_STATE = UNRESOLVED_EN_WEBHOOK_ACTUAL`

##### 12.3. `original_transaction_id`

Se conserva como `EXTERNAL_OBJECT_ID` de la transacción/suscripción del ecosistema externo. Las fuentes actuales no acreditan una columna estructurada que lo vincule de forma durable con `club.subscriptions.id`.

Estado:

`REVENUECAT_ORIGINAL_TRANSACTION_MAPPING_STATE = UNRESOLVED`

##### 12.4. `aliases`

Los aliases permanecen `EXTERNAL_ALIAS`. No autorizan fusionar dos usuarios VENTO, mover suscripción entre usuarios ni tomar correo/nombre como equivalencia.

Estado consolidado:

`REVENUECAT_ID_MAPPING_STATE = MAPEO_CANONICO_PARCIALMENTE_ACREDITADO`

---

#### 13. Expo Push Service — `EXT-SYS-006`

El push token se clasifica como `EXTERNAL_ROUTING_REF`, no como persona, empleado, sesión o credencial de proveedor.

La relación observada es:

```text
Expo push token
→ employee_push_tokens.token
→ employee_push_tokens.id como registro técnico VENTO
→ employee_push_tokens.employee_id como propietario canónico
```

Tipo de relación:

`EXTERNAL_ROUTE_TO_OWNER`.

Reglas:

1. varios push tokens pueden estar asociados a un mismo trabajador;
2. un token no sustituye `employee_id`;
3. un token inválido puede desactivarse sin eliminar la identidad del trabajador;
4. `announcementId` enviado en el payload es una referencia canónica/correlacional de VENTO cuando existe, no un ID emitido por Expo;
5. la respuesta actualmente consumida no acredita persistencia de un ticket ID de proveedor para mapearlo.

Estado:

`EXPO_PUSH_ID_MAPPING_STATE = MAPEO_CANONICO_PARCIALMENTE_ACREDITADO`

---

#### 14. Google Maps / Google Reviews — `EXT-SYS-008`

`place_id` se clasifica como `EXTERNAL_OBJECT_ID` del namespace Google Places.

La implementación observada lo usa para consulta de detalle y lo devuelve junto con atributos como dirección y coordenadas, pero no persiste una equivalencia con `site_id` ni con otro recurso canónico.

Reglas:

1. `place_id ≠ site_id`;
2. dirección, nombre, latitud y longitud son atributos, no prueba de identidad;
3. el campo `site_id` aceptado por el tipo de entrada actual no se utiliza para resolver ni persistir el `place_id`;
4. una selección de lugar puede permanecer como referencia externa transitoria si el flujo no necesita una identidad canónica persistente;
5. si un proceso propietario decide asociar durablemente un `place_id` con una sede, dirección u otro recurso VENTO, deberá existir un `MAPPING_RECORD` explícito antes de usar esa relación como identidad.

Estado:

`GOOGLE_PLACES_ID_MAPPING_STATE = REFERENCIA_EXTERNA_TRANSITORIA_SIN_MAPEO_CANONICO`

---

#### 15. Apple Wallet / PassKit + APNs — `EXT-SYS-009`

La familia contiene identificadores con naturalezas distintas:

| Identificador                   | Clase                                                                                | Relación canónica                                              |
| ------------------------------- | ------------------------------------------------------------------------------------ | -------------------------------------------------------------- |
| `serialNumber`                  | identificador del recurso de pase administrado por VENTO y expuesto mediante PassKit | resuelve el registro `wallet_passes` y su `user_id`            |
| `passTypeIdentifier`            | `TECHNICAL_NAMESPACE_ID`                                                             | delimita el tipo de pase; no identifica al usuario             |
| `deviceLibraryIdentifier`       | `EXTERNAL_OBJECT_ID` de dispositivo Wallet                                           | resuelve registros de dispositivo/pase; no equivale al usuario |
| `pushToken`                     | `EXTERNAL_ROUTING_REF`                                                               | destino APNs asociado al registro técnico de dispositivo/pase  |
| `user_id` del registro del pase | `CANONICAL_VENTO_ID`                                                                 | propietario canónico del pase                                  |

Reglas:

1. `serialNumber` no se sustituye por `user_id` aunque el pase pertenezca a un usuario;
2. `deviceLibraryIdentifier` no se utiliza como ID de persona;
3. `pushToken` no se utiliza como ID de dispositivo canónico ni como identidad de cliente;
4. el namespace incluye `passTypeIdentifier` cuando sea necesario para evitar colisiones de serial;
5. un cambio de push token actualiza el destino técnico, no la identidad del usuario ni del pase;
6. las lecturas por `serialNumber` deben resolver el pase exacto antes de exponer información protegida.

Estado:

`PASSKIT_ID_MAPPING_STATE = MAPEO_CANONICO_PARCIALMENTE_ACREDITADO`

---

#### 16. Zebra BrowserPrint — `EXT-SYS-011`

BrowserPrint expone atributos de dispositivo como `uid`, nombre y tipo. El `uid` se clasifica como identificador técnico local de la superficie BrowserPrint.

Contrato objetivo:

```text
BrowserPrint device.uid
+
namespace / estación / ambiente aplicables
→ MAPPING_RECORD
→ identidad canónica de impresora del servicio transversal de impresión
```

Reglas:

1. el nombre visible de impresora no es suficiente para resolver identidad;
2. el modelo o tipo no es suficiente para resolver identidad;
3. el orden de enumeración de BrowserPrint no es identidad;
4. una impresora detectada localmente no se asigna a una sede o área por proximidad o nombre;
5. antes de que el UID se use como binding durable de enrutamiento, debe vincularse a exactamente una identidad canónica de impresora acreditada por el inventario propietario;
6. cambio de estación, bridge o dispositivo no puede reescribir silenciosamente la identidad canónica anterior.

La evidencia actual acredita selección local por UID, pero no acredita qué identidad concreta del inventario canónico de impresoras corresponde al dispositivo detectado.

Estado:

`ZEBRA_ID_MAPPING_STATE = MAPEO_CANONICO_REQUERIDO_SIN_VINCULO_PERSISTENTE_ACREDITADO`

El inventario y la caracterización física permanecen bajo el servicio transversal de impresión; `SHELL-CON-022` materializará el contrato compartido de relación cuando corresponda.

---

#### 17. Resend — `EXT-SYS-004`

El flujo actual conserva IDs canónicos VENTO de invitación, usuario y empleado, y utiliza el correo como dirección de entrega.

La respuesta del proveedor no se conserva actualmente como un identificador estructurado de mensaje que permita materializar una relación externa→canónica.

Reglas:

1. correo del destinatario = `DISPLAY_SEARCH_ATTRIBUTE` / dirección de entrega, no identidad canónica;
2. `invitation_id` permanece ID canónico VENTO;
3. `user_id` o `employee_id` permanecen IDs canónicos VENTO;
4. no se inventa un provider message ID a partir de timestamp, destinatario o estado de envío;
5. si una versión posterior del contrato captura un identificador de mensaje del proveedor, ese valor deberá vincularse a la generación de entrega correspondiente sin reemplazar la identidad de invitación.

Estado:

`RESEND_ID_MAPPING_STATE = SIN_IDENTIFICADOR_EXTERNO_PERSISTIDO_ACREDITADO`

---

#### 18. Sentry — `EXT-SYS-007`

La superficie observada es telemetría de salida y no constituye una fuente de objetos empresariales VENTO.

Reglas:

1. IDs de evento, issue, release, trace o proyecto que el proveedor pueda producir permanecen referencias técnicas de observabilidad mientras no exista contrato canónico que exija otra relación;
2. usuario, correo, mensaje, stack, pantalla o tag no se utilizan como mapeo de identidad empresarial;
3. grouping del proveedor no fusiona incidentes, personas, procesos ni recursos VENTO;
4. una futura relación con caso tecnológico o evidencia deberá ser correlacional y explícita, no deducida por semejanza.

Las fuentes actuales no acreditan persistencia de un identificador externo Sentry dentro de un registro canónico de VENTO.

Estado:

`SENTRY_ID_MAPPING_STATE = SIN_IDENTIFICADOR_EXTERNO_PERSISTIDO_ACREDITADO`

---

#### 19. Plataformas técnicas sin mapeo empresarial — `EXT-SYS-001`, `EXT-SYS-005`, `EXT-SYS-010`

##### 19.1. Supabase

IDs de proyecto, Auth, tablas, Storage, funciones y objetos de infraestructura pertenecen a contratos técnicos o a los propios dominios VENTO. Compartir Supabase no crea un mapping global externo↔canónico.

Los IDs de entidades empresariales almacenados en Supabase siguen siendo canónicos de sus dominios; no se reclasifican como IDs externos solo porque la plataforma los persista.

##### 19.2. Expo / EAS Update

`projectId`, channel, profile, runtime/version y referencias de release son identificadores técnicos de plataforma. No equivalen a aplicación empresarial, usuario, empleado ni recurso de proceso por coincidencia.

##### 19.3. Vercel

Project, deployment, domain y referencias de hosting son identificadores técnicos. La tarea no acredita una correspondencia empresarial que deba materializarse como identidad externa de recurso.

Decisión primaria para las tres identidades:

`REFERENCIA_DE_PLATAFORMA_SIN_MAPEO_EMPRESARIAL`

Si un contrato tecnológico posterior necesita correlacionar esos identificadores con una aplicación o despliegue canónico, deberá usar una relación técnica explícita y versionada sin convertir infraestructura en autoridad empresarial.

---

#### 20. Google Wallet — `EXT-SYS-012`

Existe un modelo contractual de objeto genérico con referencias como `id` y `classId`, pero no existe binding remoto operativo acreditado.

Reglas:

1. `classId` es `TECHNICAL_NAMESPACE_ID` del modelo de Wallet y no un ID de trabajador;
2. el `id` del objeto genérico no se declara actualmente como una relación remota validada;
3. barcode, issuer, class, claims JWT y texto de presentación no sustituyen identidad canónica;
4. no se afirma que Google haya aceptado, creado o devuelto un objeto cuyo ID pueda reconciliarse con VENTO;
5. antes de promover el modelo a mapping activo deberá acreditarse el binding, la regla de construcción del ID, su namespace, el recurso canónico relacionado y la respuesta/estado del proveedor.

Estado:

`GOOGLE_WALLET_ID_MAPPING_STATE = MODELO_DE_IDENTIFICADOR_SIN_BINDING_REMOTO`

---

#### 21. `VENTO-EXTERNAL-ID-MAPPING-MATRIX-001`

| ID            | Sistema / plataforma                     | Identificadores o referencias materiales                                    | Clasificación primaria                                        | Estado de resolución | Decisión materializada                                                                                                                                                                             |
| ------------- | ---------------------------------------- | --------------------------------------------------------------------------- | ------------------------------------------------------------- | -------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `EXT-SYS-001` | Supabase                                 | IDs de proyecto/plataforma y IDs canónicos almacenados por dominios VENTO   | `REFERENCIA_DE_PLATAFORMA_SIN_MAPEO_EMPRESARIAL`              | `NOT_APPLICABLE`     | no existe mapping externo universal; los IDs empresariales conservan propiedad de su dominio y la infraestructura no los convierte en externos                                                     |
| `EXT-SYS-002` | Wompi                                    | `transaction.id`, `reference`, event ID, transaction UUID propagado         | `MAPEO_CANONICO_PARCIALMENTE_ACREDITADO`                      | `PARTIALLY_RESOLVED` | transaction ID externo→`provider_reference`→transacción canónica; reference es correlación/idempotencia; UUID propagado se valida como canónico; event ID→receipt interno                          |
| `EXT-SYS-003` | RevenueCat                               | `app_user_id`, `product_id`, `original_transaction_id`, `aliases`           | `MAPEO_CANONICO_PARCIALMENTE_ACREDITADO`                      | `PARTIALLY_RESOLVED` | `app_user_id` es ID canónico propagado; store product tiene estructura de mapping; webhook actual no resuelve producto por ella; original transaction y aliases no se fusionan con identidad VENTO |
| `EXT-SYS-004` | Resend                                   | destinatario externo; respuesta de envío no persistida como ID estructurado | `SIN_IDENTIFICADOR_EXTERNO_PERSISTIDO_ACREDITADO`             | `UNRESOLVED`         | correo es dirección de entrega; IDs de invitación/usuario/empleado siguen siendo canónicos; no se inventa message ID del proveedor                                                                 |
| `EXT-SYS-005` | Expo / EAS Update                        | project ID, profile, channel, runtime/release refs                          | `REFERENCIA_DE_PLATAFORMA_SIN_MAPEO_EMPRESARIAL`              | `NOT_APPLICABLE`     | identificadores de plataforma delimitan configuración técnica; no equivalen a recursos empresariales por nombre o valor                                                                            |
| `EXT-SYS-006` | Expo Push Service                        | push token; `announcementId` propagado cuando existe                        | `MAPEO_CANONICO_PARCIALMENTE_ACREDITADO`                      | `PARTIALLY_RESOLVED` | token→registro técnico de destino→employee owner; token no es employee ID; announcementId sigue siendo correlación canónica VENTO                                                                  |
| `EXT-SYS-007` | Sentry                                   | referencias de telemetría no persistidas en mapping canónico observado      | `SIN_IDENTIFICADOR_EXTERNO_PERSISTIDO_ACREDITADO`             | `NOT_APPLICABLE`     | telemetría no crea identidad empresarial; usuario, mensaje, stack o grouping no producen mapeo automático                                                                                          |
| `EXT-SYS-008` | Google Maps / Google Reviews             | `place_id`, dirección, coordenadas                                          | `REFERENCIA_EXTERNA_TRANSITORIA_SIN_MAPEO_CANONICO`           | `UNRESOLVED`         | `place_id` permanece referencia Google; no equivale a `site_id`; cualquier asociación durable futura exige relación explícita                                                                      |
| `EXT-SYS-009` | Apple Wallet / PassKit + APNs            | `serialNumber`, `passTypeIdentifier`, `deviceLibraryIdentifier`, push token | `MAPEO_CANONICO_PARCIALMENTE_ACREDITADO`                      | `PARTIALLY_RESOLVED` | serial resuelve pase/user owner; device ID resuelve registros de dispositivo/pase; push token es destino; namespaces y recursos permanecen separados                                               |
| `EXT-SYS-010` | Vercel                                   | project/deployment/domain refs                                              | `REFERENCIA_DE_PLATAFORMA_SIN_MAPEO_EMPRESARIAL`              | `NOT_APPLICABLE`     | hosting y despliegue son referencias técnicas; no existe equivalencia empresarial acreditada en esta tarea                                                                                         |
| `EXT-SYS-011` | Zebra BrowserPrint                       | `device.uid`, nombre, tipo de impresora                                     | `MAPEO_CANONICO_REQUERIDO_SIN_VINCULO_PERSISTENTE_ACREDITADO` | `UNRESOLVED`         | UID local deberá vincularse a una identidad canónica de impresora antes de usarse como binding durable; nombre/tipo no bastan                                                                      |
| `EXT-SYS-012` | Google Wallet / Google Pay & Wallet      | object `id`, `classId`, issuer/model refs                                   | `MODELO_DE_IDENTIFICADOR_SIN_BINDING_REMOTO`                  | `UNRESOLVED`         | existe modelo de IDs, no relación remota validada; no se declara objeto creado ni vínculo activo con trabajador/recurso VENTO                                                                      |
| `EXT-SYS-013` | POS externo vigente                      | proveedor, namespaces e IDs no acreditados                                  | `BLOQUEADA_SIN_BINDING`                                       | `BLOCKED`            | `INT-POS-001` debe acreditar proveedor, objetos, IDs, namespaces y contratos antes de crear mapping                                                                                                |
| `EXT-SYS-014` | Shopify / comercio electrónico           | binding no acreditado                                                       | `NO_APLICA_SIN_BINDING`                                       | `NOT_APPLICABLE`     | no se inventan shop/order/customer/product IDs ni equivalencias mientras no exista binding autorizado                                                                                              |
| `EXT-SYS-015` | Rappi / marketplace                      | binding no acreditado                                                       | `NO_APLICA_SIN_BINDING`                                       | `NOT_APPLICABLE`     | no se inventan order/store/courier IDs ni relaciones canónicas sin contrato real                                                                                                                   |
| `EXT-SYS-016` | ManyChat / automatización conversacional | binding no acreditado                                                       | `NO_APLICA_SIN_BINDING`                                       | `NOT_APPLICABLE`     | no se inventan subscriber/contact/flow IDs ni equivalencias sin bot/API acreditados                                                                                                                |
| `EXT-SYS-017` | WhatsApp                                 | proveedor/API/binding no acreditados                                        | `NO_APLICA_SIN_BINDING`                                       | `NOT_APPLICABLE`     | número, contacto o conversación no se convierten en persona/caso canónico sin proveedor, namespace y contrato acreditados                                                                          |
| `EXT-SYS-018` | Instagram / social                       | API/binding no acreditados                                                  | `NO_APLICA_SIN_BINDING`                                       | `NOT_APPLICABLE`     | handle, profile o message ID no se convierten en identidad empresarial sin binding y relación aprobados                                                                                            |
| `EXT-SYS-019` | Correo corporativo y alias funcionales   | proveedor e integración no acreditados                                      | `NO_APLICA_SIN_BINDING`                                       | `NOT_APPLICABLE`     | correo, mailbox o alias no equivalen a persona, expediente o proveedor canónico por coincidencia                                                                                                   |
| `EXT-SYS-020` | Telefonía / voz                          | operador, interfaz y namespaces no acreditados                              | `BLOQUEADA_SIN_BINDING`                                       | `BLOCKED`            | `TI-INT-003` debe acreditar operador, cuenta, interfaz, IDs y semántica antes de instanciar mapping; caller ID no basta                                                                            |
| `EXT-SYS-021` | Transporte externo                       | proveedor, tracking e interfaz no acreditados                               | `NO_APLICA_SIN_BINDING`                                       | `NOT_APPLICABLE`     | tracking, guía, conductor o referencia de envío no se convierten en salida/entrega canónica sin binding y contrato acreditados                                                                     |

Reconciliación:

```text
MAPEO_CANONICO_PARCIALMENTE_ACREDITADO = 002,003,006,009 = 4
MAPEO_CANONICO_REQUERIDO_SIN_VINCULO_PERSISTENTE_ACREDITADO = 011 = 1
REFERENCIA_EXTERNA_TRANSITORIA_SIN_MAPEO_CANONICO = 008 = 1
SIN_IDENTIFICADOR_EXTERNO_PERSISTIDO_ACREDITADO = 004,007 = 2
REFERENCIA_DE_PLATAFORMA_SIN_MAPEO_EMPRESARIAL = 001,005,010 = 3
MODELO_DE_IDENTIFICADOR_SIN_BINDING_REMOTO = 012 = 1
NO_APLICA_SIN_BINDING = 014,015,016,017,018,019,021 = 7
BLOQUEADA_SIN_BINDING = 013,020 = 2
TOTAL = 21
```

---

#### 22. Resolución antes del efecto empresarial

Cuando una entrada externa referencia un recurso VENTO, el orden conceptual es:

```text
AUTENTICAR / VALIDAR ORIGEN
→ CLASIFICAR EL IDENTIFICADOR RECIBIDO
→ RESOLVER NAMESPACE Y AMBIENTE
→ CONSULTAR RELACIÓN ACREDITADA
→ CLASIFICAR RESOLVED / UNRESOLVED / AMBIGUOUS / CONFLICT
→ VALIDAR RECURSO EN DOMINIO PROPIETARIO
→ REVALIDAR AUTORIZACIÓN Y ESTADO
→ APLICAR O RECHAZAR EL EFECTO
```

Reglas:

1. un mapping `RESOLVED` no concede autorización;
2. `UNRESOLVED`, `AMBIGUOUS` o `CONFLICT` bloquean cualquier efecto que dependa de conocer el recurso exacto;
3. la ausencia de mapping no se corrige copiando el external ID dentro de una columna canónica;
4. no se crea automáticamente un recurso empresarial para acomodar una referencia externa salvo que el contrato propietario autorice explícitamente ese alta;
5. una afirmación externa puede conservarse como evidencia aun cuando el mapping no esté resuelto;
6. la disposición posterior de entradas no resolubles pertenece a `INT-EXT-016`;
7. auditoría, métricas y reconciliación de relaciones pertenecen a `INT-EXT-017`.

---

#### 23. Cambios, reasignación y fusión

Una relación no puede reinterpretarse silenciosamente cuando cambia la realidad externa.

Reglas:

1. si el proveedor reutiliza o reasigna un ID, la relación histórica se retira y se crea una nueva relación con evidencia suficiente;
2. el registro anterior conserva vigencia histórica y no se sobrescribe;
3. una fusión de identidades VENTO no se ejecuta únicamente porque dos referencias externas converjan;
4. aliases de proveedor no autorizan fusión interna automática;
5. una división de recurso canónico exige nuevas relaciones explícitas y no reparte referencias por heurística;
6. cambios incompatibles de namespace o semántica de ID exigen una nueva versión contractual;
7. la pérdida de evidencia deja el mapping en estado no resoluble o conflictivo hasta reconciliación; no se conserva `RESOLVED` por costumbre.

---

#### 24. Frontera con idempotencia, payload y conciliación

Se preservan estas separaciones:

```text
MAPPING
→ QUÉ RECURSO REPRESENTA O A QUÉ RECURSO SE ASOCIA UNA REFERENCIA
```

```text
IDEMPOTENCIA
→ SI ESTA OPERACIÓN YA FUE RECLAMADA Y QUÉ RESULTADO DEBE RECUPERARSE
```

```text
PAYLOAD ORIGINAL
→ QUÉ AFIRMACIÓN EXACTA ENTREGÓ EL PROVEEDOR
```

```text
CONCILIACIÓN
→ CÓMO SE RESUELVEN DIVERGENCIAS, AUSENCIAS O RESULTADOS INCIERTOS
```

Reglas:

1. un `provider_event_id` puede deduplicar una entrega sin identificar el recurso empresarial;
2. una `reference` puede correlacionar un pago sin ser el ID canónico del pago;
3. el payload completo no se usa como clave primaria de mapping;
4. el mapping conserva suficiente referencia para enlazar posteriormente la evidencia original sin definir en esta tarea su retención;
5. `SHELL-CON-022` y `SHELL-CON-023` permanecen contratos separados;
6. `INT-EXT-014` conserva la responsabilidad exclusiva sobre almacenamiento y protección del payload original;
7. `INT-EXT-017` conserva reconciliación operativa y observabilidad de mappings.

---

#### 25. Handoffs y condiciones de salida

| Trabajo derivado                                              | Estado                    | Propietario / tarea responsable   | Condición de salida                                                                                                                              |
| ------------------------------------------------------------- | ------------------------- | --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| Contrato compartido consumible de mapping externo             | `FUERA_DE_ALCANCE`        | `SHELL-CON-022`                   | existe representación compartida de sistema, namespace, external ID, recurso canónico, relación, estado y versión sin heurísticas de identidad   |
| Contrato de evento externo recibido con referencias mapeables | `FUERA_DE_ALCANCE`        | `SHELL-CON-019`                   | el evento adaptado puede conservar identificadores externos y referencias de mapping sin convertir al tercero en productor empresarial           |
| Idempotencia y resultado recuperable                          | `FUERA_DE_ALCANCE`        | `SHELL-CON-023`                   | la identidad de operación permanece separada de la identidad del recurso                                                                         |
| Conservación controlada del payload original                  | `FUERA_DE_ALCANCE`        | `INT-EXT-014`                     | payload original y mapping pueden correlacionarse sin usar contenido sensible como identidad canónica                                            |
| Disposición de mapping no resoluble, ambiguo o conflictivo    | `FUERA_DE_ALCANCE`        | `INT-EXT-016`                     | entradas que dependen de una relación inválida tienen rechazo o disposición explícita sin efecto silencioso                                      |
| Auditoría, métricas y reconciliación de mappings              | `FUERA_DE_ALCANCE`        | `INT-EXT-017`                     | cambios, conflictos, relaciones retiradas y resolución manual autorizada son reconstruibles                                                      |
| Proveedor, objetos e identificadores del POS vigente          | `BLOQUEADO_POR_EVIDENCIA` | `INT-POS-001`                     | proveedor, interfaz, namespaces, payload y IDs quedan acreditados antes de materializar relaciones                                               |
| Operador, interfaz e identificadores de telefonía/voz         | `BLOQUEADO_POR_EVIDENCIA` | `TI-INT-003`                      | proveedor/operador, cuenta, interfaz, IDs y semántica quedan acreditados antes de materializar relaciones                                        |
| Binding técnico Zebra UID ↔ impresora canónica                | `PENDIENTE_DE_EVIDENCIA`  | `PRINT-ARC-001` / `PRINT-ARC-002` | la impresora física y su interfaz acreditan un UID técnico que se vincula inequívocamente con una identidad canónica del inventario de impresión |

No queda pendiente sustantivo sin propietario y condición de salida.

---

#### 26. Prohibiciones

Queda prohibido:

1. copiar un external ID a un campo canónico y asumir que quedó mapeado;
2. inferir identidad por coincidencia de UUID;
3. inferir identidad por correo, teléfono, nombre, dirección, coordenadas, alias o texto visible;
4. tratar `reference`, idempotency key o event ID como ID del recurso sin contrato que lo establezca;
5. tratar un push token como ID de usuario o empleado;
6. tratar `deviceLibraryIdentifier` como ID de usuario;
7. tratar `passTypeIdentifier` como ID de pase o persona;
8. tratar BrowserPrint UID como identidad canónica de impresora sin vínculo acreditado;
9. tratar `place_id` como `site_id`;
10. tratar RevenueCat `app_user_id` como ID nativo del proveedor cuando el contrato VENTO lo propagó;
11. fusionar usuarios por aliases de RevenueCat;
12. usar `original_transaction_id` como subscription ID canónico sin relación explícita;
13. tratar correo de Resend como ID canónico de invitación o usuario;
14. convertir IDs de Sentry, Vercel, Expo/EAS o Supabase en IDs empresariales por pertenecer a la infraestructura;
15. declarar un objeto Google Wallet remoto creado únicamente porque existe un modelo de `id` y `classId`;
16. usar el mismo mapping entre ambientes;
17. reutilizar un mapping de otro proveedor por coincidencia de valor;
18. sobrescribir historia de una relación retirada;
19. resolver un estado `AMBIGUOUS` eligiendo el primer candidato;
20. resolver un estado `CONFLICT` sobrescribiendo el mapping vigente;
21. permitir que un mapping otorgue permiso empresarial;
22. permitir que un mapping sustituya autenticidad de origen;
23. permitir que un mapping sustituya idempotencia;
24. definir retención del payload original dentro de esta tarea;
25. modificar código o Supabase;
26. crear tablas, índices, RPC, triggers, colas o registros físicos de mapping;
27. inventar IDs externos para sistemas sin binding;
28. cambiar las veintiuna identidades heredadas;
29. iniciar o desarrollar `INT-EXT-014`.

---

#### 27. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa por identidad externa reglas de correspondencia, correlación y no inferencia ya protegidas por el registro vigente. La cobertura existente ya exige conservar el identificador externo antes de producir un hecho interno, separar identidades y contratos, mantener correlación, demostrar equivalencia antes de convertir una referencia legacy o externa en representación canónica y validar la afirmación externa dentro del adaptador y del dominio propietario. La tarea no crea una operación ejecutable nueva, una nueva autoridad, un nuevo endpoint, un nuevo proveedor, un nuevo recurso empresarial ni una política de seguridad adicional.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

El registro canónico de requisitos permanece sin cambios.

---

#### 28. Criterios de aceptación

`INT-EXT-013` queda documentalmente completa cuando se cumplen simultáneamente:

1. se preservan exactamente `EXT-SYS-001` a `EXT-SYS-021`;
2. existen exactamente 21 decisiones primarias;
3. faltantes = 0;
4. duplicados = 0;
5. identificadores únicos = 21;
6. la distribución es exactamente `4 + 1 + 1 + 2 + 3 + 1 + 7 + 2 = 21`;
7. identificador externo e identificador canónico permanecen conceptos distintos;
8. un ID canónico propagado al tercero se clasifica como `PROPAGATED_CANONICAL_ID` cuando regresa;
9. referencias de routing, correlación e idempotencia no se convierten en IDs de recurso;
10. atributos de búsqueda o presentación no producen equivalencia automática;
11. namespace y ambiente forman parte de la resolución;
12. una relación de identidad exacta resuelve como máximo a un recurso canónico activo dentro de su namespace;
13. relaciones históricas retiradas no se sobrescriben;
14. `UNRESOLVED`, `AMBIGUOUS` y `CONFLICT` bloquean efectos dependientes de una identidad exacta;
15. Wompi separa transaction ID externo, reference, event ID y transaction UUID propagado;
16. Wompi `provider_reference` no se convierte en order ID;
17. RevenueCat `app_user_id` conserva semántica de ID canónico VENTO propagado;
18. RevenueCat `product_id` se relaciona conceptualmente mediante `store_product_id` y plan, sin presentar el webhook actual como resolución ya implementada;
19. RevenueCat `original_transaction_id` permanece externo hasta disponer de relación durable acreditada;
20. aliases RevenueCat no fusionan usuarios;
21. Expo push token se conserva como destino vinculado a su registro técnico y propietario, no como employee ID;
22. Google `place_id` no se convierte en `site_id`;
23. Apple separa serial, pass type, device library ID, push token y user ID;
24. Zebra UID requiere vínculo explícito con la identidad canónica de impresora;
25. correo Resend permanece dirección, no ID canónico;
26. telemetría Sentry no crea identidad empresarial por grouping o semejanza;
27. Supabase, Expo/EAS y Vercel conservan referencias de infraestructura sin mapping empresarial universal;
28. Google Wallet conserva modelo de IDs sin afirmar binding remoto;
29. POS externo permanece bloqueado hasta `INT-POS-001`;
30. telefonía/voz permanece bloqueada hasta acreditar proveedor e interfaz mediante `TI-INT-003`;
31. los siete sistemas sin binding no reciben IDs o mappings ficticios;
32. `SHELL-CON-022` conserva la materialización compartida posterior;
33. `SHELL-CON-023` permanece separado del mapping de recursos;
34. no se define conservación física del payload original;
35. no se modifica código;
36. no se modifica Supabase;
37. no se crean tablas, RPC ni registros físicos;
38. no se crean ni modifican requisitos de prueba;
39. `INT-EXT-014` permanece reservada.

---

#### 29. Resultado de la tarea

`INT-EXT-013` queda **APROBADA** como definición documental completa del mapeo de identificadores externos y canónicos para las veintiuna identidades externas.

Resultado consolidado:

- identidades materializadas: **21/21**;
- mappings parcialmente acreditados: **4**;
- mapping canónico requerido sin vínculo persistente acreditado: **1**;
- referencia externa transitoria sin mapping canónico: **1**;
- sistemas sin identificador externo persistido acreditado: **2**;
- referencias de plataforma sin mapping empresarial: **3**;
- modelo de identificador sin binding remoto: **1**;
- identidades sin binding a las que no aplica mapping actual: **7**;
- identidades bloqueadas sin binding: **2**;
- faltantes: **0**;
- duplicados: **0**;
- cambios físicos: **0**;
- requisitos creados o modificados: **0**.

Invariante final:

```text
REFERENCIA EXTERNA
+
NAMESPACE Y AMBIENTE
+
RELACIÓN ACREDITADA
+
RECURSO CANÓNICO EXACTO
=
MAPEO RESOLUBLE Y TRAZABLE
```

sin equiparar coincidencia de valor con identidad, sin convertir correlación o idempotencia en mapping y sin transferir autoridad empresarial al proveedor.

---

ÚLTIMA TAREA APROBADA

`INT-EXT-012 — Definir idempotencia y deduplicación por sistema externo`

TAREA ACTUAL APROBADA

`INT-EXT-013 — Definir mapeo de identificadores externos y canónicos`

SIGUIENTE TAREA RESERVADA

`INT-EXT-014 — Definir conservación controlada del payload original`


### ✅ INT-EXT-014 — Definir conservación controlada del payload original

**Estado:** APROBADA
**Tarea anterior:** `INT-EXT-013 — Definir mapeo de identificadores externos y canónicos` — APROBADA
**Tarea siguiente:** `INT-EXT-015 — Definir rate limits, reintentos, backoff y circuit breaker` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materializada de captura, preservación, minimización, inmutabilidad, acceso, correlación, retención gobernada y disposición del payload original o de la evidencia fuente de intercambios externos para `EXT-SYS-001` a `EXT-SYS-021`, sin modificar código, Supabase, proveedores, datos, endpoints, Storage, secretos ni configuración remota
**Bloque:** X — Integraciones
**Mini-bloque:** Integraciones externas y credenciales
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/02_INTEGRACIONES_EXTERNAS_Y_CREDENCIALES.md`
**Implementación física autorizada:** ninguna
**Cambios de código, DDL, DML, migraciones, RLS, RPC, Edge Functions, Storage, buckets, secretos, credenciales, endpoints, despliegues o datos:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir cómo VENTO conserva una afirmación externa en su forma fuente cuando esa evidencia es necesaria para demostrar qué recibió realmente el adaptador, sin convertir el payload del proveedor en modelo empresarial, sin duplicarlo indiscriminadamente en tablas de negocio o auditoría y sin retener contenido completo cuando una referencia, huella o proyección mínima sea suficiente.

La tarea separa obligatoriamente:

```text
PAYLOAD ORIGINAL / EVIDENCIA FUENTE
≠
PAYLOAD NORMALIZADO O ADAPTADO
≠
HECHO CANÓNICO VENTO
≠
AUDITORÍA ORDINARIA
≠
LOG TÉCNICO
≠
RESPUESTA O RECIBO DEL PROVEEDOR
≠
CREDENCIAL O SECRETO
```

También separa:

```text
PRESERVACIÓN
≠
COPIA ORDINARIA
≠
RETENCIÓN
≠
BACKUP
≠
LEGAL HOLD
≠
ARCHIVO OPERATIVO
```

El objetivo no es guardar todo. El objetivo es conservar exactamente la evidencia fuente que sea necesaria, en una custodia protegida, correlacionable e inmutable, durante el periodo autorizado por el gobierno de información aplicable.

---

#### 2. Resultado sustantivo

Se aprueban dos artefactos documentales internos:

1. `VENTO-EXTERNAL-ORIGINAL-PAYLOAD-CUSTODY-001`, contrato común de captura y preservación controlada de evidencia fuente externa.
2. `VENTO-EXTERNAL-ORIGINAL-PAYLOAD-MATRIX-001`, decisión materializada para las veintiuna identidades externas heredadas.

Balance:

| Control                                              |    Resultado |
| ---------------------------------------------------- | -----------: |
| Identidades esperadas                                |       **21** |
| Identidades materializadas                           | **21 de 21** |
| Identificadores `EXT-SYS-*` únicos                   |       **21** |
| Identidades faltantes                                |        **0** |
| Identidades duplicadas                               |        **0** |
| `PRESERVACION_DURABLE_DE_ENTRADA_REQUERIDA`          |        **2** |
| `PRESERVACION_MINIMA_DE_OPERACION_POR_RECURSO`       |        **1** |
| `NO_RETENER_PAYLOAD_COMPLETO_POR_MINIMIZACION`       |        **5** |
| `GOBERNADA_POR_CONTRATO_INTERNO_VENTO`               |        **1** |
| `CONFIGURACION_PLATAFORMA_SIN_PAYLOAD_ACREDITADO`    |        **2** |
| `MODELO_DOCUMENTADO_SIN_BINDING_REMOTO`              |        **1** |
| `NO_APLICA_SIN_BINDING`                              |        **7** |
| `BLOQUEADA_SIN_BINDING`                              |        **2** |
| Periodos de retención numéricos inventados           |        **0** |
| Copias de payload autorizadas en auditoría ordinaria |        **0** |
| Cambios físicos                                      |        **0** |
| Requisitos de prueba creados o modificados           |        **0** |

Reconciliación:

```text
2 + 1 + 5 + 1 + 2 + 1 + 7 + 2 = 21
```

La clasificación primaria determina si la superficie necesita evidencia fuente durable, evidencia mínima por recurso, solo un recibo/referencia mínima o ninguna conservación de payload completo en el corte actual.

---

#### 3. Entradas canónicas preservadas

La tarea consume y conserva sin redefinir:

- `VENTO-EXTERNAL-SYSTEM-INVENTORY-001` y sus veintiuna identidades `EXT-SYS-001` a `EXT-SYS-021`;
- principal técnico, credenciales, mecanismos, alcance, ambientes, custodia y lifecycle aprobados en `INT-EXT-002` a `INT-EXT-008`;
- contratos I/O versionados de `INT-EXT-009`;
- estrategia de intercambio de `INT-EXT-010`;
- autenticidad, origen, timestamp y replay de `INT-EXT-011`;
- identidad idempotente y deduplicación de `INT-EXT-012`;
- mapeo de identificadores de `INT-EXT-013`;
- la obligación vigente de conservar la afirmación externa, su payload protegido, el identificador externo, la recepción y la correlación antes de producir un hecho interno;
- la obligación de minimizar payloads y no copiar documentos, datos personales completos, datos financieros, datos médicos, credenciales u otra información sensible cuando una referencia protegida sea suficiente;
- la prohibición de incluir secretos, tokens, passwords, claves privadas, credenciales de proveedor o URLs firmadas persistentes en eventos, esquemas, ejemplos, auditoría ordinaria o evidencia no protegida;
- la regla de que auditoría y logs registran referencias, huellas, estados y resultados sin convertirse en copia completa del payload;
- `SHELL-CON-019` como destino del contrato compartido de evento externo recibido;
- `SHELL-CON-022` como contrato separado de mapeo de identificadores;
- `SHELL-CON-023` como contrato separado de idempotencia y conciliación;
- `INFO-INT-001` y su frontera documental de preservación, archivo externo, correlación, clasificación, retención, hold y evidencia;
- la propiedad de cada dominio VENTO sobre el hecho empresarial resultante.

Esta tarea no selecciona bucket, tabla, proveedor de almacenamiento, algoritmo de cifrado administrado, periodo universal de retención ni mecanismo físico de archivo.

---

#### 4. Definiciones canónicas

`VENTO-EXTERNAL-ORIGINAL-PAYLOAD-CUSTODY-001` usa las siguientes clases:

| Concepto                        | Significado                                                                                                                                          |
| ------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| `SOURCE_PAYLOAD`                | representación recibida del tercero antes de una transformación semántica destructiva                                                                |
| `RAW_SOURCE_BYTES`              | bytes exactos recibidos cuando el protocolo de autenticidad o la fidelidad de evidencia requieren conservar la representación de transporte          |
| `SOURCE_PAYLOAD_DIGEST`         | huella criptográfica de la representación fuente; permite demostrar integridad sin exponer el contenido                                              |
| `NORMALIZED_EXTERNAL_ASSERTION` | interpretación tipada y validada del payload externo dentro del adaptador                                                                            |
| `CANONICAL_BUSINESS_FACT`       | hecho interno producido por el dominio propietario después de validación; nunca es el payload externo                                                |
| `PROTECTED_SOURCE_EVIDENCE`     | objeto de evidencia con acceso restringido que conserva la fuente necesaria y sus metadatos no secretos                                              |
| `REDACTED_EVIDENCE_VIEW`        | vista derivada y minimizada destinada a investigación o soporte ordinario cuando no es necesario revelar el contenido fuente completo                |
| `MINIMAL_EXTERNAL_RECEIPT`      | identificador, estado, error normalizado, referencia y huella mínima de una respuesta externa cuando no se justifica conservar la respuesta completa |
| `BUSINESS_ROW_REFERENCE`        | referencia desde una entidad empresarial hacia evidencia, receipt o mapping; no contiene por defecto el payload fuente                               |
| `AUDIT_REFERENCE`               | registro de sistema, ambiente, superficie, evidencia, huella, resultado y correlación sin duplicar el contenido fuente                               |
| `RETENTION_POLICY_REF`          | referencia a la regla aprobada de retención/disposición aplicable; no es un número inventado por esta tarea                                          |
| `PRESERVATION_OR_HOLD_REF`      | referencia a una condición autorizada que impide una disposición ordinaria cuando aplique                                                            |

Una representación JSON parseada puede conservar valor semántico, pero no se considera equivalente a `RAW_SOURCE_BYTES` cuando firma, MAC, canonicalización o investigación dependen de la secuencia exacta recibida.

---

#### 5. `VENTO-EXTERNAL-ORIGINAL-PAYLOAD-CUSTODY-001`

Toda evidencia fuente durable deberá poder representar como mínimo:

| Dimensión                       | Regla                                                                               |
| ------------------------------- | ----------------------------------------------------------------------------------- |
| `external_system_id`            | identidad `EXT-SYS-*` exacta                                                        |
| `environment`                   | ambiente exacto; la evidencia no se reutiliza entre ambientes                       |
| `surface`                       | webhook, servicio de recurso, respuesta de proveedor u otra superficie material     |
| `direction`                     | `EXTERNAL_TO_VENTO`, `VENTO_TO_EXTERNAL`, `BIDIRECTIONAL` o equivalente contractual |
| `contract_version`              | versión VENTO que interpretó el intercambio                                         |
| `received_at`                   | instante local de recepción cuando exista una entrada                               |
| `media_type`                    | media type recibido cuando sea material                                             |
| `content_encoding`              | encoding de transporte cuando sea material                                          |
| `source_capture_mode`           | `RAW_BYTES`, `PROVIDER_OBJECT`, `MINIMAL_RECEIPT` o clase equivalente               |
| `source_byte_length`            | tamaño de la fuente capturada sin convertirlo en criterio empresarial               |
| `payload_digest_algorithm`      | algoritmo de huella versionado y aprobado por la implementación                     |
| `payload_digest`                | huella de la fuente capturada                                                       |
| `external_event_or_receipt_ref` | identificador externo cuando exista y esté acreditado                               |
| `authenticity_result_ref`       | referencia al resultado de autenticidad; nunca el secreto                           |
| `mapping_refs[]`                | relaciones acreditadas de `INT-EXT-013` cuando existan                              |
| `idempotency_ref`               | relación con la operación de `INT-EXT-012` sin convertir el payload en clave        |
| `sensitivity_class`             | clasificación efectiva de la evidencia                                              |
| `retention_policy_ref`          | regla de retención/disposición aplicable                                            |
| `preservation_or_hold_ref`      | bloqueo autorizado de disposición cuando exista                                     |
| `protected_payload_locator`     | referencia opaca a la custodia del contenido; no se expone a clientes ordinarios    |
| `redacted_view_ref`             | vista minimizada opcional para investigación o soporte                              |
| `disposition_evidence_ref`      | evidencia de disposición cuando el lifecycle aplicable permita retirar el contenido |

La denominación física final pertenece al contrato compartido y a las fases de implementación correspondientes. Esta tarea fija semántica, no una tabla o bucket.

---

#### 6. Orden obligatorio de captura y conversión

Para una entrada externa que pueda producir un hecho VENTO:

```text
RECIBIR LA ENTREGA
→ FIJAR VENTO_RECEIVED_AT
→ CAPTURAR TRANSITORIAMENTE LA REPRESENTACIÓN FUENTE
→ VALIDAR AUTENTICIDAD / ORIGEN SEGÚN EL PERFIL
→ CALCULAR HUELLA DE LA FUENTE
→ MATERIALIZAR EVIDENCIA PROTEGIDA CUANDO EL CONTRATO LA EXIJA
→ PARSEAR / NORMALIZAR / MAPEAR
→ RESOLVER IDEMPOTENCIA Y ESTADO
→ VALIDAR DOMINIO PROPIETARIO
→ PRODUCIR O RECHAZAR EL HECHO INTERNO
```

Reglas:

1. si la firma cubre los bytes raw, la captura ocurre antes de `JSON.parse` o reserialización;
2. preservar la fuente no autoriza procesarla;
3. una entrada no auténtica no entra silenciosamente al flujo empresarial;
4. la disposición de entradas inválidas o no procesables pertenece a `INT-EXT-016`;
5. el storage normal de evidencia no se usa como sumidero ilimitado para tráfico no autenticado;
6. si la autenticidad no puede decidirse sin los bytes fuente, esos bytes pueden mantenerse transitoriamente durante la verificación sin convertirlos todavía en evidencia empresarial durable;
7. una entrada auténtica que deba respaldar un hecho interno materializa la evidencia requerida antes de que el hecho dependa de una copia mutable o de una transformación no reconstruible;
8. el payload original no se transforma en fuente de verdad empresarial por ser preservado.

---

#### 7. Inmutabilidad, redelivery y versiones de evidencia

La preservación de la fuente es append-only o equivalente.

Reglas:

1. una redelivery no sobrescribe la evidencia fuente de una recepción anterior;
2. cada recepción puede conservar su `receipt` o intento técnico y vincularse con la misma operación lógica;
3. mismo identificador externo y misma huella pueden converger en la misma operación idempotente, pero conservan trazabilidad de recepción cuando el contrato lo requiera;
4. mismo identificador externo y huella distinta produce conflicto de identidad/contenido y no reescribe la evidencia original;
5. una transformación o parser corregido crea una nueva interpretación derivada, no modifica los bytes fuente preservados;
6. un cambio de mapping no modifica el payload histórico;
7. una corrección del hecho interno no altera la afirmación externa que lo originó;
8. una evidencia retirada por lifecycle conserva únicamente las referencias y constancias permitidas por su política; no se falsifica la historia haciendo aparecer un payload distinto.

El contrato prohíbe usar un `UPSERT` que reemplace silenciosamente el contenido fuente de una recepción anterior cuando ese contenido constituye evidencia.

---

#### 8. Separación entre evidencia fuente, fila empresarial y auditoría

La relación objetivo es:

```text
PROTECTED_SOURCE_EVIDENCE
        ↓ referencia / huella
ADAPTADOR / RECEIPT
        ↓ interpretación
HECHO EMPRESARIAL
        ↓ referencias
AUDITORÍA
```

Reglas:

1. la entidad empresarial conserva campos canónicos, identificadores externos necesarios, estado, mapping y una referencia a evidencia; no necesita el payload completo por defecto;
2. auditoría ordinaria conserva referencias, huellas, versión, actor/principal, resultado, tiempos y correlación; no copia el payload fuente completo;
3. logs técnicos no almacenan bodies completos por conveniencia;
4. una misma afirmación externa no se duplica en varias tablas para facilitar consultas;
5. una copia adicional requiere una finalidad independiente, clasificación, acceso y lifecycle propios; comodidad de debugging no es una finalidad suficiente;
6. una vista redacted puede exponer campos mínimos para soporte sin dar acceso al objeto fuente;
7. una política RLS que permite al propio usuario consultar una fila empresarial no debe implicar acceso automático al payload externo protegido almacenado por esa fila.

---

#### 9. Secretos, headers y material de autenticación

Queda prohibido conservar como contenido ordinario de evidencia:

- `Authorization` bearer reutilizable;
- `service_role`;
- API keys privadas;
- webhook secrets;
- signing secrets;
- passwords;
- private keys;
- material P8/P12 privado;
- tokens de sesión reutilizables;
- URLs firmadas persistentes;
- cookies de sesión;
- cualquier valor cuya exposición permita autenticar una nueva petición.

Reglas:

1. el secreto que valida una firma jamás se copia junto al payload;
2. auditoría conserva la referencia de credencial o mecanismo, no el valor;
3. firma, checksum o MAC recibidos pueden conservarse únicamente dentro de la evidencia protegida cuando sean necesarios para demostrar la fuente; la vista ordinaria conserva una huella o referencia suficiente;
4. si un header contiene además metadata no secreta necesaria, se captura de forma allowlist y no mediante copia indiscriminada de todos los headers;
5. el payload protegido no se usa como mecanismo de custodia de secretos.

---

#### 10. Minimización y decisión de conservar contenido completo

La regla por defecto es:

```text
SI UNA REFERENCIA + HUELLA + METADATA MÍNIMA
PERMITEN DEMOSTRAR EL INTERCAMBIO NECESARIO
→ NO RETENER EL PAYLOAD COMPLETO
```

La preservación completa se justifica únicamente cuando al menos una de estas condiciones está acreditada:

- la afirmación externa puede producir o justificar un hecho empresarial material y debe poder reconstruirse;
- el mecanismo de autenticidad depende de los bytes exactos y la evidencia de seguridad requiere preservarlos;
- existe necesidad de conciliación, investigación o disputa que no puede satisfacerse con una proyección mínima;
- una política de información, legal, contractual o de evidencia exige conservar la fuente;
- el proveedor no ofrece una fuente recuperable posterior y perder el payload impediría demostrar la decisión aplicada.

No justifican por sí solas conservar el payload completo:

- que el proveedor envíe JSON;
- que exista una columna `jsonb`;
- que el almacenamiento sea barato;
- que el contenido pueda ser útil en debugging futuro;
- que la respuesta sea fácil de serializar;
- que una librería devuelva el objeto completo;
- que una consulta read-only produzca muchos campos;
- que el tercero pueda reenviar la misma información.

---

#### 11. Retención, preservación, hold y disposición

`INT-EXT-014` no fija un número universal de días.

Cada objeto de evidencia fuente deberá resolver:

```text
CLASIFICACIÓN
+
FINALIDAD
+
PROCESO / RECURSO
+
POLÍTICA DE RETENCIÓN APLICABLE
+
RESTRICCIONES DE PRESERVACIÓN O HOLD
→ FECHA / CONDICIÓN DE DISPOSICIÓN
```

Reglas:

1. la duración no se deriva del proveedor por defecto;
2. la duración no se deriva de la vida de la fila empresarial por defecto;
3. un mapping retirado no elimina automáticamente evidencia aún retenida;
4. una operación cerrada no elimina evidencia sujeta a una obligación vigente;
5. un hold autorizado suspende la disposición ordinaria sin cambiar la fuente;
6. finalizado el periodo y sin bloqueo aplicable, el contenido puede disponerse mediante el procedimiento aprobado;
7. la evidencia de disposición no contiene el payload eliminado;
8. conservar indefinidamente por ausencia de política no se presenta como cumplimiento;
9. cuando no exista un periodo físico acreditado para una implementación concreta, el estado correcto es pendiente de evidencia de la política aplicable, no un número estimado.

Las reglas de retención, preservación, archivo y hold se consumen del gobierno de información y no se redefinen localmente por proveedor.

---

#### 12. Acceso y separación de responsabilidades

El payload fuente completo se considera una superficie de evidencia restringida.

Reglas:

1. no se expone mediante consultas ordinarias de la entidad empresarial;
2. un usuario que puede ver su pago, suscripción o perfil no obtiene por ello acceso al payload completo del proveedor;
3. el principal técnico que recibe la entrada puede materializar la evidencia sin adquirir permiso para leerla después fuera de su función;
4. soporte ordinario usa la vista redacted o referencias mínimas;
5. investigación autorizada puede requerir acceso al contenido fuente conforme a finalidad, clasificación y evidencia de acceso;
6. administradores del storage no adquieren autoridad empresarial por administrar la custodia;
7. una aplicación consumidora no accede a payloads de otro dominio por compartir Supabase;
8. el acceso a producción no se hereda desde development o staging;
9. cualquier exportación o copia de investigación mantiene la clasificación y lifecycle aplicables.

---

#### 13. Wompi — `EXT-SYS-002`

Decisión primaria:

`PRESERVACION_DURABLE_DE_ENTRADA_REQUERIDA`

Superficie material:

- webhook de resultado de pago;
- identificador de evento cuando exista;
- transacción/reference y estado externos;
- propiedades y checksum de firma;
- timestamp de proveedor;
- correlación con transacción y orden VENTO.

Contrato objetivo:

```text
ENTREGA WOMPI AUTENTICADA
→ RECEIPT DE RECEPCIÓN
→ HUELLA DE FUENTE
→ EVIDENCIA FUENTE PROTEGIDA E INMUTABLE
→ REFERENCIAS DE EVENTO / TRANSACCIÓN / MAPPING
→ EFECTO DE PAGO EN DOMINIO PROPIETARIO
```

Reglas específicas:

1. el body fuente se conserva como evidencia separada cuando la entrega pueda producir un cambio de estado de pago;
2. el objeto preservado no contiene el secreto de eventos;
3. checksum y metadata de autenticidad permanecen referenciables sin exponer credenciales;
4. el mismo payload no debe copiarse además como `raw_response` de la transacción solo por conveniencia;
5. una redelivery no sobrescribe el payload fuente de una recepción anterior;
6. el receipt conserva relación con la identidad idempotente de `INT-EXT-012` y con el mapping de `INT-EXT-013`;
7. una entrada sin identidad suficiente puede conservar evidencia según su disposición de seguridad, pero no habilita un hecho nuevo.

Estado técnico observado:

- el runtime parsea la petición mediante JSON antes de conservar una representación fuente separada;
- `payments.webhook_events.payload` persiste el objeto JSON parseado;
- el mismo objeto se entrega además a la actualización de transacción y termina en `payments.transactions.raw_response`;
- la tabla de transacciones es consultable por el usuario propietario mediante RLS;
- el registro del webhook se actualiza con `payload = excluded.payload`, por lo que una redelivery puede reemplazar la copia anterior;
- no se observa una referencia separada a evidencia fuente inmutable ni una huella de los bytes recibidos.

Resultado del corte:

`WOMPI_ORIGINAL_PAYLOAD_STATE = IMPLEMENTADO_PARCIAL_NO_INMUTABLE_Y_DUPLICADO`

---

#### 14. RevenueCat — `EXT-SYS-003`

Decisión primaria:

`PRESERVACION_DURABLE_DE_ENTRADA_REQUERIDA`

La evidencia fuente es especialmente material porque el perfil de autenticidad aprobado requiere validar una firma sobre timestamp y cuerpo raw.

Contrato objetivo:

```text
RAW BODY REVENUECAT
→ HUELLA
→ VALIDACIÓN DE AUTENTICIDAD
→ EVIDENCIA FUENTE PROTEGIDA
→ PARSEO Y NORMALIZACIÓN
→ RECEIPT / IDEMPOTENCIA
→ SUBSCRIPCIÓN / ENTITLEMENT CANÓNICOS
```

Reglas específicas:

1. el cuerpo se captura antes de parsear cuando el perfil de firma dependa de bytes raw;
2. la copia empresarial no conserva el payload completo;
3. la auditoría ordinaria no conserva el payload completo;
4. `app_user_id`, producto, transacción externa, entitlement y tiempos relevantes se proyectan como campos tipados o referencias según los contratos anteriores;
5. la evidencia fuente conserva correlación con la suscripción, el receipt de evento y el mapping sin convertirse en la suscripción;
6. una redelivery no genera una nueva copia empresarial del mismo payload;
7. el secreto de autenticidad no se almacena con la evidencia.

Estado técnico observado:

- el runtime usa `req.json()` y no conserva los bytes raw antes del parseo;
- el payload completo se inserta en `club.subscriptions.raw_payload`;
- el mismo payload completo se inserta además en `club.audit_events.event_data`;
- tanto la suscripción propia como la auditoría propia tienen políticas de lectura para el usuario autenticado correspondiente;
- no existe una custodia separada de evidencia fuente ni una referencia opaca desde las filas empresariales observadas.

Resultado del corte:

`REVENUECAT_ORIGINAL_PAYLOAD_STATE = NO_CONFORME_DUPLICADO_EN_FILAS_EMPRESARIALES_Y_SIN_RAW_BYTES`

---

#### 15. Apple Wallet / PassKit + APNs — `EXT-SYS-009`

Decisión primaria:

`PRESERVACION_MINIMA_DE_OPERACION_POR_RECURSO`

Las llamadas observadas del PassKit Web Service son operaciones técnicas sobre recursos concretos, no webhooks de hechos empresariales firmados por un proveedor.

Reglas:

1. registro y retiro de dispositivo conservan como evidencia mínima la operación, `deviceLibraryIdentifier`, `passTypeIdentifier`, `serialNumber`, resultado y correlación necesarios;
2. el `authenticationToken` del pase no se copia a evidencia ordinaria;
3. el push token se trata como routing ref sensible y solo se conserva donde el contrato de registro lo necesita;
4. consultas de seriales y obtención del pase no requieren archivar el body completo de cada request;
5. `If-Modified-Since` y `passesUpdatedSince` son metadata técnica y no justifican un archivo completo de request;
6. la firma del `.pkpass` y el JWT APNs saliente permanecen fuera del payload entrante;
7. el endpoint técnico de log no se convierte en un repositorio ilimitado de contenido arbitrario; cualquier evidencia futura deberá ser acotada, minimizada y clasificada.

Estado técnico observado:

- el servicio procesa body y path de registro y actualiza relaciones de dispositivo/pase;
- no se observa una custodia de raw request;
- el endpoint de log responde sin persistir el body;
- esa ausencia no es una brecha por sí sola para estas operaciones mientras exista evidencia estructurada suficiente y no se requiera reconstruir un hecho externo autónomo.

Resultado:

`PASSKIT_ORIGINAL_PAYLOAD_STATE = EVIDENCIA_MINIMA_POR_RECURSO_SIN_ARCHIVO_RAW_GENERAL`

---

#### 16. Superficies donde no se conserva payload completo por defecto

##### 16.1. Resend — `EXT-SYS-004`

La superficie observada es salida VENTO hacia proveedor de correo.

- el body del correo se deriva de la invitación canónica y no constituye una afirmación original del proveedor;
- una respuesta exitosa del proveedor debe conservar como máximo receipt/message ref y estado necesarios cuando el contrato los acredite;
- una respuesta de error se normaliza y limita; no se usa texto arbitrario del proveedor como payload empresarial;
- el código observado no conserva un message ID exitoso estructurado y guarda una porción de texto de error dentro de metadata de invitación cuando falla;
- la evolución objetivo separa error/receipt técnico de la fila empresarial y no introduce una copia íntegra de la respuesta.

Decisión:

`RESEND_ORIGINAL_PAYLOAD_STATE = NO_RETENER_PAYLOAD_COMPLETO_POR_MINIMIZACION`

##### 16.2. Expo Push Service — `EXT-SYS-006`

- el mensaje enviado se deriva del anuncio canónico;
- la respuesta técnica se consume actualmente para detectar `DeviceNotRegistered`;
- la respuesta completa no necesita conservarse por defecto;
- tickets/receipts futuros, cuando se acrediten, se conservan como referencias mínimas ligadas a la operación de entrega;
- el push token continúa siendo destino técnico sensible y no payload empresarial.

Decisión:

`EXPO_PUSH_ORIGINAL_PAYLOAD_STATE = NO_RETENER_PAYLOAD_COMPLETO_POR_MINIMIZACION`

##### 16.3. Sentry — `EXT-SYS-007`

- la superficie observada es telemetría saliente;
- la fuente de la observación pertenece a la aplicación VENTO, no a un payload entrante autónomo de Sentry;
- grouping, issue o respuesta del proveedor no justifican crear un archivo paralelo de telemetría completa en VENTO;
- correlación futura con un caso tecnológico utiliza referencias mínimas y clasificación de observabilidad.

Decisión:

`SENTRY_ORIGINAL_PAYLOAD_STATE = NO_RETENER_PAYLOAD_COMPLETO_POR_MINIMIZACION`

##### 16.4. Google Maps / Google Reviews — `EXT-SYS-008`

- las respuestas de autocomplete y detalle son consultas read-only bajo demanda;
- el runtime proyecta únicamente `place_id`, descripción/dirección, coordenadas y campos mínimos requeridos;
- no persiste la respuesta completa observada;
- la ausencia de persistencia completa es coherente con minimización mientras el proceso no requiera una evidencia contractual adicional;
- una futura relación durable con una sede se gobierna mediante mapping explícito, no mediante archivo del response completo.

Decisión:

`GOOGLE_PLACES_ORIGINAL_PAYLOAD_STATE = NO_RETENER_PAYLOAD_COMPLETO_POR_MINIMIZACION`

##### 16.5. Zebra BrowserPrint — `EXT-SYS-011`

- ZPL es contenido generado por VENTO para una operación física, no una afirmación original del proveedor;
- el contrato de impresión debe conservar job, plantilla/versión, hash lógico, impresora, generación y resultado necesarios para evidenciar el efecto;
- no se crea dentro de esta tarea un archivo externo de cada string ZPL por defecto;
- UID de impresora y resultado del bridge permanecen referencias técnicas, no payload empresarial.

Decisión:

`ZEBRA_ORIGINAL_PAYLOAD_STATE = NO_RETENER_PAYLOAD_COMPLETO_POR_MINIMIZACION`

---

#### 17. Supabase — `EXT-SYS-001`

Supabase continúa gobernada por los contratos internos de cada dominio y superficie.

Decisión:

`SUPABASE_ORIGINAL_PAYLOAD_DECISION = GOBERNADA_POR_CONTRATO_INTERNO_VENTO`

Reglas:

1. no se crea un archivo universal de todos los requests Supabase;
2. Auth, RPC, Storage, Realtime, Edge Functions y base de datos conservan evidencia según el contrato propietario;
3. la plataforma no convierte un body interno en payload externo solo por transportarlo;
4. cuando una Edge Function actúe como adaptador de proveedor externo, la identidad `EXT-SYS-*` del proveedor y este contrato de evidencia sí aplican a esa frontera;
5. cualquier materialización Supabase perteneciente a VENTO deberá originarse y versionarse desde `vento-shell`.

---

#### 18. Configuraciones de plataforma sin payload acreditado

##### 18.1. Expo / EAS Update — `EXT-SYS-005`

Perfiles, channels, project ID, runtime y configuración no acreditan una operación externa cuyo payload fuente deba conservarse bajo esta tarea.

Decisión:

`EXPO_EAS_ORIGINAL_PAYLOAD_STATE = CONFIGURACION_PLATAFORMA_SIN_PAYLOAD_ACREDITADO`

##### 18.2. Vercel — `EXT-SYS-010`

Hosting, rewrites, domains y configuración observada no acreditan una API administrativa o callback cuyo payload fuente deba conservarse.

Decisión:

`VERCEL_ORIGINAL_PAYLOAD_STATE = CONFIGURACION_PLATAFORMA_SIN_PAYLOAD_ACREDITADO`

Una futura automatización material deberá volver a esta política si incorpora request, response, callback o evidencia externa relevante.

---

#### 19. Google Wallet — `EXT-SYS-012`

Existe un modelo documental de objeto y JWT de guardado, pero no se acredita un binding remoto operativo ni una respuesta del proveedor que deba archivarse como fuente.

Decisión:

`GOOGLE_WALLET_ORIGINAL_PAYLOAD_STATE = MODELO_DOCUMENTADO_SIN_BINDING_REMOTO`

Reglas:

1. el JWT generado por VENTO no se convierte en payload original del proveedor;
2. issuer, class y object ID permanecen referencias de configuración/modelo;
3. no se inventa una respuesta remota para satisfacer la matriz;
4. cualquier binding futuro deberá definir qué receipt o respuesta merece preservación y qué campos son suficientes antes de activarse.

---

#### 20. `VENTO-EXTERNAL-ORIGINAL-PAYLOAD-MATRIX-001`

| ID            | Sistema / plataforma                     | Naturaleza de la superficie actual                      | Clasificación primaria                            | Estado técnico del corte                                              | Decisión materializada                                                                                                                                     |
| ------------- | ---------------------------------------- | ------------------------------------------------------- | ------------------------------------------------- | --------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `EXT-SYS-001` | Supabase                                 | plataforma interna compartida y fronteras propietarias  | `GOBERNADA_POR_CONTRATO_INTERNO_VENTO`            | `SEGUN_CONTRATO_PROPIETARIO`                                          | no existe archivo universal de requests; el contrato aplica cuando una frontera Supabase actúa como adaptador de un proveedor externo                      |
| `EXT-SYS-002` | Wompi                                    | webhook externo que puede producir efecto de pago       | `PRESERVACION_DURABLE_DE_ENTRADA_REQUERIDA`       | `IMPLEMENTADO_PARCIAL_NO_INMUTABLE_Y_DUPLICADO`                       | conservar fuente protegida y receipt antes del hecho; evitar duplicación en transacción y evitar que redelivery reemplace evidencia previa                 |
| `EXT-SYS-003` | RevenueCat                               | webhook externo de suscripción/entitlement              | `PRESERVACION_DURABLE_DE_ENTRADA_REQUERIDA`       | `NO_CONFORME_DUPLICADO_EN_FILAS_EMPRESARIALES_Y_SIN_RAW_BYTES`        | capturar raw body antes de firma/parseo; almacenar evidencia separada; suscripción y auditoría conservan referencias y campos mínimos, no payload completo |
| `EXT-SYS-004` | Resend                                   | envío outbound y respuesta técnica                      | `NO_RETENER_PAYLOAD_COMPLETO_POR_MINIMIZACION`    | `RESPUESTA_EXITOSA_NO_PERSISTIDA_Y_ERROR_TECNICO_PARCIAL_EN_METADATA` | conservar receipt/ref y error normalizado cuando exista; no copiar body/respuesta completa dentro de invitación                                            |
| `EXT-SYS-005` | Expo / EAS Update                        | configuración de plataforma sin contrato I/O acreditado | `CONFIGURACION_PLATAFORMA_SIN_PAYLOAD_ACREDITADO` | `SIN_PAYLOAD_EXTERNO_ACREDITADO`                                      | no inventar evidencia fuente; si se materializa API o callback futuro, aplicar este contrato antes de activación                                           |
| `EXT-SYS-006` | Expo Push Service                        | envío outbound por destino y respuesta técnica          | `NO_RETENER_PAYLOAD_COMPLETO_POR_MINIMIZACION`    | `RESPUESTA_TECNICA_TRANSITORIA`                                       | conservar solo receipt/error/ref necesarios; el anuncio canónico y la operación de entrega son la fuente VENTO                                             |
| `EXT-SYS-007` | Sentry                                   | telemetría outbound                                     | `NO_RETENER_PAYLOAD_COMPLETO_POR_MINIMIZACION`    | `TELEMETRIA_SALIENTE`                                                 | no crear archivo espejo de telemetría de proveedor; correlación futura utiliza referencias y evidencia mínima                                              |
| `EXT-SYS-008` | Google Maps / Google Reviews             | consulta read-only y normalización de respuesta         | `NO_RETENER_PAYLOAD_COMPLETO_POR_MINIMIZACION`    | `RESPUESTA_NORMALIZADA_TRANSITORIA_SIN_PERSISTENCIA_COMPLETA`         | mantener solo los campos necesarios o mapping explícito; respuesta completa no se conserva por defecto                                                     |
| `EXT-SYS-009` | Apple Wallet / PassKit + APNs            | operaciones de recurso, lecturas y señal outbound       | `PRESERVACION_MINIMA_DE_OPERACION_POR_RECURSO`    | `EVIDENCIA_ESTRUCTURADA_SIN_ARCHIVO_RAW_GENERAL`                      | conservar receipt de operación y refs de recurso; no archivar auth token ni bodies completos indiscriminadamente                                           |
| `EXT-SYS-010` | Vercel                                   | hosting/configuración sin API administrativa acreditada | `CONFIGURACION_PLATAFORMA_SIN_PAYLOAD_ACREDITADO` | `SIN_PAYLOAD_EXTERNO_ACREDITADO`                                      | no inventar request/response; futura automatización vuelve a esta política                                                                                 |
| `EXT-SYS-011` | Zebra BrowserPrint                       | adaptador local y contenido ZPL generado por VENTO      | `NO_RETENER_PAYLOAD_COMPLETO_POR_MINIMIZACION`    | `CONTENIDO_OUTBOUND_LOCAL_SIN_EVIDENCIA_FUENTE_EXTERNA`               | conservar identidad de job, hash, plantilla/versión, impresora y resultado en su contrato propietario; no crear archivo raw externo por defecto            |
| `EXT-SYS-012` | Google Wallet / Google Pay & Wallet      | modelo de payload/JWT sin binding remoto acreditado     | `MODELO_DOCUMENTADO_SIN_BINDING_REMOTO`           | `SIN_RESPUESTA_REMOTA_ACREDITADA`                                     | no conservar una interacción que no está acreditada; binding futuro define receipt/payload necesario                                                       |
| `EXT-SYS-013` | POS externo vigente                      | proveedor, interfaz y payload no acreditados            | `BLOQUEADA_SIN_BINDING`                           | `BLOCKED`                                                             | `INT-POS-001` debe acreditar proveedor, payloads y sensibilidad antes de fijar captura y preservación                                                      |
| `EXT-SYS-014` | Shopify / comercio electrónico           | binding no acreditado                                   | `NO_APLICA_SIN_BINDING`                           | `NOT_APPLICABLE`                                                      | no se inventa retención de order/customer/product payload sin contrato real                                                                                |
| `EXT-SYS-015` | Rappi / marketplace                      | binding no acreditado                                   | `NO_APLICA_SIN_BINDING`                           | `NOT_APPLICABLE`                                                      | no se inventa payload ni conservación sin binding                                                                                                          |
| `EXT-SYS-016` | ManyChat / automatización conversacional | binding no acreditado                                   | `NO_APLICA_SIN_BINDING`                           | `NOT_APPLICABLE`                                                      | no se inventa payload conversacional ni archivo sin API/bot acreditado                                                                                     |
| `EXT-SYS-017` | WhatsApp                                 | proveedor/API/binding no acreditados                    | `NO_APLICA_SIN_BINDING`                           | `NOT_APPLICABLE`                                                      | número, mensaje o conversación no se archivan por inferencia sin proveedor, contrato, clasificación y finalidad                                            |
| `EXT-SYS-018` | Instagram / social                       | API/binding no acreditados                              | `NO_APLICA_SIN_BINDING`                           | `NOT_APPLICABLE`                                                      | no se inventa preservación de mensajes, perfiles o eventos sin binding                                                                                     |
| `EXT-SYS-019` | Correo corporativo y alias funcionales   | proveedor e integración no acreditados                  | `NO_APLICA_SIN_BINDING`                           | `NOT_APPLICABLE`                                                      | correo/alias como canal no define por sí solo qué mensajes o payloads deben preservarse                                                                    |
| `EXT-SYS-020` | Telefonía / voz                          | operador, interfaz y payload no acreditados             | `BLOQUEADA_SIN_BINDING`                           | `BLOCKED`                                                             | `TI-INT-003` debe acreditar operador, interfaz, grabaciones/eventos y sensibilidad antes de definir preservación                                           |
| `EXT-SYS-021` | Transporte externo                       | proveedor, tracking e interfaz no acreditados           | `NO_APLICA_SIN_BINDING`                           | `NOT_APPLICABLE`                                                      | tracking o guía no autorizan archivar payloads de un proveedor no acreditado                                                                               |

Reconciliación:

```text
PRESERVACION_DURABLE_DE_ENTRADA_REQUERIDA = 002,003 = 2
PRESERVACION_MINIMA_DE_OPERACION_POR_RECURSO = 009 = 1
NO_RETENER_PAYLOAD_COMPLETO_POR_MINIMIZACION = 004,006,007,008,011 = 5
GOBERNADA_POR_CONTRATO_INTERNO_VENTO = 001 = 1
CONFIGURACION_PLATAFORMA_SIN_PAYLOAD_ACREDITADO = 005,010 = 2
MODELO_DOCUMENTADO_SIN_BINDING_REMOTO = 012 = 1
NO_APLICA_SIN_BINDING = 014,015,016,017,018,019,021 = 7
BLOQUEADA_SIN_BINDING = 013,020 = 2
TOTAL = 21
```

---

#### 21. Regla para bindings futuros

Una identidad actualmente `NO_APLICA_SIN_BINDING`, `BLOQUEADA_SIN_BINDING`, `CONFIGURACION_PLATAFORMA_SIN_PAYLOAD_ACREDITADO` o `MODELO_DOCUMENTADO_SIN_BINDING_REMOTO` no puede activar un intercambio nuevo sin resolver previamente:

1. proveedor e instancia;
2. superficie y dirección;
3. contrato I/O y versión;
4. autenticidad aplicable;
5. identificadores externos y mapping;
6. identidad idempotente cuando exista efecto;
7. sensibilidad del payload;
8. si requiere `RAW_SOURCE_BYTES`, objeto fuente o solo receipt mínimo;
9. campos o headers que deben excluirse por contener secretos;
10. clasificación y acceso;
11. política de retención aplicable;
12. preservación o hold cuando corresponda;
13. forma de disposición;
14. referencia de evidencia y correlación con el hecho interno.

No se permite activar tráfico y decidir después qué evidencia debía haberse conservado.

---

#### 22. Relación con mapping, idempotencia y autenticidad

Las cuatro responsabilidades permanecen separadas:

```text
AUTENTICIDAD
→ ¿LA AFIRMACIÓN PUEDE ATRIBUIRSE A LA FUENTE ESPERADA?
```

```text
IDEMPOTENCIA
→ ¿ESTA OPERACIÓN YA FUE RECLAMADA Y QUÉ RESULTADO DEBE RECUPERARSE?
```

```text
MAPPING
→ ¿A QUÉ RECURSO CANÓNICO CORRESPONDE LA REFERENCIA EXTERNA?
```

```text
EVIDENCIA FUENTE
→ ¿QUÉ ENTREGÓ REALMENTE EL PROVEEDOR Y QUÉ HUELLA LO DEMUESTRA?
```

Reglas:

1. un payload auténtico puede ser duplicado;
2. un payload deduplicable puede apuntar a un mapping no resuelto;
3. un mapping resuelto no demuestra que el payload recibido sea auténtico;
4. una huella demuestra integridad de la fuente preservada, no autorización empresarial;
5. el payload completo no se utiliza como primary key de mapping;
6. el payload completo no sustituye `operation_key`;
7. receipt, mapping, operation y evidencia conservan IDs separados y correlacionables.

---

#### 23. Handoffs y condiciones de salida

| Trabajo derivado                                               | Estado                    | Propietario / tarea responsable | Condición de salida                                                                                                                                            |
| -------------------------------------------------------------- | ------------------------- | ------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Contrato compartido de evento externo recibido                 | `FUERA_DE_ALCANCE`        | `SHELL-CON-019`                 | el contrato consumible representa sistema, ambiente, receipt, evidencia fuente, huella, autenticidad, mapping, idempotencia y correlación sin exponer secretos |
| Contrato compartido de mapping                                 | `FUERA_DE_ALCANCE`        | `SHELL-CON-022`                 | la referencia de evidencia puede relacionarse con mappings tipados sin usar el payload como identidad                                                          |
| Contrato compartido de idempotencia y conciliación             | `FUERA_DE_ALCANCE`        | `SHELL-CON-023`                 | operación, receipt y evidencia permanecen separadas y recuperables                                                                                             |
| Preservación y archivo externo gobernados                      | `FUERA_DE_ALCANCE`        | `INFO-INT-001`                  | la implementación consumible conserva clasificación, fuente, versión, retención, hold, disposición, integridad y evidencia conforme al gobierno de información |
| Disposición de entradas inválidas, conflictivas o no mapeables | `FUERA_DE_ALCANCE`        | `INT-EXT-016` / `SHELL-CON-024` | la entrada no procesable tiene rechazo o cuarentena explícitos sin contaminar el flujo normal de evidencia                                                     |
| Auditoría, métricas, alertas y conciliación de evidencia       | `FUERA_DE_ALCANCE`        | `INT-EXT-017`                   | acceso, conflicto, ausencia de evidencia, duplicados y reconciliación quedan reconstruibles sin copiar payload sensible en auditoría ordinaria                 |
| Binding y payload del POS vigente                              | `BLOQUEADO_POR_EVIDENCIA` | `INT-POS-001`                   | proveedor, interfaz, payload, IDs y sensibilidad quedan acreditados antes de seleccionar conservación                                                          |
| Operador, interfaz y payload de telefonía/voz                  | `BLOQUEADO_POR_EVIDENCIA` | `TI-INT-003`                    | proveedor/operador, interfaz, eventos, grabaciones y sensibilidad quedan acreditados antes de seleccionar conservación                                         |

No queda una decisión sustantiva de preservación sin propietario documental y condición de salida.

---

#### 24. Fronteras reservadas a `INT-EXT-015` a `INT-EXT-020`

| Materia                                                     | Tarea propietaria |
| ----------------------------------------------------------- | ----------------- |
| rate limits, retry, backoff y circuit breaker               | `INT-EXT-015`     |
| cuarentena o dead-letter                                    | `INT-EXT-016`     |
| auditoría, métricas, alertas y conciliación                 | `INT-EXT-017`     |
| contingencia ante indisponibilidad del proveedor            | `INT-EXT-018`     |
| retiro de integración y revocación de credenciales          | `INT-EXT-019`     |
| prohibición de credenciales compartidas entre integraciones | `INT-EXT-020`     |

Esta tarea no fija presupuestos de tráfico, número de intentos, cadence, reintentos, backoff, circuit breaker, política de dead-letter, alertas ni procedimiento de contingencia.

---

#### 25. Prohibiciones

Queda prohibido:

1. usar una tabla empresarial como archivo general de payload externo;
2. copiar el mismo payload completo en entidad empresarial y auditoría;
3. exponer payload protegido a un usuario únicamente porque puede consultar la entidad canónica relacionada;
4. reemplazar evidencia histórica durante una redelivery;
5. reserializar y afirmar que el resultado representa los bytes exactos cuando el protocolo depende del raw body;
6. mezclar payloads entre ambientes;
7. conservar secretos de webhook, API keys, passwords, private keys o tokens de sesión dentro del payload protegido;
8. copiar todos los headers cuando basta una allowlist de metadata no secreta;
9. usar logs como almacenamiento de evidencia fuente;
10. usar auditoría como almacenamiento del body completo;
11. conservar indefinidamente porque no se conoce todavía una política de retención;
12. inventar un periodo universal de retención;
13. eliminar evidencia sujeta a preservación o hold vigente;
14. presentar backup como mecanismo de preservación canónica;
15. presentar una copia operativa como evidencia inmutable por el solo hecho de existir;
16. retener respuestas completas de consultas read-only sin finalidad acreditada;
17. archivar cada respuesta de Resend o Expo Push cuando un receipt mínimo sea suficiente;
18. crear un archivo espejo de Sentry dentro de VENTO por precaución genérica;
19. usar `place_id`, push token, UID de impresora, email o número telefónico como prueba de que el payload completo debe retenerse;
20. inventar payloads para Expo/EAS, Vercel, Google Wallet remoto o sistemas sin binding;
21. usar payload completo como clave idempotente o mapping canónico;
22. convertir la preservación de una afirmación externa en autorización del hecho;
23. definir retry/backoff de `INT-EXT-015`;
24. definir cuarentena de `INT-EXT-016`;
25. definir auditoría operativa de `INT-EXT-017`;
26. modificar código, Supabase, Storage, proveedor, secretos, endpoints o datos durante esta tarea;
27. cambiar las veintiuna identidades heredadas;
28. iniciar o desarrollar `INT-EXT-015`.

---

#### 26. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea materializa por identidad externa obligaciones ya protegidas por el registro vigente: preservar de forma protegida la afirmación y payload de una fuente externa antes del hecho interno cuando corresponda, minimizar contenido, impedir secretos en eventos o evidencia ordinaria, conservar huella/correlación y evitar que auditoría replique payload sensible. Los hallazgos actuales de Wompi y RevenueCat son diferencias de implementación frente a esos controles existentes y no introducen una familia verificable nueva.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

El registro canónico de requisitos permanece sin cambios.

---

#### 27. Criterios de aceptación

`INT-EXT-014` queda documentalmente completa cuando se cumplen simultáneamente:

1. se preservan exactamente `EXT-SYS-001` a `EXT-SYS-021`;
2. existen exactamente 21 decisiones primarias;
3. faltantes = 0;
4. duplicados = 0;
5. identificadores únicos = 21;
6. la distribución es exactamente `2 + 1 + 5 + 1 + 2 + 1 + 7 + 2 = 21`;
7. payload original, payload normalizado, hecho interno, auditoría y log permanecen separados;
8. preservación, retención, backup, archivo operativo y hold permanecen separados;
9. bytes raw se capturan antes de parsear cuando el mecanismo de autenticidad los requiera;
10. cada evidencia durable dispone de huella, ambiente, sistema, superficie, versión y correlación;
11. el payload fuente protegido no contiene secretos de autenticación reutilizables;
12. una redelivery no sobrescribe evidencia histórica;
13. mismo ID externo con huella distinta no reescribe el payload anterior;
14. filas empresariales no conservan por defecto el payload completo cuando una referencia protegida basta;
15. auditoría ordinaria no copia el payload completo;
16. logs no se usan como evidence store;
17. el acceso al hecho empresarial no concede acceso automático a la evidencia fuente;
18. no se fija un periodo universal de retención;
19. retención y disposición heredan políticas de gobierno de información;
20. un hold autorizado bloquea disposición sin modificar la fuente;
21. Wompi exige evidencia durable separada para el webhook de pago;
22. la duplicación actual de Wompi entre evento y `raw_response` no se presenta como diseño conforme;
23. el upsert actual de Wompi no se presenta como evidencia inmutable;
24. RevenueCat exige raw body cuando el perfil de autenticidad aprobado dependa de él;
25. RevenueCat no conserva el payload completo simultáneamente en suscripción y auditoría en el contrato objetivo;
26. Apple PassKit conserva evidencia mínima por recurso sin copiar auth token ni archivar todas las lecturas;
27. Resend y Expo Push conservan recibos/errores mínimos cuando existan, no respuestas completas por defecto;
28. Sentry no crea archivo espejo de telemetría en VENTO;
29. Google Places conserva respuesta normalizada/transitoria y no respuesta completa por defecto;
30. Zebra conserva referencias y hash del job bajo su contrato propietario sin convertir ZPL en payload externo fuente;
31. Supabase conserva gobierno por contrato interno;
32. Expo/EAS y Vercel no reciben payload ficticio;
33. Google Wallet permanece modelo sin binding remoto;
34. POS permanece bloqueado hasta `INT-POS-001`;
35. telefonía/voz permanece bloqueada hasta `TI-INT-003`;
36. los siete sistemas sin binding no reciben políticas físicas inventadas;
37. `SHELL-CON-019` conserva la materialización compartida del evento externo recibido;
38. `INFO-INT-001` conserva la frontera de preservación/archivo externo;
39. no se modifica código;
40. no se modifica Supabase;
41. no se crean buckets, tablas, RPC, Edge Functions ni registros físicos;
42. no se crean ni modifican requisitos de prueba;
43. `INT-EXT-015` permanece reservada.

---

#### 28. Resultado de la tarea

`INT-EXT-014` queda **APROBADA** como definición documental completa de conservación controlada del payload original para las veintiuna identidades externas.

Resultado consolidado:

- identidades materializadas: **21/21**;
- preservación durable de entrada requerida: **2**;
- preservación mínima por recurso: **1**;
- superficies donde no se conserva payload completo por minimización: **5**;
- plataforma gobernada por contrato interno: **1**;
- configuraciones sin payload acreditado: **2**;
- modelo sin binding remoto: **1**;
- identidades sin binding a las que no aplica conservación actual: **7**;
- identidades bloqueadas sin binding: **2**;
- periodos numéricos de retención inventados: **0**;
- cambios físicos: **0**;
- requisitos creados o modificados: **0**.

Invariante final:

```text
AFIRMACIÓN EXTERNA MATERIAL
+
CAPTURA FIEL CUANDO CORRESPONDA
+
HUELLA
+
CUSTODIA PROTEGIDA
+
REFERENCIAS DE AUTENTICIDAD / MAPPING / IDEMPOTENCIA
+
RETENCIÓN GOBERNADA
=
EVIDENCIA FUENTE RECONSTRUIBLE
SIN CONVERTIR EL PAYLOAD EN HECHO EMPRESARIAL
NI DUPLICARLO EN AUDITORÍA ORDINARIA
```

---

ÚLTIMA TAREA APROBADA

`INT-EXT-013 — Definir mapeo de identificadores externos y canónicos`

TAREA ACTUAL APROBADA

`INT-EXT-014 — Definir conservación controlada del payload original`

SIGUIENTE TAREA RESERVADA

`INT-EXT-015 — Definir rate limits, reintentos, backoff y circuit breaker`


### ✅ INT-EXT-015 — Definir rate limits, reintentos, backoff y circuit breaker

**Estado:** APROBADA
**Tarea anterior:** `INT-EXT-014 — Definir conservación controlada del payload original` — APROBADA
**Tarea siguiente:** `INT-EXT-016 — Definir cuarentena o dead-letter` — RESERVADA
**Tipo de tarea:** documental; definición normativa y materializada de límites de tasa, elegibilidad de reintentos, presupuestos, backoff, tratamiento de `Retry-After`, resultado desconocido, circuit breaker, bulkheads y drenaje controlado para `EXT-SYS-001` a `EXT-SYS-021`, especializando la política transversal vigente sin crear mecanismos físicos ni modificar código, Supabase, proveedores, endpoints o datos
**Bloque:** X — Integraciones
**Mini-bloque:** Integraciones externas y credenciales
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/02_INTEGRACIONES_EXTERNAS_Y_CREDENCIALES.md`
**Implementación física autorizada:** ninguna
**Cambios de código, DDL, DML, migraciones, RLS, RPC, Edge Functions, colas, workers, schedulers, circuit breakers físicos, secretos, credenciales, endpoints, despliegues o datos:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir cómo cada integración externa de VENTO limita presión sobre proveedores y sobre sus propias fronteras, cuándo una misma operación puede volver a intentarse, cuánto puede durar ese presupuesto, cómo se calcula la demora entre intentos y cómo se aísla una dependencia degradada sin perder trabajo ni convertir un fallo técnico en un efecto empresarial nuevo.

La tarea separa obligatoriamente:

```text
RATE LIMIT
≠
RETRY
≠
BACKOFF
≠
CIRCUIT BREAKER
≠
BULKHEAD
≠
IDEMPOTENCIA
≠
CONCILIACIÓN
≠
CUARENTENA / DEAD-LETTER
≠
CONTINGENCIA EMPRESARIAL
```

Y también:

```text
REDELIVERY DEL PROVEEDOR
≠
REINTENTO OUTBOUND DE VENTO
≠
REPROCESAMIENTO INTERNO DE UN RECEIPT YA CAPTURADO
```

Un reintento nunca crea una operación nueva. Conserva la identidad, huella, finalidad, recurso, audiencia y contrato aprobados y solo cambia la identidad técnica del intento.

---

#### 2. Resultado sustantivo

Se aprueban dos artefactos documentales internos:

1. `VENTO-EXTERNAL-RETRY-RESILIENCE-CONTRACT-001`, especialización externa de rate limiting, retry, backoff, circuit breaker y bulkheads sobre la política transversal ya aprobada.
2. `VENTO-EXTERNAL-RETRY-RESILIENCE-MATRIX-001`, decisión materializada para las veintiuna identidades `EXT-SYS-*`.

Balance:

| Control                                              | Resultado |
| ---------------------------------------------------- | --------: |
| Identidades esperadas                                |    **21** |
| Identidades materializadas                           | **21/21** |
| Identificadores `EXT-SYS-*` únicos                   |    **21** |
| Faltantes                                            |     **0** |
| Duplicados                                           |     **0** |
| `GOBERNADA_POR_CONTRATO_INTERNO_VENTO`               |     **1** |
| `WEBHOOK_INBOUND_REDELIVERY_GOBERNADA_POR_PROVEEDOR` |     **2** |
| `OUTBOUND_PROVIDER_RATE_LIMITED`                     |     **2** |
| `BEST_EFFORT_OBSERVABILITY_ISOLATED`                 |     **1** |
| `INTERACTIVE_READ_ONLY_PROVIDER_CALL`                |     **1** |
| `HYBRID_RESOURCE_AND_PUSH_BY_SURFACE`                |     **1** |
| `CONFIGURATION_NO_RUNTIME_RETRY_CONTRACT`            |     **2** |
| `PHYSICAL_EFFECT_UNKNOWN_OUTCOME_GUARDED`            |     **1** |
| `MODEL_NO_REMOTE_BINDING`                            |     **1** |
| `NO_APLICA_SIN_BINDING`                              |     **7** |
| `BLOQUEADA_SIN_BINDING`                              |     **2** |
| Cuotas numéricas de proveedor inventadas             |     **0** |
| Umbrales numéricos de circuit breaker inventados     |     **0** |
| Cambios físicos                                      |     **0** |
| Requisitos de prueba creados o modificados           |     **0** |

Reconciliación:

```text
1 + 2 + 2 + 1 + 1 + 1 + 2 + 1 + 1 + 7 + 2 = 21
```

La tarea no crea una política paralela de reintentos. Consume `ENTERPRISE-EVENT-RETRY-POLICY-001@1.0.0` y fija qué parte de esa política aplica a cada frontera externa.

---

#### 3. Entradas canónicas preservadas

La tarea consume y conserva sin redefinir:

- `VENTO-EXTERNAL-SYSTEM-INVENTORY-001` y las veintiuna identidades `EXT-SYS-001` a `EXT-SYS-021`;
- principal técnico, credenciales, mecanismos, alcance, ambientes, custodia y lifecycle aprobados en `INT-EXT-002` a `INT-EXT-008`;
- `VENTO-EXTERNAL-IO-CONTRACT-001` y su matriz versionada de `INT-EXT-009`;
- `VENTO-EXTERNAL-DELIVERY-STRATEGY-001` y su matriz de `INT-EXT-010`, incluida la distribución de dos `WEBHOOK`, cero `POLLING`, una `HIBRIDA_PUSH_PULL`, dieciséis `NO_APLICA_RECEPCION_ASINCRONA` y dos `BLOQUEADA_SIN_BINDING`;
- autenticidad, origen, timestamp y replay de `INT-EXT-011`;
- `VENTO-EXTERNAL-IDEMPOTENCY-CONTRACT-001` de `INT-EXT-012`;
- `VENTO-EXTERNAL-ID-MAPPING-CONTRACT-001` de `INT-EXT-013`;
- `VENTO-EXTERNAL-ORIGINAL-PAYLOAD-CUSTODY-001` de `INT-EXT-014`;
- `ENTERPRISE-EVENT-RETRY-POLICY-001@1.0.0` de `INT-APP-005`;
- la cobertura vigente de `TREQ-INTEGRATION-003`, `TREQ-INTEGRATION-004` y `TREQ-INTEGRATION-138` a `TREQ-INTEGRATION-167`;
- `SHELL-CON-019`, `SHELL-CON-022` y `SHELL-CON-023` como contratos compartidos posteriores de evento recibido, mapping e idempotencia/conciliación;
- `QUEUE-ARC-006`, `QUEUE-ARC-008`, `QUEUE-ARC-009`, `QUEUE-ARC-011` y `QUEUE-ARC-012` como destinos de materialización física de retry, fallos, concurrencia, métricas y autorización de trabajos;
- `CONT-INT-003` y `CONT-INT-004` para dependencia externa, salud, reincorporación y retorno controlado al servicio normal;
- la propiedad de cada dominio VENTO sobre el hecho empresarial y su recuperación.

Nada de lo definido aquí cambia una clave idempotente, autoriza una operación, sustituye una política de continuidad o crea una cola física.

---

#### 4. Herencia obligatoria de `ENTERPRISE-EVENT-RETRY-POLICY-001@1.0.0`

Toda operación externa reintentable deberá consumir la política transversal vigente en lugar de definir números locales arbitrarios.

Invariantes heredados:

1. el primer envío cuenta como intento uno;
2. la misma operación conserva clave idempotente, huella, payload lógico, recurso, audiencia y finalidad;
3. solo cambian `attempt_id`, `delivery_id`, tiempos, conexión, worker o traza técnica;
4. un error desconocido no habilita retry automático;
5. la autorización, contexto y vigencia se revalidan antes de cualquier intento que pueda producir o revelar un efecto;
6. el presupuesto termina al alcanzar primero intentos, edad, cancelación, expiración, error permanente o pérdida de autoridad;
7. agotar reintentos no ejecuta compensación ni declara éxito;
8. un timeout no se convierte en fracaso seguro cuando el receptor pudo haber aplicado el efecto;
9. una redelivery legítima conserva identidad de operación y nunca se transforma en un hecho nuevo;
10. un componente local no puede ampliar los presupuestos máximos aprobados.

---

#### 5. Taxonomía cerrada de error y disposición

`VENTO-EXTERNAL-RETRY-RESILIENCE-CONTRACT-001` reutiliza exactamente las doce clases de la política transversal:

| Clase                    | Disposición                                                  |
| ------------------------ | ------------------------------------------------------------ |
| `TRANSIENT_CONNECTIVITY` | retry automático dentro del perfil aplicable                 |
| `TRANSIENT_DEPENDENCY`   | retry automático dentro del perfil aplicable                 |
| `RATE_LIMITED`           | esperar `Retry-After` o presupuesto local compatible         |
| `CONCURRENCY_RETRYABLE`  | retry automático solo con claim/lease seguro                 |
| `OUT_OF_ORDER_WAIT`      | esperar dependencia; no sondeo agresivo                      |
| `AUTH_REFRESH_REQUIRED`  | refrescar mecanismo autorizado y reevaluar antes de reenviar |
| `UNKNOWN_OUTCOME`        | consultar o conciliar antes de reejecutar                    |
| `PERMANENT_CONTRACT`     | no retry automático                                          |
| `PERMANENT_BUSINESS`     | no retry automático                                          |
| `SECURITY_DENIED`        | no retry automático                                          |
| `CONFLICTING_REUSE`      | no retry automático                                          |
| `CANCELLED_OR_EXPIRED`   | no retry automático                                          |

Reglas externas adicionales:

- un `429` se clasifica `RATE_LIMITED` cuando el contrato lo acredita;
- un `5xx` no se clasifica automáticamente como transitorio sin considerar la semántica del proveedor y si el resultado pudo quedar confirmado;
- `401` o credencial expirada puede convertirse en `AUTH_REFRESH_REQUIRED`, pero solo si el lifecycle aprobado permite renovar y reautorizar;
- `403`, firma inválida, contrato revocado o payload incompatible no se convierten en retry mediante fallback;
- un texto de error, excepción SDK o código HTTP aislado no altera esta taxonomía.

---

#### 6. Perfiles canónicos reutilizados

Los máximos contractuales vigentes se conservan sin modificación:

| Perfil                        | Intentos totales |     Base | Tope por demora | Edad máxima |
| ----------------------------- | ---------------: | -------: | --------------: | ----------: |
| `RETRY_NONE`                  |            **1** |      `0` |             `0` |         `0` |
| `RETRY_INTERACTIVE_SAFE`      |            **3** | `500 ms` |           `5 s` |      `30 s` |
| `RETRY_OWNER_COMMAND`         |            **6** |    `2 s` |         `2 min` |    `30 min` |
| `RETRY_EVENT_STANDARD`        |           **12** |    `5 s` |        `15 min` |      `24 h` |
| `RETRY_EVENT_CRITICAL`        |           **20** |    `2 s` |        `10 min` |      `72 h` |
| `RETRY_PROVIDER_RATE_LIMITED` |           **12** |   `30 s` |           `6 h` |       `7 d` |
| `RETRY_OFFLINE_SYNC`          |           **20** |   `10 s` |        `30 min` |       `7 d` |
| `RETRY_OUT_OF_ORDER`          |           **20** |   `30 s` |           `1 h` |      `72 h` |

Estos valores son techos, no objetivos de consumo. Una operación puede terminar en el primer intento o detenerse antes por resultado definitivo, cancelación, expiración, autorización o error permanente.

Una integración externa no puede crear `RETRY_WOMPI`, `RETRY_RESEND`, `RETRY_EXPO` u otro perfil local nuevo sin versionar primero la política transversal correspondiente.

---

#### 7. Backoff obligatorio

Cuando un perfil permita retry automático, se reutiliza `EXPONENTIAL_FULL_JITTER`:

```text
exponential_ceiling = min(delay_cap, base_delay × 2^(n - 2))
next_delay = random_uniform(0, exponential_ceiling)
```

Reglas:

1. `n` representa el número del nuevo intento posterior al primero;
2. el jitter se calcula por operación e intento;
3. no existe una demora fija universal para todos los proveedores;
4. el scheduler no puede adelantar un instante impuesto por el proveedor;
5. reiniciar proceso, función, dispositivo o worker no reinicia el presupuesto;
6. el estado durable conserva `first_attempt_at`, `attempt_number` y `next_attempt_at` cuando exista ejecución asíncrona;
7. el tiempo de espera por circuit breaker abierto no consume un nuevo intento de envío, aunque sí consume la edad máxima de la operación.

---

#### 8. Contrato de rate limiting

Rate limiting gobierna capacidad y cuota; no decide por sí solo idempotencia ni éxito.

Toda superficie outbound activa deberá poder resolver conceptualmente:

```text
EXTERNAL_SYSTEM_ID
+
ENVIRONMENT
+
PROVIDER / INSTANCE
+
CREDENTIAL_REF O PRINCIPAL_REF CUANDO APLIQUE
+
ENDPOINT / SURFACE
+
OPERATION_KIND
+
QUOTA_OR_RATE_POLICY_REF
→ BUCKET DE LÍMITE INDEPENDIENTE
```

Reglas:

1. las cuotas no se comparten entre development, staging y production;
2. una cuota de una credencial o tenant no se evade rotando worker, proceso o credencial;
3. una cuota de un endpoint no se interpreta como permiso para saturar otro endpoint del mismo proveedor;
4. cuando el proveedor entregue `Retry-After` o equivalente válido:

```text
next_attempt_at = max(calculated_backoff_at, provider_retry_after_at)
```

5. un `Retry-After` inválido no produce retry inmediato; se utiliza el perfil local y se registra la anomalía;
6. si la espera exigida excede la edad máxima de la operación, el resultado sale a conciliación o intervención según el contrato, no a un envío tardío silencioso;
7. no se inventa un número de requests por segundo cuando las fuentes actuales no acreditan la cuota del proveedor;
8. una cuota numérica física solo puede declararse validada cuando exista fuente de proveedor, configuración o evidencia operativa vigente;
9. `QUEUE-ARC-006` deberá materializar los límites operativos por binding antes de activar workers o schedulers que los necesiten;
10. `QUEUE-ARC-011` deberá medir espera, tasa, throttling y error sin copiar payload sensible.

Para webhooks inbound, la protección de capacidad de VENTO se mantiene separada de la cuota outbound. La recepción no se convierte en una operación outbound reintentable y un control de admisión no puede descartar silenciosamente una entrega ya autenticada que deba conservar receipt o evidencia.

---

#### 9. Circuit breaker y bulkheads

El circuit breaker protege a VENTO y al proveedor frente a una dependencia degradada. No es una cola, no es una compensación y no demuestra que una operación haya fallado.

Estados lógicos:

| Estado      | Semántica                                                                                        |
| ----------- | ------------------------------------------------------------------------------------------------ |
| `CLOSED`    | los intentos elegibles pueden pasar dentro de rate limit, concurrencia y presupuesto             |
| `OPEN`      | se suspenden nuevos intentos contra el destino degradado; el trabajo conserva identidad y estado |
| `HALF_OPEN` | se habilita un número limitado de probes controlados para comprobar recuperación                 |

Reglas:

1. el breaker se delimita como mínimo por sistema externo, ambiente, superficie y destino material; no existe un breaker global que derribe integraciones sanas;
2. un `PERMANENT_BUSINESS`, `SECURITY_DENIED` o `CONFLICTING_REUSE` no se usa como señal de salud del proveedor;
3. `RATE_LIMITED` activa la espera de cuota y puede contribuir a degradación de capacidad, pero no se reinterpreta automáticamente como caída total;
4. `TRANSIENT_DEPENDENCY`, fallos de conexión y respuestas de servicio degradado pueden alimentar la política del breaker cuando el binding lo defina;
5. el breaker abierto no consume intentos de envío adicionales;
6. la edad máxima sigue transcurriendo mientras el circuito permanece abierto;
7. `HALF_OPEN` usa probes limitados y nunca libera todo el backlog;
8. un probe no cambia la identidad empresarial de las operaciones pendientes;
9. cerrar el breaker no confirma trabajo que todavía no se ha ejecutado;
10. reabrirlo no elimina backlog ni receipts;
11. los umbrales físicos de error, ventana, tiempo abierto y número de probes deben ser versionados por binding en E4 antes de implementación; esta tarea no inventa valores numéricos sin evidencia;
12. bulkheads separan como mínimo proveedores, aplicaciones, consumidoras y clases de criticidad para impedir cascadas;
13. una prioridad crítica no permite starvation indefinido de trabajo ordinario ni bypass de idempotencia o rate limits;
14. el restablecimiento aplica drenaje controlado con jitter y límites de concurrencia.

---

#### 10. Resultado desconocido antes de cualquier nuevo envío

Cuando una llamada pudo llegar al proveedor pero la respuesta se perdió:

```text
UNKNOWN_OUTCOME
→ CONSULTAR POR CLAVE / EVENT ID / ID EXTERNO / RECEIPT
   ├── CONFIRMADO → recuperar resultado; no reenviar
   ├── NO APLICADO DEMOSTRADO → mismo operation ref puede reintentarse
   └── INDETERMINADO → RECONCILIATION_REQUIRED
```

Reglas:

1. pagos, correos entregados, push, actualizaciones Wallet, movimientos físicos e impresiones no se repiten a ciegas;
2. un timeout no es prueba de fracaso;
3. si el proveedor no ofrece consulta y VENTO no conserva receipt suficiente, el contrato no autoriza auto-retry de una operación irreversible o perceptible por el usuario;
4. una repetición intencional del usuario usa una nueva generación o intención cuando el proceso lo permita;
5. la resolución posterior de estados inciertos pertenece a `INT-EXT-017`; la disposición de fallos no procesables pertenece a `INT-EXT-016`.

---

#### 11. Separación entre redelivery inbound y retry outbound

##### 11.1. Webhook inbound

Para Wompi y RevenueCat:

```text
PROVEEDOR REENVÍA
→ VENTO AUTENTICA
→ IDENTIFICA RECEIPT / EVENTO
→ DEDUPLICA
→ CONSERVA EVIDENCIA SEGÚN INT-EXT-014
→ PROCESA O RECUPERA RESULTADO
```

VENTO no genera un segundo webhook contra sí mismo ni crea un loop outbound al proveedor para “reintentar” la recepción.

Si el procesamiento interno posterior al receipt falla de forma transitoria, ese trabajo interno usa los perfiles de evento aplicables y la misma identidad capturada; no se inventa un nuevo evento externo.

##### 11.2. Operación outbound

Para una llamada iniciada por VENTO:

```text
OPERACIÓN VENTO ESTABLE
→ RATE LIMIT
→ BREAKER
→ INTENTO
→ CLASIFICAR RESPUESTA
→ RESULTADO O NEXT_ATTEMPT_AT
```

El orden evita enviar primero y preguntar después si existía cuota, circuito abierto o presupuesto agotado.

---

#### 12. Wompi — `EXT-SYS-002`

Clasificación primaria:

`WEBHOOK_INBOUND_REDELIVERY_GOBERNADA_POR_PROVEEDOR`

Superficie actual:

- checkout basado en URL generada por VENTO;
- webhook de pago como entrada asíncrona acreditada;
- no existe polling puro acreditado para descubrir el estado del pago.

Decisión:

1. el webhook recibido no usa un perfil de retry outbound VENTO;
2. una redelivery de Wompi conserva `source_system + provider_event_id` o el receipt estable definido por `INT-EXT-012`;
3. el procesamiento interno de un receipt de pago, cuando deba diferirse, usa `RETRY_EVENT_CRITICAL` por criticidad de pago, sin crear otro evento externo;
4. `UNKNOWN_OUTCOME` del efecto de pago exige consulta/conciliación antes de cualquier nuevo cobro;
5. el checkout actual no ejecuta una llamada API de creación de intención al proveedor; construir de nuevo una URL no se interpreta como retry de un request remoto;
6. no se acredita un rate limit numérico de Wompi en las fuentes actuales;
7. un breaker futuro de dependencia Wompi debe aislar la superficie externa sin eliminar receipts ya recibidos;
8. cualquier política física queda vinculada a `QUEUE-ARC-006` y a la conciliación de `SHELL-CON-023`.

Estado técnico observado:

`WOMPI_RETRY_RESILIENCE_STATE = REDELIVERY_DEDUP_PARCIAL_SIN_RATE_LIMIT_O_BREAKER_ACREDITADO`

El webhook actual reconoce eventos previamente procesados, pero no implementa rate limiting, scheduler de reintentos, backoff ni circuit breaker.

---

#### 13. RevenueCat — `EXT-SYS-003`

Clasificación primaria:

`WEBHOOK_INBOUND_REDELIVERY_GOBERNADA_POR_PROVEEDOR`

Decisión:

1. el webhook de entitlement es entrada inbound; VENTO no lo reenvía al proveedor;
2. una redelivery debe converger sobre la misma identidad idempotente de `INT-EXT-012`;
3. el procesamiento interno de un receipt válido puede utilizar `RETRY_EVENT_CRITICAL` cuando la actualización de entitlement sea material, preservando la misma operación;
4. compra y restore del SDK son operaciones bajo demanda y no se convierten en polling ni en loops custom de retry sin contrato del SDK;
5. un resultado incierto de compra/restore se resuelve mediante estado/restauración/conciliación, no mediante una segunda compra ciega;
6. no se acredita una cuota numérica de RevenueCat en las fuentes actuales;
7. el breaker de la dependencia no puede revocar un entitlement ya confirmado ni convertir ausencia temporal del proveedor en expiración empresarial;
8. `QUEUE-ARC-006` materializará cualquier trabajo diferido; `INT-EXT-017` conserva la conciliación.

Estado técnico observado:

`REVENUECAT_RETRY_RESILIENCE_STATE = SIN_DEDUP_DURABLE_RETRY_BACKOFF_RATE_LIMIT_NI_BREAKER_ACREDITADOS`

La función actual procesa una entrega en línea y no evidencia claim durable, política de reintento, backoff o circuit breaker.

---

#### 14. Resend — `EXT-SYS-004`

Clasificación primaria:

`OUTBOUND_PROVIDER_RATE_LIMITED`

Perfil objetivo ordinario:

`RETRY_PROVIDER_RATE_LIMITED`

Reglas:

1. la unidad de operación es una generación de entrega de invitación, no solamente el correo destinatario;
2. un retry conserva invitación, generación, destinatario, subject lógico, finalidad e identidad de entrega;
3. un reenvío voluntario posterior es una nueva generación y no comparte la identidad del retry técnico;
4. `429` o cuota acreditada usa `RATE_LIMITED` y respeta `Retry-After`;
5. un rechazo de destinatario, contrato o payload permanente no se reintenta;
6. un timeout después del envío queda `UNKNOWN_OUTCOME`; sin receipt consultable no se autoriza reenviar automáticamente el mismo correo;
7. el breaker se delimita por ambiente, cuenta/credencial, endpoint y operación de envío;
8. abrir el breaker conserva la invitación y la intención de entrega; no la marca como enviada ni fallida por inferencia;
9. no se acredita una cuota numérica de Resend en las fuentes actuales.

Estado técnico observado:

`RESEND_RETRY_RESILIENCE_STATE = LLAMADA_UNICA_SIN_RETRY_AFTER_BACKOFF_BREAKER_NI_RECEIPT_DE_EXITO_PERSISTIDO`

La implementación actual realiza un único `fetch`, trata cualquier respuesta no exitosa como fallo inmediato y no evidencia scheduler, `Retry-After`, backoff, circuit breaker o receipt exitoso estructurado.

---

#### 15. Expo Push Service — `EXT-SYS-006`

Clasificación primaria:

`OUTBOUND_PROVIDER_RATE_LIMITED`

Perfil objetivo ordinario:

`RETRY_PROVIDER_RATE_LIMITED`

Reglas:

1. la identidad de entrega se compone de anuncio, destino y generación aprobados por `INT-EXT-012`;
2. `DeviceNotRegistered` es condición permanente para ese token y no se reintenta;
3. `429` y cuotas acreditadas respetan `Retry-After`;
4. un fallo transitorio conserva los mensajes exactos del mismo lote lógico o los divide conservando identidad por destino; no genera anuncios nuevos;
5. un resultado incierto usa receipt/ticket cuando se materialice antes de reenviar a un destino;
6. el breaker se delimita por ambiente, endpoint y cuenta/proyecto aplicables, con bulkhead por clase de entrega para evitar que una campaña bloquee avisos críticos;
7. el drenaje tras recuperación respeta rate limit y jitter; no libera todos los tokens a la vez;
8. no se acredita una cuota numérica de Expo Push en las fuentes actuales.

Estado técnico observado:

`EXPO_PUSH_RETRY_RESILIENCE_STATE = BATCH_LIMITADO_LOCALMENTE_SIN_RETRY_AFTER_BACKOFF_BREAKER_NI_RECEIPT_DURABLE`

El código actual divide mensajes en lotes de hasta 100 y desactiva `DeviceNotRegistered`, pero no evidencia política durable de retry, lectura de `Retry-After`, circuit breaker ni persistencia de tickets/receipts.

---

#### 16. Sentry — `EXT-SYS-007`

Clasificación primaria:

`BEST_EFFORT_OBSERVABILITY_ISOLATED`

Decisión:

1. telemetría no es un efecto empresarial cuya entrega deba bloquear procesos de negocio;
2. VENTO no crea un backlog empresarial general para reintentar indefinidamente eventos Sentry;
3. el SDK puede aplicar su transporte interno conforme a su contrato, pero ese comportamiento no se eleva a autoridad empresarial;
4. el breaker/bulkhead de observabilidad aísla Sentry de los flujos propietarios;
5. una caída de Sentry no revierte operaciones confirmadas ni vuelve fallida una transacción empresarial;
6. el perfil empresarial por defecto es `RETRY_NONE`; cualquier buffer técnico del SDK sigue siendo infraestructura de observabilidad y debe respetar sensibilidad y límites propios;
7. no se acredita una cuota numérica ni un breaker físico Sentry en las fuentes actuales.

Estado:

`SENTRY_RETRY_RESILIENCE_STATE = BEST_EFFORT_SIN_CONTRATO_EMPRESARIAL_DE_RETRY`

---

#### 17. Google Maps / Google Reviews — `EXT-SYS-008`

Clasificación primaria:

`INTERACTIVE_READ_ONLY_PROVIDER_CALL`

Perfil objetivo ordinario:

`RETRY_INTERACTIVE_SAFE`

Decisión:

1. autocomplete y detalle son lecturas bajo demanda y no producen por sí mismas un hecho irreversible;
2. solo errores realmente transitorios pueden usar el perfil interactivo;
3. `RATE_LIMITED` respeta `Retry-After`, pero una espera que exceda la edad máxima interactiva devuelve estado degradado o error controlado en lugar de crear un job oculto de larga duración;
4. `ZERO_RESULTS` y respuestas semánticamente válidas sin resultado no son fallos reintentables;
5. claves inválidas, denegación o contrato incompatible no se reintentan;
6. el breaker se delimita por ambiente, credencial y superficie de Places; al abrirse, el flujo debe degradarse sin inventar dirección, coordenadas o `place_id`;
7. la misma consulta puede reintentarse dentro del presupuesto sin crear mapping canónico;
8. no se acredita una cuota numérica Google Places en las fuentes actuales.

Estado técnico observado:

`GOOGLE_PLACES_RETRY_RESILIENCE_STATE = REQUEST_RESPONSE_UNICO_SIN_RETRY_AFTER_BACKOFF_O_BREAKER_ACREDITADOS`

La función actual ejecuta una llamada por solicitud y convierte errores del proveedor en respuesta controlada, sin bucle de reintentos ni breaker observable.

---

#### 18. Apple Wallet / PassKit + APNs — `EXT-SYS-009`

Clasificación primaria:

`HYBRID_RESOURCE_AND_PUSH_BY_SURFACE`

La política se separa por superficie:

##### 18.1. PassKit Web Service inbound

- registro, baja, consulta de cambios y descarga son requests iniciados por Wallet/dispositivo;
- VENTO no reintenta esas requests contra Apple;
- una repetición inbound debe ser idempotente por recurso cuando modifica registro técnico;
- `401`, `404`, request inválida u otra condición contractual no se convierten en loops internos.

##### 18.2. APNs outbound

Perfil objetivo ordinario:

`RETRY_PROVIDER_RATE_LIMITED`

Reglas:

1. el push APNs es una señal de actualización, no el contenido autoritativo del pase;
2. la misma señal conserva pass, dispositivo y generación;
3. un retry no genera una nueva versión del pase;
4. `RATE_LIMITED` o espera indicada por APNs se respeta dentro del presupuesto aplicable;
5. un token permanentemente inválido se retira o desactiva según su lifecycle y no se reintenta indefinidamente;
6. el breaker de APNs no impide que el recurso del pase siga disponible por su web service cuando corresponda;
7. al recuperar APNs se drena la señalización con límite y jitter;
8. no se acredita una cuota numérica APNs en las fuentes actuales.

Estado técnico observado:

`PASSKIT_APNS_RETRY_RESILIENCE_STATE = PUSH_HTTP2_UNICO_SIN_RETRY_AFTER_BACKOFF_BREAKER_NI_CLASIFICACION_DE_STATUS_ACREDITADOS`

La función de push observada abre una conexión HTTP/2, envía una vez y resuelve o rechaza por evento de transporte; no evidencia scheduler, backoff, breaker ni tratamiento estructurado de rate limits.

---

#### 19. Zebra BrowserPrint — `EXT-SYS-011`

Clasificación primaria:

`PHYSICAL_EFFECT_UNKNOWN_OUTCOME_GUARDED`

Reglas:

1. detectar o conectar impresora puede usar interacción corta reintentable cuando no existe efecto físico;
2. enviar ZPL es una operación física y requiere identidad estable de job/generación antes de cualquier retry automático;
3. si la llamada demuestra que el trabajo no alcanzó el dispositivo, un reintento puede usar el perfil crítico del trabajo conservando la misma identidad;
4. si BrowserPrint confirma solo envío técnico, no se afirma impresión física;
5. timeout, callback perdido o desconexión después de enviar se clasifica `UNKNOWN_OUTCOME` y bloquea auto-retry hasta reconciliación o intervención;
6. una reimpresión voluntaria es una nueva generación y no un retry técnico del job anterior;
7. el breaker se delimita por bridge/estación/impresora y no abre el circuito de otras impresoras sanas;
8. al abrir el breaker no se marcan jobs como impresos ni se eliminan de la intención operativa;
9. `QUEUE-ARC-006`, `QUEUE-ARC-009` y el contrato transversal de impresión materializarán el comportamiento físico correspondiente.

Estado técnico observado:

`ZEBRA_RETRY_RESILIENCE_STATE = ENVIO_UNICO_CON_CALLBACK_SIN_JOB_DURABLE_RETRY_BACKOFF_O_BREAKER_ACREDITADO`

El cliente actual ejecuta una llamada `device.send` y muestra éxito técnico o error; no evidencia job durable, retry automático, backoff o circuit breaker.

---

#### 20. Supabase, plataformas de configuración y modelo sin binding

##### 20.1. Supabase — `EXT-SYS-001`

Clasificación:

`GOBERNADA_POR_CONTRATO_INTERNO_VENTO`

No existe un rate limiter o circuit breaker externo universal para toda actividad Supabase. Cada RPC, Edge Function, Storage, Auth, Realtime o llamada interna conserva su contrato propietario. Cuando Supabase aloje un adaptador hacia un tercero, la política se aplica a la identidad `EXT-SYS-*` de ese tercero.

##### 20.2. Expo / EAS Update — `EXT-SYS-005`

Clasificación:

`CONFIGURATION_NO_RUNTIME_RETRY_CONTRACT`

La configuración actual no acredita una operación administrativa runtime sobre la cual definir retry físico. Builds, updates o APIs futuras deberán versionar su binding antes de activar un scheduler propio.

##### 20.3. Vercel — `EXT-SYS-010`

Clasificación:

`CONFIGURATION_NO_RUNTIME_RETRY_CONTRACT`

Hosting y configuración observados no acreditan una llamada administrativa o job externo que justifique retry/breaker específico de esta identidad.

##### 20.4. Google Wallet — `EXT-SYS-012`

Clasificación:

`MODEL_NO_REMOTE_BINDING`

Existe modelo de objeto/JWT, pero no respuesta remota acreditada. No se inventan cuotas, códigos, retries o breaker para una interacción no materializada.

---

#### 21. `VENTO-EXTERNAL-RETRY-RESILIENCE-MATRIX-001`

| ID            | Sistema / plataforma                     | Clasificación primaria                               | Perfil o regla objetivo                                                                      | Rate limit / breaker                                                                                         | Estado del corte                                                                          |
| ------------- | ---------------------------------------- | ---------------------------------------------------- | -------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------- |
| `EXT-SYS-001` | Supabase                                 | `GOBERNADA_POR_CONTRATO_INTERNO_VENTO`               | según contrato propietario                                                                   | sin bucket externo universal; aislamiento por superficie propietaria                                         | `SEGUN_CONTRATO_PROPIETARIO`                                                              |
| `EXT-SYS-002` | Wompi                                    | `WEBHOOK_INBOUND_REDELIVERY_GOBERNADA_POR_PROVEEDOR` | inbound sin retry outbound; procesamiento diferido `RETRY_EVENT_CRITICAL`                    | protección por fuente/ambiente; breaker solo sobre dependencia o procesamiento, no sobre receipt ya recibido | `REDELIVERY_DEDUP_PARCIAL_SIN_RATE_LIMIT_O_BREAKER_ACREDITADO`                            |
| `EXT-SYS-003` | RevenueCat                               | `WEBHOOK_INBOUND_REDELIVERY_GOBERNADA_POR_PROVEEDOR` | inbound sin retry outbound; procesamiento diferido `RETRY_EVENT_CRITICAL`                    | aislamiento por fuente/ambiente; no inventar cuota                                                           | `SIN_DEDUP_DURABLE_RETRY_BACKOFF_RATE_LIMIT_NI_BREAKER_ACREDITADOS`                       |
| `EXT-SYS-004` | Resend                                   | `OUTBOUND_PROVIDER_RATE_LIMITED`                     | `RETRY_PROVIDER_RATE_LIMITED`, condicionado a identidad y resolución de resultado incierto   | bucket por ambiente/cuenta/credencial/endpoint; `Retry-After`; breaker por destino                           | `LLAMADA_UNICA_SIN_RETRY_AFTER_BACKOFF_BREAKER_NI_RECEIPT_DE_EXITO_PERSISTIDO`            |
| `EXT-SYS-005` | Expo / EAS Update                        | `CONFIGURATION_NO_RUNTIME_RETRY_CONTRACT`            | `RETRY_NONE` en el corte                                                                     | no se configura breaker de operación inexistente                                                             | `SIN_OPERACION_RUNTIME_ACREDITADA`                                                        |
| `EXT-SYS-006` | Expo Push Service                        | `OUTBOUND_PROVIDER_RATE_LIMITED`                     | `RETRY_PROVIDER_RATE_LIMITED` por anuncio+destino+generación                                 | bucket por ambiente/proyecto/endpoint; `Retry-After`; bulkhead por criticidad                                | `BATCH_LOCAL_SIN_RETRY_DURABLE_O_BREAKER`                                                 |
| `EXT-SYS-007` | Sentry                                   | `BEST_EFFORT_OBSERVABILITY_ISOLATED`                 | `RETRY_NONE` empresarial; transporte SDK separado                                            | bulkhead de observabilidad; una caída no bloquea negocio                                                     | `BEST_EFFORT_SIN_CONTRATO_EMPRESARIAL_DE_RETRY`                                           |
| `EXT-SYS-008` | Google Maps / Google Reviews             | `INTERACTIVE_READ_ONLY_PROVIDER_CALL`                | `RETRY_INTERACTIVE_SAFE` solo para error transitorio                                         | bucket por ambiente/credencial/superficie; breaker degradable                                                | `REQUEST_RESPONSE_UNICO_SIN_RETRY_AFTER_BACKOFF_O_BREAKER_ACREDITADOS`                    |
| `EXT-SYS-009` | Apple Wallet / PassKit + APNs            | `HYBRID_RESOURCE_AND_PUSH_BY_SURFACE`                | inbound PassKit sin self-retry; APNs `RETRY_PROVIDER_RATE_LIMITED`                           | breaker APNs separado del web service; bucket por ambiente/topic/destino aplicable                           | `PUSH_HTTP2_UNICO_SIN_RETRY_AFTER_BACKOFF_BREAKER_NI_CLASIFICACION_DE_STATUS_ACREDITADOS` |
| `EXT-SYS-010` | Vercel                                   | `CONFIGURATION_NO_RUNTIME_RETRY_CONTRACT`            | `RETRY_NONE` en el corte                                                                     | no se inventa quota/breaker de API no acreditada                                                             | `SIN_OPERACION_RUNTIME_ACREDITADA`                                                        |
| `EXT-SYS-011` | Zebra BrowserPrint                       | `PHYSICAL_EFFECT_UNKNOWN_OUTCOME_GUARDED`            | discovery interactivo; print solo si no-aplicación demostrada; unknown → conciliación/manual | breaker por bridge/estación/impresora; nunca libera reimpresiones masivas                                    | `ENVIO_UNICO_SIN_JOB_DURABLE_RETRY_BACKOFF_O_BREAKER_ACREDITADO`                          |
| `EXT-SYS-012` | Google Wallet / Google Pay & Wallet      | `MODEL_NO_REMOTE_BINDING`                            | `RETRY_NONE`                                                                                 | no existe cuota o breaker remoto acreditado                                                                  | `SIN_BINDING_REMOTO`                                                                      |
| `EXT-SYS-013` | POS externo vigente                      | `BLOQUEADA_SIN_BINDING`                              | `BLOCKED`                                                                                    | `INT-POS-001` debe acreditar proveedor, operaciones, cuotas y resultado incierto                             | `BLOCKED`                                                                                 |
| `EXT-SYS-014` | Shopify / comercio electrónico           | `NO_APLICA_SIN_BINDING`                              | `NOT_APPLICABLE`                                                                             | no inventar cuota, retry o breaker                                                                           | `NOT_APPLICABLE`                                                                          |
| `EXT-SYS-015` | Rappi / marketplace                      | `NO_APLICA_SIN_BINDING`                              | `NOT_APPLICABLE`                                                                             | no inventar cuota, retry o breaker                                                                           | `NOT_APPLICABLE`                                                                          |
| `EXT-SYS-016` | ManyChat / automatización conversacional | `NO_APLICA_SIN_BINDING`                              | `NOT_APPLICABLE`                                                                             | no inventar cuota, retry o breaker                                                                           | `NOT_APPLICABLE`                                                                          |
| `EXT-SYS-017` | WhatsApp                                 | `NO_APLICA_SIN_BINDING`                              | `NOT_APPLICABLE`                                                                             | no inventar cuota, retry o breaker                                                                           | `NOT_APPLICABLE`                                                                          |
| `EXT-SYS-018` | Instagram / social                       | `NO_APLICA_SIN_BINDING`                              | `NOT_APPLICABLE`                                                                             | no inventar cuota, retry o breaker                                                                           | `NOT_APPLICABLE`                                                                          |
| `EXT-SYS-019` | Correo corporativo y alias funcionales   | `NO_APLICA_SIN_BINDING`                              | `NOT_APPLICABLE`                                                                             | no inventar cuota, retry o breaker                                                                           | `NOT_APPLICABLE`                                                                          |
| `EXT-SYS-020` | Telefonía / voz                          | `BLOQUEADA_SIN_BINDING`                              | `BLOCKED`                                                                                    | `TI-INT-003` debe acreditar operador, interfaz, cuotas y semántica de resultado                              | `BLOCKED`                                                                                 |
| `EXT-SYS-021` | Transporte externo                       | `NO_APLICA_SIN_BINDING`                              | `NOT_APPLICABLE`                                                                             | no inventar cuota, retry o breaker                                                                           | `NOT_APPLICABLE`                                                                          |

Reconciliación:

```text
GOBERNADA_POR_CONTRATO_INTERNO_VENTO = 001 = 1
WEBHOOK_INBOUND_REDELIVERY_GOBERNADA_POR_PROVEEDOR = 002,003 = 2
OUTBOUND_PROVIDER_RATE_LIMITED = 004,006 = 2
BEST_EFFORT_OBSERVABILITY_ISOLATED = 007 = 1
INTERACTIVE_READ_ONLY_PROVIDER_CALL = 008 = 1
HYBRID_RESOURCE_AND_PUSH_BY_SURFACE = 009 = 1
CONFIGURATION_NO_RUNTIME_RETRY_CONTRACT = 005,010 = 2
PHYSICAL_EFFECT_UNKNOWN_OUTCOME_GUARDED = 011 = 1
MODEL_NO_REMOTE_BINDING = 012 = 1
NO_APLICA_SIN_BINDING = 014,015,016,017,018,019,021 = 7
BLOQUEADA_SIN_BINDING = 013,020 = 2
TOTAL = 21
```

---

#### 22. Estado de implementación observado

La definición documental no certifica que los runtimes actuales cumplan la política.

Hallazgos materiales del corte:

| Superficie         | Evidencia observada                                                 | Brecha frente al contrato objetivo                                                                |
| ------------------ | ------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| Wompi webhook      | lookup de evento y retorno de duplicado cuando ya está procesado    | no existe rate limiter, backoff, breaker ni worker durable acreditado para procesamiento diferido |
| RevenueCat webhook | procesamiento directo en una sola request                           | no existe claim/dedup durable, retry/backoff, rate limiter ni breaker acreditados                 |
| Resend             | un `fetch` outbound por envío                                       | no existe `Retry-After`, scheduler, backoff, breaker ni receipt exitoso persistido acreditado     |
| Expo Push          | lotes locales de hasta 100 y desactivación de `DeviceNotRegistered` | no existe retry durable, `Retry-After`, breaker ni ticket/receipt durable acreditado              |
| Google Places      | una llamada por request interactiva                                 | no existe retry, backoff ni breaker acreditados                                                   |
| APNs               | una llamada HTTP/2 por señal                                        | no existe retry, `Retry-After`, breaker ni clasificación estructurada del status acreditados      |
| Zebra BrowserPrint | una llamada `device.send` con callbacks                             | no existe job durable, retry/backoff/breaker ni prueba de efecto físico acreditados               |

Estos hallazgos son estados de implementación, no autorización para corregir código durante `INT-EXT-015`.

---

#### 23. Activación de bindings futuros

Una identidad `NO_APLICA_SIN_BINDING`, `BLOQUEADA_SIN_BINDING`, `CONFIGURATION_NO_RUNTIME_RETRY_CONTRACT` o `MODEL_NO_REMOTE_BINDING` no podrá activarse sin resolver antes:

1. proveedor e instancia exactos;
2. ambiente;
3. endpoint/superficie y dirección;
4. contrato I/O y versión;
5. autenticidad y credencial aplicables;
6. identidad idempotente y regla de resultado recuperable;
7. mapping de identificadores cuando aplique;
8. evidencia/payload que deba conservarse;
9. códigos externos → taxonomía de error canónica;
10. perfil de retry aplicable;
11. quota/rate policy y fuente de esa cuota;
12. semántica de `Retry-After` o mecanismo equivalente;
13. condición `UNKNOWN_OUTCOME` y forma de inquiry/receipt;
14. scope del circuit breaker;
15. señales que abren/cerran el breaker;
16. umbral, ventana, duración abierta y límite half-open físicamente versionados;
17. bulkhead y límite de concurrencia;
18. salida al agotar presupuesto;
19. tareas de cuarentena, auditoría y contingencia aplicables;
20. evidencia de pruebas antes de producción.

No se permite activar tráfico y decidir después cómo limitarlo o recuperarlo.

---

#### 24. Agotamiento del presupuesto

Al alcanzar el primer límite aplicable, la operación no queda silenciosamente pendiente.

Destinos permitidos heredados:

| Destino                        | Uso                                                                        |
| ------------------------------ | -------------------------------------------------------------------------- |
| `RECONCILIATION_REQUIRED`      | existe posibilidad de efecto o divergencia que exige consulta/conciliación |
| `MANUAL_INTERVENTION_REQUIRED` | falta una decisión humana o una resolución automática segura               |
| `DEAD_LETTER_CANDIDATE`        | el elemento puede aislarse para tratamiento controlado posterior           |
| `PERMANENTLY_REJECTED`         | contrato, seguridad o negocio impiden continuar                            |
| `CANCELLED_OR_EXPIRED`         | la intención dejó de ser vigente                                           |

`INT-EXT-015` define cuándo deja de reintentarse. `INT-EXT-016` define la cuarentena/dead-letter. `INT-EXT-017` define auditoría, métricas, alertas y conciliación. `INT-EXT-018` define contingencia empresarial ante indisponibilidad del proveedor.

---

#### 25. Handoffs y condiciones de salida

| Trabajo derivado                                            | Estado                    | Propietario / tarea responsable | Condición de salida                                                                              |
| ----------------------------------------------------------- | ------------------------- | ------------------------------- | ------------------------------------------------------------------------------------------------ |
| Contrato compartido de idempotencia y resultado recuperable | `FUERA_DE_ALCANCE`        | `SHELL-CON-023`                 | operación, intento, receipt y resultado permanecen correlacionables y no se duplica el efecto    |
| Evento externo recibido y receipt                           | `FUERA_DE_ALCANCE`        | `SHELL-CON-019`                 | redelivery inbound conserva fuente, autenticidad, evidencia e identidad estable                  |
| Scheduler, retry, backoff y límite máximo físicos           | `FUERA_DE_ALCANCE`        | `QUEUE-ARC-006`                 | cada trabajo ejecutable consume perfil, presupuesto, `next_attempt_at` y rate policy versionados |
| Cola de fallos y recuperación manual                        | `FUERA_DE_ALCANCE`        | `QUEUE-ARC-008`                 | agotamiento y error no procesable tienen destino controlado sin pérdida silenciosa               |
| Claim, lease, bloqueo de duplicados y concurrencia          | `FUERA_DE_ALCANCE`        | `QUEUE-ARC-009`                 | no existen dos intentos concurrentes del mismo alcance idempotente                               |
| Métricas de espera, ejecución, throttling y error           | `FUERA_DE_ALCANCE`        | `QUEUE-ARC-011`                 | rate limit, breaker, backlog e intentos son observables sin payload sensible                     |
| Autorización para retry manual o automático                 | `FUERA_DE_ALCANCE`        | `QUEUE-ARC-012`                 | retry manual conserva motivo, actor, alcance y reautorización cuando aplique                     |
| Cuarentena o dead-letter externo                            | `FUERA_DE_ALCANCE`        | `INT-EXT-016` / `SHELL-CON-024` | entrada o salida agotada/no procesable queda aislada con disposición explícita                   |
| Auditoría, métricas, alertas y conciliación externa         | `FUERA_DE_ALCANCE`        | `INT-EXT-017`                   | intentos, rate limiting, breaker, unknown outcome y resultados quedan reconstruibles             |
| Contingencia por indisponibilidad prolongada                | `FUERA_DE_ALCANCE`        | `INT-EXT-018`                   | un proveedor degradado tiene modo empresarial alterno sin crear doble fuente de verdad           |
| Contratos de proveedor crítico y reincorporación            | `FUERA_DE_ALCANCE`        | `CONT-INT-003` / `CONT-INT-004` | salud externa y retorno al servicio normal se validan antes de drenar backlog completo           |
| Binding del POS vigente                                     | `BLOQUEADO_POR_EVIDENCIA` | `INT-POS-001`                   | proveedor, operaciones, códigos, cuotas y garantías permiten instanciar esta política            |
| Binding de telefonía/voz                                    | `BLOQUEADO_POR_EVIDENCIA` | `TI-INT-003`                    | operador, interfaz, operaciones, cuotas y resultado quedan acreditados                           |

No queda una brecha sustantiva de esta tarea sin propietario y condición de salida.

---

#### 26. Fronteras reservadas a `INT-EXT-016` a `INT-EXT-020`

| Materia                                                     | Tarea propietaria |
| ----------------------------------------------------------- | ----------------- |
| cuarentena o dead-letter                                    | `INT-EXT-016`     |
| auditoría, métricas, alertas y conciliación                 | `INT-EXT-017`     |
| contingencia ante indisponibilidad del proveedor            | `INT-EXT-018`     |
| retiro de integración y revocación de credenciales          | `INT-EXT-019`     |
| prohibición de credenciales compartidas entre integraciones | `INT-EXT-020`     |

Esta tarea no diseña todavía la cola de cuarentena, el dashboard de alertas, el runbook de contingencia ni el retiro del proveedor.

---

#### 27. Prohibiciones

Queda prohibido:

1. reintentar porque un error “parece temporal” sin clasificación canónica;
2. reintentar un `SECURITY_DENIED`, `PERMANENT_CONTRACT`, `PERMANENT_BUSINESS`, `CONFLICTING_REUSE` o `CANCELLED_OR_EXPIRED`;
3. tratar timeout como fracaso seguro cuando el efecto pudo confirmarse;
4. cambiar idempotency key, payload lógico, importe, destinatario, recurso o audiencia para obtener éxito;
5. crear una operación nueva en cada intento;
6. reiniciar presupuesto al reiniciar proceso, dispositivo, función o worker;
7. usar demora fija universal sin jitter;
8. ignorar un `Retry-After` válido;
9. cambiar credencial, tenant, worker o ambiente para evadir cuota;
10. inventar requests/segundo, cuotas diarias o ventanas de proveedor sin evidencia vigente;
11. inventar threshold, sampling window, open duration o probe count de breaker sin binding/evidencia;
12. usar un circuit breaker global para todos los proveedores;
13. contar errores empresariales permanentes como falla de salud del proveedor;
14. liberar todo el backlog cuando un breaker cierre;
15. permitir que prioridad crítica elimine rate limit, idempotencia o aislamiento;
16. agotar retry y marcar automáticamente éxito;
17. agotar retry y ejecutar automáticamente compensación;
18. reintentar un webhook inbound “enviándolo” de nuevo al proveedor;
19. convertir redelivery del proveedor en un evento externo nuevo;
20. reenviar correo, push, pago o impresión con `UNKNOWN_OUTCOME` sin inquiry/conciliación cuando el primer efecto pudo ocurrir;
21. confundir callback técnico de impresora con prueba de impresión física;
22. crear backlog empresarial para telemetría Sentry por defecto;
23. convertir Google Maps request/response en polling oculto;
24. crear loops de compra/restore RevenueCat fuera del contrato del SDK;
25. inventar rate limit o retry para Expo/EAS, Vercel, Google Wallet remoto o identidades sin binding;
26. crear colas, workers, cron, schedulers, tablas, RPC, triggers o circuit breakers físicos durante esta tarea;
27. modificar código, Supabase, proveedor, endpoints, credenciales, Storage o datos;
28. cambiar las veintiuna identidades heredadas;
29. desarrollar `INT-EXT-016`.

---

#### 28. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** `INT-EXT-015` especializa por identidad externa reglas de retry y resiliencia ya materializadas y protegidas por el registro vigente. La cobertura existente ya exige backoff con jitter, límites de intentos y edad, respeto de `Retry-After`, tratamiento de resultado desconocido, claim/locking, perfiles cerrados, circuit breaker, bulkheads, concurrencia, agotamiento, reautorización, observabilidad, conciliación y recuperación. La tarea no introduce una nueva familia verificable, no cambia límites numéricos existentes y no declara un mecanismo físico implementado.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

El registro canónico de requisitos permanece sin cambios.

---

#### 29. Criterios de aceptación

`INT-EXT-015` queda documentalmente completa cuando se cumplen simultáneamente:

1. se preservan exactamente `EXT-SYS-001` a `EXT-SYS-021`;
2. existen exactamente 21 decisiones primarias;
3. faltantes = 0;
4. duplicados = 0;
5. identificadores únicos = 21;
6. la distribución primaria es exactamente `1 + 2 + 2 + 1 + 1 + 1 + 2 + 1 + 1 + 7 + 2 = 21`;
7. se reutiliza `ENTERPRISE-EVENT-RETRY-POLICY-001@1.0.0` sin crear perfiles paralelos;
8. se conservan exactamente ocho perfiles canónicos y sus máximos aprobados;
9. se conservan exactamente doce clases de error;
10. error desconocido no habilita retry automático;
11. full jitter usa la fórmula canónica aprobada;
12. `Retry-After` válido impone el instante mínimo de siguiente intento;
13. cuotas se separan por ambiente, proveedor/instancia, credencial/principal, endpoint y operación cuando apliquen;
14. no se inventan cuotas numéricas de proveedor;
15. reiniciar runtime no reinicia presupuesto;
16. breaker `OPEN` no consume nuevos intentos de envío;
17. breaker abierto sí consume edad máxima de la operación;
18. `HALF_OPEN` usa probes limitados y no libera backlog masivo;
19. bulkheads aíslan proveedores, aplicaciones, consumidoras y criticidad;
20. no se inventan umbrales numéricos de breaker sin evidencia;
21. `UNKNOWN_OUTCOME` obliga inquiry/conciliación antes de repetir un efecto material;
22. redelivery inbound se mantiene separada del retry outbound;
23. Wompi webhook no se convierte en retry outbound de VENTO;
24. procesamiento diferido de un receipt de pago conserva identidad y perfil crítico;
25. RevenueCat webhook no se convierte en loop custom de compra/restore;
26. Resend usa perfil objetivo `RETRY_PROVIDER_RATE_LIMITED` solo con identidad estable y protección de resultado desconocido;
27. Expo Push distingue `DeviceNotRegistered` como permanente y conserva identidad por anuncio/destino/generación;
28. Sentry permanece best-effort y aislado del negocio;
29. Google Places usa como máximo perfil interactivo para lecturas transitorias y no crea job oculto de larga duración;
30. Apple separa requests inbound de PassKit y señales outbound APNs;
31. Zebra bloquea auto-retry ante resultado físico desconocido y distingue reimpresión intencional;
32. Supabase permanece gobernada por contratos propietarios;
33. Expo/EAS y Vercel no reciben políticas runtime ficticias;
34. Google Wallet no recibe rate limit o breaker remoto sin binding;
35. POS permanece bloqueado hasta `INT-POS-001`;
36. telefonía/voz permanece bloqueada hasta `TI-INT-003`;
37. los siete sistemas sin binding no reciben cuotas, retries ni breakers inventados;
38. `QUEUE-ARC-006` conserva la materialización física de scheduler/retry/backoff/límites;
39. `QUEUE-ARC-008`, `009`, `011` y `012` conservan fallos, concurrencia, métricas y autorización;
40. `INT-EXT-016` conserva cuarentena/dead-letter;
41. `INT-EXT-017` conserva auditoría, métricas, alertas y conciliación;
42. `INT-EXT-018` conserva contingencia empresarial;
43. no se modifica código;
44. no se modifica Supabase;
45. no se crean colas, workers, tablas, RPC, cron, schedulers ni circuit breakers físicos;
46. no se crean ni modifican requisitos de prueba;
47. `INT-EXT-016` permanece reservada.

---

#### 30. Resultado de la tarea

`INT-EXT-015` queda **APROBADA** como definición documental completa de rate limits, reintentos, backoff y circuit breaker para las veintiuna identidades externas.

Resultado consolidado:

- identidades materializadas: **21/21**;
- política transversal reutilizada: **1** (`ENTERPRISE-EVENT-RETRY-POLICY-001@1.0.0`);
- perfiles canónicos preservados: **8**;
- clases de error preservadas: **12**;
- webhooks inbound gobernados por redelivery del proveedor: **2**;
- superficies outbound clasificadas como provider-rate-limited: **2**;
- telemetría best-effort aislada: **1**;
- lectura interactiva externa: **1**;
- familia híbrida PassKit/APNs: **1**;
- configuraciones sin contrato runtime: **2**;
- efecto físico con unknown outcome protegido: **1**;
- modelo sin binding remoto: **1**;
- identidades sin binding no aplicables: **7**;
- identidades bloqueadas sin binding: **2**;
- cuotas numéricas de proveedor inventadas: **0**;
- parámetros numéricos de breaker inventados: **0**;
- cambios físicos: **0**;
- requisitos creados o modificados: **0**.

Invariante final:

```text
MISMA OPERACIÓN
+
ERROR CLASIFICADO
+
PERFIL CANÓNICO
+
RATE LIMIT
+
FULL JITTER
+
PRESUPUESTO FINITO
+
BREAKER / BULKHEAD POR DESTINO
+
UNKNOWN OUTCOME ANTES DE REPETIR EFECTOS
=
REINTENTO CONTROLADO SIN DUPLICAR HECHOS NI PRODUCIR CASCADAS
```

---

ÚLTIMA TAREA APROBADA

`INT-EXT-014 — Definir conservación controlada del payload original`

TAREA ACTUAL APROBADA

`INT-EXT-015 — Definir rate limits, reintentos, backoff y circuit breaker`

SIGUIENTE TAREA RESERVADA

`INT-EXT-016 — Definir cuarentena o dead-letter`


### ✅ INT-EXT-016 — Definir cuarentena o dead-letter

**Estado:** APROBADA
**Tarea anterior:** `INT-EXT-015 — Definir rate limits, reintentos, backoff y circuit breaker` — APROBADA
**Tarea siguiente:** `INT-EXT-017 — Definir auditoría, métricas, alertas y conciliación` — RESERVADA
**Tipo de tarea:** documental; especialización normativa de cuarentena, dead-letter, intervención y disposición controlada para las veintiuna identidades externas `EXT-SYS-001` a `EXT-SYS-021`, sin crear colas físicas, almacenamiento, workers, tablas, RPC, migraciones, configuración de proveedores ni cambios de runtime
**Bloque:** X — Integraciones
**Mini-bloque:** Integraciones externas y credenciales
**Fase:** exclusivamente documental
**Repositorio propietario:** `vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/X_INTEGRACIONES/02_INTEGRACIONES_EXTERNAS_Y_CREDENCIALES.md`
**Implementación física autorizada:** ninguna
**Cambios de código, DDL, DML, migraciones, RLS, RPC, Storage, secretos, cuentas externas, configuración productiva o despliegues:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir cuándo una unidad asociada a una integración externa debe salir del procesamiento ordinario por falta de confianza, integridad o compatibilidad y cuándo, en cambio, puede convertirse en candidata a dead-letter porque la automatización ya agotó su capacidad segura de continuar.

La tarea especializa para fronteras externas la política transversal aprobada en `INT-APP-009` sin crear una taxonomía paralela.

Separación obligatoria:

```text
CUARENTENA
≠
DEAD_LETTER_CANDIDATE
≠
RECHAZO PERMANENTE
≠
RESULTADO DESCONOCIDO
≠
CONCILIACIÓN
≠
COMPENSACIÓN
≠
CONTINGENCIA DEL PROVEEDOR
```

Regla central:

```text
CUARENTENA
→ CONFIANZA, INTEGRIDAD O COMPATIBILIDAD IMPIDEN PROCESAR

DEAD_LETTER_CANDIDATE
→ LA AUTOMATIZACIÓN YA NO PUEDE CONTINUAR Y REQUIERE DISPOSICIÓN CONTROLADA
```

Ni cuarentena ni dead-letter constituyen un estado empresarial de éxito o fracaso.

---

#### 2. Resultado sustantivo

Se materializan dos artefactos documentales internos:

1. `VENTO-EXTERNAL-QUARANTINE-DEAD-LETTER-CONTRACT-001`, especialización externa de aislamiento, elegibilidad de dead-letter, intervención y reproceso controlado.
2. `VENTO-EXTERNAL-QUARANTINE-DEAD-LETTER-MATRIX-001`, decisión materializada para las veintiuna identidades `EXT-SYS-*`.

Balance:

| Control                                             | Resultado |
| --------------------------------------------------- | --------: |
| Identidades esperadas                               |    **21** |
| Identidades materializadas                          | **21/21** |
| Identificadores `EXT-SYS-*` únicos                  |    **21** |
| Faltantes                                           |     **0** |
| Duplicados                                          |     **0** |
| `GOBERNADA_POR_CONTRATO_INTERNO_VENTO`              |     **1** |
| `INBOUND_EVENT_QUARANTINE_AND_DLQ_GOVERNED`         |     **2** |
| `OUTBOUND_OPERATION_DLQ_WITH_UNKNOWN_OUTCOME_GUARD` |     **2** |
| `BEST_EFFORT_NO_BUSINESS_DLQ`                       |     **1** |
| `INTERACTIVE_READ_ONLY_NO_PERSISTENT_DLQ`           |     **1** |
| `HYBRID_RESOURCE_AND_PUSH_QUARANTINE_DLQ`           |     **1** |
| `CONFIGURATION_NO_RUNTIME_FAILURE_QUEUE`            |     **2** |
| `PHYSICAL_EFFECT_RECONCILIATION_BEFORE_DLQ`         |     **1** |
| `MODEL_NO_REMOTE_BINDING`                           |     **1** |
| `NO_APLICA_SIN_BINDING`                             |     **7** |
| `BLOQUEADA_SIN_BINDING`                             |     **2** |
| Razones cerradas de cuarentena heredadas            |     **8** |
| Puertas acumulativas de dead-letter heredadas       |     **7** |
| Acciones manuales heredadas                         |    **10** |
| Outcomes de cierre heredados                        |     **8** |
| Cambios físicos                                     |     **0** |
| Requisitos de prueba creados o modificados          |     **0** |

Reconciliación de identidades:

```text
1 + 2 + 2 + 1 + 1 + 1 + 2 + 1 + 1 + 7 + 2 = 21
```

La clasificación primaria describe la política que gobierna la identidad en el corte actual. No presupone que exista ya una cola, tabla, bucket, worker o panel de recuperación.

---

#### 3. Entradas canónicas preservadas

La tarea consume y conserva sin redefinir:

- `VENTO-EXTERNAL-SYSTEM-INVENTORY-001` y exactamente `EXT-SYS-001` a `EXT-SYS-021`;
- principal técnico, referencias de credencial, mecanismos de autenticación, alcance, ambiente, custodia y lifecycle definidos en `INT-EXT-002` a `INT-EXT-008`;
- `VENTO-EXTERNAL-IO-CONTRACT-001` de `INT-EXT-009`;
- `VENTO-EXTERNAL-DELIVERY-STRATEGY-001` de `INT-EXT-010`;
- autenticidad, origen, timestamp y replay de `INT-EXT-011`;
- `VENTO-EXTERNAL-IDEMPOTENCY-CONTRACT-001` de `INT-EXT-012`;
- `VENTO-EXTERNAL-ID-MAPPING-CONTRACT-001` de `INT-EXT-013`;
- `VENTO-EXTERNAL-ORIGINAL-PAYLOAD-CUSTODY-001` de `INT-EXT-014`;
- `VENTO-EXTERNAL-RETRY-RESILIENCE-CONTRACT-001` de `INT-EXT-015`;
- `ENTERPRISE-PARTIAL-ERROR-HANDLING-POLICY-001@1.0.0` de `INT-APP-009`;
- la separación entre retry, resultado desconocido, conciliación, compensación, cuarentena y dead-letter;
- la obligación de preservar una operación e idempotency key cuando la intención lógica no cambie;
- la prohibición de transformar un ACK técnico en confirmación empresarial;
- la custodia protegida, minimización, retención y hold definidos para evidencia externa;
- la propiedad del dominio VENTO sobre el hecho empresarial y su cierre.

Nada de esta tarea cambia el significado de una identidad externa, un evento, una operación, un mapping, una clave idempotente, una credencial o un hecho empresarial.

---

#### 4. Alcance de fallo aplicable

La taxonomía transversal conserva los ocho alcances cerrados:

| Alcance               |
| --------------------- |
| `REQUEST_OR_COMMAND`  |
| `OWNER_TRANSACTION`   |
| `EVENT_EMISSION`      |
| `DELIVERY`            |
| `CONSUMER_EFFECT`     |
| `BATCH_OR_BULK_ITEM`  |
| `EXTERNAL_EXCHANGE`   |
| `OFFLINE_OR_EVIDENCE` |

Para esta tarea:

- la frontera primaria de proveedores remotos es `EXTERNAL_EXCHANGE`;
- una operación de periférico o evidencia física, como Zebra, puede requerir `OFFLINE_OR_EVIDENCE`;
- un procesamiento interno posterior a un receipt externo puede enlazar además `DELIVERY`, `CONSUMER_EFFECT` u otro alcance sin fusionar identidades;
- la clasificación siempre se hace sobre la unidad exacta que falló.

Una misma incidencia puede enlazar varios alcances, pero ninguno sustituye al otro.

---

#### 5. Clases de parcialidad preservadas

Se mantienen exactamente las nueve clases transversales:

| Clase                             |
| --------------------------------- |
| `NO_EFFECT_CONFIRMED`             |
| `SOME_EFFECTS_CONFIRMED`          |
| `SOME_EFFECTS_UNKNOWN`            |
| `ALL_EFFECTS_UNKNOWN`             |
| `DEPENDENCY_INCOMPLETE`           |
| `CONFLICTING_RESULTS`             |
| `UNTRUSTED_OR_TAMPERED_INPUT`     |
| `CONTRACT_OR_SCHEMA_INCOMPATIBLE` |
| `EXTERNAL_STATE_DIVERGENCE`       |

Reglas externas:

1. un timeout no convierte `SOME_EFFECTS_UNKNOWN` o `ALL_EFFECTS_UNKNOWN` en `NO_EFFECT_CONFIRMED`;
2. un evento con autenticidad no demostrada puede clasificarse `UNTRUSTED_OR_TAMPERED_INPUT` sin afirmar que el proveedor emitió el contenido;
3. una versión no interpretable puede clasificarse `CONTRACT_OR_SCHEMA_INCOMPATIBLE` sin reserializar ni corregir silenciosamente el payload fuente;
4. una discrepancia entre proveedor y estado VENTO utiliza `EXTERNAL_STATE_DIVERGENCE` y se dirige a conciliación;
5. una unidad en cuarentena conserva su clase de parcialidad; el aislamiento no la reemplaza.

---

#### 6. Disposiciones transversales aplicables

Se conservan las doce disposiciones aprobadas:

| Disposición                      |
| -------------------------------- |
| `RETRY_SAME_OPERATION`           |
| `WAIT_FOR_DEPENDENCY`            |
| `QUERY_AUTHORITATIVE_RESULT`     |
| `RECONCILE`                      |
| `QUARANTINE`                     |
| `DEAD_LETTER_CANDIDATE`          |
| `MANUAL_INTERVENTION_REQUIRED`   |
| `PERMANENTLY_REJECT`             |
| `COMPENSATE_CONFIRMED_EFFECTS`   |
| `CREATE_CORRECTION_OR_SUCCESSOR` |
| `CONTINUE_INDEPENDENT_UNITS`     |
| `BLOCK_DEPENDENT_UNITS`          |

Esta tarea especializa `QUARANTINE` y `DEAD_LETTER_CANDIDATE`; no redefine las demás.

---

#### 7. Razones cerradas de cuarentena

Solo se permiten las ocho razones aprobadas:

| Razón de cuarentena                   |
| ------------------------------------- |
| `UNTRUSTED_SIGNATURE_OR_AUTHENTICITY` |
| `SCHEMA_OR_VERSION_UNSUPPORTED`       |
| `PAYLOAD_INTEGRITY_FAILED`            |
| `IDENTITY_OR_ROUTING_AMBIGUOUS`       |
| `SENSITIVITY_OR_POLICY_VIOLATION`     |
| `REPEATED_POISON_MESSAGE`             |
| `EVIDENCE_LINKAGE_INVALID`            |
| `MANUAL_HOLD_FOR_INVESTIGATION`       |

Reglas:

1. ninguna integración crea una novena razón local;
2. conectividad temporal, `RATE_LIMITED`, circuit breaker abierto o espera normal de dependencia no son razones de cuarentena;
3. rechazo empresarial ordinario no es cuarentena;
4. una firma inválida bloquea el procesamiento; la conservación durable del contenido no autenticado solo procede cuando exista finalidad de seguridad, investigación o evidencia que la justifique;
5. tráfico evidentemente no autenticado no se convierte por defecto en un sumidero ilimitado de evidencia;
6. `REPEATED_POISON_MESSAGE` exige misma unidad o identidad estable y evidencia de repetición; no se infiere de un único fallo;
7. `MANUAL_HOLD_FOR_INVESTIGATION` exige autoridad y finalidad explícitas;
8. liberar una cuarentena exige resolver la causa que la originó.

---

#### 8. Contrato de cuarentena externa

Una unidad elegible para `QUARANTINE` deberá cumplir:

```text
AISLAR UNIDAD EXACTA
→ DETENER PROCESAMIENTO ORDINARIO
→ PRESERVAR IDENTIDAD Y HUELLA
→ REFERENCIAR EVIDENCIA PROTEGIDA
→ CLASIFICAR RAZÓN CERRADA
→ CONSERVAR RESULTADO EMPRESARIAL SIN INFERIR
→ ASIGNAR PROPIETARIA + RESPONSABLE + SIGUIENTE ACCIÓN
→ REQUERIR AUTORIZACIÓN PARA LIBERACIÓN O REPROCESO
```

Invariantes:

- cuarentena no modifica el resultado empresarial;
- cuarentena no crea una nueva operación;
- cuarentena no cambia idempotency key;
- cuarentena no reescribe el payload fuente;
- cuarentena no cambia mapping para conseguir que el mensaje pase;
- cuarentena no concede permisos de lectura sobre el contenido protegido;
- cuarentena no permite reproceso automático;
- eliminar, archivar u ocultar el elemento no resuelve el caso.

---

#### 9. Evidencia mínima de cuarentena

La representación lógica deberá poder enlazar, cuando aplique:

```text
partial_error_id
external_system_id
environment
surface
operation_id
external_event_or_receipt_ref
idempotency_ref
payload_digest
protected_payload_locator
authenticity_result_ref
mapping_refs[]
retry_error_class
partiality_class
disposition
quarantine_reason
responsible_owner
next_action
due_at_or_reactivation_condition
authorization_reference
audit_reference
reconciliation_reference
retention_policy_ref
preservation_or_hold_ref
```

Reglas de contenido:

1. se conserva referencia o huella antes que una copia adicional del payload completo;
2. el contenido fuente completo permanece en la custodia protegida definida por `INT-EXT-014` cuando corresponda;
3. logs, métricas, paneles y auditoría ordinaria no duplican bodies completos;
4. secretos, API keys, bearer tokens, signing secrets, passwords y claves privadas no se copian a la representación de cuarentena;
5. una vista operativa utiliza proyección minimizada y redacted;
6. una investigación autorizada accede a evidencia protegida por referencia y finalidad.

---

#### 10. Puertas acumulativas de dead-letter

`DEAD_LETTER_CANDIDATE` requiere simultáneamente las siete puertas aprobadas:

| Puerta                                               |
| ---------------------------------------------------- |
| `AUTOMATION_BUDGET_CLOSED`                           |
| `ITEM_ISOLATED`                                      |
| `IDENTITY_AND_CONTENT_PRESERVED`                     |
| `BUSINESS_OUTCOME_CLASSIFIED_OR_RECONCILIATION_OPEN` |
| `OWNER_AND_NEXT_ACTION_ASSIGNED`                     |
| `REPROCESSING_REQUIRES_AUTHORIZATION`                |
| `RETENTION_AND_AUDIT_DEFINED`                        |

Regla de elegibilidad:

```text
DEAD_LETTER_ELIGIBLE
=
GATE_1
AND GATE_2
AND GATE_3
AND GATE_4
AND GATE_5
AND GATE_6
AND GATE_7
```

Una sola puerta falsa impide clasificar la unidad como candidata a dead-letter.

---

#### 11. Contrato de dead-letter externo

`DEAD_LETTER_CANDIDATE` significa exclusivamente que la automatización ya no puede continuar de forma segura y el elemento requiere una disposición controlada.

No significa:

- que el proveedor no ejecutó el efecto;
- que VENTO ejecutó el efecto;
- que el caso está cerrado;
- que corresponde compensar;
- que puede reenviarse con otra identidad;
- que puede borrarse;
- que el payload puede editarse;
- que el propietario empresarial cambió.

Reglas:

1. el budget de `INT-EXT-015` debe estar cerrado;
2. el elemento debe estar aislado del flujo ordinario;
3. identidad, contenido lógico o referencia protegida y huella deben permanecer preservados;
4. si existe `RESULT_UNKNOWN`, debe existir conciliación abierta antes de satisfacer la cuarta puerta;
5. propietaria, responsable y siguiente acción deben ser explícitos;
6. reproceso manual o automatizado posterior exige autorización;
7. retención y auditoría deben estar definidas;
8. mover un registro entre stores no cambia el outcome empresarial;
9. un cambio material de contenido crea una sucesora;
10. la intención original nunca se reescribe para convertir un fallo histórico en éxito.

---

#### 12. Precedencia de decisión

Toda unidad externa con fallo se clasifica en este orden lógico:

```text
1. ¿LA UNIDAD Y SU IDENTIDAD SON DETERMINABLES?
   NO → AISLAR Y RESOLVER IDENTIDAD / ROUTING

2. ¿AUTENTICIDAD, INTEGRIDAD, ESQUEMA Y POLÍTICA PERMITEN PROCESAR?
   NO → QUARANTINE O RECHAZO SEGURO SEGÚN CAUSA Y EVIDENCIA

3. ¿EL RESULTADO PUEDE SER DESCONOCIDO?
   SÍ → QUERY_AUTHORITATIVE_RESULT / RECONCILE

4. ¿EXISTE ERROR TRANSITORIO CON PRESUPUESTO ABIERTO?
   SÍ → RETRY_SAME_OPERATION / WAIT_FOR_DEPENDENCY

5. ¿EXISTE AUSENCIA DE EFECTO DEMOSTRADA Y ERROR PERMANENTE?
   SÍ → PERMANENTLY_REJECT

6. ¿LA AUTOMATIZACIÓN ESTÁ AGOTADA?
   SÍ → EVALUAR LAS SIETE PUERTAS DE DEAD-LETTER

7. ¿HAY EFECTOS CONFIRMADOS O RESIDUALES?
   SÍ → CONSERVARLOS Y DIRIGIR CONCILIACIÓN, CORRECCIÓN O COMPENSACIÓN
```

La evaluación no se salta pasos para reducir backlog.

---

#### 13. Resultado desconocido

`UNKNOWN_OUTCOME`, `SOME_EFFECTS_UNKNOWN` y `ALL_EFFECTS_UNKNOWN` tienen precedencia sobre un cierre técnico por agotamiento.

```text
TIMEOUT / RESPUESTA PERDIDA / CALLBACK INCOMPLETO
→ ¿EL EFECTO PUDO OCURRIR?
   ├── NO, DEMOSTRADO → puede volver a retry seguro o rechazo según contrato
   ├── SÍ, CONFIRMADO → recuperar resultado; no repetir
   └── INDETERMINADO → RECONCILIATION_REQUIRED
```

Reglas:

1. no se repiten pagos, correos, push, cambios de Wallet, movimientos físicos o impresiones solo porque el timeout terminó;
2. un elemento con resultado desconocido puede ser candidato a dead-letter únicamente si la conciliación permanece abierta y todas las demás puertas se cumplen;
3. dead-letter no sustituye la conciliación;
4. un resultado posteriormente confirmado se vincula al mismo caso y desactiva cualquier acción incompatible;
5. un resultado posteriormente demostrado como no aplicado puede habilitar retry de la misma operación si conserva autorización y vigencia.

---

#### 14. Agotamiento de retry y poison messages

Agotar un perfil de retry no produce dead-letter automáticamente.

```text
RETRY BUDGET CLOSED
→ CLASIFICAR RESULTADO
→ AISLAR
→ PRESERVAR
→ ASIGNAR OWNER / ACCIÓN
→ DEFINIR AUTORIZACIÓN + RETENCIÓN + AUDITORÍA
→ SOLO ENTONCES EVALUAR DEAD_LETTER_CANDIDATE
```

`REPEATED_POISON_MESSAGE` se utiliza cuando la misma unidad válida para identificación provoca repetidamente un fallo no resoluble mediante el flujo ordinario y continuar amenaza estabilidad o disponibilidad.

No se utiliza para:

- un único parser error sin diagnóstico;
- una cuota temporal;
- un breaker abierto;
- falta de conectividad;
- una dependencia todavía pendiente;
- una denegación empresarial válida;
- un resultado desconocido que aún requiere consulta.

---

#### 15. Conflicto de identidad o contenido

Cuando una misma identidad externa aparece con contenido materialmente distinto:

```text
MISMO EXTERNAL EVENT / RECEIPT REF
+
HUELLA DISTINTA
→ NO SOBRESCRIBIR
→ CONFLICTING_REUSE / CONFLICTING_RESULTS
→ AISLAR UNIDAD
→ QUARANTINE SI LA CONFIANZA O INTEGRIDAD QUEDA COMPROMETIDA
→ RECONCILE
```

Reglas:

1. nunca gana la última escritura;
2. nunca se reemplaza la evidencia anterior;
3. ninguna redelivery puede mutar el contenido histórico de otra recepción;
4. el mapping se revisa por referencia, no editando la fuente;
5. una corrección material produce una sucesora si el proceso lo permite.

---

#### 16. Autenticidad inválida y tráfico no confiable

Para entradas externas:

1. falla de firma, checksum, token o mecanismo de origen bloquea el paso a lógica empresarial;
2. no toda solicitud no autenticada merece retención durable;
3. la metadata mínima necesaria para seguridad puede registrarse de forma minimizada;
4. `UNTRUSTED_SIGNATURE_OR_AUTHENTICITY` habilita cuarentena cuando la investigación, evidencia, repetición o política de seguridad justifican preservar la unidad;
5. tráfico masivo claramente no autenticado se rechaza de forma fail-closed y no convierte la cuarentena en almacenamiento ilimitado;
6. nunca se guarda junto al caso el secreto usado para verificar la autenticidad;
7. una firma inválida no se reintenta cambiando credencial, secreto o ambiente por fallback.

---

#### 17. Reproceso desde cuarentena o dead-letter

El reproceso es una acción nueva sobre el mismo caso, no una nueva intención empresarial.

Para la misma intención lógica:

```text
MISMA OPERACIÓN
+
MISMA IDEMPOTENCY KEY
+
MISMA HUELLA LÓGICA
+
MISMA PROPIETARIA
+
NUEVO INTENTO AUTORIZADO
```

Reglas:

1. se conserva la identidad original;
2. se revalida autoridad, contrato, mapping, vigencia y dependencia antes de ejecutar;
3. la causa de cuarentena debe estar resuelta;
4. el reproceso desde dead-letter exige las condiciones de autorización correspondientes;
5. una unidad ya confirmada no vuelve a ejecutar su efecto;
6. si el contenido debe cambiar materialmente, se usa `CREATE_SUCCESSOR`;
7. el intento anterior y el nuevo permanecen enlazados e inmutables;
8. el reproceso no elimina el caso histórico.

---

#### 18. Acciones manuales permitidas

Se conservan exactamente las diez acciones aprobadas:

| Acción                       |
| ---------------------------- |
| `RETRY_AUTHORIZED`           |
| `QUERY_RECEIPT`              |
| `CORRECT_METADATA`           |
| `CREATE_SUCCESSOR`           |
| `RELINK_EVIDENCE`            |
| `REPROCESS_FROM_QUARANTINE`  |
| `REPROCESS_FROM_DEAD_LETTER` |
| `PERMANENT_REJECT`           |
| `START_RECONCILIATION`       |
| `START_COMPENSATION`         |

Toda intervención conserva:

```text
actor autorizado
+ autoridad aplicable
+ finalidad
+ motivo estructurado
+ unidad exacta
+ efectos exactos
+ evidencia consultada
+ acción seleccionada
+ parámetros permitidos
+ resultado anterior
+ resultado posterior
+ segregación requerida
+ audit_reference
+ residual
+ siguiente responsable
```

No son acciones válidas editar directamente una fuente de verdad, forzar éxito, borrar para cerrar o cambiar silenciosamente un resultado.

---

#### 19. Outcomes de cierre

Se conservan exactamente los ocho outcomes aprobados:

| Outcome                           |
| --------------------------------- |
| `RESOLVED_CONFIRMED`              |
| `RESOLVED_NO_EFFECT`              |
| `RESOLVED_DUPLICATE_PRIOR_RESULT` |
| `RESOLVED_CORRECTED`              |
| `RESOLVED_COMPENSATED`            |
| `RESOLVED_WITH_ACCEPTED_RESIDUAL` |
| `PERMANENTLY_REJECTED`            |
| `SUPERSEDED_BY_SUCCESSOR`         |

No existen:

- `CLOSED_UNKNOWN`;
- cierre automático por antigüedad;
- cierre por mover a dead-letter;
- cierre por borrar cuarentena;
- cierre sin evidencia.

`RESOLVED_WITH_ACCEPTED_RESIDUAL` mantiene residual, propietaria, responsable, riesgo, control compensatorio, autoridad y condición temporal aplicable.

---

#### 20. Wompi — `EXT-SYS-002`

Clasificación primaria:

`INBOUND_EVENT_QUARANTINE_AND_DLQ_GOVERNED`

Superficie material: webhook de resultado de pago.

Reglas:

1. checksum, ambiente, identidad del evento y evidencia se validan antes del efecto empresarial;
2. una entrada con autenticidad no confiable no alcanza lógica de pago;
3. una entrega autenticada pero con esquema no soportado, integridad fallida, identidad/routing ambiguo o evidencia inválida puede ir a `QUARANTINE` con la razón cerrada correspondiente;
4. una redelivery válida se deduplica antes de tratarse como error nuevo;
5. mismo identificador de proveedor con huella distinta se aísla y concilia; no sobrescribe la evidencia previa;
6. si el receipt válido ya fue capturado y el procesamiento interno agota `RETRY_EVENT_CRITICAL`, se evalúan las siete puertas de dead-letter;
7. un estado de pago incierto utiliza `QUERY_AUTHORITATIVE_RESULT` o `RECONCILE` antes de cualquier nueva acción de cobro;
8. `DEAD_LETTER_CANDIDATE` nunca demuestra que el pago no ocurrió;
9. el payload protegido permanece bajo `INT-EXT-014`; el caso operativo conserva referencias y huellas minimizadas;
10. liberar o reprocesar un caso de pago exige autorización y no crea un evento Wompi nuevo.

Resultado documental:

`WOMPI_QUARANTINE_DLQ_STATE = DEFINIDO_SOBRE_RECEIPT_IDEMPOTENTE_Y_RESULTADO_FINANCIERO_PROTEGIDO`

---

#### 21. RevenueCat — `EXT-SYS-003`

Clasificación primaria:

`INBOUND_EVENT_QUARANTINE_AND_DLQ_GOVERNED`

Superficie material: webhook de entitlement/suscripción.

Reglas:

1. una entrada no auténtica no afecta entitlement;
2. autenticidad no confiable, schema no soportado, integridad fallida, routing ambiguo o enlace de evidencia inválido pueden activar `QUARANTINE` según la razón cerrada aplicable;
3. una redelivery conserva identidad idempotente y no crea una compra, restore o entitlement nuevo;
4. un receipt válido cuyo procesamiento interno agota el presupuesto aplicable puede evaluar dead-letter;
5. compra o restore con resultado incierto se resuelve mediante estado autoritativo o conciliación; no se inicia otra compra por el hecho de agotar espera;
6. un entitlement ya confirmado no se revoca por mover un trabajo técnico a dead-letter;
7. el payload externo completo no se duplica en el caso de error;
8. un cambio material de interpretación o mapping crea una nueva interpretación derivada y conserva la fuente original.

Resultado documental:

`REVENUECAT_QUARANTINE_DLQ_STATE = DEFINIDO_SIN_CONVERTIR_BACKLOG_TECNICO_EN_ESTADO_DE_ENTITLEMENT`

---

#### 22. Resend — `EXT-SYS-004`

Clasificación primaria:

`OUTBOUND_OPERATION_DLQ_WITH_UNKNOWN_OUTCOME_GUARD`

Superficie material: envío de correo iniciado por VENTO.

Reglas:

1. la identidad es la generación de entrega aprobada, no solamente la dirección de correo;
2. `RATE_LIMITED` o fallo transitorio conserva la misma operación durante el budget de retry;
3. error permanente de destinatario, contrato o contenido con no-efecto demostrado puede terminar `PERMANENTLY_REJECT` sin usar dead-letter como cementerio genérico;
4. timeout posterior al envío se clasifica `UNKNOWN_OUTCOME` cuando el proveedor pudo aceptar el correo;
5. sin receipt consultable o evidencia de no-envío no se reenvía automáticamente;
6. al cerrar el budget, un caso todavía accionable solo puede ser candidato a dead-letter si cumple las siete puertas;
7. una nueva invitación o reenvío voluntario posterior es una nueva generación, no el reproceso silencioso del caso anterior;
8. subject, body y datos personales no se duplican en dead-letter cuando una referencia al artefacto de notificación resulta suficiente;
9. toda acción manual conserva destinatario, generación, finalidad, motivo y estado previo.

Resultado documental:

`RESEND_QUARANTINE_DLQ_STATE = DEAD_LETTER_CON_GUARDA_DE_RESULTADO_DESCONOCIDO_Y_MINIMIZACION`

---

#### 23. Expo Push Service — `EXT-SYS-006`

Clasificación primaria:

`OUTBOUND_OPERATION_DLQ_WITH_UNKNOWN_OUTCOME_GUARD`

Superficie material: envío de notificaciones push.

Reglas:

1. la unidad se conserva por anuncio, destino y generación;
2. `DeviceNotRegistered` permanece condición permanente del destino y no se convierte en retry infinito ni dead-letter por defecto;
3. error transitorio conserva la misma identidad durante el budget aplicable;
4. un ticket o receipt futuro se consulta antes de repetir cuando el resultado pueda ser incierto;
5. el agotamiento de automatización habilita evaluación de las siete puertas, no dead-letter automático;
6. una campaña masiva conserva resultado individual por destino;
7. un destino confirmado no se vuelve a notificar porque otro destino falle;
8. el caso no copia el payload completo de la notificación cuando basta referencia al anuncio, destino, generación y huella;
9. el reproceso autorizado conserva la misma intención; una nueva campaña o generación utiliza identidad nueva.

Resultado documental:

`EXPO_PUSH_QUARANTINE_DLQ_STATE = DEAD_LETTER_POR_DESTINO_CON_RESULTADO_INDIVIDUAL_Y_SIN_REENVIO_CIEGO`

---

#### 24. Sentry — `EXT-SYS-007`

Clasificación primaria:

`BEST_EFFORT_NO_BUSINESS_DLQ`

Reglas:

1. telemetría no se convierte en backlog empresarial;
2. fallo de entrega a Sentry no bloquea ni revierte una operación de negocio;
3. buffers propios del SDK no adquieren semántica de dead-letter empresarial;
4. no se crea una cola durable general para reintentar indefinidamente telemetría;
5. una violación de sensibilidad o política impide exfiltrar el contenido y se trata bajo gobierno de seguridad/evidencia, sin copiar el dato prohibido a otro store de error;
6. observabilidad de Sentry permanece aislada de las fuentes propietarias;
7. no existe reproceso empresarial de telemetría como condición para cerrar procesos VENTO.

Resultado documental:

`SENTRY_QUARANTINE_DLQ_STATE = SIN_DEAD_LETTER_EMPRESARIAL_POR_DEFECTO`

---

#### 25. Google Maps / Google Reviews — `EXT-SYS-008`

Clasificación primaria:

`INTERACTIVE_READ_ONLY_NO_PERSISTENT_DLQ`

Reglas:

1. autocomplete y detalle bajo demanda son lecturas interactivas;
2. fallo transitorio puede agotar su perfil interactivo y devolver degradación o error controlado sin crear un job persistente oculto;
3. `ZERO_RESULTS` o respuesta válida sin coincidencia no son fallos de dead-letter;
4. credencial denegada, contrato inválido o schema incompatible se rechazan y se diagnostican; no se reintentan indefinidamente;
5. una respuesta cuya integridad o procedencia resulte materialmente no confiable no alimenta mappings ni hechos VENTO;
6. no se conserva un backlog de consultas de usuario una vez vencida la interacción;
7. cualquier investigación de seguridad usa evidencia mínima y no un archivo masivo de respuestas Places.

Resultado documental:

`GOOGLE_PLACES_QUARANTINE_DLQ_STATE = SIN_DEAD_LETTER_PERSISTENTE_PARA_LECTURA_INTERACTIVA`

---

#### 26. Apple Wallet / PassKit + APNs — `EXT-SYS-009`

Clasificación primaria:

`HYBRID_RESOURCE_AND_PUSH_QUARANTINE_DLQ`

La decisión se separa por superficie.

##### 26.1. PassKit Web Service inbound

1. una petición con autenticación de recurso inválida se bloquea antes de producir mutación;
2. identidad o routing ambiguo, schema no soportado, integridad fallida o evidencia inválida pueden requerir `QUARANTINE` cuando exista unidad preservable y finalidad legítima;
3. una repetición de registro o baja se resuelve idempotentemente por recurso cuando corresponda;
4. una lectura repetida no se convierte en dead-letter;
5. una petición inválida no se repara editando `serialNumber`, `passTypeIdentifier`, token o destino;
6. el token de autenticación no se copia al caso operativo.

##### 26.2. APNs outbound

1. la señal de actualización conserva pass, dispositivo y generación;
2. un token permanentemente inválido termina su tratamiento según lifecycle y no se reintenta indefinidamente;
3. fallos transitorios agotan el budget aplicable antes de evaluar dead-letter;
4. un resultado de entrega incierto no demuestra que el dispositivo recibió o aplicó la actualización;
5. una señal agotada puede ser candidata a dead-letter solo si sigue siendo válida, todas las puertas se cumplen y el resultado empresarial permanece correctamente clasificado;
6. una nueva versión del pase no se crea por reprocesar una señal anterior;
7. la disponibilidad del recurso PassKit permanece separada del éxito de APNs.

Resultado documental:

`PASSKIT_APNS_QUARANTINE_DLQ_STATE = HIBRIDO_POR_RECURSO_Y_SENAL_SIN_CONFUNDIR_PUSH_CON_HECHO_EMPRESARIAL`

---

#### 27. Zebra BrowserPrint — `EXT-SYS-011`

Clasificación primaria:

`PHYSICAL_EFFECT_RECONCILIATION_BEFORE_DLQ`

Reglas:

1. detectar o conectar una impresora antes de enviar trabajo puede fallar sin efecto físico;
2. una vez enviado ZPL, timeout, callback perdido o desconexión puede dejar `UNKNOWN_OUTCOME`;
3. `UNKNOWN_OUTCOME` bloquea auto-reprint;
4. el sistema debe distinguir envío técnico de impresión física;
5. un ZPL incompatible, routing ambiguo o evidencia no enlazable puede requerir `QUARANTINE` antes de cualquier nuevo envío;
6. un trabajo agotado solo puede llegar a `DEAD_LETTER_CANDIDATE` con outcome clasificado o conciliación abierta y las otras seis puertas satisfechas;
7. mover el job a dead-letter no significa `impreso` ni `no impreso`;
8. `REPROCESS_FROM_DEAD_LETTER` nunca equivale a reimpresión automática;
9. una reimpresión voluntaria es una nueva generación explícita;
10. el operador debe poder identificar impresora, estación, job, generación, evidencia y acción segura sin recibir un payload sensible innecesario.

Resultado documental:

`ZEBRA_QUARANTINE_DLQ_STATE = RESULTADO_FISICO_INCIERTO_REQUIERE_CONCILIACION_ANTES_DE_REIMPRESION`

---

#### 28. Supabase, plataformas de configuración y modelo sin binding

##### 28.1. Supabase — `EXT-SYS-001`

Clasificación:

`GOBERNADA_POR_CONTRATO_INTERNO_VENTO`

No existe una cuarentena o dead-letter externa universal para toda actividad Supabase. Cada RPC, Edge Function, Storage, Auth, Realtime, cron o trabajo interno conserva su contrato propietario. Cuando Supabase aloje un adaptador hacia un tercero, la disposición externa se decide por la identidad `EXT-SYS-*` de ese tercero y no por `EXT-SYS-001` de forma global.

##### 28.2. Expo / EAS Update — `EXT-SYS-005`

Clasificación:

`CONFIGURATION_NO_RUNTIME_FAILURE_QUEUE`

La configuración acreditada no materializa una operación runtime que justifique una cuarentena o dead-letter de mensajes. Una futura API, job o canal de delivery deberá versionar su binding antes de activar esta política.

##### 28.3. Vercel — `EXT-SYS-010`

Clasificación:

`CONFIGURATION_NO_RUNTIME_FAILURE_QUEUE`

Hosting y configuración observados no acreditan un intercambio runtime empresarial que deba colocarse en una cola de fallos externa bajo esta identidad.

##### 28.4. Google Wallet / Google Pay & Wallet — `EXT-SYS-012`

Clasificación:

`MODEL_NO_REMOTE_BINDING`

Existe modelo documental de artefacto/JWT, pero no un binding remoto acreditado sobre el cual materializar cuarentena, dead-letter, receipt o reproceso. Cualquier binding futuro deberá versionar primero la matriz.

---

#### 29. Identidades sin binding y bindings bloqueados

##### 29.1. `NO_APLICA_SIN_BINDING`

Las identidades siguientes no tienen intercambio runtime acreditado en el corte actual y no reciben una política física inventada:

- `EXT-SYS-014` — Shopify / comercio electrónico;
- `EXT-SYS-015` — Rappi / marketplace;
- `EXT-SYS-016` — ManyChat / automatización conversacional;
- `EXT-SYS-017` — WhatsApp;
- `EXT-SYS-018` — Instagram / social;
- `EXT-SYS-019` — Correo corporativo y alias funcionales;
- `EXT-SYS-021` — Transporte externo.

Para estas siete identidades:

- no existe quarantine store acreditado;
- no existe dead-letter operativo acreditado;
- no se seleccionan errores de proveedor por analogía;
- no se inventan receipts, payloads, retry profiles o acciones manuales específicas;
- cualquier activación futura deberá acreditar binding, I/O, autenticidad, idempotencia, mapping, payload, retry y disposición antes de uso productivo.

##### 29.2. `BLOQUEADA_SIN_BINDING`

`EXT-SYS-013 — POS externo vigente` permanece bloqueada hasta `INT-POS-001`, que deberá acreditar proveedor, operaciones, endpoints, webhooks, códigos, resultados, payloads y garantías suficientes para instanciar esta política.

`EXT-SYS-020 — Telefonía / voz` permanece bloqueada hasta `TI-INT-003`, que deberá acreditar operador, interfaz, operaciones, callbacks, identidad, payload, resultado y garantías suficientes para instanciar esta política.

Hasta entonces no se inventan razones de cuarentena específicas de proveedor, receipts, dead-letter físico ni reprocesos.

---

#### 30. `VENTO-EXTERNAL-QUARANTINE-DEAD-LETTER-MATRIX-001`

| ID            | Sistema / plataforma                     | Clasificación primaria                              | Cuarentena                                                                                         | Dead-letter / disposición                                                    | Condición crítica                                                  |
| ------------- | ---------------------------------------- | --------------------------------------------------- | -------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------- | ------------------------------------------------------------------ |
| `EXT-SYS-001` | Supabase                                 | `GOBERNADA_POR_CONTRATO_INTERNO_VENTO`              | según contrato propietario; no cuarentena externa universal                                        | según trabajo o dominio propietario                                          | un adaptador a tercero usa la identidad de ese tercero             |
| `EXT-SYS-002` | Wompi                                    | `INBOUND_EVENT_QUARANTINE_AND_DLQ_GOVERNED`         | autenticidad, schema, integridad, identidad/routing, evidencia o hold según razones cerradas       | procesamiento interno agotado puede evaluar siete puertas                    | pago incierto exige consulta/conciliación; nunca inferir no-efecto |
| `EXT-SYS-003` | RevenueCat                               | `INBOUND_EVENT_QUARANTINE_AND_DLQ_GOVERNED`         | autenticidad, schema, integridad, routing, evidencia o hold según razones cerradas                 | procesamiento interno agotado puede evaluar siete puertas                    | entitlement confirmado no se revoca por fallo técnico              |
| `EXT-SYS-004` | Resend                                   | `OUTBOUND_OPERATION_DLQ_WITH_UNKNOWN_OUTCOME_GUARD` | solo confianza, integridad, compatibilidad, política o investigación; no por transitorio ordinario | agotamiento con siete puertas; permanente puede rechazarse sin DLQ           | timeout tras envío requiere resolver aceptación antes de reenviar  |
| `EXT-SYS-005` | Expo / EAS Update                        | `CONFIGURATION_NO_RUNTIME_FAILURE_QUEUE`            | no aplica runtime acreditado                                                                       | no aplica runtime acreditado                                                 | binding futuro debe versionar la matriz                            |
| `EXT-SYS-006` | Expo Push Service                        | `OUTBOUND_OPERATION_DLQ_WITH_UNKNOWN_OUTCOME_GUARD` | solo causas cerradas aplicables a unidad/destino                                                   | por destino y generación tras agotamiento y siete puertas                    | `DeviceNotRegistered` es permanente; no retry infinito             |
| `EXT-SYS-007` | Sentry                                   | `BEST_EFFORT_NO_BUSINESS_DLQ`                       | violación de política se bloquea sin copiar contenido prohibido                                    | no backlog empresarial por defecto                                           | fallo de telemetría no cambia estado de negocio                    |
| `EXT-SYS-008` | Google Maps / Google Reviews             | `INTERACTIVE_READ_ONLY_NO_PERSISTENT_DLQ`           | investigación de integridad/seguridad solo cuando exista finalidad                                 | no job persistente de consulta agotada                                       | degradar interacción sin inventar dirección o coordenadas          |
| `EXT-SYS-009` | Apple Wallet / PassKit + APNs            | `HYBRID_RESOURCE_AND_PUSH_QUARANTINE_DLQ`           | inbound por autenticidad/integridad/routing/schema/evidencia; sin copiar tokens                    | APNs agotado puede evaluar siete puertas si la señal sigue vigente           | push no confirma descarga ni efecto del pase                       |
| `EXT-SYS-010` | Vercel                                   | `CONFIGURATION_NO_RUNTIME_FAILURE_QUEUE`            | no aplica runtime acreditado                                                                       | no aplica runtime acreditado                                                 | no inventar cola de fallos de hosting/configuración                |
| `EXT-SYS-011` | Zebra BrowserPrint                       | `PHYSICAL_EFFECT_RECONCILIATION_BEFORE_DLQ`         | incompatibilidad, routing, integridad o evidencia cuando aplique                                   | solo con resultado físico clasificado o conciliación abierta y siete puertas | nunca auto-reprint ante `UNKNOWN_OUTCOME`                          |
| `EXT-SYS-012` | Google Wallet / Google Pay & Wallet      | `MODEL_NO_REMOTE_BINDING`                           | no aplica sin binding remoto                                                                       | no aplica sin binding remoto                                                 | versionar antes de activar interacción remota                      |
| `EXT-SYS-013` | POS externo vigente                      | `BLOQUEADA_SIN_BINDING`                             | no instanciar hasta `INT-POS-001`                                                                  | no instanciar hasta `INT-POS-001`                                            | proveedor y garantías no acreditados                               |
| `EXT-SYS-014` | Shopify / comercio electrónico           | `NO_APLICA_SIN_BINDING`                             | no aplica                                                                                          | no aplica                                                                    | binding futuro exige versión del contrato                          |
| `EXT-SYS-015` | Rappi / marketplace                      | `NO_APLICA_SIN_BINDING`                             | no aplica                                                                                          | no aplica                                                                    | binding futuro exige versión del contrato                          |
| `EXT-SYS-016` | ManyChat / automatización conversacional | `NO_APLICA_SIN_BINDING`                             | no aplica                                                                                          | no aplica                                                                    | binding futuro exige versión del contrato                          |
| `EXT-SYS-017` | WhatsApp                                 | `NO_APLICA_SIN_BINDING`                             | no aplica                                                                                          | no aplica                                                                    | binding futuro exige versión del contrato                          |
| `EXT-SYS-018` | Instagram / social                       | `NO_APLICA_SIN_BINDING`                             | no aplica                                                                                          | no aplica                                                                    | binding futuro exige versión del contrato                          |
| `EXT-SYS-019` | Correo corporativo y alias funcionales   | `NO_APLICA_SIN_BINDING`                             | no aplica                                                                                          | no aplica                                                                    | binding futuro exige versión del contrato                          |
| `EXT-SYS-020` | Telefonía / voz                          | `BLOQUEADA_SIN_BINDING`                             | no instanciar hasta `TI-INT-003`                                                                   | no instanciar hasta `TI-INT-003`                                             | operador e interfaz no acreditados                                 |
| `EXT-SYS-021` | Transporte externo                       | `NO_APLICA_SIN_BINDING`                             | no aplica                                                                                          | no aplica                                                                    | binding futuro exige versión del contrato                          |

Reconciliación:

```text
21 IDENTIDADES
=
1 GOBERNADA_POR_CONTRATO_INTERNO_VENTO
+ 2 INBOUND_EVENT_QUARANTINE_AND_DLQ_GOVERNED
+ 2 OUTBOUND_OPERATION_DLQ_WITH_UNKNOWN_OUTCOME_GUARD
+ 1 BEST_EFFORT_NO_BUSINESS_DLQ
+ 1 INTERACTIVE_READ_ONLY_NO_PERSISTENT_DLQ
+ 1 HYBRID_RESOURCE_AND_PUSH_QUARANTINE_DLQ
+ 2 CONFIGURATION_NO_RUNTIME_FAILURE_QUEUE
+ 1 PHYSICAL_EFFECT_RECONCILIATION_BEFORE_DLQ
+ 1 MODEL_NO_REMOTE_BINDING
+ 7 NO_APLICA_SIN_BINDING
+ 2 BLOQUEADA_SIN_BINDING
```

---

#### 31. Propiedad del caso y separación de autoridad

Toda unidad aislada conserva cuatro responsabilidades distintas:

| Responsabilidad                   | Regla                                                                              |
| --------------------------------- | ---------------------------------------------------------------------------------- |
| propietario del hecho empresarial | aplicación o dominio que confirma, rechaza, corrige o compensa el efecto           |
| principal técnico del adaptador   | ejecuta la frontera técnica autorizada; no adquiere propiedad empresarial          |
| custodio de evidencia             | protege contenido, referencias y lifecycle; no decide resultado empresarial        |
| responsable de intervención       | actor o servicio autorizado para la acción concreta; no recibe autoridad universal |

Reglas:

1. un proveedor externo nunca se convierte en propietario de una fuente VENTO;
2. una cola de fallos futura no se convierte en propietaria del proceso;
3. SHELL o un servicio transversal puede custodiar y gestionar el caso sin decidir el estado empresarial;
4. una credencial técnica no equivale a autorización de reproceso;
5. una persona con acceso a soporte no obtiene por ello permiso para leer payloads completos o forzar outcomes.

---

#### 32. Seguridad, privacidad y minimización

Cuarentena y dead-letter son superficies de riesgo elevado porque concentran fallos y evidencia.

Reglas obligatorias:

1. clasificación de sensibilidad se conserva desde la fuente;
2. se aplica minimización por finalidad;
3. se prefieren referencias, hashes y metadata allowlisted;
4. secretos y material reutilizable de autenticación quedan excluidos;
5. payloads financieros, personales o sensibles no se copian por conveniencia de debugging;
6. una vista de soporte se redacta independientemente del storage protegido;
7. exportar un caso conserva clasificación, finalidad, autorización y lifecycle;
8. production, staging y development no comparten contenido de cuarentena ni credenciales;
9. un hold autorizado suspende disposición ordinaria sin modificar la evidencia;
10. ausencia de periodo de retención no justifica conservación indefinida presentada como cumplimiento.

---

#### 33. Retención y disposición

Esta tarea no fija un número universal de días.

Cada caso resuelve:

```text
SENSIBILIDAD
+
FINALIDAD
+
ESTADO DEL CASO
+
POLÍTICA DE RETENCIÓN
+
PRESERVACIÓN / HOLD
+
RESIDUALES ABIERTOS
→ DISPOSICIÓN PERMITIDA
```

Reglas:

1. la edad del caso no lo resuelve;
2. llegar a dead-letter no inicia por sí solo borrado inmediato;
3. un caso cerrado puede conservar evidencia según su política;
4. un caso abierto no se borra para reducir backlog;
5. el contenido que alcance su disposición conserva únicamente las referencias y constancias permitidas;
6. la evidencia de disposición no contiene una copia del payload eliminado;
7. un hold bloquea disposición, no reproceso ni outcome por inferencia.

---

#### 34. Reconciliación y frontera con `INT-EXT-017`

`INT-EXT-016` determina cuándo una unidad debe aislarse y qué condiciones permiten convertirla en candidata a dead-letter.

`INT-EXT-017` conserva la definición detallada de:

- auditoría externa consolidada;
- métricas de backlog, edad, clasificación y recurrencia;
- alertas y escalamiento;
- consultas y conciliación con proveedor;
- reconstrucción de intentos, receipts, mappings y resultados;
- indicadores de cierre y residuales.

Hasta ejecutar `INT-EXT-017`, esta tarea exige `audit_reference` y `reconciliation_reference` cuando apliquen, pero no crea dashboards, reglas de alerta ni procesos físicos de conciliación.

---

#### 35. Materialización física reservada

Las responsabilidades pendientes quedan vinculadas de forma explícita:

| Materia                                                   | Estado en esta tarea      | Propietario posterior | Condición de salida                                                                                     |
| --------------------------------------------------------- | ------------------------- | --------------------- | ------------------------------------------------------------------------------------------------------- |
| contrato compartido de cuarentena, rechazo y compensación | `DEFINIDO_SEMANTICAMENTE` | `SHELL-CON-024`       | materializar tipos y contrato compartido preservando razones, puertas, referencias y outcomes aprobados |
| cola de fallos y recuperación manual                      | `NO_IMPLEMENTADA`         | `QUEUE-ARC-008`       | definir infraestructura física de fallos, aislamiento y recuperación sin cambiar semántica empresarial  |
| concurrencia de reprocesos                                | `NO_IMPLEMENTADA`         | `QUEUE-ARC-009`       | impedir claim o reproceso duplicado de la misma unidad                                                  |
| autorización para reintentar trabajos                     | `NO_IMPLEMENTADA`         | `QUEUE-ARC-012`       | materializar controles para acciones manuales y reintentos autorizados                                  |
| métricas de espera, ejecución y error                     | `NO_IMPLEMENTADA`         | `QUEUE-ARC-011`       | medir backlog, edad y error sin exponer payloads sensibles                                              |
| auditoría, alertas y conciliación externa                 | `RESERVADA`               | `INT-EXT-017`         | definir reconstrucción, consultas, señales, alertas y cierre de casos externos                          |
| contingencia ante proveedor indisponible                  | `RESERVADA`               | `INT-EXT-018`         | definir operación empresarial alternativa sin duplicar fuente de verdad                                 |
| binding POS                                               | `BLOQUEADO_POR_EVIDENCIA` | `INT-POS-001`         | acreditar proveedor, I/O, garantías y resultados antes de instanciar la política                        |
| binding telefonía/voz                                     | `BLOQUEADO_POR_EVIDENCIA` | `TI-INT-003`          | acreditar operador, interfaz, callbacks y resultados antes de instanciar la política                    |

No queda una brecha sustantiva de esta tarea sin propietario y condición de salida.

---

#### 36. Frontera con contrato compartido `SHELL-CON-024`

`SHELL-CON-024 — Crear contrato de cuarentena, rechazo y compensación` deberá materializar posteriormente el contrato compartido consumible por adaptadores y servicios.

Esta tarea fija como entrada obligatoria para ese contrato:

- `external_system_id`;
- unidad y operación estable;
- referencias de evento, receipt e idempotencia;
- clase de parcialidad;
- disposición;
- razón de cuarentena cuando aplique;
- resultado de las siete puertas de dead-letter;
- referencias de evidencia protegida;
- propietaria, responsable y siguiente acción;
- autorización de intervención/reproceso;
- auditoría, conciliación, retención y hold;
- residual y outcome de cierre cuando exista.

`SHELL-CON-024` no podrá transformar dead-letter en estado empresarial ni crear una vía de escritura transversal a dominios VENTO.

---

#### 37. Prohibiciones

Queda prohibido:

1. enviar a cuarentena cualquier fallo temporal por comodidad;
2. usar cuarentena para evadir `Retry-After`, backoff o circuit breaker;
3. usar cuarentena para un rechazo empresarial ordinario;
4. crear una razón de cuarentena local distinta de las ocho aprobadas;
5. clasificar un caso como dead-letter solo porque el retry budget terminó;
6. omitir cualquiera de las siete puertas de dead-letter;
7. usar dead-letter para ocultar `RESULT_UNKNOWN` sin conciliación abierta;
8. tratar dead-letter como éxito, fracaso, rechazo o compensación empresarial;
9. borrar un caso para reducir métricas o backlog;
10. editar payload, importe, cantidad, destinatario, recurso o mapping para lograr un reproceso exitoso;
11. generar una nueva idempotency key para repetir la misma intención;
12. repetir una unidad ya confirmada;
13. reintentar un pago, correo, push o impresión a ciegas cuando el efecto pudo ocurrir;
14. auto-reimprimir Zebra ante resultado físico desconocido;
15. duplicar payloads sensibles dentro de una futura cola de fallos;
16. copiar secretos, tokens o claves privadas a cuarentena, dead-letter, auditoría o métricas;
17. otorgar acceso de soporte al payload completo por defecto;
18. compartir cuarentenas o credenciales entre ambientes;
19. crear backlog empresarial para Sentry por defecto;
20. crear jobs persistentes de dead-letter para consultas interactivas de Google Places;
21. inventar cuarentena o dead-letter runtime para Expo/EAS o Vercel sin binding;
22. inventar interacción remota de Google Wallet;
23. inventar política física para Shopify, Rappi, ManyChat, WhatsApp, Instagram, correo corporativo o transporte externo sin binding;
24. instanciar POS antes de `INT-POS-001`;
25. instanciar telefonía/voz antes de `TI-INT-003`;
26. convertir una cola futura en propietaria del hecho empresarial;
27. crear tablas, índices, constraints, funciones, triggers, RPC, RLS, buckets, queues, topics, workers, cron o schedulers durante esta tarea;
28. modificar código, Supabase, proveedores, endpoints, credenciales, Storage o datos;
29. ejecutar reprocesos reales;
30. desarrollar `INT-EXT-017`.

---

#### 38. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Justificación:** la tarea especializa por identidad externa reglas verificables ya protegidas por la política transversal vigente de errores parciales, cuarentena, dead-letter, intervención, resultado desconocido, conciliación, preservación de evidencia, minimización, retry e idempotencia. No crea una nueva taxonomía ejecutable, no modifica razones, puertas, acciones, outcomes, perfiles de retry ni límites existentes y no declara infraestructura física implementada.

Balance:

- creados: **0**;
- modificados: **0**;
- diferidos: **0**;
- descartados: **0**;
- obsoletos: **0**.

El registro canónico de requisitos permanece sin cambios.

---

#### 39. Criterios de aceptación

`INT-EXT-016` queda documentalmente completa cuando se cumplen simultáneamente:

1. se preservan exactamente `EXT-SYS-001` a `EXT-SYS-021`;
2. existen exactamente 21 decisiones primarias;
3. faltantes = 0;
4. duplicados = 0;
5. identificadores únicos = 21;
6. la distribución primaria es exactamente `1 + 2 + 2 + 1 + 1 + 1 + 2 + 1 + 1 + 7 + 2 = 21`;
7. se reutiliza `ENTERPRISE-PARTIAL-ERROR-HANDLING-POLICY-001@1.0.0` sin taxonomía paralela;
8. se conservan exactamente ocho razones de cuarentena;
9. se conservan exactamente siete puertas acumulativas de dead-letter;
10. se conservan exactamente diez acciones manuales;
11. se conservan exactamente ocho outcomes de cierre;
12. cuarentena y dead-letter permanecen disposiciones operativas y no estados empresariales;
13. cuarentena solo se utiliza por confianza, integridad, compatibilidad, sensibilidad, evidencia o investigación según razones cerradas;
14. red temporal, rate limit, breaker abierto y espera normal no se convierten en cuarentena;
15. tráfico no autenticado no crea un storage ilimitado por defecto;
16. agotar retry no produce dead-letter automáticamente;
17. las siete puertas deben ser verdaderas para `DEAD_LETTER_CANDIDATE`;
18. `RESULT_UNKNOWN` exige consulta o conciliación antes de acciones incompatibles;
19. dead-letter con resultado incierto exige conciliación abierta;
20. misma intención conserva operation id, idempotency key, huella y propietaria;
21. cambio material produce sucesora;
22. unidad confirmada no vuelve a ejecutarse;
23. payload y evidencia no se sobrescriben durante redelivery, cuarentena o reproceso;
24. caso operativo usa referencias/hashes y no duplica payload completo por defecto;
25. secretos y material reutilizable de autenticación no se copian al caso;
26. Wompi conserva pago y receipt separados de la disposición técnica;
27. RevenueCat conserva entitlement separado de la disposición técnica;
28. Resend bloquea reenvío ciego ante resultado incierto;
29. Expo Push clasifica por destino y generación y no reintenta permanentemente `DeviceNotRegistered`;
30. Sentry no crea backlog empresarial por defecto;
31. Google Places no crea dead-letter persistente para lectura interactiva agotada;
32. Apple separa PassKit inbound de APNs outbound;
33. Zebra no auto-reimprime ante resultado físico desconocido;
34. Supabase no recibe una cola externa universal;
35. Expo/EAS y Vercel no reciben infraestructura runtime ficticia;
36. Google Wallet no recibe binding remoto ficticio;
37. POS permanece bloqueado hasta `INT-POS-001`;
38. telefonía/voz permanece bloqueada hasta `TI-INT-003`;
39. siete identidades sin binding permanecen `NO_APLICA_SIN_BINDING`;
40. `SHELL-CON-024` conserva la materialización del contrato compartido;
41. `QUEUE-ARC-008` conserva la infraestructura física de cola de fallos y recuperación manual;
42. `QUEUE-ARC-009` conserva control de concurrencia de reproceso;
43. `QUEUE-ARC-012` conserva autorización de trabajos y retries manuales;
44. `QUEUE-ARC-011` conserva métricas de espera, ejecución y error;
45. `INT-EXT-017` conserva auditoría, métricas, alertas y conciliación externa;
46. `INT-EXT-018` conserva contingencia por indisponibilidad del proveedor;
47. no se modifica código;
48. no se modifica Supabase;
49. no se crean colas, stores, workers, tablas, RPC, cron ni schedulers físicos;
50. no se crean ni modifican requisitos de prueba;
51. `INT-EXT-017` permanece reservada.

---

#### 40. Resultado de la tarea

`INT-EXT-016` queda **APROBADA** como definición documental completa de cuarentena y dead-letter para las veintiuna identidades externas.

Resultado consolidado:

- identidades materializadas: **21/21**;
- razones de cuarentena preservadas: **8**;
- puertas acumulativas de dead-letter preservadas: **7**;
- acciones manuales preservadas: **10**;
- outcomes de cierre preservados: **8**;
- webhooks inbound con aislamiento y dead-letter gobernados: **2**;
- operaciones outbound con guarda de resultado desconocido: **2**;
- telemetría best-effort sin dead-letter empresarial: **1**;
- lectura interactiva sin dead-letter persistente: **1**;
- familia híbrida PassKit/APNs: **1**;
- configuraciones sin cola runtime: **2**;
- periférico físico con conciliación previa: **1**;
- modelo sin binding remoto: **1**;
- identidades sin binding no aplicables: **7**;
- identidades bloqueadas sin binding: **2**;
- cambios físicos: **0**;
- requisitos creados o modificados: **0**.

Invariante final:

```text
UNIDAD EXTERNA ESTABLE
+
RESULTADO EMPRESARIAL NO INFERIDO
+
EVIDENCIA PROTEGIDA
+
RAZÓN DE CUARENTENA CERRADA CUANDO APLIQUE
+
SIETE PUERTAS DE DEAD-LETTER CUANDO APLIQUE
+
PROPIETARIA + RESPONSABLE + SIGUIENTE ACCIÓN
+
AUTORIZACIÓN DE REPROCESO
+
CONCILIACIÓN ABIERTA SI EXISTE INCERTIDUMBRE
=
AISLAMIENTO CONTROLADO SIN DUPLICAR EFECTOS NI OCULTAR OBLIGACIONES
```

---

ÚLTIMA TAREA APROBADA

`INT-EXT-015 — Definir rate limits, reintentos, backoff y circuit breaker`

TAREA ACTUAL APROBADA

`INT-EXT-016 — Definir cuarentena o dead-letter`

SIGUIENTE TAREA RESERVADA

`INT-EXT-017 — Definir auditoría, métricas, alertas y conciliación`


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
