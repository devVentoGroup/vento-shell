### CONTRATOS DE INTEGRACIONES EXTERNAS

<!-- EXECUTION-GATE-RECONCILIATION:B001-200:SHELL-CON-017-024 -->
### Reconciliación topológica de SHELL-CON-017 a SHELL-CON-024

Esta regla se incorpora al contrato de cada marcador `SHELL-CON-017..024`.

| Propiedad | Valor |
| --- | --- |
| modalidad física | `GLOBAL_ENABLE_ONCE` |
| gate temporal | `PRE_E5_FOUNDATION` |
| identidad | `<task_id>::GLOBAL` |
| autorización | explícita por instancia; nunca inferida desde el marcador documental |

Las formas contractuales estáticas de integración pueden materializarse una sola vez como fundación compartida antes de E5. La existencia del contrato global no ejecuta integraciones, llamadas remotas, sincronizaciones, webhooks, credenciales ni efectos empresariales.

Esta reconciliación prevalece únicamente sobre un requisito histórico de esperar E5 para materializar la forma compartida inicial. La ejecución de una integración o su adopción por un package_id conserva el gate propietario correspondiente.

### ✅ SHELL-CON-017 — Crear contrato de principal técnico de integración

**Estado:** APROBADA
**Tarea anterior:** SHELL-CON-016 — Crear contrato de propiedad funcional
**Tarea siguiente:** SHELL-CON-018 — Crear contrato de referencia de credencial externa sin incluir el secreto
**Tipo de tarea:** Documental
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/01_CONTRATOS_DE_INTEGRACIONES_EXTERNAS.md`
**Estado físico resultante:** `CONTRATO_DE_PRINCIPAL_TECNICO_DE_INTEGRACION_DEFINIDO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-CON-017` centraliza en la fundación compartida de Vento OS el contrato lógico de `IntegrationPrincipal` ya definido por `INT-EXT-002`, sin crear una identidad paralela, sin reinterpretar las 21 decisiones `EXT-SYS-001` a `EXT-SYS-021` y sin confundir identidad técnica, credencial, actor humano, cuenta de proveedor, endpoint, dispositivo o autoridad empresarial.

La regla central es:

```text
INTEGRATION PRINCIPAL
=
identidad lógica técnica, no humana, estable y atribuible
que identifica la frontera VENTO responsable de una interacción de integración
```

Y permanece separado de:

```text
ACTOR HUMANO
PRINCIPAL AUTENTICADO DE UNA EJECUCIÓN
PERMISSION KEY
PROVIDER ACCOUNT
EXTERNAL CREDENTIAL
SECRET VALUE
ENDPOINT
DISPOSITIVO
PROVEEDOR
AUTORIDAD EMPRESARIAL
```

La tarea convierte esa semántica ya aprobada en un contrato compartido consumible a futuro por aplicaciones, adaptadores, servicios, auditoría y componentes de integración, pero no materializa todavía package, tipos, registros, credenciales, secretos, endpoints, tablas, migraciones ni cambios en Supabase.

---

#### 2. Resultado canónico

Queda definido el contrato lógico compartido de principal técnico de integración con estas decisiones:

1. existe una identidad compartida denominada `IntegrationPrincipal`;
2. su identificador estable se denomina `IntegrationPrincipalId`;
3. la superficie lógica propietaria se reserva en `@vento/contracts/integrations`;
4. el identificador es opaco, no secreto, estable y no reutilizable para otra integración independiente;
5. cada binding material deberá resolver un principal técnico antes de operar;
6. una misma plataforma externa puede requerir varios principales cuando existan fronteras materialmente distintas;
7. una rotación de credencial no cambia por sí sola el principal lógico;
8. un cambio de finalidad, frontera de confianza o integración independiente obliga a reevaluar la identidad aplicable;
9. `IntegrationPrincipal` no concede permisos empresariales;
10. `IntegrationPrincipal` no sustituye `PrincipalContext`, `SYSTEM_SERVICE`, actor efectivo ni autorización;
11. la identidad del proveedor externo permanece separada del principal técnico interno de VENTO;
12. las 21 decisiones de `INT-EXT-002` se adoptan por referencia y no se duplican como una segunda matriz editable;
13. `SHELL-CON-018` conserva en exclusiva la definición de la referencia de credencial externa sin secreto;
14. no se asigna en esta tarea ningún valor físico de `integration_principal_id`.

---

#### 3. Fuentes y precedencia

La tarea conserva y coordina las siguientes decisiones aprobadas:

| Fuente                                    | Uso vinculante                                                                                                             |
| ----------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `SHELL-CON-001`                           | raíz `@vento/contracts`, autoridad estática, separación frente a runtime y prohibición de anticipar contratos propietarios |
| `SHELL-CON-016`                           | propiedad funcional única, separación entre propietaria empresarial y ejecutor técnico                                     |
| `INT-EXT-001`                             | inventario de 21 identidades externas, propiedad, finalidad y evidencia                                                    |
| `INT-EXT-002`                             | definición de `IntegrationPrincipal`, cardinalidad, dirección de confianza, matriz 21/21 y handoffs                        |
| `INT-EXT-003..020`                        | decisiones posteriores sobre credenciales, autenticación, scopes, ambientes, contratos, transporte, resiliencia y retiro   |
| `AUTH-CTX-005`                            | semántica de `PrincipalContext`, incluida la clase `SYSTEM_SERVICE`                                                        |
| `AUTH-CTX-006`                            | separación entre principal técnico y actor efectivo                                                                        |
| `SHELL-PKG-001..008`                      | distribución, SemVer, compatibilidad, publicación, deprecación, actualización y rollback de packages compartidos           |
| Registro Canónico de Requisitos de Prueba | cobertura vigente de integración, identidad técnica, autenticación, autorización y trazabilidad                            |

Precedencia aplicable:

```text
INT-EXT-001
→ inventario de sistemas y fronteras externas

INT-EXT-002
→ semántica propietaria de IntegrationPrincipal

SHELL-CON-017
→ contrato compartido consumible de esa semántica

SHELL-CON-018..024
→ contratos complementarios de la misma familia

implementación física autorizada
→ tipos, registros, adapters y consumidores
```

`SHELL-CON-017` no reabre ni sustituye las decisiones de `INT-EXT-002`.

---

#### 4. Frontera exacta de la tarea

La tarea incluye únicamente:

- identidad lógica del principal técnico;
- invariantes de estabilidad y atribución;
- separación frente a actores, permisos, credenciales y proveedores;
- relación con `SYSTEM_SERVICE`;
- reglas de cardinalidad;
- reglas de entrada, salida y bridges locales;
- metadata conceptual mínima necesaria para resolver la identidad;
- política de fallo cerrado;
- trazabilidad y ciclo de vida conceptual;
- superficie compartida lógica dentro de `@vento/contracts`;
- adopción por referencia de las 21 decisiones ya aprobadas.

La tarea no incluye:

- valor secreto de ninguna credencial;
- referencia contractual completa de credencial externa;
- procedencia proveedor/VENTO de credenciales;
- API key, OAuth, HMAC, certificados u otros mecanismos concretos;
- scopes de proveedor;
- separación física de secretos por ambiente;
- contratos de evento externo;
- contratos canónicos de venta o línea de venta;
- mapeo de identificadores externos;
- idempotencia y conciliación;
- cuarentena, rechazo o compensación;
- creación de cuentas externas;
- persistencia física;
- código runtime;
- cambios en Supabase.

Esos asuntos permanecen en `SHELL-CON-018..024`, `INT-EXT-003..020`, BLOQUE E3/R y tareas técnicas propietarias.

---

#### 5. Definición canónica de `IntegrationPrincipal`

`IntegrationPrincipal` representa la identidad lógica técnica bajo la cual VENTO ejecuta o procesa una interacción perteneciente a una frontera concreta de integración.

Responde:

```text
¿QUÉ INTEGRACIÓN TÉCNICA VENTO EJECUTÓ O PROCESÓ ESTA INTERACCIÓN?
```

No responde por sí sola:

```text
¿QUÉ PERSONA ORIGINÓ LA INTENCIÓN?
¿QUÉ PERMISO EMPRESARIAL EXISTÍA?
¿QUÉ SECRETO SE UTILIZÓ?
¿QUÉ CUENTA COMERCIAL POSEE VENTO EN EL PROVEEDOR?
¿QUÉ ENDPOINT SE INVOCÓ?
¿QUÉ RESULTADO EMPRESARIAL QUEDÓ CONFIRMADO?
¿QUÉ APLICACIÓN ES PROPIETARIA DEL HECHO?
```

El principal técnico existe para atribución estable, separación de responsabilidades, auditabilidad y control de fronteras; no es un mecanismo de autorización por sí mismo.

---

#### 6. `IntegrationPrincipalId`

`IntegrationPrincipalId` es la identidad estable y opaca de un `IntegrationPrincipal`.

Reglas:

1. es un identificador, no un secreto;
2. no contiene API keys, tokens, certificados, passwords ni material recuperable de credencial;
3. no se deriva del valor de una credencial;
4. no se deriva del correo de una persona;
5. no se deriva automáticamente del nombre de una función, repositorio, variable de entorno, endpoint o proveedor;
6. no se deriva automáticamente de `external_system_id`;
7. permanece estable durante rotaciones ordinarias de credencial del mismo binding;
8. no se reutiliza para otra integración independiente después de retiro o revocación;
9. debe ser único dentro del registro canónico que lo materialice físicamente;
10. no se fija en esta tarea un prefijo, UUID, secuencia, slug ni formato físico que las fuentes aprobadas no hayan establecido;
11. una entrada desconocida o ambigua no se convierte en `IntegrationPrincipalId` por cast o semejanza textual;
12. no se crean valores físicos para las 21 identidades externas durante esta tarea documental.

La ausencia deliberada de un formato serial nuevo evita inventar identificadores sin una autoridad física aprobada.

---

#### 7. Separaciones obligatorias

Se mantiene la siguiente desigualdad contractual:

```text
IntegrationPrincipalId
≠ PrincipalContext.session_id
≠ PrincipalContext.auth_user_id
≠ PermissionKey
≠ provider_account_ref
≠ external_credential_id
≠ secret value
≠ endpoint_ref
≠ device_id
≠ external_system_id
≠ AppCode
≠ actor humano
```

Consecuencias:

- una misma cadena textual no fusiona dos categorías;
- una cuenta del proveedor no identifica al principal VENTO;
- una credencial válida no identifica por sí sola al principal;
- un endpoint no es una identidad;
- un dispositivo no es automáticamente el principal del servicio que lo usa;
- una aplicación no obtiene un principal genérico por su `AppCode`;
- una persona que inicia o aprueba la operación conserva identidad propia y trazable;
- un permiso empresarial no se convierte en credencial técnica ni identidad de integración.

---

#### 8. Relación con `PrincipalContext` y `SYSTEM_SERVICE`

`AUTH-CTX-005` ya define `PrincipalContext` como identidad técnica autenticada de una solicitud y contempla `principal_type = SYSTEM_SERVICE` para procesos de servidor confiables, incluidos adapters, webhooks verificados, jobs y procesos que usan credenciales privilegiadas.

`SHELL-CON-017` conserva una separación de niveles:

```text
IntegrationPrincipal
→ identidad estable de la frontera de integración

PrincipalContext.SYSTEM_SERVICE
→ identidad autenticada de una ejecución o solicitud concreta
```

Reglas:

1. no todo `SYSTEM_SERVICE` es una integración externa;
2. un mantenimiento interno, job o servicio puede ser `SYSTEM_SERVICE` sin poseer `IntegrationPrincipal`;
3. una ejecución de integración podrá resolverse como `SYSTEM_SERVICE` cuando su modelo de autenticación y contexto así lo determine;
4. esa ejecución deberá poder correlacionarse con el `IntegrationPrincipal` aplicable sin fusionar ambos conceptos;
5. `auth_user_id` puede ser nulo para un servicio y no se usa como sustituto obligatorio de `IntegrationPrincipalId`;
6. `session_id` describe sesión o ejecución técnica y no reemplaza la identidad estable del binding;
7. esta tarea no agrega campos a `AccessContext@1.0.0`;
8. esta tarea no cambia `PrincipalContext` ni sus cuatro valores de `principal_type`;
9. `service_role` permanece una credencial privilegiada, nunca un `IntegrationPrincipalId`;
10. `SYSTEM_SERVICE` válido y `IntegrationPrincipal` conocido no implican operación empresarial autorizada.

---

#### 9. Cardinalidad y frontera material

La cardinalidad se resuelve por frontera material de integración, no únicamente por proveedor o plataforma.

Reglas heredadas y centralizadas:

1. cada binding material debe tener una decisión explícita de principal antes de operar;
2. dos integraciones independientes no reutilizan un principal genérico para simplificar configuración;
3. una misma plataforma puede tener varios principales por aplicación, finalidad, dirección, cuenta, componente o frontera de ejecución;
4. compartir proveedor no fusiona principales;
5. compartir contrato comercial no fusiona principales;
6. compartir infraestructura no fusiona principales;
7. compartir una credencial, cuando exista legacy, no prueba que exista un único principal válido;
8. un cambio de credencial no crea automáticamente un principal nuevo;
9. un cambio de finalidad o frontera de confianza obliga a reevaluar si sigue siendo el mismo principal;
10. si no existe binding acreditado, no se fabrica una identidad física por anticipación.

---

#### 10. Dirección de confianza

El contrato conserva tres direcciones conceptuales.

##### 10.1. Salida VENTO → tercero

```text
ACTOR O PROCESO VENTO
→ AUTORIZACIÓN EMPRESARIAL
→ INTEGRATION PRINCIPAL
→ REFERENCIA DE CREDENCIAL
→ PROVEEDOR EXTERNO
```

La identidad técnica permite atribuir la llamada, pero la autoridad empresarial se resuelve antes y permanece en el dominio propietario.

##### 10.2. Entrada tercero → VENTO

```text
FUENTE EXTERNA
→ AUTENTICIDAD DEL PROVEEDOR
→ RECEPTOR / ADAPTER VENTO
→ INTEGRATION PRINCIPAL INTERNO
→ CONTRATO PROPIETARIO
→ EFECTO EMPRESARIAL DESPUÉS DE VALIDACIÓN
```

La identidad externa del proveedor y el principal interno de procesamiento no se fusionan.

##### 10.3. Bridge local o dispositivo

```text
ACTOR HUMANO
→ APLICACIÓN VENTO
→ INTEGRATION PRINCIPAL / BINDING LOCAL
→ BRIDGE, AGENTE O DISPOSITIVO
```

El bridge, navegador, impresora, token de dispositivo o periférico no sustituye al actor humano ni al principal lógico.

---

#### 11. Superficie compartida lógica

Se reserva la superficie pública lógica:

```text
@vento/contracts/integrations
```

Su responsabilidad en `SHELL-CON-017` queda limitada a la semántica de principal técnico.

Artefactos lógicos públicos reservados por esta tarea:

- `IntegrationPrincipalId`;
- `IntegrationPrincipal`;
- `IntegrationPrincipalRef`.

Reglas:

1. estos nombres representan contrato compartido y no implementación runtime;
2. la forma física TypeScript, JSON Schema o generación exacta solo podrá materializarse mediante `SHELL-CI-020::<package_id>` después de aprobar `E5-GATE-008::<package_id>` y satisfacer las etapas previas obligatorias del paquete;
3. ningún consumidor podrá definir una versión semánticamente distinta bajo los mismos nombres;
4. no se autoriza importar rutas internas no publicadas;
5. la raíz `@vento/contracts` no se usa como exportación genérica para ocultar el subpath;
6. `SHELL-CON-018..024` podrán ampliar esta misma familia de integración cuando sus tareas propietarias definan sus contratos;
7. esta tarea no anticipa los símbolos públicos concretos de `SHELL-CON-018..024`.

La reserva de `@vento/contracts/integrations` no implica que el directorio exista físicamente ni que el package esté publicado.

---

#### 12. Contrato conceptual mínimo

La futura representación compartida de un principal técnico deberá poder preservar, como mínimo y cuando aplique, las siguientes dimensiones semánticas:

| Dimensión                  | Regla                                                                                       |
| -------------------------- | ------------------------------------------------------------------------------------------- |
| `integration_principal_id` | identidad técnica estable, opaca y no secreta                                               |
| `external_system_id`       | referencia a la identidad externa gobernada por el inventario aplicable; no es el principal |
| `external_instance_id`     | instancia concreta solo cuando exista evidencia y contrato suficiente                       |
| `business_owner_ref`       | propietaria del hecho o decisión empresarial; permanece separada del ejecutor técnico       |
| `technical_owner_ref`      | responsable técnico del binding o integración                                               |
| finalidad técnica          | capacidad exacta para la que existe el principal; no concede autoridad empresarial          |
| ambiente                   | contexto de ejecución identificable y no inferido                                           |
| vigencia                   | condición temporal o de ciclo de vida aplicable cuando exista materialización               |
| correlación                | vínculo con request, command, event, intento o evidencia sin sustituir sus identidades      |

Esta tabla define información semántica mínima, no un schema físico definitivo.

Quedan expresamente fuera de la forma mínima de `SHELL-CON-017`:

- el valor de una credencial;
- el contrato completo de `external_credential_id`;
- secretos;
- headers de autenticación;
- endpoint concreto;
- payload empresarial;
- datos personales del actor causal.

---

#### 13. Relación con las 21 identidades de `INT-EXT-002`

`INT-EXT-002` conserva autoridad sobre la matriz materializada de `EXT-SYS-001` a `EXT-SYS-021`.

`SHELL-CON-017` adopta esa matriz por referencia y no crea una copia editable.

Reconciliación vigente:

| Control                                                            |    Resultado |
| ------------------------------------------------------------------ | -----------: |
| identidades externas heredadas                                     |       **21** |
| decisiones documentales de principal                               | **21 de 21** |
| faltantes                                                          |        **0** |
| duplicados                                                         |        **0** |
| decisiones documentales `ESPECIFICADO`                             |       **21** |
| materializaciones físicas `PENDIENTE_DE_EVIDENCIA`                 |       **11** |
| materializaciones físicas `NO_APLICA` actualmente                  |       **10** |
| valores físicos de `IntegrationPrincipalId` creados por esta tarea |        **0** |

Las claves `EXT-SYS-*` siguen siendo identidades del inventario documental externo. No se convierten automáticamente en `IntegrationPrincipalId` ni en identificadores del proveedor.

---

#### 14. Frontera con credenciales y `SHELL-CON-018`

`SHELL-CON-017` fija únicamente esta relación:

```text
IntegrationPrincipal
→ puede autenticarse mediante una credencial referenciada
```

Permanece prohibido:

```text
IntegrationPrincipal = secret value
IntegrationPrincipal = API key
IntegrationPrincipal = token
IntegrationPrincipal = certificado
IntegrationPrincipal = service_role
IntegrationPrincipal = provider account
```

`SHELL-CON-018` conserva como responsabilidad exclusiva la definición compartida de la referencia de credencial externa sin incluir el secreto.

Por tanto, esta tarea no fija todavía:

- forma de `ExternalCredentialId`;
- campos de una referencia de credencial;
- emisor de la credencial;
- almacenamiento;
- cifrado;
- rotación;
- expiración;
- revocación;
- scope de proveedor;
- separación física por ambiente.

---

#### 15. Frontera con proveedor y cuenta externa

Un proveedor o una cuenta de proveedor no se convierten en principal técnico VENTO.

```text
PROVEEDOR
→ presta capacidad externa

PROVIDER ACCOUNT
→ identifica cuenta, tenant o relación externa cuando exista

INTEGRATION PRINCIPAL
→ identifica la frontera técnica VENTO que ejecuta o procesa la interacción
```

Reglas:

1. la autenticidad de un proveedor no concede autoridad empresarial;
2. una cuenta comercial no se reutiliza como identidad de ejecución VENTO;
3. un tenant no equivale a principal;
4. una cuenta humana administradora del proveedor no equivale a principal;
5. un webhook firmado identifica una fuente externa autenticada, pero el procesamiento interno sigue teniendo identidad VENTO propia;
6. el principal técnico no adquiere propiedad funcional del hecho por ser quien transporta o procesa la integración.

---

#### 16. Frontera con autorización empresarial

La secuencia válida es:

```text
INTENCIÓN O EVENTO
→ IDENTIDAD Y CONTEXTO
→ AUTORIZACIÓN EMPRESARIAL
→ INTEGRATION PRINCIPAL
→ CREDENCIAL TÉCNICA
→ INTERACCIÓN EXTERNA
→ VALIDACIÓN DEL RESULTADO
→ EFECTO EMPRESARIAL PROPIETARIO
→ AUDITORÍA
```

Invariantes:

1. un principal válido puede recibir rechazo empresarial;
2. una credencial válida puede pertenecer a un principal sin permiso para la operación solicitada;
3. un proveedor autenticado no puede ordenar por sí solo una mutación interna;
4. `service_role` no sustituye autorización de dominio;
5. una integración de solo lectura no amplía su finalidad por compartir principal o credencial con otra;
6. una automatización conserva la misma frontera de propiedad que una acción interactiva;
7. `IntegrationPrincipal` no contiene `PermissionKey` como sustituto de autorización;
8. conocer el principal no permite inferir sede, área, turno, check-in, rol o actor humano.

---

#### 17. Actor humano causal y delegación

Cuando una persona origine, apruebe, supervise o dispare una operación que después sea ejecutada por una integración:

```text
ACTOR HUMANO CAUSAL
≠ INTEGRATION PRINCIPAL
```

La auditoría deberá poder conservar ambos cuando apliquen.

Reglas:

1. una cuenta personal no se usa como `IntegrationPrincipalId`;
2. el correo de un empleado no se usa como principal técnico;
3. la identidad técnica no borra al actor causal;
4. una automatización posterior puede conservar causalidad con un actor o proceso sin convertirse en ese actor;
5. no existe delegación humana implícita por ejecutar bajo un principal técnico;
6. una operación que exige actor humano no se vuelve válida únicamente porque la integración esté autenticada;
7. la resolución del actor efectivo permanece bajo los contratos de contexto y autorización.

---

#### 18. Ambiente y aislamiento

Toda ejecución debe permitir distinguir el ambiente relevante sin convertirlo en autoridad empresarial.

Reglas:

1. producción, staging, desarrollo, sandbox u otros ambientes aprobados no se fusionan por accidente en auditoría;
2. la identidad del ambiente no se infiere únicamente desde una URL o variable no gobernada;
3. un mismo nombre lógico no habilita compartir credenciales entre ambientes;
4. la separación física de credenciales por ambiente permanece en `INT-EXT-006` y contratos posteriores;
5. esta tarea no obliga a que cada ambiente use siempre un `IntegrationPrincipalId` diferente ni autoriza que lo comparta: la decisión depende de la frontera material y de confianza aplicable;
6. si el ambiente cambia la frontera de confianza o finalidad, la identidad debe reevaluarse.

---

#### 19. Ciclo de vida conceptual

La futura materialización deberá permitir conservar:

- alta explícita;
- vínculo con la integración exacta;
- vínculo con propietario técnico y empresarial;
- activación controlada;
- referencia a credencial sin secreto;
- rotación de credenciales sin perder identidad cuando el binding sea el mismo;
- suspensión;
- revocación;
- retiro;
- historial de cambios;
- correlación de ejecuciones;
- reconciliación de ambigüedades.

Reglas:

1. retirar un principal no permite reutilizar su identidad para otra integración;
2. una credencial revocada no implica que el histórico del principal desaparezca;
3. una rotación no reescribe auditoría previa;
4. el estado físico exacto y su persistencia pertenecen a la implementación posterior;
5. esta tarea no crea enums físicos de lifecycle ni tablas para representarlos.

---

#### 20. Seguridad y minimización

El contrato compartido deberá ser seguro para transporte, logs contractuales y auditoría sin exponer material sensible.

Queda prohibido incorporar en `IntegrationPrincipal`:

- API keys;
- JWT completos;
- access tokens;
- refresh tokens;
- passwords;
- client secrets;
- webhook secrets;
- claves privadas;
- certificados privados;
- service role keys;
- cookies de sesión;
- material criptográfico recuperable;
- datos personales que no sean necesarios para identificar causalidad mediante referencia separada.

`IntegrationPrincipalId` debe poder aparecer en evidencia técnica sin permitir autenticación por conocimiento del identificador.

---

#### 21. Auditoría y correlación

Toda interacción material deberá poder correlacionar, cuando aplique:

```text
IntegrationPrincipalId
+
actor o proceso causal
+
external_system_id
+
external_instance_id
+
ambiente
+
contrato/version
+
request / command / event / attempt
+
referencia de credencial
+
resultado técnico
+
efecto empresarial confirmado o rechazado
```

Reglas:

1. la correlación no fusiona identidades;
2. el resultado técnico no se interpreta automáticamente como resultado empresarial;
3. una respuesta externa no cambia la propietaria funcional;
4. la referencia de credencial se conserva sin secreto;
5. la auditoría histórica conserva el principal usado aunque después se suspenda o retire;
6. un principal desconocido o ambiguo se registra como inconsistencia y no se rellena por heurística.

---

#### 22. Fallo cerrado

Una frontera que requiera principal técnico no podrá operar como integración canónica cuando:

- el principal no pueda resolverse;
- exista más de una identidad posible sin regla autoritativa;
- la identidad pertenezca a otra integración independiente;
- la finalidad no corresponda al binding solicitado;
- la referencia esté retirada o no sea utilizable según el contrato vigente;
- el ambiente o frontera de confianza resulte incompatible;
- la ejecución dependa de convertir una cuenta humana, secreto o proveedor en principal;
- la información necesaria solo pueda obtenerse inventando un valor no acreditado.

El fallo cerrado del principal no sustituye la lógica de retry, cuarentena, compensación o conciliación que pertenece a tareas posteriores.

---

#### 23. Compatibilidad, versionado y distribución

El contrato hereda `SHELL-PKG-001..008`:

1. `@vento/contracts` conserva SemVer independiente;
2. una publicación es inmutable;
3. cambios incompatibles en la forma o semántica pública exigen clasificación SemVer apropiada;
4. consumidores VENTO usan versiones exactas según la política ya aprobada;
5. publicación y adopción requieren pruebas propias y matriz de compatibilidad;
6. no existe auto-merge ni auto-deploy por actualizar el contrato;
7. una deprecación deberá conservar inventario de consumidores, ventana, migración y rollback;
8. un cambio de credencial ordinario no obliga a versionar el contrato si no cambia su forma o significado;
9. cambiar la semántica de `IntegrationPrincipalId` o mezclar categorías constituye cambio contractual material.

---

#### 24. Estado de materialización física

En el corte actual:

```text
SHELL-CON-017
→ contrato lógico completo
→ superficie @vento/contracts/integrations reservada
→ IntegrationPrincipal definido
→ IntegrationPrincipalId definido
→ 21 decisiones INT-EXT-002 adoptadas por referencia
→ 0 valores físicos de principal creados
→ 0 packages materializados
→ 0 tipos publicados
→ 0 registros persistidos
→ 0 credenciales creadas
→ 0 secretos creados
→ 0 cambios en Supabase
→ 0 consumidores migrados
```

La materialización física del registro de sistemas, bindings y principals corresponde a `INT-DB-001`; cualquier implementación del contrato compartido solo puede abrirse tras `E5-GATE-008::<package_id>` mediante `SHELL-CI-020::<package_id>`, una vez satisfechas las etapas previas obligatorias del paquete.

Esta tarea no cambia el estado de ningún expediente E5 ni autoriza implementación fuera del ciclo aprobado.

---

#### 25. Handoffs exactos

| Pendiente                                                 | Propietario existente                                      | Condición de salida                                                                                                                      |
| --------------------------------------------------------- | ---------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| referencia compartida de credencial sin secreto           | `SHELL-CON-018`                                            | contrato lógico aprobado y posteriormente materializado sin exponer secreto                                                              |
| evento externo recibido                                   | `SHELL-CON-019`                                            | sobre y semántica de recepción definidos                                                                                                 |
| contrato canónico de venta                                | `SHELL-CON-020`                                            | venta compartida definida sin doble fuente                                                                                               |
| contrato canónico de línea de venta                       | `SHELL-CON-021`                                            | línea compartida y correlacionable definida                                                                                              |
| mapeo de identificadores externos                         | `SHELL-CON-022`                                            | referencias externas/canónicas gobernadas sin equivalencias heurísticas                                                                  |
| idempotencia y conciliación                               | `SHELL-CON-023`                                            | identidad de operación, resultado y reconciliación definidos                                                                             |
| cuarentena, rechazo y compensación                        | `SHELL-CON-024`                                            | tratamiento de entrada inválida o efecto fallido definido                                                                                |
| procedencia de credenciales                               | `INT-EXT-003`                                              | cada superficie aplicable clasificada                                                                                                    |
| mecanismo de autenticación                                | `INT-EXT-004`                                              | mecanismo por integración aprobado                                                                                                       |
| least privilege técnico                                   | `INT-EXT-005`                                              | alcance mínimo definido                                                                                                                  |
| separación de ambientes                                   | `INT-EXT-006`                                              | aislamiento aplicable definido                                                                                                           |
| almacenamiento, rotación y revocación de secretos         | `INT-EXT-007` / `INT-EXT-008`                              | ciclo de credencial definido                                                                                                             |
| registro físico de sistemas, bindings y principal técnico | `INT-DB-001`                                               | infraestructura autorizada materializa identidad, binding y auditoría de integración sin convertir el principal en credencial ni permiso |
| materialización física del contrato compartido            | `SHELL-CI-020::<package_id>`                               | se abre solo tras `E5-GATE-008::<package_id>` y con las etapas previas obligatorias del paquete satisfechas                              |
| adopción compartida                                       | `SHELL-CI-006`; `SHELL-MIG-001..008` para consumidores web | cada consumidor se actualiza mediante PR; los consumidores web además migran por lotes reversibles y certifican retiro legacy            |

No se crea un identificador de tarea nuevo porque los pendientes poseen propietario canónico existente.

---

#### 26. Cobertura de prueba vigente no modificada

La semántica centralizada por esta tarea ya se encuentra protegida por cobertura canónica vigente. `INT-EXT-002` identifica, entre otras, las siguientes relaciones de prueba existentes: `TREQ-INTEGRATION-020`, `TREQ-AUTH-015`, `TREQ-AUTH-021`, `TREQ-SUPABASE-866`, `TREQ-SUPABASE-867`, `TREQ-INTEGRATION-201`, `TREQ-INTEGRATION-290`, `TREQ-INTEGRATION-293`, `TREQ-INTEGRATION-294` y `TREQ-INTEGRATION-315`.

Esa cobertura ya protege separación entre principal técnico y actor humano, correlación tecnológica, autenticación mínima, vínculo técnico explícito, tratamiento de `service_role` como credencial y prohibición de derivar autoridad empresarial desde infraestructura o acceso compartidos.

---

#### 27. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA**

**Requisitos creados:** 0
**Requisitos modificados:** 0

Justificación: `SHELL-CON-017` centraliza y hace compartida una semántica ya aprobada y ya protegida. No introduce comportamiento ejecutable, nuevo mecanismo de autenticación, secreto, credencial, endpoint, permiso, transporte, estado empresarial ni persistencia física. Por ello el Registro Canónico de Requisitos de Prueba permanece sin cambios.

---

#### 28. Decisiones vinculantes

1. `IntegrationPrincipal` es la identidad lógica técnica, no humana y atribuible de una frontera de integración VENTO.
2. `IntegrationPrincipalId` es estable, opaco y no secreto.
3. No se crea un formato serial nuevo de identificador en esta tarea.
4. La superficie lógica compartida se reserva en `@vento/contracts/integrations`.
5. `IntegrationPrincipal`, `IntegrationPrincipalId` e `IntegrationPrincipalRef` quedan reservados como artefactos públicos lógicos de `SHELL-CON-017`.
6. Cada binding material deberá resolver un principal antes de operar.
7. Dos integraciones independientes no comparten un principal genérico por conveniencia.
8. Una plataforma puede poseer varios principales cuando existan bindings materialmente distintos.
9. Rotar una credencial no cambia por sí solo el principal lógico.
10. Cambiar finalidad o frontera de confianza exige reevaluar la identidad.
11. `IntegrationPrincipal` no es `PrincipalContext` ni `SYSTEM_SERVICE`.
12. Una ejecución de integración puede resolverse como `SYSTEM_SERVICE`, pero ambos conceptos conservan identidades y ciclos de vida distintos.
13. No todo `SYSTEM_SERVICE` es una integración externa.
14. `service_role` es credencial privilegiada, nunca principal ni permiso empresarial.
15. `IntegrationPrincipal` no es actor humano.
16. `IntegrationPrincipal` no es `PermissionKey`.
17. `IntegrationPrincipal` no es cuenta de proveedor.
18. `IntegrationPrincipal` no es credencial ni valor secreto.
19. `IntegrationPrincipal` no es endpoint ni dispositivo.
20. La identidad externa del proveedor no sustituye el principal interno de VENTO.
21. Un principal válido no implica operación empresarial autorizada.
22. La propiedad funcional permanece en la aplicación o dominio propietario definido por sus contratos.
23. Las 21 decisiones de `INT-EXT-002` se adoptan por referencia y no se duplican.
24. Las 11 materializaciones `PENDIENTE_DE_EVIDENCIA` permanecen pendientes.
25. Las 10 materializaciones `NO_APLICA` permanecen sin identidad física hasta que exista binding acreditado.
26. No se crean valores físicos de `integration_principal_id`.
27. `SHELL-CON-018` conserva la referencia de credencial externa sin secreto.
28. Esta tarea no crea código, package físico, migración, tabla, RLS, RPC, secreto, cuenta externa ni cambio Supabase.
29. Esta tarea no crea ni modifica `TREQ-*`.
30. `SHELL-CON-018` permanece como única continuidad reservada.

---

#### 29. Hallazgos y destinos exactos

| Hallazgo                                                                                                              | Estado                                  | Destino                                                                                                                                  |
| --------------------------------------------------------------------------------------------------------------------- | --------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| el contrato semántico de principal técnico ya existe en `INT-EXT-002` pero no está centralizado en `@vento/contracts` | resuelto documentalmente por esta tarea | `SHELL-CON-017`                                                                                                                          |
| no existen valores físicos acreditados de `IntegrationPrincipalId` para las 21 identidades                            | esperado por fase                       | `INT-DB-001`, exclusivamente dentro de un paquete autorizado tras `E5-GATE-008::<package_id>` y abierto por `SHELL-CI-020::<package_id>` |
| 11 identidades poseen binding/configuración observados pero principal físico no acreditado                            | `PENDIENTE_DE_EVIDENCIA` heredado       | `INT-EXT-002` conserva la decisión documental; `INT-DB-001` es el propietario de la materialización física posterior                     |
| 10 identidades no poseen binding acreditado                                                                           | `NO_APLICA` actualmente                 | `INT-EXT-002` conserva la no materialización; `INT-DB-001` solo aplica después de acreditar un binding real                              |
| referencia contractual de credencial aún no está centralizada                                                         | reservado                               | `SHELL-CON-018`                                                                                                                          |
| `PrincipalContext.SYSTEM_SERVICE` ya existe y puede solaparse operativamente con una integración                      | conciliado conceptualmente              | conservar separación `SYSTEM_SERVICE` / `IntegrationPrincipal` en runtime y contratos                                                    |
| persistencia física del registro de integración no existe como resultado de esta tarea                                | fuera de alcance                        | `INT-DB-001`                                                                                                                             |

Todos los pendientes tienen propietario o condición de materialización identificados.

---

#### 30. Criterios de aceptación

`SHELL-CON-017` queda documentalmente completa cuando:

1. `IntegrationPrincipal` queda definido como identidad técnica no humana y atribuible;
2. `IntegrationPrincipalId` queda definido como estable, opaco y no secreto;
3. no se inventa un formato de ID físico;
4. se reserva `@vento/contracts/integrations` como superficie lógica compartida;
5. se separan principal técnico, actor humano, `PermissionKey`, cuenta de proveedor, credencial, secreto, endpoint, dispositivo y aplicación;
6. se concilia explícitamente `IntegrationPrincipal` con `PrincipalContext.SYSTEM_SERVICE` sin fusionarlos;
7. se preserva que no todo `SYSTEM_SERVICE` es una integración externa;
8. se preserva que un principal técnico válido no concede autorización empresarial;
9. se preserva la propiedad funcional definida por los dominios propietarios;
10. se conservan las reglas de cardinalidad por frontera material;
11. se conserva que una misma plataforma puede requerir varios principales;
12. se conserva que una rotación de credencial no cambia por sí sola el principal;
13. se preservan las tres direcciones de confianza: salida, entrada y bridge local;
14. se adopta por referencia la matriz de 21 identidades de `INT-EXT-002`;
15. se concilian 21 de 21 decisiones, con 0 faltantes y 0 duplicados;
16. se mantienen 11 casos `PENDIENTE_DE_EVIDENCIA` y 10 `NO_APLICA` para materialización física;
17. se crean 0 valores físicos de `integration_principal_id`;
18. se mantiene `SHELL-CON-018` como propietaria de la referencia de credencial externa;
19. no se adelantan los contratos `SHELL-CON-019..024`;
20. no se crean secretos, credenciales, cuentas, endpoints, schemas físicos, tablas, migraciones, RLS, RPC ni cambios Supabase;
21. no se modifica `AccessContext@1.0.0`;
22. no se crean ni modifican requisitos de prueba;
23. la continuidad reserva exclusivamente `SHELL-CON-018`.

---

#### 31. Continuidad

##### ÚLTIMA TAREA APROBADA

SHELL-CON-016 — Crear contrato de propiedad funcional

##### TAREA ACTUAL APROBADA

SHELL-CON-017 — Crear contrato de principal técnico de integración

##### SIGUIENTE TAREA RESERVADA

SHELL-CON-018 — Crear contrato de referencia de credencial externa sin incluir el secreto


### ✅ SHELL-CON-018 — Crear contrato de referencia de credencial externa sin incluir el secreto

**Estado:** APROBADA
**Tarea anterior:** SHELL-CON-017 — Crear contrato de principal técnico de integración
**Tarea siguiente:** SHELL-CON-019 — Crear contrato de evento externo recibido
**Tipo de tarea:** Documental
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/01_CONTRATOS_DE_INTEGRACIONES_EXTERNAS.md`
**Estado físico resultante:** `CONTRATO_DE_REFERENCIA_DE_CREDENCIAL_EXTERNA_DEFINIDO_NO_MATERIALIZADO`
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-CON-018` centraliza en la fundación compartida de Vento OS el contrato no sensible mediante el cual una integración puede identificar una credencial externa sin transportar, persistir ni revelar su valor operacional.

La regla central es:

```text
EXTERNAL CREDENTIAL REF
=
identidad y metadata contractual no sensibles
que permiten atribuir una credencial a su integración, superficie y ambiente
sin contener el material que autentica o verifica
```

Y permanece separado de:

```text
VALOR SECRETO
API KEY OPERACIONAL
TOKEN OPERACIONAL
PASSWORD
PRIVATE KEY
CERTIFICADO PRIVADO
SERVICE ROLE KEY
COOKIE O SESIÓN
MATERIAL RECUPERABLE DE CREDENCIAL
```

La tarea convierte en contrato compartido las decisiones ya aprobadas en `INT-EXT-003` a `INT-EXT-008`, sin reabrir su procedencia, mecanismo, alcance, ambiente, custodia o lifecycle y sin crear valores físicos de `ExternalCredentialId`.

---

#### 2. Resultado canónico

Queda definido el contrato lógico compartido de referencia de credencial externa con estas decisiones:

1. existe un identificador contractual denominado `ExternalCredentialId`;
2. existe una referencia contractual no sensible denominada `ExternalCredentialRef`;
3. ambos pertenecen a la superficie lógica `@vento/contracts/integrations` ya reservada por `SHELL-CON-017`;
4. `ExternalCredentialId` identifica una credencial gobernada o un verificador de credencial, no su valor;
5. `ExternalCredentialRef` conserva únicamente identidad y metadata no sensibles necesarias para vincular la credencial con sistema externo, principal técnico, superficie, ambiente y contratos aplicables;
6. una referencia no autoriza por sí sola a resolver el material secreto;
7. una referencia no contiene una ruta operacional de secret store, variable de entorno funcional ni valor recuperable de credencial;
8. una credencial materializada pertenece a un único ambiente VENTO;
9. la misma plataforma puede tener varias referencias por superficies de credencial independientes;
10. una rotación que sustituye el material por un sucesor independiente conserva el mismo `IntegrationPrincipal` cuando la frontera no cambia, pero el sucesor conserva identidad de credencial distinta y relación histórica con el predecesor;
11. configuraciones públicas, identificadores de destino y bindings sin credencial externa no reciben un `ExternalCredentialId` ficticio;
12. la referencia de una credencial publicable sigue sin convertir su valor en secreto ni en autoridad empresarial;
13. se preservan las veintiuna identidades `EXT-SYS-001` a `EXT-SYS-021` con decisión explícita de aplicabilidad;
14. no se crea ninguna instancia física de `ExternalCredentialId` en esta tarea.

---

#### 3. Fuentes y precedencia

La tarea conserva y coordina las siguientes decisiones aprobadas:

| Fuente                                    | Uso vinculante                                                                                                                         |
| ----------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| `SHELL-CON-001`                           | `@vento/contracts` como autoridad estática, versionada y sin secretos ni resolución runtime                                            |
| `SHELL-CON-017`                           | `IntegrationPrincipal`, `IntegrationPrincipalId`, superficie `@vento/contracts/integrations` y separación entre principal y credencial |
| `INT-EXT-001`                             | inventario de veintiuna identidades externas y evidencia de binding                                                                    |
| `INT-EXT-002`                             | separación entre principal técnico, actor, cuenta externa, `external_credential_id` y valor secreto                                    |
| `INT-EXT-003`                             | procedencia de credenciales por superficie y separación entre emisor, custodio, presentador y validador                                |
| `INT-EXT-004`                             | mecanismo técnico de autenticación o verificación por superficie                                                                       |
| `INT-EXT-005`                             | `minimum_scope`, `scope_ceiling` y mínimo privilegio                                                                                   |
| `INT-EXT-006`                             | separación obligatoria por `DEVELOPMENT`, `STAGING` y `PRODUCTION`                                                                     |
| `INT-EXT-007`                             | clasificación de material, referencia no sensible y frontera con secret stores                                                         |
| `INT-EXT-008`                             | lifecycle, predecesor, sucesor, expiración, revocación y retiro                                                                        |
| `SHELL-PKG-001..008`                      | distribución, SemVer, compatibilidad, deprecación y rollback de packages compartidos                                                   |
| Registro Canónico de Requisitos de Prueba | cobertura vigente de credenciales, secretos, autorización, integración y trazabilidad                                                  |

Precedencia aplicable:

```text
INT-EXT-001..008
→ decisiones propietarias de integración externa

SHELL-CON-017
→ identidad compartida del principal técnico

SHELL-CON-018
→ referencia compartida no sensible de credencial

implementación física autorizada
→ resolución runtime, secret store, consumers y evidencia
```

`SHELL-CON-018` no redefine el secret store ni el mecanismo de autenticación.

---

#### 4. Frontera exacta de la tarea

La tarea incluye únicamente:

- semántica de `ExternalCredentialId`;
- semántica de `ExternalCredentialRef`;
- dimensiones mínimas que una referencia debe preservar;
- cardinalidad por superficie y ambiente;
- relación con `IntegrationPrincipal`;
- relación con procedencia, mecanismo y alcance ya aprobados;
- relación con custodia sin exponer ubicación operacional ni valor secreto;
- relación con lifecycle y sucesión de credenciales;
- tratamiento de credenciales publicables;
- política de fallo cerrado ante referencias ambiguas o incompletas;
- decisiones de aplicabilidad para `EXT-SYS-001` a `EXT-SYS-021`;
- superficie pública lógica dentro de `@vento/contracts/integrations`.

La tarea no incluye:

- valores de API keys, tokens, secretos, passwords o claves privadas;
- material de certificados privados;
- rutas físicas de secret stores;
- nombres funcionales que permitan recuperar secretos;
- creación o rotación de credenciales;
- selección nueva de mecanismos;
- ampliación de scopes;
- creación de ambientes, cuentas, proyectos o instancias externas;
- contratos de evento externo;
- contratos de venta o línea de venta;
- mapeo de identificadores externos;
- idempotencia o conciliación;
- cuarentena, rechazo o compensación;
- tablas, DDL, DML, migraciones, RLS, RPC o cambios en Supabase;
- implementación runtime o migración de consumidores.

---

#### 5. Definición canónica de `ExternalCredentialId`

`ExternalCredentialId` es la identidad estable, opaca y no sensible de una credencial gobernada dentro de una frontera de integración.

Reglas:

1. identifica la credencial, no el secreto;
2. no es una API key, token, password, private key, certificado privado ni valor derivable del secreto;
3. no se deriva de `IntegrationPrincipalId`, `external_system_id`, `provider_account_ref`, endpoint, variable de entorno o nombre del proveedor;
4. no se deriva de un hash reversible, truncamiento o representación parcial del valor secreto;
5. no se usa como mecanismo de autenticación;
6. conocer el identificador no concede capacidad para resolver ni usar la credencial;
7. es único dentro del registro físico que lo materialice;
8. no se reutiliza para una credencial sucesora distinta;
9. no se reutiliza después de revocación o retiro para material diferente;
10. permanece en la evidencia histórica aunque la credencial sea revocada, expirada o retirada;
11. esta tarea no fija UUID, prefijo, slug, secuencia ni formato físico no aprobado por las fuentes;
12. esta tarea crea cero valores físicos de `ExternalCredentialId`.

---

#### 6. Definición canónica de `ExternalCredentialRef`

`ExternalCredentialRef` es la representación contractual no sensible que permite reconocer qué credencial corresponde a una interacción sin transportar el material que autentica o verifica.

Debe poder responder, cuando exista evidencia:

```text
¿QUÉ CREDENCIAL CONTRACTUAL ES?
¿A QUÉ SISTEMA Y BINDING PERTENECE?
¿QUÉ PRINCIPAL TÉCNICO LA USA O VALIDA?
¿EN QUÉ AMBIENTE PUEDE USARSE?
¿QUÉ SUPERFICIE Y FINALIDAD CUBRE?
¿QUIÉN LA EMITIÓ O ASIGNÓ SEGÚN LA EVIDENCIA?
¿QUÉ MECANISMO LA CONSUME?
¿CUÁL ES SU TECHO DE ALCANCE?
¿QUÉ CLASE DE MATERIAL REPRESENTA?
¿CUÁL ES SU ESTADO DE LIFECYCLE CUANDO ESTÁ MATERIALIZADA?
```

No debe poder responder:

```text
¿CUÁL ES EL VALOR DEL SECRETO?
¿CUÁL ES LA PRIVATE KEY?
¿CUÁL ES EL TOKEN OPERACIONAL?
¿CUÁL ES EL PASSWORD?
¿QUÉ TEXTO DEBO PRESENTAR PARA AUTENTICARME?
```

---

#### 7. Dimensiones mínimas de la referencia

Una materialización futura de `ExternalCredentialRef` deberá poder conservar, sin exponer el valor de la credencial, estas dimensiones:

| Dimensión                  | Regla                                                                                  |
| -------------------------- | -------------------------------------------------------------------------------------- |
| `external_credential_id`   | identidad estable, opaca y no sensible de la credencial                                |
| `external_system_id`       | identidad externa propietaria de la familia; no sustituye la credencial                |
| `external_instance_id`     | instancia concreta únicamente cuando exista evidencia suficiente                       |
| `integration_principal_id` | principal técnico al que la credencial está vinculada; no es la credencial             |
| `provider_account_ref`     | cuenta o relación externa cuando exista; permanece separada de la credencial           |
| superficie de credencial   | superficie exacta a la que aplica; no se inventa un formato global de ID               |
| procedencia                | conserva la decisión acreditada por `INT-EXT-003`; no se infiere desde naming          |
| mecanismo                  | conserva el mecanismo acreditado por `INT-EXT-004`; no lo selecciona esta tarea        |
| `minimum_scope`            | operaciones y recursos mínimos aprobados por `INT-EXT-005`                             |
| `scope_ceiling`            | techo que la credencial no puede superar                                               |
| ambiente VENTO             | exactamente `DEVELOPMENT`, `STAGING` o `PRODUCTION` cuando la referencia física exista |
| clase de material          | clasificación aplicable de `INT-EXT-007`                                               |
| propietario funcional      | referencia al dueño de la finalidad o efecto empresarial, sin transferir autoridad     |
| custodio técnico           | responsable técnico de la integración o superficie                                     |
| estado de lifecycle        | estado aprobado por `INT-EXT-008` cuando exista materialización física                 |
| predecesor / sucesor       | referencia no sensible cuando exista una rotación                                      |
| fechas conocidas           | únicamente las acreditadas por emisor, política o evidencia; no se inventan            |
| consumidores autorizados   | consumidores explícitamente admitidos cuando el contrato requiera material compartido  |

No todos los campos condicionales deben estar poblados si la fuente propietaria declara que no aplican. Un dato obligatorio para la operación que no pueda resolverse bloquea la referencia en lugar de completarse por inferencia.

---

#### 8. Datos expresamente prohibidos dentro de la referencia

`ExternalCredentialRef` no contendrá:

- API key operacional;
- secret key;
- `service_role` key;
- JWT completo;
- access token;
- refresh token;
- webhook secret;
- password;
- client secret;
- private key;
- archivo P8;
- archivo P12;
- password de P12;
- JSON privado de cuenta de servicio;
- token opaco recuperable que autentique una operación;
- cookie de sesión;
- header de autenticación completo;
- firma reutilizable como credencial;
- material criptográfico recuperable;
- copia parcial del secreto que permita reconstrucción o correlación insegura;
- ruta operacional cuya publicación conceda acceso al material;
- variable o instrucción runtime que funcione como mecanismo de recuperación del secreto.

La referencia puede contener metadata no sensible aprobada, pero nunca debe convertirse en un sustituto encubierto del secreto.

---

#### 9. Frontera con `IntegrationPrincipal`

La relación canónica es:

```text
IntegrationPrincipalId
→ identifica QUIÉN ejecuta técnicamente la frontera VENTO

ExternalCredentialId
→ identifica QUÉ credencial gobernada se usa o valida

ExternalCredentialRef
→ describe la relación no sensible entre credencial, principal, superficie y ambiente
```

Reglas:

1. un principal puede relacionarse con varias credenciales por superficie o ambiente;
2. una credencial no concede autoridad empresarial al principal;
3. compartir principal no permite compartir automáticamente credencial;
4. compartir credencial legacy no demuestra que dos integraciones deban compartir principal;
5. una rotación ordinaria puede conservar `IntegrationPrincipalId` y sustituir `ExternalCredentialId`;
6. un cambio de principal no reescribe la identidad histórica de la credencial usada anteriormente;
7. `service_role` permanece material de credencial privilegiado, no principal técnico.

---

#### 10. Cardinalidad por superficie

La referencia se gobierna por superficie de credencial, no únicamente por proveedor.

Por tanto:

```text
UN external_system_id
PUEDE TENER
VARIAS ExternalCredentialRef
```

cuando existan, por ejemplo:

- credencial saliente y credencial entrante distintas;
- API key de cliente y secreto server-side distintos;
- credenciales distintas por plataforma móvil;
- firma de artefacto y autenticación de API distintas;
- credenciales distintas por cuenta, aplicación, issuer, topic o recurso;
- credenciales sucesoras durante una rotación controlada.

Reglas:

1. dos superficies no se fusionan por compartir proveedor;
2. dos materiales no se fusionan por compartir nombre de variable;
3. una plataforma con varias direcciones de confianza puede requerir varias referencias;
4. una misma referencia no cubre silenciosamente una superficie nueva;
5. un uso nuevo exige decisión contractual de procedencia, mecanismo, alcance, ambiente y lifecycle antes de agregarse.

---

#### 11. Separación por ambiente

Toda referencia física de credencial pertenece a un único ambiente VENTO:

```text
DEVELOPMENT
STAGING
PRODUCTION
```

Reglas:

1. el ambiente se resuelve antes de seleccionar la referencia;
2. una referencia productiva no puede seleccionarse desde desarrollo o staging;
3. una referencia de staging no puede seleccionarse desde desarrollo o producción;
4. una referencia de desarrollo no puede seleccionarse desde staging o producción;
5. la igualdad del nombre lógico de una credencial entre ambientes no implica igualdad de `ExternalCredentialId` ni del material;
6. si el proveedor no permite aislamiento suficiente, la referencia del ambiente afectado permanece bloqueada hasta materializar una instancia o separación compatible;
7. una etiqueta `test`, `preview`, `development` o equivalente del proveedor no reemplaza la identidad de ambiente VENTO por inferencia.

---

#### 12. Procedencia de la credencial

`ExternalCredentialRef` preserva la procedencia decidida por `INT-EXT-003` sin redefinirla.

La referencia debe permitir distinguir, según evidencia:

- material emitido o asignado por proveedor;
- material emitido por VENTO;
- material cuya procedencia no está acreditada;
- ausencia actual de credencial externa en un binding observado;
- ausencia de binding sobre el cual materializar una credencial.

Reglas:

1. la ubicación actual del valor no demuestra quién lo emitió;
2. el nombre de una variable no demuestra procedencia;
3. una credencial emitida por VENTO no se convierte en permiso empresarial;
4. una credencial emitida por el proveedor no convierte al proveedor en actor VENTO;
5. `ORIGEN_NO_ACREDITADO` permanece como incertidumbre explícita hasta disponer de evidencia suficiente;
6. una referencia no puede convertir esa incertidumbre en una procedencia supuesta.

---

#### 13. Mecanismo, alcance y autoridad

La referencia puede transportar metadata del mecanismo y alcance aprobados, pero no ejecuta autenticación ni autorización.

```text
ExternalCredentialRef
→ IDENTIFICA METADATA CONTRACTUAL

runtime autorizado
→ RESUELVE MATERIAL
→ EJECUTA MECANISMO
→ REVALIDA AUTORIDAD EMPRESARIAL INDEPENDIENTE
```

Reglas:

1. una API key sigue siendo API key aunque su referencia sea opaca;
2. un secreto de webhook no puede reutilizarse como credencial outbound;
3. un material de lectura no se amplía a escritura;
4. `minimum_scope` y `scope_ceiling` no pueden ampliarse por una configuración runtime más permisiva;
5. una credencial técnicamente válida no concede `PermissionKey`;
6. el contrato compartido no contiene lógica para evaluar scopes del proveedor;
7. el contrato compartido no llama al proveedor ni a Supabase para validar credenciales.

---

#### 14. Clase de material y custodia

`INT-EXT-007` distingue material secreto, verificadores, credenciales publicables, configuración pública, referencias y destinos.

`ExternalCredentialRef` se interpreta como `CREDENTIAL_REFERENCE`: una identidad no sensible que puede persistirse o versionarse sin contener el material autenticador.

La referencia puede describir una credencial cuyo material sea, según la fuente propietaria:

- `SECRET_STATIC_SERVER_SIDE`;
- `SECRET_DYNAMIC_VERIFIER`;
- `SECRET_DYNAMIC_RECOVERABLE`;
- `PUBLIC_CREDENTIAL_RESTRICTED`.

No se crea una `ExternalCredentialRef` únicamente porque exista:

- `PUBLIC_CONFIGURATION` sin función de credencial;
- `DESTINATION_TOKEN_OR_IDENTIFIER` que solo identifica destino;
- `NO_SECRET_APPLICABLE` en una frontera sin credencial externa.

Reglas:

1. la referencia no contiene el secreto aunque el runtime pueda resolverlo;
2. la referencia no expone un secret store físico como API pública de `@vento/contracts`;
3. la resolución de material pertenece al runtime y custodia autorizados;
4. un valor publicable puede estar disponible en configuración cliente, pero no se incorpora al package contractual como valor operacional por el solo hecho de ser público;
5. el contrato compartido conserva clasificación y vínculo, no configuración viva del proveedor.

---

#### 15. Lifecycle y rotación

La identidad de credencial conserva historia propia.

Cuando una credencial se sustituye por otra:

```text
CREDENCIAL PREDECESORA
→ ExternalCredentialId A

CREDENCIAL SUCESORA INDEPENDIENTE
→ ExternalCredentialId B
```

La rotación puede mantener el mismo `IntegrationPrincipalId` si no cambia la frontera técnica.

Reglas:

1. el sucesor no reutiliza `ExternalCredentialId` del predecesor;
2. la relación predecesor/sucesor se conserva mediante referencias no sensibles;
3. la revocación no borra la referencia histórica;
4. la expiración no reescribe fechas conocidas;
5. `REVOCADA`, `EXPIRADA` y `RETIRADA` no vuelven a `ACTIVA` mediante edición retrospectiva;
6. `ROTACION_EN_CURSO` y `SOLAPAMIENTO_CONTROLADO` no autorizan fallback indefinido;
7. una credencial de otro ambiente no puede actuar como sucesor temporal;
8. el contrato no inventa una fecha de expiración cuando el emisor no la provee o la evidencia no la acredita.

---

#### 16. Credenciales publicables

Una credencial diseñada para distribución en cliente puede ser referenciada sin reclasificarse como secreto.

Reglas:

1. `PUBLIC_CREDENTIAL_RESTRICTED` conserva su naturaleza publicable;
2. ocultar una credencial publicable dentro de un bundle no crea confidencialidad;
3. su seguridad depende de alcance mínimo, restricciones de aplicación/API/dominio/cuota, ambiente y controles server-side posteriores;
4. el valor operacional publicable no se convierte en constante contractual de `@vento/contracts`;
5. una contraparte privada asociada requiere una referencia y custodia separadas;
6. una credencial publicable no prueba actor humano, principal técnico ni autoridad empresarial.

---

#### 17. Artefactos derivados y tokens efímeros

No todo artefacto generado a partir de una credencial requiere una identidad persistente independiente.

Reglas:

1. una credencial raíz gobernada conserva su `ExternalCredentialId`;
2. un artefacto efímero derivado, como un token firmado de corta vida, no crea automáticamente un nuevo `ExternalCredentialId` cuando su identidad y lifecycle dependen de la credencial raíz;
3. la expiración del artefacto derivado no equivale a revocación de la credencial raíz;
4. si una tarea propietaria determina que el artefacto derivado posee lifecycle y autoridad independientes, deberá recibir una referencia propia antes de tratarse como credencial gobernada separada;
5. esta tarea no crea identificadores para artefactos efímeros observados.

---

#### 18. Resolución runtime

`@vento/contracts` conserva únicamente el contrato estático.

La resolución futura del material seguirá conceptualmente:

```text
ExternalCredentialRef
→ validar sistema + principal + superficie + ambiente + estado
→ resolver binding runtime privado
→ comprobar autorización técnica para acceder al material
→ obtener material desde custodia aprobada
→ ejecutar mecanismo
→ no exponer el valor
```

Reglas:

1. `ExternalCredentialRef` no contiene una función de resolución;
2. `@vento/contracts` no accede a secret stores;
3. el runtime no puede usar el identificador como valor de autenticación;
4. una referencia desconocida, retirada, de otro ambiente o incompatible con la superficie falla cerrada;
5. la ausencia del material bloquea la operación que lo requiere;
6. el fallo de resolución no autoriza fallback a una credencial global, legacy o de otro ambiente;
7. logs y auditoría usan referencias no sensibles, nunca el valor resuelto.

---

#### 19. Auditoría y evidencia

Una interacción que use credencial deberá poder conservar, cuando aplique:

```text
ExternalCredentialId
+
IntegrationPrincipalId
+
external_system_id
+
external_instance_id
+
ambiente
+
superficie
+
mecanismo
+
referencia de contrato
+
intento
+
resultado técnico
+
efecto empresarial
```

sin registrar el material de autenticación.

La evidencia puede conservar identificador de credencial, versión o fingerprint no reversible únicamente cuando exista un mecanismo aprobado que no permita recuperar ni reutilizar el secreto.

La auditoría histórica no se elimina cuando una credencial expira, se revoca o se retira.

---

#### 20. Fallo cerrado

Una referencia no podrá considerarse utilizable cuando:

- falta `external_credential_id` en una credencial que debe estar gobernada;
- la referencia pertenece a otro sistema, principal, superficie o ambiente;
- la procedencia obligatoria permanece irresoluble y el contrato exige acreditarla antes de operar;
- el mecanismo no corresponde con la superficie;
- el alcance solicitado excede `scope_ceiling`;
- el ambiente es ambiguo;
- el estado de lifecycle impide uso;
- el material requerido no puede resolverse desde la custodia autorizada;
- la única forma de continuar exige usar una credencial global, humana, legacy, de otro ambiente o no gobernada;
- el dato faltante solo puede completarse por inferencia.

El fallo de referencia no sustituye retry, conciliación, cuarentena o compensación, que permanecen bajo sus contratos propietarios.

---

#### 21. Decisión por las veintiuna identidades externas

`SHELL-CON-018` preserva las decisiones de `INT-EXT-001..008` y materializa una decisión de aplicabilidad de referencia para cada identidad sin crear identificadores físicos.

| `external_system_id` | Sistema / plataforma                     | Evidencia de credencial heredada                                 | Estado de referencia en SHELL-CON-018 | Decisión                                                                                                                                                 |
| -------------------- | ---------------------------------------- | ---------------------------------------------------------------- | ------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `EXT-SYS-001`        | Supabase                                 | credenciales de proveedor acreditadas en binding                 | `PENDIENTE_DE_EVIDENCIA`              | requiere referencias separadas por superficie y ambiente; `service_role` permanece credencial privilegiada server-side y nunca se convierte en principal |
| `EXT-SYS-002`        | Wompi                                    | credenciales de proveedor y secretos/checksums observados        | `PENDIENTE_DE_EVIDENCIA`              | requiere referencias por superficie; la procedencia no acreditada del secreto de eventos se conserva sin inferencia                                      |
| `EXT-SYS-003`        | RevenueCat                               | API keys de SDK y secreto de webhook observados                  | `PENDIENTE_DE_EVIDENCIA`              | requiere referencias independientes por plataforma/superficie y ambiente; API key pública y secreto webhook no se fusionan                               |
| `EXT-SYS-004`        | Resend                                   | API key server-side observada                                    | `PENDIENTE_DE_EVIDENCIA`              | requiere referencia no sensible vinculada al sender técnico, ambiente y alcance de correo aprobado                                                       |
| `EXT-SYS-005`        | Expo / EAS Update                        | configuración observada sin credencial física acreditada         | `PENDIENTE_DE_EVIDENCIA`              | no se crea referencia física hasta acreditar la credencial administrativa realmente usada                                                                |
| `EXT-SYS-006`        | Expo Push Service                        | binding observado sin credencial externa de cliente              | `NO_APLICA`                           | push token permanece identificador de destino; no se crea `ExternalCredentialId` ficticio                                                                |
| `EXT-SYS-007`        | Sentry                                   | DSN de ingestión publicable/restringido observado                | `PENDIENTE_DE_EVIDENCIA`              | la credencial publicable puede tener referencia gobernada sin convertirse en secreto ni autoridad empresarial                                            |
| `EXT-SYS-008`        | Google Maps / Google Reviews             | API key de Maps observada; enlaces públicos separados            | `PENDIENTE_DE_EVIDENCIA`              | la API key puede tener referencia gobernada; URLs, coordenadas y `place_id` no reciben referencia de credencial                                          |
| `EXT-SYS-009`        | Apple Wallet / PassKit y APNs            | múltiples superficies proveedor/VENTO observadas                 | `PENDIENTE_DE_EVIDENCIA`              | cada superficie gobernada requiere referencia independiente; se preservan las brechas de custodia/lifecycle ya registradas sin cerrarlas documentalmente |
| `EXT-SYS-010`        | Vercel                                   | configuración observada sin credencial administrativa acreditada | `PENDIENTE_DE_EVIDENCIA`              | no se crea referencia física hasta acreditar la credencial de despliegue o administración realmente usada                                                |
| `EXT-SYS-011`        | Zebra BrowserPrint                       | bridge observado sin credencial externa                          | `NO_APLICA`                           | UID, nombre o dispositivo no se convierten en credencial ni reciben `ExternalCredentialId`                                                               |
| `EXT-SYS-012`        | Google Wallet / Google Pay & Wallet      | modelo de cuenta de servicio documentado sin binding acreditado  | `NO_APLICA_ACTUAL`                    | el modelo no autoriza crear una referencia física hasta acreditar el binding y ambiente aplicables                                                       |
| `EXT-SYS-013`        | POS externo vigente                      | proveedor, binding y credenciales no acreditados                 | `NO_APLICA_ACTUAL`                    | no se inventa credencial ni referencia antes de acreditar proveedor e interfaz                                                                           |
| `EXT-SYS-014`        | Shopify / canal de comercio electrónico  | sin binding ni credencial acreditados                            | `NO_APLICA_ACTUAL`                    | una futura integración deberá adoptar referencia antes de activarse si su mecanismo usa credencial                                                       |
| `EXT-SYS-015`        | Rappi / marketplace                      | sin binding ni credencial acreditados                            | `NO_APLICA_ACTUAL`                    | una futura integración deberá adoptar referencia antes de activarse si su mecanismo usa credencial                                                       |
| `EXT-SYS-016`        | ManyChat / automatización conversacional | sin binding ni credencial acreditados                            | `NO_APLICA_ACTUAL`                    | no se presume token, API key, OAuth client ni referencia                                                                                                 |
| `EXT-SYS-017`        | WhatsApp                                 | proveedor/API/binding no acreditados                             | `NO_APLICA_ACTUAL`                    | canal, número o cuenta no se convierten en referencia de credencial                                                                                      |
| `EXT-SYS-018`        | Instagram / perfiles sociales            | API/binding no acreditados                                       | `NO_APLICA_ACTUAL`                    | perfil social o cuenta humana no se convierten en referencia de credencial                                                                               |
| `EXT-SYS-019`        | Correo corporativo y alias funcionales   | proveedor e integración no acreditados                           | `NO_APLICA_ACTUAL`                    | buzón, dirección o alias no se convierten en credencial técnica                                                                                          |
| `EXT-SYS-020`        | Telefonía / canal de voz                 | operador e integración no acreditados                            | `NO_APLICA_ACTUAL`                    | número, extensión o caller ID no se convierten en credencial técnica                                                                                     |
| `EXT-SYS-021`        | Transporte externo                       | proveedor, tracking e interfaz no acreditados                    | `NO_APLICA_ACTUAL`                    | tracking, guía o portal no se convierten en credencial técnica                                                                                           |

---

#### 22. Reconciliación de cobertura

La matriz anterior conserva exactamente las veintiuna identidades externas:

```text
21 IDENTIDADES
=
9 PENDIENTE_DE_EVIDENCIA
+
2 NO_APLICA
+
10 NO_APLICA_ACTUAL
```

Controles:

| Control                                           |    Resultado |
| ------------------------------------------------- | -----------: |
| identidades esperadas                             |       **21** |
| decisiones materializadas                         | **21 de 21** |
| identificadores `EXT-SYS-*` únicos                |       **21** |
| faltantes                                         |        **0** |
| duplicados                                        |        **0** |
| valores físicos de `ExternalCredentialId` creados |        **0** |
| secretos creados, copiados, revelados o movidos   |        **0** |
| mecanismos nuevos seleccionados                   |        **0** |
| cambios de scope                                  |        **0** |
| cambios de ambiente                               |        **0** |
| cambios físicos de custodia o lifecycle           |        **0** |

`PENDIENTE_DE_EVIDENCIA` no autoriza inventar un identificador. Indica que existe una credencial o configuración relevante, pero la referencia física canónica y todos sus vínculos obligatorios no están acreditados como materializados.

---

#### 23. Superficie compartida lógica

La superficie pública lógica continúa siendo:

```text
@vento/contracts/integrations
```

Artefactos públicos lógicos definidos por esta tarea:

- `ExternalCredentialId`;
- `ExternalCredentialRef`.

Reglas:

1. no se crea un subpath paralelo para credenciales;
2. no se agregan valores operacionales de credenciales al package;
3. no se agrega una API runtime de secret resolution a `@vento/contracts`;
4. ningún consumidor define localmente una semántica distinta bajo los mismos nombres;
5. la forma física TypeScript, JSON Schema o generación exacta se materializará únicamente cuando la implementación del package sea autorizada;
6. `SHELL-CON-019..024` podrán ampliar la misma familia de integración únicamente dentro de su propia tarea propietaria;
7. esta tarea no define símbolos públicos de `SHELL-CON-019..024`.

---

#### 24. Compatibilidad, versionado y distribución

La referencia hereda la política de `SHELL-PKG-001..008` y `SHELL-CON-001`:

1. `@vento/contracts` conserva SemVer independiente;
2. una versión publicada es inmutable;
3. cambiar significado, obligatoriedad o relación de una dimensión pública exige clasificación SemVer apropiada;
4. agregar un secreto o valor operacional a una referencia existente sería una violación contractual, no una extensión compatible;
5. consumidores usan versiones exactas según la política aprobada;
6. adopción requiere compatibilidad y pruebas antes de despliegue;
7. deprecación o retiro conserva inventario de consumidores, migración, ventana y rollback;
8. rotar una credencial no obliga por sí sola a publicar una nueva versión del contrato si su forma y semántica no cambian.

---

#### 25. Estado de materialización física

En el corte actual:

```text
SHELL-CON-018
→ contrato lógico completo
→ ExternalCredentialId definido
→ ExternalCredentialRef definido
→ @vento/contracts/integrations preservado
→ 21/21 identidades con decisión de aplicabilidad
→ 0 ExternalCredentialId físicos creados
→ 0 referencias físicas persistidas
→ 0 valores de credencial incorporados al contrato
→ 0 secretos creados o movidos
→ 0 packages materializados por esta tarea
→ 0 consumidores migrados
→ 0 cambios en Supabase
```

La tarea no cambia el estado de ningún paquete ni autoriza implementación física antes de `E5-GATE-008::<package_id>` ni fuera de `SHELL-CI-020::<package_id>`.

---

#### 26. Handoffs exactos

| Pendiente                                        | Propietario existente                                                      | Condición de salida                                                                                                                  |
| ------------------------------------------------ | -------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| evento externo recibido                          | `SHELL-CON-019`                                                            | contrato compartido de recepción externa definido sin convertir credencial en payload                                                |
| contrato canónico de venta                       | `SHELL-CON-020`                                                            | venta compartida definida sin doble fuente                                                                                           |
| contrato canónico de línea de venta              | `SHELL-CON-021`                                                            | línea compartida y correlacionable definida                                                                                          |
| mapeo de identificadores externos                | `SHELL-CON-022`                                                            | equivalencias gobernadas sin heurísticas                                                                                             |
| idempotencia y conciliación                      | `SHELL-CON-023`                                                            | identidad de operación y reconciliación definidas                                                                                    |
| cuarentena, rechazo y compensación               | `SHELL-CON-024`                                                            | tratamiento de entrada inválida o efecto fallido definido                                                                            |
| registro físico de sistemas y bindings           | `INT-DB-001`                                                               | infraestructura autorizada materializa el sistema y binding sin almacenar secretos                                                   |
| referencias físicas de credenciales sin secretos | `INT-DB-002`                                                               | referencias no sensibles quedan materializadas sin exponer ni duplicar el valor de la credencial                                     |
| resolución runtime de credenciales               | `INT-EXT-007`; `INT-EXT-008`; `SHELL-CI-020::<package_id>`                 | la custodia y lifecycle aprobados se implementan solo tras `E5-GATE-008::<package_id>` y sin trasladar secretos a `@vento/contracts` |
| materialización física del contrato compartido   | `SHELL-CI-020::<package_id>`                                               | el contrato físico se abre solo tras `E5-GATE-008::<package_id>` y con las etapas previas obligatorias del paquete satisfechas       |
| adopción y compatibilidad                        | `SHELL-CI-005`; `SHELL-CI-006`; `SHELL-MIG-001..008` para consumidores web | la matriz de compatibilidad se valida antes de actualizar por PR; los consumidores web además migran por lotes reversibles           |

No se crea una tarea nueva porque los pendientes poseen propietario canónico existente.

---

#### 27. Cobertura de prueba vigente no modificada

`SHELL-CON-018` centraliza reglas ya protegidas por el registro canónico y por las decisiones de `INT-EXT-003` a `INT-EXT-008`:

- separación entre principal técnico, credencial y autoridad empresarial;
- mínimo privilegio y prohibición de `service_role` como autoridad transversal;
- referencias no sensibles y ausencia de secretos en metadata, logs, contratos o artefactos;
- separación de credenciales por ambiente;
- custodia server-side de material secreto;
- tratamiento diferenciado de credenciales publicables;
- rotación, expiración, revocación y conservación de historia;
- fail-closed ante identidad, ambiente o credencial incompatibles.

La tarea no introduce un comportamiento ejecutable adicional que requiera una fila nueva en el registro.

---

#### 28. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA**

**Requisitos creados:** 0
**Requisitos modificados:** 0

Justificación: `SHELL-CON-018` centraliza en `@vento/contracts/integrations` una referencia no sensible sobre reglas ya materializadas documentalmente y ya cubiertas por requisitos vigentes. No crea una credencial física, secreto, mecanismo, permiso, endpoint, transporte, operación empresarial, almacenamiento, persistencia ni comportamiento runtime nuevo. El Registro Canónico de Requisitos de Prueba permanece sin cambios.

---

#### 29. Decisiones vinculantes

1. `ExternalCredentialId` identifica una credencial gobernada y nunca su valor.
2. `ExternalCredentialRef` es una representación contractual no sensible.
3. Ambos pertenecen a `@vento/contracts/integrations`.
4. No se crea un formato serial físico de `ExternalCredentialId` en esta tarea.
5. Conocer un `ExternalCredentialId` no permite autenticar ni resolver el secreto.
6. Una referencia no contiene API key, token, password, private key, secret key ni material recuperable.
7. Una referencia no contiene una API runtime para secret stores.
8. La referencia conserva `external_system_id` y `integration_principal_id` como identidades distintas.
9. `external_instance_id` y `provider_account_ref` solo se incorporan cuando existe evidencia.
10. La procedencia conserva la decisión de `INT-EXT-003`.
11. El mecanismo conserva la decisión de `INT-EXT-004`.
12. `minimum_scope` y `scope_ceiling` conservan la decisión de `INT-EXT-005`.
13. Una referencia física pertenece a un único ambiente VENTO conforme a `INT-EXT-006`.
14. La clase de material conserva `INT-EXT-007`.
15. `ExternalCredentialRef` se interpreta como `CREDENTIAL_REFERENCE` y no como secret store.
16. `PUBLIC_CONFIGURATION`, `DESTINATION_TOKEN_OR_IDENTIFIER` y `NO_SECRET_APPLICABLE` no crean por sí solos una credencial ficticia.
17. `PUBLIC_CREDENTIAL_RESTRICTED` puede tener referencia gobernada sin reclasificarse como secreto.
18. Una plataforma puede requerir varias referencias por superficie.
19. Una rotación de material crea identidad de credencial sucesora distinta cuando existe un sucesor independiente.
20. La rotación no cambia por sí sola `IntegrationPrincipalId`.
21. Predecesor y sucesor conservan trazabilidad histórica.
22. Una credencial revocada, expirada o retirada no se elimina de la evidencia histórica.
23. Un artefacto efímero derivado no crea automáticamente una credencial persistente nueva.
24. La resolución runtime falla cerrada ante referencia desconocida, incompatible o de otro ambiente.
25. No existe fallback autorizado a una credencial global, legacy o de otro ambiente.
26. Las veintiuna identidades externas quedan reconciliadas 21/21.
27. Nueve identidades quedan `PENDIENTE_DE_EVIDENCIA` para referencia física.
28. Dos identidades quedan `NO_APLICA` por ausencia de credencial externa en el binding observado.
29. Diez identidades quedan `NO_APLICA_ACTUAL` por ausencia de binding o credencial materializable actual.
30. Se crean cero valores físicos de `ExternalCredentialId`.
31. Se crean o modifican cero secretos y cero credenciales.
32. No se modifica Supabase, código, package físico ni configuración remota.
33. No se crean ni modifican requisitos `TREQ-*`.
34. `SHELL-CON-019` permanece como única continuidad reservada.

---

#### 30. Hallazgos y destinos exactos

| Hallazgo                                                                                                                | Estado                                                                    | Destino                                                                                                                                     |
| ----------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| la semántica de referencia de credencial estaba distribuida entre `INT-EXT-003..008`                                    | resuelto documentalmente                                                  | `SHELL-CON-018`                                                                                                                             |
| no existen valores físicos canónicos acreditados de `ExternalCredentialId` como resultado de esta fase                  | `PENDIENTE_DE_EVIDENCIA` cuando existe credencial/configuración relevante | `INT-DB-002`, exclusivamente dentro de un paquete autorizado tras `E5-GATE-008::<package_id>` y abierto por `SHELL-CI-020::<package_id>`    |
| siete identidades poseen superficies de credencial observadas, pero la referencia física canónica no está materializada | `PENDIENTE_DE_EVIDENCIA`                                                  | `INT-EXT-003..008` conservan procedencia, mecanismo, alcance, ambiente, custodia y lifecycle; `INT-DB-002` materializa la referencia física |
| dos plataformas tienen configuración observada sin credencial administrativa acreditada                                 | `PENDIENTE_DE_EVIDENCIA`                                                  | `INT-EXT-003` debe acreditar la procedencia/material aplicable antes de que `INT-DB-002` pueda materializar una referencia                  |
| Expo Push y Zebra BrowserPrint no presentan credencial externa de cliente en el binding observado                       | `NO_APLICA`                                                               | crear referencia solo si un binding futuro introduce credencial real                                                                        |
| Google Wallet tiene modelo documentado sin binding acreditado                                                           | `NO_APLICA_ACTUAL`                                                        | acreditar binding antes de materializar referencia                                                                                          |
| nueve identidades restantes carecen de binding/credencial acreditados                                                   | `NO_APLICA_ACTUAL`                                                        | adoptar referencia antes de activación futura cuando el mecanismo la requiera                                                               |
| Apple Wallet / PassKit y APNs conserva brechas de custodia/lifecycle ya documentadas                                    | no resuelto por esta tarea                                                | `INT-EXT-007`; `INT-EXT-008`; materialización física posterior en `INT-DB-002` bajo el paquete autorizado                                   |

Todos los pendientes conservan propietario o condición objetiva de salida.

---

#### 31. Criterios de aceptación

`SHELL-CON-018` queda documentalmente completa cuando:

1. `ExternalCredentialId` queda definido como identidad no sensible y distinta del valor;
2. `ExternalCredentialRef` queda definido como referencia contractual no sensible;
3. no se inventa un formato físico de identificador;
4. se preserva `@vento/contracts/integrations` como superficie compartida;
5. la referencia no contiene secretos ni material recuperable;
6. la referencia no contiene lógica runtime de resolución;
7. principal técnico y credencial permanecen separados;
8. sistema externo, instancia y cuenta externa permanecen separados de la credencial;
9. la referencia preserva procedencia sin inferirla;
10. la referencia preserva mecanismo sin redefinirlo;
11. la referencia preserva mínimo privilegio y `scope_ceiling`;
12. cada referencia física queda ligada a un único ambiente VENTO;
13. se distingue credencial publicable de secreto confidencial;
14. configuración pública y tokens de destino no se convierten en credenciales;
15. una plataforma puede tener múltiples referencias por superficies independientes;
16. una rotación mantiene historia predecesor/sucesor sin reutilizar identidad;
17. un artefacto efímero derivado no se convierte automáticamente en credencial persistente;
18. la resolución de una referencia incompatible falla cerrada;
19. no existe fallback a credenciales globales, legacy o de otro ambiente;
20. se preservan exactamente `EXT-SYS-001` a `EXT-SYS-021`;
21. existen exactamente veintiuna decisiones de aplicabilidad;
22. faltantes = 0;
23. duplicados = 0;
24. la reconciliación es 9 `PENDIENTE_DE_EVIDENCIA` + 2 `NO_APLICA` + 10 `NO_APLICA_ACTUAL` = 21;
25. se crean cero valores físicos de `ExternalCredentialId`;
26. se crean cero secretos y cero credenciales;
27. no se modifica código, Supabase, datos, proveedores ni configuración remota;
28. no se adelanta el contrato de evento externo de `SHELL-CON-019`;
29. se crean cero requisitos de prueba;
30. se modifican cero requisitos de prueba;
31. la continuidad reserva exclusivamente `SHELL-CON-019`.

---

#### 32. Continuidad

##### ÚLTIMA TAREA APROBADA

SHELL-CON-017 — Crear contrato de principal técnico de integración

##### TAREA ACTUAL APROBADA

SHELL-CON-018 — Crear contrato de referencia de credencial externa sin incluir el secreto

##### SIGUIENTE TAREA RESERVADA

SHELL-CON-019 — Crear contrato de evento externo recibido


### ✅ SHELL-CON-019 — Crear contrato de evento externo recibido

**Estado:** APROBADA
**Tarea anterior:** SHELL-CON-018 — Crear contrato de referencia de credencial externa sin incluir el secreto
**Tarea siguiente:** SHELL-CON-020 — Crear contrato canónico de venta
**Tipo de tarea:** Documental; definición normativa documental del contrato compartido de evento externo recibido, con sobre estable, versión, identidad de recepción, referencia de autenticidad, evidencia fuente protegida, afirmación normalizada, referencias de mapping, idempotencia y correlación, sin convertir al tercero en fuente empresarial ni implementar código, persistencia, endpoints o transporte
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/01_CONTRATOS_DE_INTEGRACIONES_EXTERNAS.md`
**Superficie lógica objetivo:** `@vento/contracts/integrations`
**Estado físico resultante:** `DEFINIDO_NO_MATERIALIZADO`
**Implementación física autorizada:** ninguna
**Cambios de código, DDL, DML, migraciones, RLS, RPC, Storage, Edge Functions, secretos, credenciales, endpoints, proveedores, configuración remota, despliegues o datos:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

Definir el contrato compartido que representa una **afirmación o evento recibido desde una frontera externa** antes de que una aplicación propietaria de VENTO produzca, rechace, difiera o concilie un efecto empresarial.

El contrato debe permitir que cualquier adaptador autorizado conserve de forma uniforme:

- qué sistema externo originó la afirmación;
- qué instancia, superficie y ambiente participaron cuando exista evidencia;
- bajo qué contrato VENTO interpretó la entrada;
- qué identidad externa o receipt permite reconocer la recepción;
- cuándo fue recibida y, cuando exista evidencia, cuándo afirma el proveedor que ocurrió;
- qué resultado de autenticidad corresponde a la recepción;
- dónde se conserva la evidencia fuente protegida;
- qué huella identifica el contenido capturado sin usarla como identidad empresarial;
- cuál es la afirmación externa normalizada y minimizada;
- qué referencias de mapping, idempotencia y correlación están asociadas;
- qué propietario interno debe evaluar cualquier efecto posterior.

La tarea elimina la ambigüedad entre recibir información externa y confirmar un hecho interno:

```text
EVENTO / AFIRMACIÓN EXTERNA RECIBIDA
≠
HECHO EMPRESARIAL CANÓNICO VENTO
```

```text
PROVEEDOR EXTERNO
≠
PRODUCTOR EMPRESARIAL INTERNO
```

```text
RECEIPT / ACK / CALLBACK / WEBHOOK
≠
EFECTO EMPRESARIAL CONFIRMADO
```

```text
PAYLOAD DEL PROVEEDOR
≠
MODELO CANÓNICO DEL DOMINIO PROPIETARIO
```

---

#### 2. Resultado canónico

Se define `ExternalReceivedEvent<TNormalizedAssertion>` como el contrato lógico compartido de una recepción externa gobernada por VENTO.

Su responsabilidad es representar la frontera entre:

```text
FUENTE EXTERNA
→ CAPTURA DE RECEPCIÓN
→ AUTENTICIDAD / CONTRATO / EVIDENCIA
→ NORMALIZACIÓN DEL ADAPTADOR
→ HANDOFF A LA APLICACIÓN PROPIETARIA
```

sin saltar directamente a:

```text
HECHO EMPRESARIAL
EVENTO EMPRESARIAL INTERNO
MUTACIÓN DE DOMINIO
COMPENSACIÓN
CONCILIACIÓN CERRADA
```

El contrato se define documentalmente dentro de la superficie lógica ya aprobada:

```text
@vento/contracts/integrations
```

Esta tarea no crea todavía el package, archivo TypeScript, export, schema físico, tabla inbox, registro de receipt, endpoint de webhook ni mecanismo de almacenamiento.

---

#### 3. Entradas canónicas preservadas

`SHELL-CON-019` consume y conserva sin redefinir:

- `SHELL-CON-017`, incluido `IntegrationPrincipal`, su identidad estable y la separación entre principal técnico, actor humano, permiso, cuenta, endpoint y credencial;
- `SHELL-CON-018`, incluidos `ExternalCredentialId`, `ExternalCredentialRef`, ambiente, procedencia, mecanismo, alcance, clase de material y lifecycle sin valor secreto;
- `INT-EXT-001`, incluidas las veintiuna identidades `EXT-SYS-001` a `EXT-SYS-021` y su distribución de evidencia;
- `INT-EXT-002`, incluida la separación entre principal técnico y autoridad empresarial;
- `INT-EXT-003` a `INT-EXT-008`, incluidas procedencia, mecanismo, mínimo privilegio, separación ambiental, custodia y lifecycle de credenciales;
- `INT-EXT-009`, incluida la diferencia entre contrato de entrada, payload del proveedor, respuesta externa, versión del proveedor, versión VENTO y adaptador;
- `INT-EXT-010`, incluida la estrategia concreta de intercambio por superficie sin convertir toda entrada HTTP en evento;
- `INT-EXT-011`, incluida la validación de autenticidad, origen, tiempo y replay sin exponer material secreto;
- `INT-EXT-012`, incluida la identidad idempotente independiente de la identidad del recurso y del intento técnico;
- `INT-EXT-013`, incluido el mapping explícito entre identificadores externos, receipts, referencias canónicas y relaciones sin equivalencia;
- `INT-EXT-014`, incluida la preservación protegida del payload o evidencia fuente, la huella y la prohibición de reescribir evidencia histórica;
- `INT-EXT-015` a `INT-EXT-017`, incluidas resiliencia, cuarentena, auditoría, métricas, alertas y conciliación sin transformar sus políticas en campos ejecutables de este contrato;
- la política transversal que impide a un adaptador externo escribir directamente fuentes privadas de varias aplicaciones;
- la propiedad exclusiva de la aplicación responsable sobre cualquier hecho empresarial derivado.

La tarea no modifica ninguna de esas decisiones.

---

#### 4. Frontera semántica obligatoria

La secuencia canónica queda definida así:

```text
SISTEMA / CLIENTE TÉCNICO EXTERNO
        ↓
EVENTO O AFIRMACIÓN EXTERNA
        ↓
RECEPCIÓN TÉCNICA VENTO
        ↓
VALIDACIÓN DE CONTRATO Y AUTENTICIDAD
        ↓
EVIDENCIA FUENTE PROTEGIDA
        ↓
AFIRMACIÓN EXTERNA NORMALIZADA
        ↓
MAPEO / IDEMPOTENCIA / CORRELACIÓN
        ↓
APLICACIÓN PROPIETARIA
        ↓
VALIDACIÓN EMPRESARIAL Y AUTORIZACIÓN
        ↓
HECHO EMPRESARIAL, RECHAZO O CONCILIACIÓN
        ↓
EVENTO EMPRESARIAL INTERNO, CUANDO CORRESPONDA
```

Reglas:

1. el sistema externo es fuente de su propia afirmación, no de la verdad empresarial interna;
2. `ExternalReceivedEvent` no es un evento de `ENTERPRISE-EVENT-CATALOG-001`;
3. el proveedor externo no puede aparecer como `producer_application` de un evento empresarial interno;
4. el adaptador no adquiere propiedad funcional por recibir, verificar o transformar la entrada;
5. una autenticidad válida demuestra la procedencia técnica definida por el contrato, no que el contenido sea empresarialmente correcto;
6. una respuesta `2xx`, receipt, callback o ACK no confirma por sí sola un pago, entitlement, venta, inventario, entrega, saldo, documento o cualquier otro efecto de dominio;
7. el hecho interno solo puede producirlo la aplicación propietaria después de sus validaciones y reglas;
8. un error posterior no autoriza a reescribir la evidencia externa que originó el procesamiento.

---

#### 5. Identidad pública del contrato

La identidad lógica queda fijada así:

| Propiedad                | Decisión                                                             |
| ------------------------ | -------------------------------------------------------------------- |
| símbolo contractual      | `ExternalReceivedEvent<TNormalizedAssertion>`                        |
| package lógico           | `@vento/contracts`                                                   |
| superficie lógica        | `@vento/contracts/integrations`                                      |
| propietario              | `devVentoGroup/vento-shell`                                          |
| naturaleza               | contrato estático, versionado y no ejecutable                        |
| payload genérico         | afirmación externa normalizada y tipada por el adaptador propietario |
| valor secreto            | prohibido                                                            |
| persistencia             | fuera del alcance de esta tarea                                      |
| transporte               | fuera del alcance del contrato compartido                            |
| autorización empresarial | fuera del contrato; permanece en la aplicación propietaria           |

No se define un package adicional para eventos externos y no se crea una segunda fuente de contratos fuera de `@vento/contracts`.

---

#### 6. Forma lógica de `ExternalReceivedEvent`

La forma contractual objetivo es:

```ts
type ExternalReceivedEvent<TNormalizedAssertion> = {
  external_system_id: string;
  external_instance_id: string | null;

  integration_principal_id: IntegrationPrincipalId | null;
  external_credential_id: ExternalCredentialId | null;

  environment: "DEVELOPMENT" | "STAGING" | "PRODUCTION";

  vento_contract_version: string;
  provider_contract_version: string | null;
  input_contract_ref: string;
  transport_ref: string;

  external_event_id: string | null;
  receipt_id: string | null;

  received_at: string;
  provider_occurred_at: string | null;

  authenticity_result_ref: string | null;
  source_evidence_ref: string;
  source_payload_digest: string | null;

  normalized_assertion: TNormalizedAssertion | null;

  mapping_refs: readonly string[];
  idempotency_ref: string | null;
  correlation_refs: readonly string[];
  owner_contract_ref: string;
};
```

La forma es **lógica y normativa**. No fija nombres de archivos, módulos internos, representación JSON final, librería de validación, algoritmo de hash, formato UUID, tabla, bucket, endpoint ni estrategia de serialización física.

---

#### 7. Semántica de los campos

##### 7.1. `external_system_id`

Identifica la relación con el sistema externo gobernado. Debe ser estable dentro del catálogo aplicable y no puede derivarse libremente desde hostname, nombre comercial, endpoint o texto del payload.

Las claves `EXT-SYS-*` utilizadas en la matriz de esta tarea son identidades documentales del inventario vigente. Esta tarea no crea identificadores físicos de runtime para ellas.

##### 7.2. `external_instance_id`

Referencia la instancia, cuenta, proyecto, aplicación, issuer u otra frontera externa concreta únicamente cuando exista una identidad acreditada.

`null` significa que la instancia todavía no está acreditada o no aplica al intercambio; nunca significa “cualquier instancia”.

##### 7.3. `integration_principal_id`

Referencia el principal técnico VENTO definido por `SHELL-CON-017` cuando exista materialización aplicable.

No contiene:

- usuario humano;
- rol;
- `PermissionKey`;
- token;
- API key;
- `service_role`;
- secreto;
- cuenta comercial del proveedor.

La ausencia física actual del principal no autoriza a reemplazarlo con una credencial o identidad humana.

##### 7.4. `external_credential_id`

Referencia la credencial gobernada por `SHELL-CON-018` cuando la superficie utilice una credencial materializada.

Nunca contiene el secreto, token, firma, certificado privado o valor de autenticación.

Una superficie cuya autenticidad no use una credencial externa materializada puede conservar `null` conforme a su contrato aprobado.

##### 7.5. `environment`

Conserva exactamente la identidad lógica de ambiente VENTO:

```text
DEVELOPMENT
STAGING
PRODUCTION
```

No se deriva automáticamente de `test`, `preview`, hostname, branch, proyecto externo, tag de telemetría o contenido enviado por el proveedor.

##### 7.6. `vento_contract_version`

Es la versión del contrato VENTO que interpreta esta recepción.

Debe existir siempre para una instancia contractual consumible.

Un cambio incompatible de significado, obligatoriedad, cardinalidad o interpretación exige una nueva versión mayor conforme a las reglas de versionado aprobadas.

##### 7.7. `provider_contract_version`

Conserva la versión del proveedor solo cuando sea acreditable.

Si el proveedor no publica o no permite determinar una versión de forma verificable:

```text
provider_contract_version = null
```

No se inventa `v1`, `latest`, fecha ni versión por convención.

##### 7.8. `input_contract_ref`

Referencia el contrato de entrada exacto mediante el cual VENTO interpreta la superficie externa.

No es el endpoint y no es el nombre del proveedor.

##### 7.9. `transport_ref`

Referencia la modalidad o superficie de transporte ya gobernada por BLOQUE X.

No autoriza a inferir que cualquier request HTTP, callback de SDK o consulta polling sea un evento externo recibido.

---

#### 8. Identidad de evento y de recepción

`external_event_id` y `receipt_id` tienen semánticas distintas.

```text
external_event_id
→ identidad que el proveedor atribuye a la afirmación o evento, cuando existe y es confiable

receipt_id
→ identidad VENTO de una recepción técnica cuando el contrato la materializa
```

Invariantes:

1. al menos una identidad estable entre `external_event_id` y `receipt_id` debe ser resoluble antes de permitir procesamiento con efecto;
2. si el proveedor no entrega un identificador externo estable, la implementación futura deberá materializar un `receipt_id` durable antes del primer procesamiento o reintento;
3. un `receipt_id` nuevo por intento de procesamiento está prohibido cuando represente la misma recepción;
4. una redelivery del mismo evento puede compartir `external_event_id` y conservar una recepción técnica distinta cuando el contrato de evidencia lo requiera;
5. `external_event_id` no se convierte en identificador del recurso empresarial por coincidencia de valor;
6. `receipt_id` no se convierte en `event_id` empresarial interno;
7. el hash del payload no sustituye ninguna de estas identidades;
8. la relación entre evento externo, receipt y recurso canónico se declara mediante mapping o correlación explícita, nunca por semejanza de texto.

Ejemplo semántico permitido:

```text
EVENTO EXTERNO WOMPI
external_event_id
        ↓
RECEPCIÓN VENTO
receipt_id
        ↓
MAPPING / CORRELACIÓN
        ↓
TRANSACCIÓN PROPIETARIA
        ↓
HECHO INTERNO CONFIRMADO
```

No se permite:

```text
external_event_id
=
transaction_id canónico
```

sin una relación de mapping acreditada.

---

#### 9. Autenticidad, principal y credencial

El contrato conserva **referencias**, no material de autenticación.

`authenticity_result_ref` enlaza el resultado producido por la política aprobada de autenticidad de la superficie.

Reglas:

1. una recepción puede capturarse antes de completar autenticidad, pero no puede liberarse para producir un efecto empresarial mientras la política de la superficie no autorice continuar;
2. `authenticity_result_ref = null` no equivale a autenticidad válida;
3. una firma, checksum, MAC, JWT, token o certificado completo no se copia al contrato compartido;
4. la credencial referenciada permanece separada del resultado de autenticidad;
5. una credencial válida no convierte al proveedor en actor humano ni le concede permiso empresarial;
6. una recepción con autenticidad fallida o no demostrable conserva su evidencia y pasa a la disposición gobernada por las tareas de rechazo o cuarentena, sin producir efecto silencioso;
7. una redelivery deberá conservar la identidad lógica necesaria para que autenticidad e idempotencia puedan evaluarse sin crear un nuevo hecho por intento.

---

#### 10. Evidencia fuente y payload

`source_evidence_ref` referencia la evidencia fuente protegida definida por la política de preservación externa.

El contrato compartido **no transporta por defecto el payload original completo**.

Separación obligatoria:

```text
RAW_SOURCE_BYTES / PAYLOAD DEL PROVEEDOR
→ evidencia protegida

ExternalReceivedEvent
→ referencias + metadata + afirmación normalizada mínima
```

Reglas:

1. `source_evidence_ref` no puede ser una URL firmada persistente ni un secreto de acceso;
2. `source_payload_digest` es una huella de integridad o correlación y no una identidad empresarial;
3. el algoritmo concreto de huella se versiona en la implementación propietaria y no se fija en esta tarea;
4. cuando autenticidad dependa de los bytes exactos recibidos, la preservación debe mantener esa fuente sin reemplazarla por JSON reserializado;
5. una corrección de parser crea una nueva interpretación derivada, no modifica la fuente histórica;
6. una redelivery no sobrescribe la evidencia de una recepción previa;
7. el contrato no replica innecesariamente datos personales, financieros, médicos, documentos, credenciales o material sensible cuando una referencia protegida sea suficiente;
8. auditoría y logs deben registrar referencias, estados y huellas adecuadas sin convertirse en copia del payload.

---

#### 11. `normalized_assertion`

`normalized_assertion` contiene únicamente la representación **tipada, validada y minimizada** que el adaptador necesita entregar a la frontera propietaria.

No es un hecho empresarial.

Reglas:

1. su tipo concreto se especializa por contrato de entrada y superficie externa;
2. no existe un `Record<string, unknown>` universal como API canónica para todos los proveedores;
3. la afirmación normalizada conserva significado externo; no inventa campos internos ausentes;
4. un valor no acreditado permanece ausente o no resoluble conforme al contrato específico, en lugar de completarse por inferencia;
5. cualquier dato que deba convertirse a una identidad canónica requiere mapping explícito;
6. la afirmación normalizada no incluye secretos;
7. la afirmación normalizada no puede declarar por sí sola que un efecto empresarial quedó confirmado;
8. si autenticidad, contrato o integridad no permiten continuar, `normalized_assertion` puede permanecer `null` y la recepción conserva su evidencia para disposición controlada;
9. una nueva interpretación incompatible exige versión contractual compatible con la historia preservada.

---

#### 12. Mapping, idempotencia y correlación

El contrato solo mantiene referencias hacia las responsabilidades especializadas; no las redefine.

##### 12.1. `mapping_refs`

Relaciona identificadores externos con receipts, namespaces, rutas o recursos canónicos únicamente cuando exista una relación acreditada.

La forma compartida de mapping permanece a cargo de `SHELL-CON-022`.

No se permite deducir mapping por:

- igualdad de string;
- nombre de campo;
- proximidad temporal;
- email;
- teléfono;
- importe;
- texto libre;
- posición dentro del payload.

##### 12.2. `idempotency_ref`

Referencia la operación o decisión idempotente gobernada por las políticas vigentes.

La forma compartida de idempotencia y conciliación permanece a cargo de `SHELL-CON-023`.

`idempotency_ref` no es:

- `external_event_id` por definición universal;
- `receipt_id` por definición universal;
- hash de payload;
- `correlation_id`;
- identificador del recurso.

Cada superficie conserva el alcance aprobado de deduplicación.

##### 12.3. `correlation_refs`

Conserva referencias que permiten reconstruir la relación causal o técnica entre la recepción y otros objetos sin afirmar equivalencia.

Un timestamp por sí solo no constituye correlación ni causalidad.

##### 12.4. `owner_contract_ref`

Identifica la frontera propietaria que debe evaluar el significado empresarial de la afirmación.

No concede autoridad al adaptador y no permite escritura directa sobre la fuente de verdad del dominio.

---

#### 13. Semántica temporal

El contrato distingue como mínimo:

```text
received_at
→ momento en que VENTO registra la recepción técnica

provider_occurred_at
→ momento que el proveedor afirma para el evento, solo cuando existe y es interpretable bajo su contrato
```

Reglas:

1. `received_at` no se reemplaza por el timestamp declarado por el proveedor;
2. `provider_occurred_at` no se inventa si la fuente no lo aporta o no puede interpretarse de forma acreditada;
3. una entrega tardía conserva el momento externo original cuando exista y el momento real de recepción VENTO;
4. una redelivery no cambia retroactivamente el momento declarado del evento original;
5. el orden empresarial no se deriva únicamente de timestamps;
6. orden, versión de agregado, causalidad y reconciliación siguen gobernados por sus contratos especializados.

---

#### 14. Matriz materializada de aplicabilidad por identidad externa

Se preservan las veintiuna identidades del inventario y se decide explícitamente si existe hoy una superficie que pueda materializar `ExternalReceivedEvent` como evento externo recibido.

| ID            | Sistema / plataforma                     | Superficie inbound acreditada en el corte                                                                                                   | Decisión `SHELL-CON-019`           | Estado físico               | Condición de salida / regla                                                                                                                                                                       |
| ------------- | ---------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------- | --------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `EXT-SYS-001` | Supabase                                 | no existe un evento de proveedor único acreditado por esta tarea; las fronteras dependen de contratos propietarios                          | `NO_APLICA_EN_CORTE`               | `NO_APLICA`                 | cualquier futura superficie de evento externo deberá declarar contrato de entrada, autenticidad, evidencia y propietario antes de producir efecto                                                 |
| `EXT-SYS-002` | Wompi                                    | webhook de resultado de pago                                                                                                                | `APLICA_EVENTO_INBOUND_ACREDITADO` | `DEFINIDO_NO_MATERIALIZADO` | la recepción deberá conservar identidad externa o receipt, contrato, autenticidad, evidencia protegida, afirmación normalizada, mapping, idempotencia y correlación antes del handoff propietario |
| `EXT-SYS-003` | RevenueCat                               | webhook de entitlement / suscripción                                                                                                        | `APLICA_EVENTO_INBOUND_ACREDITADO` | `DEFINIDO_NO_MATERIALIZADO` | la recepción deberá conservar identidad externa o receipt, contrato, autenticidad, evidencia protegida, afirmación normalizada, mapping, idempotencia y correlación antes del handoff propietario |
| `EXT-SYS-004` | Resend                                   | la superficie observada es salida de correo                                                                                                 | `NO_APLICA_EN_CORTE`               | `NO_APLICA`                 | una futura callback o evento recibido deberá instanciar este contrato antes de ser procesado como afirmación externa                                                                              |
| `EXT-SYS-005` | Expo / EAS Update                        | configuración observada sin evento runtime acreditado                                                                                       | `NO_APLICA_EN_CORTE`               | `NO_APLICA`                 | acreditar primero una superficie inbound real y su contrato                                                                                                                                       |
| `EXT-SYS-006` | Expo Push Service                        | la superficie observada es salida de notificación                                                                                           | `NO_APLICA_EN_CORTE`               | `NO_APLICA`                 | una futura recepción de evento independiente requerirá contrato de entrada específico                                                                                                             |
| `EXT-SYS-007` | Sentry                                   | ingestión de telemetría VENTO hacia proveedor                                                                                               | `NO_APLICA_EN_CORTE`               | `NO_APLICA`                 | una futura entrada desde Sentry no se presume por la existencia del SDK                                                                                                                           |
| `EXT-SYS-008` | Google Maps / Google Reviews             | consulta y navegación, sin evento inbound acreditado                                                                                        | `NO_APLICA_EN_CORTE`               | `NO_APLICA`                 | acreditar una superficie de evento antes de instanciar el contrato                                                                                                                                |
| `EXT-SYS-009` | Apple Wallet / PassKit y APNs            | existen requests inbound del PassKit Web Service, pero son requests de recurso/registro y no se reetiquetan como evento empresarial externo | `NO_APLICA_AL_EVENTO_EN_CORTE`     | `NO_APLICA`                 | si se incorpora una afirmación/evento externo distinto, deberá instanciar `ExternalReceivedEvent`; los requests actuales conservan su contrato I/O propio                                         |
| `EXT-SYS-010` | Vercel                                   | configuración de plataforma sin evento runtime acreditado                                                                                   | `NO_APLICA_EN_CORTE`               | `NO_APLICA`                 | acreditar primero un binding inbound y su contrato                                                                                                                                                |
| `EXT-SYS-011` | Zebra BrowserPrint                       | bridge local y efecto físico, sin evento de proveedor inbound acreditado                                                                    | `NO_APLICA_EN_CORTE`               | `NO_APLICA`                 | callbacks o estados futuros no se convierten en evento externo sin contrato específico                                                                                                            |
| `EXT-SYS-012` | Google Wallet / Google Pay & Wallet      | modelo documentado sin binding remoto acreditado                                                                                            | `NO_APLICA_EN_CORTE`               | `NO_APLICA_ACTUAL`          | acreditar binding remoto y una superficie inbound antes de materializar recepción de eventos                                                                                                      |
| `EXT-SYS-013` | POS externo vigente                      | proveedor e interfaz no acreditados                                                                                                         | `NO_APLICA_EN_CORTE`               | `BLOQUEADO`                 | `INT-POS-001` debe acreditar proveedor, interfaz y payload; cualquier evento posterior deberá cumplir este contrato antes de producir un hecho interno                                            |
| `EXT-SYS-014` | Shopify / comercio electrónico           | sin binding acreditado                                                                                                                      | `NO_APLICA_EN_CORTE`               | `NO_APLICA_ACTUAL`          | acreditar integración y evento real antes de materialización                                                                                                                                      |
| `EXT-SYS-015` | Rappi / marketplace                      | sin binding acreditado                                                                                                                      | `NO_APLICA_EN_CORTE`               | `NO_APLICA_ACTUAL`          | acreditar integración y evento real antes de materialización                                                                                                                                      |
| `EXT-SYS-016` | ManyChat / automatización conversacional | sin binding acreditado                                                                                                                      | `NO_APLICA_EN_CORTE`               | `NO_APLICA_ACTUAL`          | acreditar bot/API y evento real antes de materialización                                                                                                                                          |
| `EXT-SYS-017` | WhatsApp                                 | sin proveedor/API/binding acreditados                                                                                                       | `NO_APLICA_EN_CORTE`               | `NO_APLICA_ACTUAL`          | acreditar proveedor, cuenta, API y evento real antes de materialización                                                                                                                           |
| `EXT-SYS-018` | Instagram / perfiles sociales            | sin API/binding acreditados                                                                                                                 | `NO_APLICA_EN_CORTE`               | `NO_APLICA_ACTUAL`          | acreditar API, cuenta técnica y evento real antes de materialización                                                                                                                              |
| `EXT-SYS-019` | Correo corporativo y alias funcionales   | proveedor e integración API no acreditados                                                                                                  | `NO_APLICA_EN_CORTE`               | `NO_APLICA_ACTUAL`          | acreditar proveedor y binding automatizado antes de materialización                                                                                                                               |
| `EXT-SYS-020` | Telefonía / canal de voz                 | operador e integración no acreditados                                                                                                       | `NO_APLICA_EN_CORTE`               | `BLOQUEADO`                 | `TI-INT-003` debe acreditar operador, interfaz y binding; un evento posterior deberá usar este contrato                                                                                           |
| `EXT-SYS-021` | Transporte externo                       | proveedor e interfaz no acreditados                                                                                                         | `NO_APLICA_EN_CORTE`               | `NO_APLICA_ACTUAL`          | acreditar proveedor, tracking/API y evento real antes de materialización                                                                                                                          |

---

#### 15. Reconciliación de identidades y decisiones

La tarea conserva exactamente el inventario heredado:

```text
21 IDENTIDADES
= 3 BINDING_TECNICO_OBSERVADO
+ 6 BINDING_CONDICIONAL_OBSERVADO
+ 2 CONFIGURACION_OBSERVADA
+ 6 DOCUMENTADO_SIN_BINDING_ACREDITADO
+ 4 PROVEEDOR_NO_ACREDITADO
```

La aplicabilidad específica de `ExternalReceivedEvent` queda:

```text
21 IDENTIDADES
= 2 APLICA_EVENTO_INBOUND_ACREDITADO
+ 19 SIN EVENTO EXTERNO RECIBIDO ACREDITADO EN EL CORTE
```

Control:

| Control                                         | Resultado |
| ----------------------------------------------- | --------: |
| identidades esperadas                           |    **21** |
| identidades materializadas en la matriz         | **21/21** |
| identificadores únicos                          |    **21** |
| faltantes                                       |     **0** |
| duplicados                                      |     **0** |
| eventos inbound acreditados                     |     **2** |
| demás identidades sin evento inbound acreditado |    **19** |
| secretos incorporados al contrato               |     **0** |
| credenciales físicas creadas                    |     **0** |
| endpoints creados                               |     **0** |
| cambios de Supabase                             |     **0** |

La clasificación de aplicabilidad no reemplaza las clasificaciones aprobadas de evidencia, transporte, autenticidad, idempotencia, mapping, preservación o resiliencia.

---

#### 16. Versionado y compatibilidad

El contrato sigue las reglas de compatibilidad ya aprobadas para `@vento/contracts` e `INT-EXT-009`.

Un cambio es incompatible cuando altera de forma no preservable, entre otros:

- la semántica de una identidad;
- la diferencia entre evento externo y hecho interno;
- obligatoriedad de un campo material;
- significado de autenticidad;
- interpretación temporal;
- vínculo entre payload fuente y afirmación normalizada;
- reglas de mapping o idempotencia;
- propiedad del efecto empresarial.

Un cambio aditivo opcional puede permanecer compatible únicamente cuando un consumidor anterior pueda ignorarlo sin reinterpretar el intercambio histórico.

Reglas adicionales:

1. `provider_contract_version` y `vento_contract_version` evolucionan independientemente;
2. cambiar la versión del proveedor no obliga automáticamente a cambiar la versión VENTO si el adaptador conserva semántica compatible;
3. cambiar el contrato VENTO no modifica retrospectivamente recepciones históricas;
4. una recepción conserva la versión con la que fue interpretada;
5. un parser nuevo no puede reinterpretar silenciosamente historia sin dejar evidencia de la nueva derivación;
6. la publicación física de versiones permanece sujeta a `SHELL-CI-001..019`, a la aprobación de `E5-GATE-008::<package_id>` y a la apertura de `SHELL-CI-020::<package_id>` para el paquete aplicable.

---

#### 17. Seguridad, privacidad y contenido prohibido

`ExternalReceivedEvent` nunca deberá incluir como contenido ordinario:

- API keys;
- service-role keys;
- passwords;
- client secrets;
- webhook secrets;
- refresh tokens;
- access tokens reutilizables;
- claves privadas;
- P8/P12;
- certificados privados;
- firmas completas cuando una referencia o resultado sea suficiente;
- URLs firmadas persistentes;
- cookies de sesión;
- payload fuente completo sensible cuando una referencia protegida sea suficiente;
- datos bancarios completos;
- expedientes médicos o personales completos;
- credenciales de proveedor;
- secretos usados para calcular checksums, HMAC o firmas.

También queda prohibido usar el contrato para transportar una `service_role` hacia un proveedor o para permitir escritura transversal sobre varias aplicaciones VENTO.

La minimización se aplica tanto a `normalized_assertion` como a metadata, auditoría, errores y correlaciones.

---

#### 18. Handoffs y fronteras posteriores

`SHELL-CON-019` deja definidos estos límites sin desarrollar las tareas posteriores:

| Trabajo posterior                       | Estado desde esta tarea     | Propietario / tarea          | Condición de salida                                                                                                                                                            |
| --------------------------------------- | --------------------------- | ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| contrato canónico de venta              | `FUERA_DE_ALCANCE`          | `SHELL-CON-020`              | la afirmación externa que corresponda a una venta puede convertirse por la propietaria en contrato canónico de venta sin conservar semántica del proveedor como fuente interna |
| contrato canónico de línea de venta     | `FUERA_DE_ALCANCE`          | `SHELL-CON-021`              | las líneas quedan representadas por identidad y semántica canónicas sin depender del payload nativo externo                                                                    |
| mapping compartido de identificadores   | `FUERA_DE_ALCANCE`          | `SHELL-CON-022`              | `mapping_refs` puede apuntar a una representación compartida tipada y sin heurísticas de identidad                                                                             |
| idempotencia y conciliación compartidas | `FUERA_DE_ALCANCE`          | `SHELL-CON-023`              | `idempotency_ref` y resultados recuperables usan el contrato compartido aprobado sin fusionar evento, receipt y efecto                                                         |
| cuarentena, rechazo y compensación      | `FUERA_DE_ALCANCE`          | `SHELL-CON-024`              | autenticidad fallida, incompatibilidad, mapping irresoluble, conflicto o entrada no procesable tienen disposición explícita sin efecto silencioso                              |
| implementación física de la superficie  | `DEFINIDO_NO_MATERIALIZADO` | `SHELL-CI-020::<package_id>` | se abre solo después de completar las etapas previas del paquete y aprobar `E5-GATE-008::<package_id>`, preservando este contrato documental                                   |

Ningún handoff autoriza a anticipar el contenido de las tareas `SHELL-CON-020` a `SHELL-CON-024`.

---

#### 19. Cobertura de prueba preexistente

La semántica protegida por esta tarea ya está cubierta por requisitos canónicos vigentes, entre ellos:

- `TREQ-INTEGRATION-003`, para identidad estable, huella, estado durable, resultado recuperable e idempotencia de operaciones asíncronas y webhooks;
- `TREQ-INTEGRATION-004`, para reconstrucción de causa, payload, principal, intento, resultado, error y efecto final;
- `TREQ-INTEGRATION-049`, para conservar afirmación externa, autenticidad, proveedor, identificador externo, payload protegido, recepción y correlación antes del hecho interno;
- `TREQ-INTEGRATION-051`, para impedir secretos y credenciales en eventos, esquemas y ejemplos;
- `TREQ-INTEGRATION-061`, para exigir validación en adaptador y propietaria antes de persistir un hecho interno;
- `TREQ-INTEGRATION-125`, para deduplicación de afirmaciones externas con identificador confiable;
- `TREQ-INTEGRATION-126`, para materializar un receipt durable cuando el proveedor no aporta identidad estable;
- `TREQ-INTEGRATION-127`, para impedir que el hash del payload sustituya la identidad empresarial;
- `TREQ-INTEGRATION-213`, para conservar sistema, autenticación referenciada, identidad externa o receipt, payload protegido, huella, versión, transformación, mapping, respuesta y correlación;
- `TREQ-INTEGRATION-306`, para limitar al adaptador a receipts, mappings y metadata propia y exigir que cualquier efecto interno pase por la propietaria.

`SHELL-CON-019` centraliza estas obligaciones en un contrato compartido y no crea una regla de comportamiento nueva respecto de las ya protegidas.

---

#### 20. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA.**

Justificación:

- la tarea materializa una representación contractual compartida de obligaciones ya aprobadas para eventos externos, autenticidad, evidencia, identidad, idempotencia, mapping, correlación y propiedad empresarial;
- no introduce un proveedor, evento operativo, mecanismo de autenticación, algoritmo criptográfico, endpoint, transporte, efecto empresarial, política de retry, almacenamiento, disposición ni autorización nueva;
- no cambia el comportamiento exigido a Wompi o RevenueCat; únicamente define el sobre común que deberá materializar esas obligaciones cuando la fase física sea autorizada;
- las diecinueve identidades restantes no reciben eventos, endpoints ni bindings ficticios;
- no se implementa código ni se modifica Supabase.

**Requisitos creados:** 0
**Requisitos modificados:** 0
**Requisitos diferidos:** 0
**Requisitos descartados:** 0
**Requisitos obsoletos:** 0

El registro canónico de requisitos permanece sin cambios.

---

#### 21. Criterios de aceptación

`SHELL-CON-019` queda documentalmente completa cuando se cumplen simultáneamente estos criterios:

1. existe exactamente un contrato lógico compartido `ExternalReceivedEvent<TNormalizedAssertion>`;
2. la superficie permanece en `@vento/contracts/integrations`;
3. el contrato distingue afirmación externa de hecho empresarial VENTO;
4. el proveedor externo no se convierte en `producer_application` interna;
5. el adaptador no adquiere propiedad funcional;
6. se conserva `external_system_id` sin derivarlo libremente del payload;
7. `external_instance_id` solo se utiliza con evidencia acreditada;
8. `IntegrationPrincipalId` y `ExternalCredentialId` se referencian sin redefinirlos;
9. el valor secreto no aparece en el contrato;
10. ambiente VENTO queda separado de etiquetas del proveedor;
11. versión VENTO y versión del proveedor permanecen independientes;
12. `input_contract_ref` identifica el contrato de entrada y no el endpoint;
13. `transport_ref` no convierte cualquier request en evento;
14. `external_event_id` y `receipt_id` conservan semánticas distintas;
15. cuando no existe ID externo estable, el contrato permite exigir receipt durable antes del procesamiento con efecto;
16. una redelivery no crea identidad empresarial nueva;
17. el hash del payload no sustituye identidad externa, receipt ni recurso;
18. autenticidad se conserva por referencia sin copiar secreto o firma completa;
19. autenticidad válida no equivale a autorización empresarial;
20. `source_evidence_ref` apunta a evidencia protegida y no a un secreto de acceso;
21. la evidencia fuente no se sobrescribe por redelivery, parser nuevo o mapping nuevo;
22. `normalized_assertion` es tipada y minimizada por superficie;
23. `normalized_assertion` no puede declarar por sí sola un hecho empresarial confirmado;
24. mapping se conserva por referencia y sin heurísticas de equivalencia;
25. idempotencia se conserva por referencia y no se confunde con receipt o hash;
26. correlación no se infiere solo por timestamp;
27. `owner_contract_ref` conserva la frontera de la aplicación propietaria;
28. `received_at` y `provider_occurred_at` permanecen separados;
29. se preservan exactamente las veintiuna identidades `EXT-SYS-001` a `EXT-SYS-021`;
30. existen exactamente 21 decisiones en la matriz;
31. faltantes = 0;
32. duplicados = 0;
33. Wompi y RevenueCat quedan como las dos superficies de evento inbound actualmente acreditadas;
34. Apple PassKit conserva sus requests inbound sin reetiquetarlos como evento empresarial externo;
35. las demás identidades no reciben un binding ficticio;
36. se preserva la distribución heredada `3 + 6 + 2 + 6 + 4 = 21`;
37. no se crean identificadores físicos de runtime;
38. no se crean secretos ni credenciales;
39. no se crean endpoints, tablas, buckets, funciones, colas o workers;
40. no se modifica Supabase;
41. no se modifica código;
42. no se ejecuta despliegue;
43. no se adelanta el contrato canónico de venta;
44. no se adelantan mapping, idempotencia, conciliación, cuarentena, rechazo o compensación compartidos;
45. se crean cero requisitos de prueba;
46. se modifican cero requisitos de prueba;
47. la siguiente tarea permanece exclusivamente reservada en `SHELL-CON-020`.

---

#### 22. Límites de la tarea

`SHELL-CON-019` no:

- implementa `@vento/contracts`;
- crea archivos TypeScript del package;
- crea schemas ejecutables;
- crea validadores runtime;
- define endpoints o rutas de webhook;
- crea tablas inbox;
- crea registros de receipt físicos;
- define una cola;
- define un dead-letter store;
- crea buckets de evidencia;
- almacena payloads;
- calcula hashes reales;
- valida firmas reales;
- selecciona secretos;
- rota credenciales;
- crea principals técnicos físicos;
- crea credenciales físicas;
- decide mappings concretos no acreditados;
- define una nueva política idempotente;
- ejecuta retry;
- ejecuta conciliación;
- ejecuta compensación;
- convierte callbacks técnicos en hechos empresariales;
- cambia propiedad funcional;
- cambia código;
- cambia Supabase;
- cambia la ruta canónica;
- desarrolla `SHELL-CON-020`.

---

#### 23. Continuidad

##### ÚLTIMA TAREA APROBADA

`SHELL-CON-018 — Crear contrato de referencia de credencial externa sin incluir el secreto`

##### TAREA ACTUAL APROBADA

`SHELL-CON-019 — Crear contrato de evento externo recibido`

##### SIGUIENTE TAREA RESERVADA

`SHELL-CON-020 — Crear contrato canónico de venta`


### ✅ SHELL-CON-020 — Crear contrato canónico de venta

**Estado:** APROBADA
**Tarea anterior:** SHELL-CON-019 — Crear contrato de evento externo recibido
**Tarea siguiente:** SHELL-CON-021 — Crear contrato canónico de línea de venta
**Tipo de tarea:** Documental; definición normativa documental del contrato técnico compartido de venta canónica, preservando identidad, fuente empresarial, revisión, contexto de origen, temporalidad, estado comercial, componentes monetarios, relaciones con pedido, cliente, pago y documento fiscal, asociación obligatoria con líneas, procedencia, correlación y auditoría, sin definir todavía el contrato compartido de línea, sin emitir eventos, sin aplicar efectos en NEXO, NUMERA o PASS y sin implementar código, persistencia, migraciones o Supabase
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/01_CONTRATOS_DE_INTEGRACIONES_EXTERNAS.md`
**Superficie lógica objetivo:** `@vento/contracts/integrations`
**Estado físico resultante:** `CONTRATO_CANONICO_DE_VENTA_DEFINIDO_NO_MATERIALIZADO`
**Implementación física autorizada:** ninguna
**Cambios de código, DDL, DML, migraciones, RLS, RPC, Storage, Edge Functions, endpoints, colas, workers, datos, secretos, credenciales, configuración remota o despliegues:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-CON-020` centraliza en la fundación compartida de Vento OS la representación técnica común de una **venta canónica individual**, de modo que la transición desde Makos y la operación posterior de PULSO converjan sobre una misma semántica consumible sin trasladar a los consumidores internos el modelo particular del proveedor, del transporte o de la persistencia propietaria.

La tarea materializa el handoff explícito de `INT-POS-005` y `INT-SALES-001`:

```text
SEMÁNTICA CANÓNICA DE VENTA
        ↓
CONTRATO COMPARTIDO ESTÁTICO
        ↓
CONSUMO HOMOGÉNEO ENTRE FRONTERAS VENTO
```

sin convertir el contrato en fuente empresarial ni en ejecutor de efectos.

La regla central es:

```text
VENTA CANÓNICA
=
HECHO COMERCIAL INDIVIDUAL IDENTIFICADO
+
FUENTE EMPRESARIAL REAL
+
CONTEXTO Y REVISIÓN
+
MOMENTO Y ESTADO COMERCIAL
+
SNAPSHOT MONETARIO
+
AL MENOS UNA LÍNEA INDIVIDUAL VÁLIDA
+
PROCEDENCIA Y CORRELACIÓN
```

Y permanece separada de:

```text
PEDIDO
PAGO
SESIÓN O MOVIMIENTO DE CAJA
DOCUMENTO FISCAL
MOVIMIENTO DE INVENTARIO
MOVIMIENTO DE FIDELIZACIÓN
HECHO ECONÓMICO
ENTREGA
EVENTO DE INTEGRACIÓN
PAYLOAD DEL PROVEEDOR
```

---

#### 2. Resultado canónico

Quedan definidos dos artefactos públicos lógicos dentro de la superficie compartida ya aprobada `@vento/contracts/integrations`:

1. `CanonicalSaleId`, como identidad canónica estable, opaca y no secreta de una venta individual;
2. `CanonicalSale<TSaleLine>`, como contrato compartido de la venta y de su colección de líneas sin definir todavía la forma interna de `TSaleLine`.

La genericidad de `TSaleLine` preserva la frontera con `SHELL-CON-021`: esta tarea exige que toda venta individual completa contenga o referencie líneas válidas, pero **no define los campos, identidad pública ni forma compartida de la línea de venta**.

El contrato común debe permitir que:

```text
MAKOS DURANTE EL ALCANCE TRANSITORIO AUTORIZADO
→ ADAPTADOR
→ VENTA CANÓNICA

PULSO COMO FUENTE AUTORIZADA
→ REGISTRO DURABLE PROPIETARIO
→ MISMA VENTA CANÓNICA
```

sin que NEXO, NUMERA, PASS u otra consumidora necesiten reinterpretar un DTO distinto por fuente.

---

#### 3. Fuentes y precedencia preservadas

La tarea consume y conserva sin reabrir las decisiones aprobadas de:

- `SHELL-CON-001`, que define `@vento/contracts` como autoridad estática, versionada, sin lógica operacional, secretos ni acceso a Supabase;
- `SHELL-CON-016`, que preserva una única propiedad funcional por hecho empresarial y prohíbe que el contrato compartido adquiera esa propiedad;
- `SHELL-CON-019`, que separa la afirmación externa recibida del hecho empresarial interno y entrega a esta tarea el handoff hacia la venta canónica;
- `INT-POS-005`, que define la semántica obligatoria de venta y línea y asigna expresamente a `SHELL-CON-020` la materialización técnica compartida de la venta;
- `INT-POS-006` a `INT-POS-020`, cuyas decisiones de estados, temporalidad, componentes monetarios, reversos, procedencia, mapping, idempotencia, adquisición, evento posterior, efectos, compensación y conciliación permanecen especializadas y no se redefinen aquí;
- `INT-POS-023` y `INT-POS-024`, que preservan autoridad temporal de fuente, cutover y retiro sin reescribir ventas históricas;
- `INT-SALES-001`, que convierte la misma semántica en regla permanente de registro durable de PULSO y confirma que el flujo agregado `makos_excel` no constituye por sí solo una venta individual canónica;
- `INT-SALES-002`, como contrato aprobado de emisión posterior desde PULSO que reutiliza la misma semántica y no crea un DTO de venta alternativo;
- los contratos transversales de propiedad, autorización, auditoría, idempotencia, retry, conciliación y ausencia de escritura cruzada ya aprobados;
- la cobertura canónica de pruebas vigente para PULSO e integración comercial.

Precedencia aplicable:

```text
INT-POS-005 / INT-SALES-001
→ SEMÁNTICA EMPRESARIAL DE VENTA

SHELL-CON-020
→ REPRESENTACIÓN COMPARTIDA ESTÁTICA

PULSO
→ PROPIETARIA DEL REGISTRO OBJETIVO CUANDO LE CORRESPONDA

CONSUMIDORAS
→ USAN EL CONTRATO SIN REDEFINIR LA VENTA
```

Un tipo local, tabla, payload de proveedor o importación agregada no sustituye este contrato compartido.

---

#### 4. Frontera exacta de la tarea

`SHELL-CON-020` incluye exclusivamente:

- identidad lógica de la venta canónica;
- forma lógica compartida de la venta;
- fuente empresarial y procedencia;
- identidad de la venta en su fuente;
- revisión de fuente y versión del contrato;
- contexto de sede, terminal y caja cuando aplique;
- momento del hecho comercial;
- estado comercial propio de la venta;
- referencias opcionales a cliente y pedido;
- referencia fiscal cuando aplique;
- referencias de pago sin absorber el pago;
- componentes monetarios de la venta como snapshot histórico;
- obligación de contener o referenciar al menos una línea individual válida;
- procedencia, correlación y atribución de registro;
- reglas de revisión, compatibilidad y preservación histórica;
- frontera entre venta externa adaptada y venta nativa de PULSO;
- condiciones para considerar completa una instancia canónica.

La tarea no incluye:

- campos del contrato compartido de línea de venta;
- identidad pública del contrato de línea;
- mapping de producto, presentación o receta de cada línea;
- endpoints, webhooks, polling o mecanismos de adquisición;
- definición o emisión de eventos empresariales;
- outbox, inbox, topic, broker, cola, worker, trigger o scheduler;
- reglas físicas de idempotencia o conciliación;
- cuarentena, rechazo o compensación compartidos;
- aplicación de inventario en NEXO;
- aplicación de hechos económicos en NUMERA;
- acumulación o redención de puntos en PASS;
- cobro, captura de pago o cierre de caja;
- emisión fiscal;
- tablas, columnas, RPC, RLS, migraciones o cambios Supabase;
- implementación física de `@vento/contracts`;
- migración de consumidores.

---

#### 5. Identidad pública del contrato

La identidad lógica queda fijada así:

| Propiedad                                     | Decisión                                                      |
| --------------------------------------------- | ------------------------------------------------------------- |
| identidad de venta                            | `CanonicalSaleId`                                             |
| contrato de venta                             | `CanonicalSale<TSaleLine>`                                    |
| package lógico                                | `@vento/contracts`                                            |
| superficie lógica                             | `@vento/contracts/integrations`                               |
| repositorio propietario del contrato          | `devVentoGroup/vento-shell`                                   |
| propietaria empresarial del registro objetivo | `PULSO`, conforme a la autoridad y transición aprobadas       |
| naturaleza                                    | contrato estático, versionado y no ejecutable                 |
| línea de venta                                | parámetro contractual todavía no materializado por esta tarea |
| persistencia                                  | fuera del alcance                                             |
| transporte                                    | fuera del alcance                                             |
| efectos downstream                            | fuera del alcance                                             |

`CanonicalSaleId` identifica la venta y no se reutiliza como identidad de pedido, pago, documento fiscal, movimiento físico, movimiento de puntos, evento o hecho económico.

Esta tarea no fija UUID, prefijo, secuencia, slug ni otro formato físico de `CanonicalSaleId`.

---

#### 6. Forma lógica de `CanonicalSale<TSaleLine>`

La forma normativa objetivo es:

```text
CanonicalSale<TSaleLine> = {
  sale_id
  contract_version

  source_system
  source_instance_ref
  source_sale_id
  source_revision

  site_ref
  terminal_ref
  cash_session_ref

  occurred_at
  commercial_state

  customer_ref
  order_ref
  fiscal_document_ref
  payment_refs[]

  monetary_snapshot {
    currency_ref
    subtotal
    discount_total
    tax_total
    tip_total
    total
  }

  lines: TSaleLine[]

  provenance_refs[]
  correlation_refs[]

  recorded_actor_ref
  recorded_principal_ref
  recorded_at
}
```

Esta forma es lógica y normativa. No fija:

- nombres físicos de archivos;
- módulo interno del package;
- representación JSON definitiva;
- tipos escalares de dinero;
- precisión decimal;
- formato de timestamps;
- algoritmo de serialización;
- enum físico de estados;
- formato de identificadores;
- schema de base de datos;
- mecanismo de validación runtime.

La materialización física posterior deberá respetar estas semánticas sin convertir la notación anterior en una implementación implícitamente aprobada.

---

#### 7. Semántica de identidad, fuente y versión

##### 7.1. `sale_id`

`CanonicalSaleId` representa la misma venta a través de revisiones, reintentos, replay, backfill y consumidoras.

Reglas:

1. cambiar estado no crea otra venta;
2. recibir una revisión posterior no crea otra venta;
3. cambiar mapping no crea otra venta;
4. sincronizar tarde no crea otra venta;
5. reintentar no crea otra venta;
6. la identidad no se deriva únicamente de total, fecha redondeada, cliente, terminal, producto, posición de archivo ni otra combinación mutable;
7. un batch, archivo o hash de archivo no es `CanonicalSaleId`;
8. una reutilización incompatible de identidad no sobrescribe la venta previa y requiere tratamiento de conflicto conforme a los contratos especializados.

##### 7.2. `source_system`

Conserva el sistema que originó realmente el hecho comercial dentro de la autoridad vigente.

Durante la transición aprobada:

- una venta Makos perteneciente al alcance transitorio conserva Makos como fuente;
- una venta originada por PULSO dentro de un alcance donde PULSO tiene autoridad conserva PULSO como fuente;
- recibir, importar o almacenar una venta en PULSO no cambia por sí solo su fuente histórica;
- adaptador, Excel, API, webhook, staging, job o sincronización son mecanismos técnicos y no sustituyen `source_system`.

##### 7.3. `source_instance_ref`

Distingue instancia, tenant, empresa, ambiente u otra frontera de origen únicamente cuando sea necesario y exista una referencia acreditada.

Su ausencia no autoriza a fusionar identidades potencialmente colisionables.

##### 7.4. `source_sale_id`

Conserva la identidad individual de la venta en la fuente.

Reglas:

1. no se sustituye por `CanonicalSaleId` para ocultar la procedencia;
2. no se sustituye por total, fecha, fila o hash;
3. una venta individual sin identidad de fuente suficiente no se fabrica desde un agregado;
4. la estrategia física para resolver una fuente que no entregue identidad suficiente pertenece a los contratos propietarios de identidad e idempotencia y no se inventa aquí.

##### 7.5. `source_revision`

Conserva la revisión o versión de la fuente cuando exista.

Si la fuente no la provee de manera acreditable, no se inventa `1`, `latest`, fecha ni secuencia artificial para simular una revisión externa.

##### 7.6. `contract_version`

Identifica la versión del contrato canónico con la que la instancia fue interpretada.

La versión del contrato compartido y la revisión de la fuente permanecen conceptos distintos.

---

#### 8. Contexto de origen

##### 8.1. `site_ref`

La venta conserva la sede canónica aplicable antes de habilitar efectos que dependan de territorio o inventario.

La sede no se deriva silenciosamente de terminal, caja, nombre de archivo o usuario cuando el mapping no sea inequívoco.

##### 8.2. `terminal_ref`

Se conserva cuando terminal o estación formen parte de la autoridad temporal, procedencia, auditoría o conciliación de la venta.

Una terminal desconocida que sea necesaria para decidir autoridad de fuente bloquea la cadena posterior en lugar de completarse por inferencia.

##### 8.3. `cash_session_ref`

Puede relacionar la venta con una sesión de caja cuando exista.

La relación no convierte la venta en movimiento de caja ni convierte el cierre de caja en modificación de la venta.

---

#### 9. Temporalidad y estado comercial

##### 9.1. `occurred_at`

Representa el momento del hecho comercial conforme a la semántica aprobada de la fuente.

Reglas:

1. no se sustituye por `recorded_at`;
2. no se sustituye por tiempo de importación, recepción, replay o sincronización;
3. una venta histórica recibida después del cutover conserva el momento original del hecho;
4. el orden empresarial no se deriva únicamente de timestamps cuando existen revisión, causalidad o reglas de autoridad adicionales.

##### 9.2. `commercial_state`

Representa exclusivamente el estado comercial de la venta bajo el vocabulario canónico aplicable.

No se deriva automáticamente de:

- pago aprobado;
- cierre de caja;
- factura emitida;
- movimiento de inventario;
- movimiento PASS;
- asiento o hecho NUMERA;
- entrega completada.

Esta tarea no redefine el vocabulario de estados aprobado por las tareas propietarias.

---

#### 10. Relaciones con otros hechos

##### 10.1. `customer_ref`

Es opcional.

Una venta a consumidor final puede existir sin crear un cliente artificial. Cuando exista un cliente identificado, la venta conserva una referencia mínima y autorizada, no una copia completa de datos personales.

##### 10.2. `order_ref`

Relaciona la venta con un pedido cuando corresponda.

La relación no permite:

```text
PEDIDO = VENTA
```

ni autoriza a reescribir una venta cuando el pedido cambie posteriormente.

##### 10.3. `fiscal_document_ref`

Relaciona la venta con el documento fiscal o su soporte cuando exista contrato aplicable.

Registrar la venta no acredita que el documento haya sido emitido, aceptado o conciliado.

##### 10.4. `payment_refs[]`

Relaciona pagos o intentos de pago independientes con la venta.

Reglas:

1. la venta no absorbe la identidad del pago;
2. un pago no reemplaza `sale_id`;
3. una respuesta técnica del proveedor no cambia por sí sola `commercial_state`;
4. un timeout no se interpreta como fracaso cierto;
5. pagos parciales o combinados conservan identidades y resultados propios en sus contratos propietarios.

---

#### 11. Snapshot monetario

`monetary_snapshot` conserva los componentes comerciales aplicados al hecho y no una recomputación desde el catálogo vigente.

Debe poder representar, según aplicabilidad:

- moneda o referencia monetaria inequívoca;
- subtotal;
- descuento total;
- impuesto total;
- propina total;
- total de venta.

Reglas:

1. descuento, impuesto y propina permanecen componentes diferenciados;
2. pago no se incorpora como componente del total por equivalencia;
3. los valores históricos no se recalculan desde precios o reglas actuales para reescribir la venta;
4. una diferencia entre encabezado y líneas se conserva como inconsistencia o materia de conciliación, no se corrige silenciosamente;
5. esta tarea no fija precisión decimal, redondeo, moneda por defecto ni fórmula de reconciliación;
6. la representación física futura deberá evitar ambigüedad de unidad monetaria.

---

#### 12. Frontera con las líneas de venta

`lines` es una colección obligatoria para una venta individual completa, pero el contrato de cada elemento pertenece a `SHELL-CON-021`.

Reglas vinculantes para esta tarea:

1. una venta individual completa contiene o referencia al menos una línea individual válida;
2. cada línea pertenece a exactamente una venta;
3. la venta no usa un agregado diario por producto como sustituto de sus líneas individuales;
4. el orden de una línea no constituye por sí solo su identidad;
5. la venta no define aquí producto, presentación, receta, cantidad, unidad, precio de línea, mapping ni estado de línea;
6. una línea no resuelta puede conservarse como evidencia o pendiente bajo su contrato propietario, pero no habilita efectos dependientes de producto por inferencia;
7. la forma compartida de la línea y su identidad pública quedan exclusivamente reservadas a `SHELL-CON-021`.

`TSaleLine` es, por tanto, un parámetro lógico de composición y no una definición anticipada del contrato siguiente.

---

#### 13. Procedencia, correlación y atribución

##### 13.1. `provenance_refs[]`

Permite reconstruir de dónde provino la representación sin copiar dentro del contrato el payload original completo.

Puede enlazar, según el origen:

- una recepción externa gobernada por `SHELL-CON-019`;
- evidencia protegida de proveedor;
- un comando o registro propietario de PULSO;
- una revisión o importación autorizada;
- otra referencia de procedencia aprobada.

Reglas:

1. una venta adaptada desde un tercero conserva la afirmación y evidencia externas por referencia;
2. una venta nativa de PULSO no necesita inventar un proveedor externo para satisfacer procedencia;
3. un payload externo no se convierte en el contrato canónico por simple copia;
4. una corrección de parser o mapping no sobrescribe la fuente histórica.

##### 13.2. `correlation_refs[]`

Relaciona la venta con recepción, pedido, pagos, documento fiscal, evento posterior, efectos físicos, fidelización, hecho económico y conciliación sin declarar equivalencia entre esas identidades.

Coincidencia de importe, fecha, email, teléfono, producto o texto libre no constituye correlación canónica suficiente por sí sola.

##### 13.3. `recorded_actor_ref`, `recorded_principal_ref` y `recorded_at`

Permiten atribuir el registro a un actor humano, principal técnico o ambos según el contrato de auditoría aplicable.

Reglas:

1. el actor y el principal técnico permanecen identidades distintas;
2. `recorded_at` no reemplaza `occurred_at`;
3. una importación técnica no convierte al adaptador en propietaria empresarial de la venta;
4. una credencial o `service_role` no sustituye actor, principal ni permiso.

---

#### 14. Conversión desde `ExternalReceivedEvent`

`SHELL-CON-019` y `SHELL-CON-020` se relacionan mediante una frontera de adaptación explícita:

```text
ExternalReceivedEvent<TNormalizedAssertion>
        ↓
VALIDACIÓN DE CONTRATO, AUTENTICIDAD, IDENTIDAD Y MAPPING
        ↓
FRONTERA PROPIETARIA
        ↓
CanonicalSale<TSaleLine>
```

La conversión está permitida únicamente cuando la afirmación externa aporta evidencia suficiente para demostrar el hecho comercial bajo las reglas propietarias.

Reglas:

1. un webhook, callback, archivo, API response o mensaje externo no es una venta por naturaleza;
2. autenticidad válida no demuestra que exista una venta canónica completa;
3. `external_event_id` no se convierte automáticamente en `sale_id`;
4. `receipt_id` no se convierte automáticamente en `sale_id`;
5. el ID de transacción de pago no se convierte automáticamente en `sale_id`;
6. el payload del proveedor se adapta; no se publica como DTO empresarial interno;
7. el proveedor externo no se convierte en `producer_application` de un evento empresarial VENTO;
8. la aplicación propietaria valida y registra el hecho antes de cualquier emisión empresarial posterior;
9. una entrada insuficiente puede permanecer como evidencia, pendiente, conflicto o materia de conciliación, pero no se eleva a venta completa por heurística.

---

#### 15. Fuente única y transición Makos → PULSO

El contrato compartido es estable aunque cambie la fuente autorizada de nuevas ventas.

```text
ANTES DEL CORTE APLICABLE
Makos = fuente empresarial del alcance autorizado
PULSO = registro/adaptación interna conforme al contrato

DESPUÉS DEL CORTE APLICABLE
PULSO = fuente empresarial de nuevas ventas del alcance transferido
```

Reglas:

1. una venta Makos ocurrida antes del corte conserva Makos como fuente aunque llegue después;
2. una venta PULSO ocurrida después del corte conserva PULSO como fuente aunque sincronice tarde;
3. una venta histórica Makos almacenada en PULSO no se reclasifica como PULSO;
4. una misma venta no puede quedar activamente representada como venta nueva de dos fuentes;
5. una contradicción de sede, terminal, momento o fuente se trata como conflicto y no como segunda venta silenciosa;
6. el contrato compartido no ejecuta el cutover;
7. el retiro del adaptador externo no elimina `source_system`, `source_sale_id`, revisión ni procedencia histórica.

---

#### 16. Granularidad y agregados

La venta canónica es individual.

Por tanto:

```text
LOTE DE IMPORTACIÓN
≠ VENTA

ARCHIVO XLSX
≠ VENTA

FILA AGREGADA POR PRODUCTO
≠ VENTA

TOTAL DIARIO
≠ VENTA
```

El flujo `makos_excel` observado puede conservar valor como evidencia, conciliación agregada o contingencia según sus contratos propietarios, pero no satisface por sí solo `CanonicalSale<TSaleLine>` cuando no dispone de identidad individual de venta y líneas.

Esta tarea no inventa ventas individuales para rellenar esa brecha de granularidad.

---

#### 17. Revisión, corrección y preservación histórica

Una revisión válida de venta:

- conserva `sale_id`;
- conserva `source_system` real;
- conserva `source_sale_id`;
- incorpora la nueva revisión acreditada;
- preserva la representación anterior como historia reconstruible;
- no sobrescribe destructivamente la procedencia;
- no permite que una revisión antigua reemplace silenciosamente una posterior.

Anulación, devolución, reembolso, corrección y compensación no se modelan como borrado de la venta original.

Una cantidad o importe negativo tampoco sustituye automáticamente la semántica de reversión cuando el hecho pueda clasificarse de forma explícita.

Los contratos especializados continúan gobernando cada acción posterior.

---

#### 18. Identidad, retry e idempotencia

Esta tarea fija únicamente las invariantes que el contrato de venta debe preservar:

1. el mismo hecho comercial conserva `sale_id` a través de retry, replay y sincronización tardía;
2. una redelivery no crea una venta nueva;
3. misma identidad con contenido lógicamente incompatible produce conflicto;
4. un timeout de cliente o worker no autoriza generar otra identidad;
5. el resultado recuperable de un registro no se codifica dentro de `sale_id`;
6. `sale_id`, identidad de fuente, idempotency key, event ID, receipt y correlation ref permanecen identidades distintas;
7. el hash de contenido puede actuar como guardia de conflicto bajo el contrato especializado, pero no sustituye la identidad de venta.

La forma compartida de idempotencia y conciliación pertenece a `SHELL-CON-023` y no se materializa en esta tarea.

---

#### 19. Fronteras de propiedad y efectos posteriores

`CanonicalSale<TSaleLine>` describe la venta. No ejecuta efectos.

| Frontera                         | Propiedad preservada                                       | Regla                                                             |
| -------------------------------- | ---------------------------------------------------------- | ----------------------------------------------------------------- |
| PULSO                            | registro y hecho comercial de venta dentro de su autoridad | la venta se registra durablemente antes de la emisión posterior   |
| NEXO                             | movimiento físico e inventario                             | consume únicamente líneas elegibles y confirma su propio efecto   |
| NUMERA                           | hecho económico, costo y conciliación financiera           | consume la venta sin apropiarse de su identidad ni reescribirla   |
| PASS                             | fidelización                                               | evalúa acumulación o redención bajo su ledger y autoridad propios |
| proveedor fiscal / POS aplicable | documento fiscal externo mientras corresponda              | la referencia fiscal no transfiere autoridad a la venta           |
| servicios de eventos             | publicación y entrega técnica                              | no adquieren propiedad empresarial por transportar el contrato    |

Reglas:

1. un fallo downstream no borra la venta;
2. una consumidora no modifica la venta para aparentar que su efecto ocurrió;
3. un ACK de transporte no confirma inventario, puntos, costo ni documento fiscal;
4. los efectos se correlacionan con la venta sin reutilizar `sale_id` como identidad universal;
5. compartir almacenamiento o credenciales no habilita escritura cruzada.

---

#### 20. Completitud de una venta canónica individual

Una instancia solo puede declararse venta canónica individual completa cuando, según aplicabilidad, se pueda demostrar simultáneamente:

1. `sale_id` resuelto y estable;
2. `source_system` resuelto;
3. autoridad de fuente compatible con sede, terminal y momento conocidos;
4. `source_sale_id` individual suficiente;
5. `contract_version` resoluble;
6. contexto de sede suficiente;
7. terminal o caja cuando sean necesarias para autoridad o trazabilidad;
8. `occurred_at` interpretable;
9. `commercial_state` válido bajo el contrato aplicable;
10. al menos una línea individual válida;
11. snapshot monetario suficiente para la semántica aplicable;
12. relaciones opcionales no fabricadas;
13. procedencia reconstruible;
14. correlación suficiente para seguir la cadena posterior;
15. atribución de actor o principal según el contrato de auditoría;
16. ausencia de una reutilización incompatible de identidad;
17. ausencia de un bloqueo que impida tratar la evidencia como hecho comercial completo.

Una entrada incompleta puede conservarse bajo el contrato técnico que corresponda, pero no se presenta como venta canónica completa para forzar efectos posteriores.

---

#### 21. Versionado y compatibilidad

`CanonicalSale<TSaleLine>` hereda la política de `@vento/contracts`:

1. el package conserva SemVer independiente;
2. una publicación es inmutable;
3. cambiar significado, obligatoriedad o cardinalidad material exige clasificación de compatibilidad apropiada;
4. una nueva versión no reinterpreta silenciosamente ventas históricas;
5. la instancia conserva la versión con la que fue interpretada;
6. un campo aditivo opcional solo es compatible cuando un consumidor anterior puede ignorarlo sin alterar el significado previo;
7. cambiar el proveedor o la fuente no obliga a crear un contrato de venta paralelo si la semántica canónica permanece compatible;
8. retirar una superficie pública exige inventario de consumidores, migración, pruebas, ventana y rollback;
9. la materialización de la línea en `SHELL-CON-021` deberá componer con esta venta sin cambiar retrospectivamente la semántica aprobada aquí.

No se declara una release física ni un número de versión publicado que todavía no exista.

---

#### 22. Seguridad y privacidad

La venta compartida aplica minimización por finalidad.

No deberá incluir por defecto:

- secretos;
- API keys;
- service-role keys;
- access tokens o refresh tokens;
- passwords;
- credenciales de proveedor;
- payload externo completo cuando una referencia protegida sea suficiente;
- datos de tarjeta completos;
- datos bancarios completos;
- documento de identidad completo cuando una referencia autorizada sea suficiente;
- perfil completo del cliente;
- datos personales no necesarios para la finalidad de la consumidora;
- logs o trazas embebidos como parte del hecho empresarial.

Reglas:

1. una referencia a cliente no concede lectura de su expediente;
2. una referencia a pago no transporta la credencial o instrumento sensible;
3. una referencia fiscal no copia el documento completo salvo que otro contrato lo requiera y autorice;
4. procedencia y auditoría conservan referencias y evidencia mínima sin convertir el contrato en archivo documental;
5. consumir la venta no concede permiso para ejecutar efectos ni consultar agregados sensibles adicionales.

---

#### 23. Matriz de escenarios materializados

| Escenario                                                                                               | Estado en `SHELL-CON-020`       | Decisión                                                                                                        |
| ------------------------------------------------------------------------------------------------------- | ------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| venta individual Makos dentro del alcance transitorio autorizado, con identidad y evidencia suficientes | `APLICA_CONTRATO_CANONICO`      | se adapta a la misma venta compartida preservando Makos como fuente histórica                                   |
| venta individual nativa PULSO dentro del alcance donde PULSO tiene autoridad                            | `APLICA_CONTRATO_CANONICO`      | se representa mediante el mismo contrato sin pasar por semántica de proveedor externo                           |
| fila agregada o total del flujo `makos_excel` sin identidad individual de venta y líneas                | `NO_SATISFACE_VENTA_INDIVIDUAL` | permanece como evidencia o material de conciliación; no se fabrica una venta individual                         |
| afirmación externa recibida sin validación empresarial suficiente                                       | `NO_ELEVAR_A_VENTA`             | conserva el contrato de recepción externa hasta resolver autenticidad, identidad, mapping y reglas propietarias |
| pedido, pago, caja, documento fiscal, inventario, puntos, costo o entrega                               | `NO_EQUIVALE_A_VENTA`           | puede correlacionarse, pero no sustituye ni reidentifica la venta                                               |

La matriz no crea fuentes nuevas ni autoriza una integración no acreditada.

---

#### 24. Estado de materialización física

En el corte actual:

```text
SHELL-CON-020
→ CanonicalSaleId definido lógicamente
→ CanonicalSale<TSaleLine> definido lógicamente
→ superficie @vento/contracts/integrations preservada
→ semántica INT-POS-005 materializada como contrato compartido de venta
→ semántica permanente INT-SALES-001 preservada
→ línea compartida NO definida todavía
→ 0 tipos físicos creados
→ 0 schemas ejecutables creados
→ 0 tablas creadas
→ 0 RPC creadas
→ 0 migraciones creadas
→ 0 cambios Supabase
→ 0 eventos emitidos
→ 0 consumidores migrados
→ 0 ventas operativas creadas o modificadas
```

La aprobación documental de esta tarea no acredita implementación física, publicación del package, adopción por consumidores ni validación E2E.

---

#### 25. Handoffs exactos

| Trabajo posterior                              | Estado desde esta tarea             | Propietario / tarea                      | Condición de salida                                                                                              |
| ---------------------------------------------- | ----------------------------------- | ---------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| contrato compartido de línea de venta          | `FUERA_DE_ALCANCE`                  | `SHELL-CON-021`                          | la línea obtiene identidad y forma compartidas compatibles con `CanonicalSale<TSaleLine>` sin redefinir la venta |
| mapping compartido de identificadores externos | `FUERA_DE_ALCANCE`                  | `SHELL-CON-022`                          | referencias de fuente, venta y recursos se relacionan sin equivalencias heurísticas                              |
| idempotencia y conciliación compartidas        | `FUERA_DE_ALCANCE`                  | `SHELL-CON-023`                          | operación, identidad, huella, resultado recuperable y conciliación se materializan sin fusionarse con `sale_id`  |
| cuarentena, rechazo y compensación             | `FUERA_DE_ALCANCE`                  | `SHELL-CON-024`                          | entradas incompatibles, conflictos o efectos fallidos reciben disposición explícita sin borrar la venta original |
| emisión empresarial desde PULSO                | preservada por contrato propietario | `INT-SALES-002`                          | una venta durable produce únicamente las definiciones de evento aprobadas y no un evento genérico paralelo       |
| salida física de inventario                    | preservada por contrato propietario | `INT-SALES-003` / NEXO                   | líneas elegibles producen el movimiento físico exactamente una vez bajo la autoridad de NEXO                     |
| hecho económico                                | preservada por contrato propietario | `INT-SALES-004` / NUMERA                 | NUMERA consume el hecho correlacionado sin escritura cruzada                                                     |
| fidelización                                   | preservada por contrato propietario | `INT-SALES-005` / `INT-SALES-006` / PASS | PASS aplica su ledger con identidad y autoridad propias                                                          |
| materialización física de `@vento/contracts`   | `DEFINIDO_NO_MATERIALIZADO`         | `SHELL-CI-020::<package_id>`             | se abre solo tras `E5-GATE-008::<package_id>` y con `SHELL-CI-001..019` certificados para el paquete aplicable   |

Todos los pendientes quedan vinculados a propietarios existentes; esta tarea no crea un identificador de tarea adicional.

---

#### 26. Cobertura de prueba preexistente

La semántica centralizada por `SHELL-CON-020` ya se encuentra protegida por cobertura canónica vigente, en particular por reglas que exigen:

- demostrar el ciclo completo de venta y líneas antes de declarar operativo PULSO;
- mantener separados pedido, venta, pago, caja, fiscalidad, inventario y fidelización;
- usar acciones autorizadas y auditables para venta, pago, caja, reversos y cierre;
- conservar una fuente empresarial única y resolver fuentes competidoras sin sobrescribir historia;
- converger PULSO y el POS externo sobre contratos canónicos de pedido, venta y línea sin doble emisión;
- impedir que retry, replay, eventos tardíos o fallos parciales dupliquen inventario, puntos, costos, pagos o comandas;
- producir efectos físicos, económicos y de fidelización bajo la autoridad de sus aplicaciones propietarias;
- conservar identidad, procedencia y correlación durante transición, cutover y retiro del adaptador.

`SHELL-CON-020` no introduce un comportamiento operacional nuevo: centraliza la representación estática que esas reglas ya exigen.

---

#### 27. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA**

**Requisitos creados:** 0
**Requisitos modificados:** 0

Justificación: la tarea materializa como contrato compartido estático la semántica de venta ya aprobada y protegida por la cobertura canónica vigente. No introduce una operación nueva, una fuente adicional, un estado empresarial nuevo, un mecanismo de pago, una regla de inventario, una política de fidelización, un evento nuevo, un transporte, una persistencia, un permiso, una migración, una modificación Supabase ni una excepción de seguridad. Por ello el registro canónico de requisitos permanece sin cambios.

---

#### 28. Decisiones vinculantes

1. `CanonicalSaleId` es la identidad canónica compartida de una venta individual.
2. `CanonicalSaleId` es estable, opaco y no secreto.
3. Esta tarea no fija su formato físico.
4. `CanonicalSale<TSaleLine>` es el contrato compartido estático de la venta.
5. La superficie lógica permanece en `@vento/contracts/integrations`.
6. El contrato no convierte `@vento/contracts` en fuente empresarial ni runtime operacional.
7. La venta permanece distinta de pedido, pago, caja, documento fiscal, inventario, fidelización, hecho económico y entrega.
8. La venta conserva `source_system` real y no el mecanismo técnico de transporte.
9. Una venta Makos histórica no se reclasifica como PULSO por ser recibida o almacenada después.
10. Una venta PULSO conserva PULSO como fuente únicamente dentro del alcance donde exista autoridad aprobada.
11. La identidad en la fuente se conserva separada de `sale_id`.
12. La revisión de fuente se conserva únicamente cuando exista y no se inventa.
13. La versión del contrato y la revisión de fuente permanecen separadas.
14. Sede, terminal y caja se conservan según aplicabilidad y no se infieren para ocultar una brecha.
15. `occurred_at` representa el hecho comercial y no el momento de registro o sincronización.
16. `commercial_state` no se deriva de pago, caja, fiscalidad, inventario, puntos, economía o entrega.
17. Cliente es opcional y no se fabrica una identidad artificial.
18. Pedido puede relacionarse con la venta sin convertirse en ella.
19. Documento fiscal y pagos permanecen hechos independientes relacionados por referencias.
20. El snapshot monetario conserva componentes históricos sin recalcular la venta desde reglas actuales.
21. Una venta individual completa requiere al menos una línea individual válida.
22. `TSaleLine` permanece abstracto hasta `SHELL-CON-021`.
23. Esta tarea no define campos ni identidad pública de la línea compartida.
24. Procedencia puede enlazar una recepción externa o un origen propietario PULSO sin copiar el payload completo.
25. Una afirmación externa no se eleva a venta únicamente por autenticidad o recepción técnica.
26. `external_event_id`, `receipt_id`, payment ID, order ID, fiscal ID y event ID no sustituyen `sale_id`.
27. Retry, replay y sincronización tardía conservan la identidad de venta.
28. Una identidad reutilizada con contenido incompatible produce conflicto, no sobrescritura.
29. El flujo agregado `makos_excel` no constituye por sí solo una venta individual canónica.
30. Un fallo de NEXO, NUMERA o PASS no borra la venta.
31. Las consumidoras confirman sus propios efectos y no escriben la fuente privada de PULSO.
32. La tarea no emite eventos ni crea definiciones de evento.
33. La tarea no crea tipos físicos, schemas, tablas, migraciones, RLS, RPC, colas, workers ni endpoints.
34. La tarea no modifica Supabase ni datos operativos.
35. La tarea crea cero requisitos de prueba y modifica cero requisitos de prueba.
36. `SHELL-CON-021` permanece como única continuidad reservada.

---

#### 29. Criterios de aceptación

`SHELL-CON-020` queda documentalmente completa cuando se cumplen simultáneamente estos criterios:

1. existe exactamente un contrato lógico compartido de venta `CanonicalSale<TSaleLine>`;
2. existe una identidad lógica `CanonicalSaleId`;
3. la superficie permanece dentro de `@vento/contracts/integrations`;
4. no se inventa un formato físico de identificador;
5. se conserva la semántica de venta aprobada por `INT-POS-005`;
6. se conserva la regla permanente de registro de `INT-SALES-001`;
7. se preserva PULSO como propietaria del registro objetivo donde corresponda;
8. fuente empresarial y mecanismo técnico permanecen separados;
9. una venta Makos histórica conserva Makos como fuente;
10. una venta PULSO solo conserva PULSO como fuente bajo autoridad aprobada;
11. `source_sale_id` permanece separado de `sale_id`;
12. revisión de fuente y versión del contrato permanecen separadas;
13. sede queda representada;
14. terminal y caja se conservan cuando son materiales;
15. `occurred_at` permanece separado de `recorded_at`;
16. estado comercial permanece ortogonal a pago, caja, fiscalidad, inventario, fidelización y economía;
17. cliente es opcional;
18. pedido se conserva solo por referencia;
19. documento fiscal se conserva solo por referencia contractual;
20. pagos se conservan como referencias a hechos independientes;
21. el snapshot monetario permite diferenciar subtotal, descuentos, impuestos, propina y total según aplicabilidad;
22. no se recalcula historia desde precios actuales;
23. la venta individual exige al menos una línea individual válida;
24. la forma compartida de línea no se define en esta tarea;
25. procedencia es reconstruible sin copiar el payload sensible como contrato de venta;
26. correlación no implica equivalencia de identidades;
27. actor y principal técnico permanecen separados;
28. una afirmación externa debe atravesar validación propietaria antes de convertirse en venta;
29. una entrada agregada no se eleva a venta individual ficticia;
30. revisiones conservan historia y no sobrescriben destructivamente;
31. retry, replay y offline no crean otra venta;
32. una reutilización incompatible de identidad produce conflicto;
33. un fallo downstream no elimina la venta;
34. NEXO, NUMERA y PASS conservan autoridad sobre sus efectos;
35. no se adelanta `SHELL-CON-021`;
36. no se adelantan mapping, idempotencia, conciliación, cuarentena, rechazo o compensación compartidos;
37. no se implementa código ni `@vento/contracts` físicamente;
38. no se modifica Supabase;
39. se crean cero requisitos de prueba;
40. se modifican cero requisitos de prueba;
41. la continuidad reserva exclusivamente `SHELL-CON-021`.

---

#### 30. Límites de la tarea

`SHELL-CON-020` no:

- implementa `@vento/contracts`;
- crea archivos TypeScript del package;
- crea schemas ejecutables;
- crea tipos de base de datos;
- crea tablas o columnas;
- crea migraciones;
- crea RLS o grants;
- crea RPC o funciones;
- crea endpoints;
- crea webhooks;
- crea colas o workers;
- emite eventos;
- crea ventas operativas;
- modifica ventas existentes;
- aplica inventario;
- aplica costos o asientos;
- aplica puntos;
- cobra pagos;
- emite documentos fiscales;
- ejecuta cutover;
- retira el adaptador externo;
- materializa la línea compartida;
- modifica código;
- modifica Supabase;
- cambia la ruta canónica;
- desarrolla `SHELL-CON-021`.

---

#### 31. Continuidad

##### ÚLTIMA TAREA APROBADA

`SHELL-CON-019 — Crear contrato de evento externo recibido`

##### TAREA ACTUAL APROBADA

`SHELL-CON-020 — Crear contrato canónico de venta`

##### SIGUIENTE TAREA RESERVADA

`SHELL-CON-021 — Crear contrato canónico de línea de venta`


### ✅ SHELL-CON-021 — Crear contrato canónico de línea de venta

**Estado:** APROBADA
**Tarea anterior:** SHELL-CON-020 — Crear contrato canónico de venta
**Tarea siguiente:** SHELL-CON-022 — Crear contrato de mapeo de identificadores externos
**Tipo de tarea:** Documental
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/01_CONTRATOS_DE_INTEGRACIONES_EXTERNAS.md`
**Superficie lógica objetivo:** `@vento/contracts/integrations`
**Estado físico resultante:** `CONTRATO_CANONICO_DE_LINEA_DE_VENTA_DEFINIDO_NO_MATERIALIZADO`
**Implementación física autorizada:** ninguna
**Cambios de código, DDL, DML, migraciones, RLS, RPC, Storage, Edge Functions, endpoints, colas, workers, datos, secretos, credenciales, configuración remota o despliegues:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-CON-021` centraliza en la fundación compartida de Vento OS la representación técnica común de una **línea de venta canónica individual**, compatible con el contrato de venta aprobado en `SHELL-CON-020` y con la semántica ya definida por `INT-POS-005..013` e `INT-SALES-001`.

La tarea cierra la frontera que `CanonicalSale<TSaleLine>` dejó deliberadamente abierta:

```text
CanonicalSale<TSaleLine>
        ↓
TSaleLine
        ↓
CanonicalSaleLine
```

La regla central es:

```text
LÍNEA DE VENTA CANÓNICA
=
IDENTIDAD DE LÍNEA ESTABLE
+
PERTENENCIA A UNA VENTA CANÓNICA
+
IDENTIDAD / REVISIÓN DE ORIGEN CUANDO EXISTAN
+
REFERENCIA AL ÍTEM REALMENTE VENDIDO
+
CANTIDAD Y UNIDAD INTERPRETABLES
+
SNAPSHOT COMERCIAL DE LÍNEA
+
REFERENCIAS DE MAPPING CUANDO APLIQUEN
+
ESTADO DE LÍNEA SOLO CUANDO SEA SEMÁNTICAMENTE ACREDITABLE
+
PROCEDENCIA Y CORRELACIÓN
```

La línea permanece separada de:

```text
PRODUCTO CANÓNICO
PRESENTACIÓN
RECETA
LÍNEA DE PEDIDO
MOVIMIENTO DE INVENTARIO
HECHO ECONÓMICO
MOVIMIENTO DE FIDELIZACIÓN
PAGO
DOCUMENTO FISCAL
CUARENTENA
MAPPING
EVENTO
EFECTO DE CONSUMIDOR
```

Una relación explícita puede vincular estos objetos. Ninguna coincidencia de identificador, nombre, código, posición, importe o timestamp los convierte en equivalentes.

---

#### 2. Resultado canónico

Quedan definidos dos artefactos públicos lógicos dentro de la superficie compartida `@vento/contracts/integrations`:

1. `CanonicalSaleLineId`, como identidad canónica estable, opaca y no secreta de una línea de venta individual;
2. `CanonicalSaleLine`, como contrato compartido estático de la línea de venta.

La composición aprobada pasa a ser:

```text
CanonicalSale<CanonicalSaleLine>
```

sin cambiar la semántica de `CanonicalSale` aprobada por `SHELL-CON-020`.

`CanonicalSaleLine` permite representar de forma uniforme una línea originada:

- en una venta individual del POS externo durante el alcance transitorio autorizado;
- en una venta nativa de PULSO dentro de su autoridad;
- en una revisión válida de cualquiera de esas ventas;

sin trasladar al consumidor interno el payload particular del proveedor, la estructura de una tabla propietaria ni el mecanismo técnico de adquisición.

La tarea no crea instancias físicas de `CanonicalSaleLineId`, tipos TypeScript, schemas ejecutables, tablas, eventos ni consumidores.

---

#### 3. Fuentes y precedencia

La tarea consume y conserva sin reabrir las decisiones aprobadas de:

| Fuente                                    | Uso vinculante                                                                                                                         |
| ----------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| `SHELL-CON-001`                           | `@vento/contracts` como autoridad contractual estática, versionada, sin red, secretos ni lógica operacional                            |
| `SHELL-CON-019`                           | procedencia de recepciones externas, evidencia protegida, mapping, idempotencia y correlación por referencia                           |
| `SHELL-CON-020`                           | `CanonicalSaleId`, `CanonicalSale<TSaleLine>`, fuente única, venta individual, snapshot monetario y composición obligatoria con líneas |
| `INT-POS-005`                             | identidad y semántica canónicas de venta y línea durante la transición                                                                 |
| `INT-POS-006`                             | identidad de línea, revisión, estados y temporalidad sin inferencias                                                                   |
| `INT-POS-007`                             | precio, descuentos, impuestos, propinas y demás componentes monetarios separados                                                       |
| `INT-POS-008`                             | anulación, devolución y reembolso como hechos distintos del original                                                                   |
| `INT-POS-009`                             | procedencia, payload original, hash, versión y recepción protegidos fuera del contrato normalizado                                     |
| `INT-POS-010`                             | empresa, sede, terminal y caja como contexto de origen separado                                                                        |
| `INT-POS-011`                             | mapping explícito entre ítem externo, producto Vento, presentación y receta                                                            |
| `INT-POS-012`                             | conservación de líneas con mapping incompleto y bloqueo de efectos dependientes de producto                                            |
| `INT-POS-013`                             | estabilidad e idempotencia por sistema, venta y línea externa                                                                          |
| `INT-SALES-001`                           | registro durable PULSO de venta y líneas con identidad, snapshots e historia                                                           |
| Registro Canónico de Requisitos de Prueba | cobertura vigente de venta, línea, integración, mapping, idempotencia y efectos                                                        |

Precedencia aplicable:

```text
SEMÁNTICA EMPRESARIAL APROBADA
→ CanonicalSale
→ CanonicalSaleLine
→ mapping compartido
→ idempotencia / conciliación
→ cuarentena / rechazo / compensación
→ implementación física autorizada
→ consumidores y efectos propietarios
```

`SHELL-CON-021` no reabre la propiedad de la venta ni la autoridad de sus efectos downstream.

---

#### 4. Frontera exacta de la tarea

La tarea incluye únicamente:

- identidad lógica de una línea canónica;
- vínculo inequívoco con una venta canónica;
- identidad, secuencia y revisión de línea en la fuente cuando existan;
- referencia al ítem realmente vendido;
- cantidad y unidad comercial;
- referencias al producto, presentación y receta cuando hayan sido resueltas por contratos propietarios;
- referencias de mapping sin definir todavía el contrato compartido de mapping;
- snapshot monetario de línea;
- estado de línea cuando exista semántica acreditada;
- temporalidad propia de línea únicamente cuando la fuente la distinga de forma verificable;
- procedencia y correlación;
- estabilidad frente a revisiones, replay, retry, cambios de mapping y liberación de cuarentena;
- reglas de completitud estructural y elegibilidad para efectos dependientes de producto;
- compatibilidad con `CanonicalSale<CanonicalSaleLine>`.

La tarea no incluye:

- redefinir `CanonicalSale`;
- crear un contrato de pedido o línea de pedido;
- definir físicamente producto, presentación o receta;
- crear o modificar catálogos de producto;
- definir el contrato compartido de mapping de identificadores;
- definir la forma compartida de idempotencia o conciliación;
- definir la forma compartida de cuarentena, rechazo o compensación;
- importar o transformar datos reales;
- definir endpoints, webhooks, polling o transporte;
- crear eventos empresariales;
- ejecutar movimientos NEXO;
- registrar hechos NUMERA;
- aplicar puntos PASS;
- cobrar pagos;
- emitir documentos fiscales;
- crear tablas, columnas, índices, RPC, RLS, migraciones o cambios Supabase;
- implementar físicamente `@vento/contracts`;
- migrar consumidores.

---

#### 5. Identidad pública del contrato

La identidad lógica queda fijada así:

| Propiedad                           | Decisión                                                |
| ----------------------------------- | ------------------------------------------------------- |
| identidad de línea                  | `CanonicalSaleLineId`                                   |
| contrato de línea                   | `CanonicalSaleLine`                                     |
| contrato padre                      | `CanonicalSale<CanonicalSaleLine>`                      |
| package lógico                      | `@vento/contracts`                                      |
| superficie lógica                   | `@vento/contracts/integrations`                         |
| repositorio propietario             | `devVentoGroup/vento-shell`                             |
| propietaria empresarial de la venta | `PULSO`, conforme a la autoridad y transición aprobadas |
| naturaleza                          | contrato estático, versionado y no ejecutable           |
| persistencia                        | fuera del alcance                                       |
| transporte                          | fuera del alcance                                       |
| efectos downstream                  | fuera del alcance                                       |

`CanonicalSaleLineId` identifica la línea comercial dentro del ciclo de vida de la venta y no se reutiliza como identidad de:

- la venta;
- un producto;
- una presentación;
- una receta;
- una línea de pedido;
- un movimiento de inventario;
- un evento;
- un efecto consumidor;
- una fila de archivo;
- un mapping;
- una cuarentena.

Esta tarea no fija UUID, prefijo, secuencia, slug ni otro formato físico de `CanonicalSaleLineId`.

---

#### 6. Forma lógica de `CanonicalSaleLine`

La forma normativa objetivo es:

```text
CanonicalSaleLine = {
  sale_line_id
  sale_id
  contract_version

  source_line_id
  source_line_sequence
  source_line_revision

  sold_item_ref

  product_ref
  presentation_ref
  recipe_ref
  mapping_refs[]

  quantity
  unit_ref

  monetary_snapshot {
    currency_ref
    applied_unit_price
    line_subtotal
    discount_total
    tax_total
    tip_total
    line_total
  }

  source_line_state
  canonical_line_state
  line_state_mapping_result
  line_occurred_at

  provenance_refs[]
  correlation_refs[]
}
```

La forma es lógica y normativa. No fija:

- nombres físicos de archivos o módulos;
- representación JSON final;
- tipos escalares concretos;
- precisión decimal;
- formato de moneda;
- formato de timestamps;
- enum físico de estados;
- algoritmo de serialización;
- formato de identificadores;
- schema de base de datos;
- mecanismo runtime de validación;
- estructura física de mapping;
- almacenamiento de cuarentena.

Los campos condicionales solo se materializan cuando la fuente o el contrato propietario aportan evidencia suficiente. Ausencia no equivale automáticamente a cero, `NOT_APPLICABLE`, `RESOLVED` ni valor predeterminado.

---

#### 7. `sale_line_id` y estabilidad de identidad

`CanonicalSaleLineId` representa la misma línea comercial a través de revisiones, reintentos, replay, backfill, sincronización tardía y cambios posteriores de mapping.

Invariantes:

1. cambiar el mapping de producto no crea otra línea;
2. resolver posteriormente presentación o receta no crea otra línea;
3. entrar en cuarentena no crea otra línea;
4. liberar una cuarentena no crea otra línea;
5. cambiar el estado de línea no crea otra línea;
6. una revisión posterior de la misma línea conserva la identidad cuando la fuente y el contrato demuestran continuidad del mismo hecho;
7. un retry o redelivery no crea otra línea;
8. sincronizar una venta PULSO después de operar offline no crea otra línea;
9. una línea Makos histórica no se recrea como línea PULSO por ser procesada después del corte;
10. reutilizar la misma identidad con contenido lógicamente incompatible produce conflicto y no sobrescritura silenciosa.

La identidad no se deriva únicamente de:

- producto;
- nombre del ítem;
- categoría;
- precio;
- cantidad;
- importe;
- posición;
- número de fila;
- timestamp;
- hash de archivo o payload;
- mapping;
- receta;
- presentación.

---

#### 8. Relación con `CanonicalSaleId`

Toda línea pertenece a exactamente una venta canónica mediante `sale_id`.

Reglas:

1. una línea no puede pertenecer simultáneamente a dos ventas;
2. `sale_line_id` y `sale_id` son identidades distintas;
3. mover una línea entre ventas para corregir una importación no constituye una edición ordinaria: requiere conservar el error, la decisión y la corrección bajo los contratos propietarios;
4. una línea aislada puede transportarse como proyección técnica únicamente si conserva `sale_id` y contexto contractual suficiente para reconstruir su venta;
5. la fuente, contexto territorial y autoridad empresarial de la venta permanecen gobernados por `CanonicalSale`;
6. una línea no redefine `source_system`, sede, terminal, caja, cliente, pedido, documento fiscal o pagos del encabezado;
7. si una proyección duplica alguna dimensión del encabezado por necesidades de transporte, los valores deben ser consistentes con la venta propietaria y no se convierten en una segunda fuente.

La colección `lines` de `CanonicalSale` queda materializada conceptualmente como una colección de `CanonicalSaleLine` compatibles con la misma venta.

---

#### 9. Identidad de línea en la fuente

##### 9.1. `source_line_id`

Conserva la identidad de línea que la fuente provea cuando exista y sea semánticamente estable.

Reglas:

1. no se sustituye por `sale_line_id` para ocultar la procedencia;
2. no se sustituye por la posición de la línea cuando existe una identidad más fuerte;
3. no se sustituye por producto, importe, nombre, código o categoría;
4. su ausencia no autoriza a fabricar un identificador externo;
5. cuando una fuente no entregue identidad estable, la resolución necesaria para idempotencia permanece bajo `INT-POS-013` y el futuro contrato compartido de `SHELL-CON-023`;
6. una fila agregada que no demuestre una línea individual no recibe un `source_line_id` ficticio.

##### 9.2. `source_line_sequence`

Conserva orden o posición únicamente cuando sea material para reconstruir la fuente.

La secuencia no es una identidad universal y no puede usarse por sí sola para deduplicar líneas.

##### 9.3. `source_line_revision`

Conserva la revisión de línea cuando la fuente la provea de forma acreditable.

No se inventan números de revisión, timestamps de revisión ni valores `latest` cuando la fuente no los declare.

---

#### 10. Referencia al ítem realmente vendido

`sold_item_ref` identifica o referencia la representación comercial del ítem que realmente participó en la línea.

Su propósito es preservar el hecho comercial antes de cualquier mapping a maestros internos.

Reglas:

1. `sold_item_ref` no equivale automáticamente a `product_ref`;
2. una identidad de catálogo comercial no sustituye la identidad del producto maestro cuando el efecto requiera producto;
3. una descripción textual puede conservarse en la evidencia o snapshot propietario, pero no se convierte por sí sola en identidad canónica;
4. una categoría no es un producto;
5. una presentación visual no es una presentación operativa;
6. una receta no es el ítem vendido;
7. cambiar el catálogo actual no reescribe qué ítem fue vendido históricamente;
8. una venta nativa de PULSO conserva el snapshot o referencia comercial realmente utilizada al vender, no una reconstrucción posterior desde el catálogo vigente.

---

#### 11. Producto, presentación, receta y mapping

`CanonicalSaleLine` conserva referencias canónicas cuando ya exista una resolución explícita y acreditada:

- `product_ref`;
- `presentation_ref`;
- `recipe_ref`;
- `mapping_refs[]`.

La tarea adopta estas reglas:

1. `product_ref` es obligatorio antes de cualquier efecto que dependa de producto;
2. `presentation_ref` es condicional y solo se exige cuando la unidad vendida o el efecto posterior requieran una presentación operativa diferenciada;
3. `recipe_ref` es condicional y solo se exige cuando el efecto aplicable dependa de una receta concreta;
4. producto, presentación y receta conservan resoluciones independientes;
5. una presentación predeterminada no se selecciona únicamente por ser predeterminada;
6. tener un producto con receta no determina automáticamente cuál receta aplica;
7. código, nombre o categoría son evidencia o candidatos, no autoridad automática;
8. ausencia silenciosa no equivale a `NOT_APPLICABLE`;
9. un mapping posterior no reescribe la identidad de la línea ni su procedencia histórica;
10. el contrato compartido exacto de `mapping_refs[]`, namespaces, equivalencias y estados de mapping pertenece exclusivamente a `SHELL-CON-022`.

Los estados de resolución aprobados en `INT-POS-011` continúan gobernando la elegibilidad, pero esta tarea no crea un segundo enum compartido ni una segunda fuente de mapping.

---

#### 12. Cantidad y unidad

`quantity` conserva la cantidad comercial realmente expresada por la línea.

`unit_ref` conserva la unidad o convención necesaria para interpretar esa cantidad sin ambigüedad.

Reglas:

1. cantidad es obligatoria para una línea canónica individual;
2. unidad es obligatoria cuando la magnitud no sea autosuficiente;
3. una cantidad de venta no es automáticamente cantidad de inventario;
4. una cantidad no se convierte entre unidades sin una regla aprobada;
5. presentación y unidad permanecen conceptos relacionados pero distintos;
6. el factor de conversión aplicable pertenece al contrato propietario del producto, presentación o efecto y no se inventa en la línea;
7. una cantidad negativa no se usa como sustituto silencioso de devolución, anulación, reembolso o compensación;
8. una diferencia de cantidad se conserva para conciliación cuando no pueda resolverse sin alterar la evidencia.

---

#### 13. Snapshot monetario de línea

`monetary_snapshot` conserva los componentes monetarios aplicados o acreditados para la línea sin recalcular historia desde reglas actuales.

Debe poder representar, según aplicabilidad y evidencia:

- `currency_ref`;
- `applied_unit_price`;
- `line_subtotal`;
- `discount_total`;
- `tax_total`;
- `tip_total` cuando exista atribución válida a la línea;
- `line_total` cuando la fuente o propietaria lo defina de forma verificable.

Reglas:

1. precio aplicado conserva el snapshot comercial del momento de la venta;
2. descuento, impuesto y propina permanecen componentes diferenciados;
3. un descuento de encabezado no se reparte entre líneas mediante prorrateo inventado;
4. un descuento de línea no se eleva a descuento global sin conservar su alcance;
5. varios descuentos o impuestos permanecen individualizables cuando la fuente los individualice y el contrato especializado lo requiera;
6. un agregado permanece agregado cuando la fuente no entregue desglose;
7. moneda no se deduce de la interfaz, la sede, el formato visual ni un valor técnico por defecto;
8. un valor desconocido no se transforma automáticamente en cero;
9. pago no se incorpora como componente monetario de la línea por equivalencia;
10. redondeo, precisión y fórmulas físicas no se fijan en esta tarea;
11. una diferencia entre suma de líneas y encabezado se conserva como diferencia a conciliar y no se corrige silenciosamente.

---

#### 14. Estado de línea

La línea conserva separados:

```text
ESTADO DE LÍNEA EN LA FUENTE
≠
ESTADO CANÓNICO DE LÍNEA
≠
ESTADO COMERCIAL DE LA VENTA
≠
ESTADO DE MAPPING
≠
ESTADO DE CUARENTENA
≠
ESTADO DE INVENTARIO
```

`source_line_state` conserva el valor o referencia de estado de la fuente cuando exista.

`canonical_line_state` solo se materializa cuando exista equivalencia semántica acreditada con el vocabulario mínimo ya aprobado:

```text
ACTIVE
CANCELLED
```

`line_state_mapping_result` distingue conceptualmente:

```text
MAPPED
NOT_PROVIDED
UNRESOLVED
```

Reglas:

1. ausencia de estado no se convierte automáticamente en `ACTIVE`;
2. un estado técnico del importador no es estado de línea;
3. estado de pago, preparación, entrega, fiscalidad o inventario no se convierte en estado de línea;
4. `CANCELLED` no ejecuta por sí solo devolución, reembolso, compensación ni reverso físico;
5. un valor nuevo o ambiguo permanece no resuelto hasta disponer de equivalencia aprobada;
6. esta tarea no crea un enum físico ni un mapping de estados ejecutable.

---

#### 15. Temporalidad propia de línea

`line_occurred_at` es condicional.

Solo existe cuando la fuente o propietaria distingue un hecho temporal específico de línea con semántica verificable.

Reglas:

1. no se copia automáticamente `CanonicalSale.occurred_at` como si fuera un timestamp propio de línea;
2. no se sustituye por tiempo de importación, recepción, registro, replay o sincronización;
3. una fecha sin hora no se transforma en medianoche para fabricar un instante;
4. una hora local sin zona u offset verificables no recibe una zona arbitraria;
5. timestamps de creación o modificación de la fuente pueden conservarse en procedencia cuando correspondan, pero no sustituyen el momento comercial;
6. una revisión tardía conserva la temporalidad histórica acreditada y no se mueve al día de recepción.

---

#### 16. Procedencia y correlación

##### 16.1. `provenance_refs[]`

Permite reconstruir qué entrada, registro o evidencia originó la línea sin copiar el payload completo dentro del contrato compartido.

Puede enlazar, según corresponda:

- una recepción externa gobernada por `SHELL-CON-019`;
- evidencia protegida del POS externo;
- una línea durable propietaria de PULSO;
- una revisión de fuente;
- una importación o transformación autorizada;
- otra referencia de procedencia aprobada.

Reglas:

1. la procedencia de línea no sustituye `sale_line_id`;
2. un hash protege integridad o equivalencia según su contrato, pero no es identidad empresarial;
3. una corrección de parser o mapping no sobrescribe la evidencia original;
4. el payload completo permanece fuera del contrato normalizado cuando una referencia protegida sea suficiente.

##### 16.2. `correlation_refs[]`

Relaciona la línea con:

- la venta;
- un pedido o línea de pedido cuando exista relación explícita;
- mappings;
- recepción externa;
- evento empresarial posterior;
- movimiento NEXO;
- hecho NUMERA;
- movimiento PASS;
- devolución, anulación o compensación;
- conciliación.

La correlación no crea equivalencia entre identidades.

Coincidencia de producto, importe, timestamp, email, teléfono, posición o texto libre no constituye correlación suficiente por sí sola.

---

#### 17. Completitud estructural y elegibilidad para efectos

La tarea separa dos conceptos que no pueden fusionarse.

##### 17.1. Línea canónica estructural

Una línea puede conservarse como línea canónica estructural cuando se pueda demostrar:

1. `sale_line_id` estable;
2. `sale_id` inequívoco;
3. versión contractual interpretable;
4. identidad de fuente cuando exista o una regla estable autorizada que no fabrique capacidad del proveedor;
5. referencia al ítem realmente vendido;
6. cantidad interpretable;
7. unidad cuando sea necesaria;
8. snapshot comercial suficiente según aplicabilidad;
9. procedencia reconstruible;
10. ausencia de conflicto incompatible de identidad.

Una línea estructural puede seguir teniendo mapping de producto pendiente.

##### 17.2. Línea elegible para efecto dependiente de producto

Además de ser estructural, la línea solo queda elegible para un efecto que dependa de producto cuando:

1. `product_ref` está resuelto de forma explícita;
2. toda presentación obligatoria está resuelta;
3. toda receta obligatoria está resuelta;
4. las dimensiones que no apliquen poseen una decisión explícita de no aplicabilidad bajo el contrato de mapping;
5. cantidad y unidad son compatibles con el efecto solicitado;
6. no existe mapping ambiguo, conflictivo o pendiente en un plano obligatorio;
7. no existe cuarentena activa que bloquee el efecto;
8. la versión de mapping aplicable está identificada;
9. la autorización y demás puertas del consumidor propietario se satisfacen;
10. idempotencia y correlación del efecto se resuelven en sus contratos propietarios.

Elegibilidad no equivale a ejecución. La línea no descuenta inventario, registra costo ni aplica puntos por sí misma.

---

#### 18. Frontera con mapping y cuarentena

La relación es:

```text
CanonicalSaleLine
→ CONSERVA LA LÍNEA Y SU IDENTIDAD

SHELL-CON-022 / mapping propietario
→ RESUELVE EQUIVALENCIAS Y REFERENCIAS

cuarentena aplicable
→ BLOQUEA EFECTOS CUANDO LA RESOLUCIÓN ES INSUFICIENTE

consumidor propietario
→ EJECUTA SU EFECTO ÚNICAMENTE TRAS SUS PUERTAS
```

Reglas:

1. una línea con mapping incompleto no se elimina de la venta;
2. el mapping incompleto no cambia `sale_line_id`;
3. entrar en cuarentena no cambia `sale_line_id`;
4. liberar cuarentena no cambia `sale_line_id`;
5. la liberación solo habilita evaluación de puertas posteriores y no ejecuta inventario;
6. una coincidencia legacy por nombre, código o categoría no sustituye mapping explícito;
7. la forma compartida de cuarentena, rechazo y compensación queda reservada para `SHELL-CON-024`;
8. esta tarea no incorpora `ACTIVE` o `RELEASED` de cuarentena dentro de `canonical_line_state`.

---

#### 19. Revisión, corrección y preservación histórica

Una revisión válida de línea:

- conserva `sale_line_id` cuando continúa representando la misma línea;
- conserva `sale_id`;
- conserva identidad de fuente y revisión acreditadas;
- conserva el snapshot anterior como historia reconstruible;
- no reescribe el payload fuente;
- no reinterpreta retroactivamente mappings ya usados sin evidencia de una nueva decisión;
- no permite que una revisión antigua sobrescriba silenciosamente una posterior.

Reglas adicionales:

1. corregir producto o presentación mediante mapping no convierte la corrección en una línea nueva;
2. corregir una cantidad o componente monetario requiere una revisión o hecho de corrección trazable; no una edición histórica silenciosa;
3. una anulación, devolución, reembolso o compensación conserva relación con la línea original y no la elimina;
4. si la fuente demuestra que una línea fue sustituida por otra identidad distinta, la relación se conserva explícitamente en lugar de reutilizar el identificador anterior;
5. la conciliación de versiones y conflictos pertenece a `SHELL-CON-023` y contratos propietarios.

---

#### 20. Origen externo y origen PULSO

El contrato de línea es agnóstico al mecanismo de adquisición y conserva la fuente empresarial de la venta mediante su relación con `CanonicalSale`.

##### 20.1. Línea proveniente de fuente externa

La secuencia válida es:

```text
EVIDENCIA / AFIRMACIÓN EXTERNA
→ ExternalReceivedEvent
→ VALIDACIÓN Y ADAPTACIÓN PROPIETARIA
→ CanonicalSale
→ CanonicalSaleLine
```

Un elemento del payload externo no se convierte en línea canónica únicamente porque tenga nombre, precio o cantidad.

Debe existir identidad y granularidad suficientes para demostrar que representa una línea individual de una venta individual.

##### 20.2. Línea nativa PULSO

PULSO puede producir la misma forma contractual cuando sea fuente autorizada de la venta.

No necesita inventar un proveedor externo, receipt o payload externo para satisfacer el contrato. Conserva su propia procedencia propietaria, snapshots e identidades durables.

La sustitución de Makos por PULSO no crea una segunda semántica de línea ni obliga a los consumidores internos a entender el mecanismo de origen.

---

#### 21. Límite del flujo agregado `makos_excel`

La implementación observada de `makos_excel` conserva filas agregadas por artículo, pero no demuestra por sí sola:

- identidad individual de venta;
- identidad individual estable de línea dentro de una venta;
- granularidad transaccional completa;
- relación individual entre línea, pago, terminal, cliente o documento fiscal.

Por tanto:

```text
FILA AGREGADA POR ARTÍCULO
≠ CanonicalSaleLine

NÚMERO DE FILA
≠ CanonicalSaleLineId

PRODUCTO + FECHA + SEDE
≠ IDENTIDAD CANÓNICA DE LÍNEA

HASH DE ARCHIVO
≠ IDENTIDAD CANÓNICA DE LÍNEA
```

El flujo agregado puede conservar valor como evidencia, conciliación o contingencia bajo sus contratos propietarios, pero esta tarea no fabrica líneas individuales para cerrar una brecha de granularidad.

---

#### 22. Fronteras con efectos downstream

`CanonicalSaleLine` describe el hecho comercial de línea. No ejecuta efectos.

| Frontera                         | Propiedad preservada                          | Regla                                                                                            |
| -------------------------------- | --------------------------------------------- | ------------------------------------------------------------------------------------------------ |
| PULSO                            | registro comercial durable de venta y líneas  | conserva identidad, revisión, snapshots y procedencia                                            |
| NEXO                             | movimiento físico e inventario                | usa líneas elegibles y confirma su propio efecto exactamente una vez                             |
| NUMERA                           | hecho económico, costo y conciliación         | consume referencias y valores autorizados sin convertir su línea económica en la línea comercial |
| PASS                             | fidelización                                  | evalúa elegibilidad y registra su ledger bajo identidad propia                                   |
| proveedor fiscal / POS aplicable | documento fiscal externo mientras corresponda | la línea comercial no se convierte en línea fiscal por equivalencia implícita                    |
| servicios de eventos             | publicación y transporte                      | no adquieren propiedad empresarial de la línea                                                   |

Reglas:

1. una línea comercial no es un movimiento de inventario;
2. un movimiento NEXO no puede reidentificar la línea comercial;
3. un hecho NUMERA no puede reescribir precio, cantidad o producto de la línea para cerrar una diferencia;
4. un movimiento PASS no convierte `sale_line_id` en identidad de ledger;
5. un fallo downstream no borra ni modifica retroactivamente la línea;
6. un consumidor conserva su propia identidad de efecto y correlaciona con `sale_line_id`.

---

#### 23. Versionado y compatibilidad

`CanonicalSaleLine` hereda la política de `@vento/contracts` y debe mantenerse compatible con `CanonicalSale`.

Reglas:

1. `contract_version` permite interpretar la forma y semántica de la línea;
2. una publicación del package es inmutable;
3. cambiar significado, obligatoriedad o cardinalidad material exige clasificación de compatibilidad apropiada;
4. una nueva versión no reinterpreta silenciosamente líneas históricas;
5. una línea conserva la versión contractual con la que fue materializada o interpretada;
6. una versión de línea incompatible con la versión de venta no puede componerse silenciosamente;
7. agregar un campo opcional solo es compatible cuando un consumidor anterior puede ignorarlo sin alterar el significado previo;
8. cambiar mapping, producto resuelto o credencial de integración no obliga por sí solo a versionar el contrato si su forma y semántica permanecen iguales;
9. cambiar la definición de identidad de `CanonicalSaleLineId` constituye un cambio contractual material;
10. la futura materialización deberá probar compatibilidad entre productores y consumidores antes de adopción.

Esta tarea no declara una release física ni un número de versión publicado inexistente.

---

#### 24. Seguridad y privacidad

`CanonicalSaleLine` aplica minimización por finalidad.

No deberá contener por defecto:

- secretos;
- API keys;
- service-role keys;
- access tokens o refresh tokens;
- passwords;
- credenciales del proveedor;
- payload externo completo cuando una referencia protegida sea suficiente;
- datos completos de tarjeta o instrumento de pago;
- datos personales completos de cliente;
- logs o trazas completos;
- archivos de evidencia embebidos;
- material criptográfico de autenticación.

Reglas:

1. `sold_item_ref` no debe convertirse en una copia innecesaria de información sensible;
2. una referencia de mapping no transporta credenciales ni secretos;
3. consumir una línea no concede acceso automático al expediente completo de venta, cliente, pago o evidencia;
4. las consumidoras reciben únicamente los datos necesarios para su finalidad y autorización;
5. la procedencia se conserva por referencias protegidas cuando sea suficiente.

---

#### 25. Matriz de escenarios materializados

| Escenario                                                                         | Estado en `SHELL-CON-021`                              | Decisión                                                                          |
| --------------------------------------------------------------------------------- | ------------------------------------------------------ | --------------------------------------------------------------------------------- |
| línea individual Makos con venta e identidad de línea acreditadas                 | `APLICA_CONTRATO_CANONICO`                             | se adapta conservando identidad, procedencia, cantidad, unidad y snapshots reales |
| línea individual nativa PULSO                                                     | `APLICA_CONTRATO_CANONICO`                             | utiliza la misma forma compartida sin semántica paralela                          |
| línea con producto resuelto y presentación/receta satisfechas según aplicabilidad | `ESTRUCTURAL_Y_POTENCIALMENTE_ELEGIBLE`                | puede avanzar a puertas del consumidor sin que el contrato ejecute el efecto      |
| línea individual con mapping de producto obligatorio pendiente                    | `ESTRUCTURAL_PERO_NO_ELEGIBLE_PARA_EFECTO_DE_PRODUCTO` | se conserva; los efectos dependientes de producto permanecen bloqueados           |
| línea con mapping ambiguo o conflictivo                                           | `BLOQUEADA_PARA_EFECTOS_DEPENDIENTES_DE_PRODUCTO`      | no se escoge un destino por heurística                                            |
| fila agregada de `makos_excel` sin venta y línea individuales acreditadas         | `NO_SATISFACE_LINEA_INDIVIDUAL`                        | permanece como evidencia o conciliación; no se fabrica `CanonicalSaleLineId`      |
| línea de pedido, movimiento NEXO, hecho NUMERA o movimiento PASS                  | `NO_EQUIVALE_A_LINEA_DE_VENTA`                         | puede correlacionarse, pero mantiene identidad y autoridad propias                |
| línea cancelada                                                                   | `CONSERVA_HISTORIA`                                    | no se elimina ni ejecuta automáticamente devolución, reembolso o compensación     |

La matriz no crea datos operativos, mappings ni efectos.

---

#### 26. Estado de materialización física

En el corte actual:

```text
SHELL-CON-021
→ CanonicalSaleLineId definido lógicamente
→ CanonicalSaleLine definido lógicamente
→ CanonicalSale<CanonicalSaleLine> definido como composición contractual
→ superficie @vento/contracts/integrations preservada
→ semántica INT-POS-005..013 centralizada sin reabrirla
→ semántica permanente INT-SALES-001 preservada
→ mapping compartido NO definido todavía
→ idempotencia / conciliación compartidas NO definidas todavía
→ cuarentena / rechazo / compensación compartidas NO definidas todavía
→ 0 valores físicos de CanonicalSaleLineId creados
→ 0 tipos físicos creados
→ 0 schemas ejecutables creados
→ 0 tablas creadas
→ 0 RPC creadas
→ 0 migraciones creadas
→ 0 cambios Supabase
→ 0 eventos emitidos
→ 0 consumidores migrados
→ 0 líneas operativas creadas o modificadas
```

La aprobación documental de esta tarea no acredita publicación del package, adopción por consumidores, persistencia física ni validación E2E.

---

#### 27. Handoffs exactos

| Trabajo posterior                              | Estado desde esta tarea             | Propietario / tarea                      | Condición de salida                                                                                                            |
| ---------------------------------------------- | ----------------------------------- | ---------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| mapping compartido de identificadores externos | `FUERA_DE_ALCANCE`                  | `SHELL-CON-022`                          | identidades externas, canónicas y namespaces se relacionan mediante equivalencias explícitas, versionadas y no heurísticas     |
| idempotencia y conciliación compartidas        | `FUERA_DE_ALCANCE`                  | `SHELL-CON-023`                          | venta y línea conservan identidades estables, huella, resultado recuperable y conciliación sin fusionarlas con claves técnicas |
| cuarentena, rechazo y compensación             | `FUERA_DE_ALCANCE`                  | `SHELL-CON-024`                          | entradas o líneas incompatibles reciben disposición explícita sin borrar identidad ni historia                                 |
| salida física de inventario                    | preservada por contrato propietario | `INT-SALES-003` / NEXO                   | una línea elegible produce el movimiento físico exactamente una vez bajo autoridad NEXO                                        |
| hecho económico                                | preservado por contrato propietario | `INT-SALES-004` / NUMERA                 | NUMERA consume el hecho correlacionado sin escritura cruzada ni reinterpretación de identidad                                  |
| fidelización                                   | preservada por contrato propietario | `INT-SALES-005` / `INT-SALES-006` / PASS | PASS evalúa acumulación o redención bajo su ledger e identidad propias                                                         |
| control permanente de retry                    | preservado por contrato propietario | `INT-SALES-007`                          | reintentos recuperan resultados sin duplicar venta, línea ni efectos                                                           |
| convivencia y fuente única                     | preservada por contrato propietario | `INT-SALES-008` a `INT-SALES-010`        | Makos y PULSO no producen dos líneas para el mismo hecho por doble fuente                                                      |
| materialización física de `@vento/contracts`   | `DEFINIDO_NO_MATERIALIZADO`         | `SHELL-CI-020::<package_id>`             | se abre solo tras `E5-GATE-008::<package_id>` y con `SHELL-CI-001..019` certificados para el paquete aplicable                 |

Todos los pendientes poseen propietario canónico existente. Esta tarea no crea un identificador de tarea adicional.

---

#### 28. Cobertura de prueba preexistente

La semántica centralizada por `SHELL-CON-021` ya se encuentra protegida por cobertura canónica vigente, en particular:

- `TREQ-PULSO-001`, que exige demostrar creación de venta y líneas dentro del ciclo POS integral;
- `TREQ-PULSO-005`, que exige separación de hechos comerciales, snapshots e historia;
- `TREQ-PULSO-006`, que protege precio, descuento, propina, reversos y hechos relacionados mediante acciones autorizadas y auditables;
- `TREQ-INTEGRATION-003`, que protege estabilidad e idempotencia de operaciones reintentables;
- `TREQ-INTEGRATION-006`, que exige fuente empresarial única y resolución de fuentes competidoras sin sobrescribir historia;
- `TREQ-INTEGRATION-011`, que exige que los efectos de inventario conserven documento, línea, versión, cantidad y unidad y se produzcan exactamente una vez;
- `TREQ-INTEGRATION-014`, que exige convergencia de PULSO y POS externo sobre contratos canónicos de pedido, venta y línea, con mapping, cuarentena, idempotencia y prevención de doble emisión.

`SHELL-CON-021` no introduce un comportamiento operacional nuevo; centraliza como contrato compartido estático la representación de línea que esas obligaciones y las tareas `INT-POS` / `INT-SALES` ya exigen.

---

#### 29. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

**Justificación:** la tarea materializa documentalmente una representación compartida de línea de venta ya definida y protegida por contratos y requisitos vigentes. No introduce una operación ejecutable, una nueva fuente, un nuevo estado empresarial, una regla monetaria nueva, un mapping nuevo, una política de idempotencia, un efecto de inventario, un hecho económico, una política de fidelización, una persistencia, un permiso, una migración ni un cambio Supabase. El Registro Canónico de Requisitos de Prueba permanece sin cambios.

---

#### 30. Decisiones vinculantes

1. `CanonicalSaleLineId` es la identidad canónica compartida de una línea de venta individual.
2. `CanonicalSaleLineId` es estable, opaca y no secreta.
3. Esta tarea no fija su formato físico.
4. `CanonicalSaleLine` es el contrato compartido estático de línea de venta.
5. `CanonicalSale<CanonicalSaleLine>` materializa la composición abierta por `SHELL-CON-020` sin redefinir `CanonicalSale`.
6. La superficie lógica permanece en `@vento/contracts/integrations`.
7. Toda línea pertenece a exactamente una venta mediante `sale_id`.
8. Línea de venta, venta, producto, presentación, receta, línea de pedido, movimiento de inventario, hecho económico y movimiento de fidelización mantienen identidades distintas.
9. `source_line_id` se conserva cuando la fuente lo provea; no se inventa cuando no exista.
10. La posición o número de fila no es identidad universal de línea.
11. La revisión de línea se conserva únicamente cuando exista evidencia.
12. `sold_item_ref` conserva el ítem realmente vendido antes del mapping a maestros internos.
13. `product_ref` es obligatorio antes de efectos dependientes de producto.
14. `presentation_ref` y `recipe_ref` son condicionales y requieren decisiones explícitas según aplicabilidad.
15. Código, nombre, categoría o coincidencia aproximada no resuelven por sí solos un mapping.
16. Mapping, cuarentena y liberación no cambian `sale_line_id`.
17. Cantidad es obligatoria y unidad debe ser inequívoca cuando sea necesaria.
18. Cantidad comercial no se convierte automáticamente en cantidad de inventario.
19. Cantidad negativa no sustituye automáticamente una devolución o compensación.
20. El snapshot monetario de línea conserva valores históricos y no recalcula historia desde el catálogo vigente.
21. Precio, descuento, impuesto y propina permanecen componentes diferenciados.
22. Un descuento de encabezado no se prorratea por inferencia sobre las líneas.
23. Moneda, precisión y redondeo no se inventan.
24. Estado de línea permanece separado de estado de venta, pago, mapping, cuarentena, inventario y entrega.
25. El estado canónico de línea solo se materializa con equivalencia semántica acreditada.
26. `CANCELLED` no ejecuta por sí solo devolución, reembolso o compensación.
27. `line_occurred_at` solo existe cuando hay temporalidad propia de línea acreditada.
28. La procedencia se conserva por referencias protegidas sin copiar innecesariamente el payload fuente.
29. Una línea estructural puede existir con mapping pendiente.
30. Una línea con mapping obligatorio pendiente no es elegible para efectos dependientes de producto.
31. Elegibilidad no equivale a ejecución.
32. Una cuarentena activa bloquea efectos aplicables sin borrar la línea.
33. Liberar cuarentena habilita puertas posteriores, pero no ejecuta inventario.
34. `makos_excel` agregado no se eleva a línea individual sin granularidad e identidad suficientes.
35. Un retry, replay, redelivery o sincronización tardía no crea otra línea.
36. Una reutilización incompatible de identidad produce conflicto y no sobrescritura.
37. Una revisión válida conserva historia y no reescribe el original.
38. Anulación, devolución, reembolso y compensación conservan relación con la línea original y no la eliminan.
39. NEXO, NUMERA y PASS conservan identidades de efecto y autoridad propias.
40. `SHELL-CON-022` conserva la responsabilidad exclusiva del contrato compartido de mapping.
41. `SHELL-CON-023` conserva la responsabilidad exclusiva de idempotencia y conciliación compartidas.
42. `SHELL-CON-024` conserva la responsabilidad exclusiva de cuarentena, rechazo y compensación compartidos.
43. Esta tarea crea cero valores físicos de `CanonicalSaleLineId`.
44. Esta tarea no crea código, tablas, migraciones, RLS, RPC, eventos, secretos, credenciales ni cambios Supabase.
45. Esta tarea crea cero requisitos de prueba y modifica cero requisitos existentes.
46. `SHELL-CON-022` permanece como única continuidad reservada.

---

#### 31. Hallazgos y destinos exactos

| Hallazgo                                                                            | Estado                                                | Destino                                                                                                                         |
| ----------------------------------------------------------------------------------- | ----------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `CanonicalSale<TSaleLine>` requería una forma compartida concreta para `TSaleLine`  | resuelto documentalmente                              | `SHELL-CON-021`                                                                                                                 |
| la semántica de línea estaba distribuida entre `INT-POS-005..013` e `INT-SALES-001` | resuelto documentalmente                              | `SHELL-CON-021` centraliza sin cambiar decisiones propietarias                                                                  |
| el mapping compartido de identidades aún no está definido en BLOQUE H               | reservado                                             | `SHELL-CON-022`                                                                                                                 |
| la forma compartida de idempotencia y conciliación aún no está definida             | reservado                                             | `SHELL-CON-023`                                                                                                                 |
| la forma compartida de cuarentena, rechazo y compensación aún no está definida      | reservado                                             | `SHELL-CON-024`                                                                                                                 |
| `makos_excel` no acredita granularidad de venta y línea individual                  | brecha física preservada, no corregida por inferencia | evidencia y pilotos propietarios `INT-POS-021` / `INT-POS-022`; no fabricar líneas                                              |
| los efectos de inventario dependen de mapping suficiente                            | frontera preservada                                   | `SHELL-CON-022` para el contrato compartido; `INT-POS-011` para la resolución POS; `INT-SALES-003` / NEXO para el efecto físico |
| la materialización física de `CanonicalSaleLine` todavía no existe                  | esperado por fase                                     | `SHELL-CI-020::<package_id>`, solo tras `E5-GATE-008::<package_id>` y con la fundación CI previa certificada                    |

No queda un pendiente narrativo sin propietario o condición de salida.

---

#### 32. Criterios de aceptación

`SHELL-CON-021` queda documentalmente completa cuando se cumplen simultáneamente estos criterios:

1. existe exactamente un contrato lógico compartido `CanonicalSaleLine`;
2. existe una identidad lógica `CanonicalSaleLineId`;
3. `CanonicalSaleLineId` queda definida como estable, opaca y no secreta;
4. no se inventa un formato físico de identificador;
5. `CanonicalSale<CanonicalSaleLine>` queda como composición compatible con `SHELL-CON-020`;
6. la superficie permanece en `@vento/contracts/integrations`;
7. cada línea pertenece a exactamente una venta;
8. venta y línea conservan identidades distintas;
9. línea y producto conservan identidades distintas;
10. línea y línea de pedido conservan identidades distintas;
11. línea y movimiento de inventario conservan identidades distintas;
12. línea y hecho económico conservan identidades distintas;
13. línea y movimiento PASS conservan identidades distintas;
14. se conserva identidad de línea de fuente cuando exista;
15. no se usa posición, fila, producto, precio, cantidad, hash o timestamp como identidad universal;
16. se conserva secuencia de origen únicamente como dato condicional;
17. se conserva revisión de línea únicamente cuando exista evidencia;
18. `sold_item_ref` preserva el ítem realmente vendido sin convertirlo automáticamente en producto Vento;
19. producto, presentación y receta permanecen referencias separadas;
20. producto es obligatorio antes de efectos dependientes de producto;
21. presentación y receta se exigen solo cuando correspondan;
22. los estados de resolución de mapping continúan bajo su contrato propietario;
23. `SHELL-CON-022` no se adelanta;
24. cantidad y unidad quedan semánticamente diferenciadas;
25. no se inventan conversiones de unidad;
26. precio, descuento, impuesto, propina y total de línea permanecen diferenciados según aplicabilidad;
27. no se inventa prorrateo de descuentos;
28. no se inventa moneda, precisión ni redondeo;
29. estado de línea permanece separado de estado de venta y de procesos técnicos;
30. `ACTIVE` y `CANCELLED` solo se usan con equivalencia semántica acreditada;
31. `MAPPED`, `NOT_PROVIDED` y `UNRESOLVED` mantienen la semántica aprobada de mapping de estado;
32. `line_occurred_at` no se fabrica desde timestamps técnicos;
33. procedencia y correlación se conservan sin duplicar payload sensible;
34. una línea estructural puede preservarse con mapping pendiente;
35. una línea no elegible no produce efectos dependientes de producto;
36. entrar o salir de cuarentena no crea una nueva línea;
37. `SHELL-CON-023` no se adelanta;
38. `SHELL-CON-024` no se adelanta;
39. retry, replay y sincronización tardía conservan identidad;
40. revisiones conservan historia y no sobrescriben el original;
41. anulaciones, devoluciones, reembolsos y compensaciones no borran la línea original;
42. el flujo agregado `makos_excel` no se presenta como línea individual canónica sin evidencia suficiente;
43. PULSO y el POS externo convergen sobre la misma semántica de línea;
44. NEXO, NUMERA y PASS conservan autoridad e identidad de efectos independientes;
45. no se crean valores físicos de `CanonicalSaleLineId`;
46. no se crean tipos físicos, schemas, tablas, RPC, migraciones, RLS, endpoints, eventos o consumidores;
47. no se modifica Supabase;
48. no se modifica código;
49. se crean cero requisitos de prueba;
50. se modifican cero requisitos de prueba;
51. la continuidad reserva exclusivamente `SHELL-CON-022`.

---

#### 33. Límites de la tarea

`SHELL-CON-021` no:

- implementa `@vento/contracts`;
- crea archivos TypeScript;
- publica una versión de package;
- crea schemas ejecutables;
- crea tablas o columnas;
- crea migraciones;
- crea RLS, grants, RPC o funciones;
- crea endpoints, webhooks, colas o workers;
- crea datos de venta o líneas operativas;
- modifica ventas o líneas existentes;
- resuelve mappings reales;
- crea equivalencias por nombre, código o categoría;
- ejecuta cuarentena o liberación;
- ejecuta idempotencia o conciliación;
- emite eventos;
- aplica inventario;
- registra costos o asientos;
- aplica puntos;
- cobra pagos;
- emite documentos fiscales;
- ejecuta cutover;
- retira adaptadores;
- modifica código;
- modifica Supabase;
- cambia la ruta canónica;
- desarrolla `SHELL-CON-022`.

---

#### 34. Continuidad

##### ÚLTIMA TAREA APROBADA

SHELL-CON-020 — Crear contrato canónico de venta

##### TAREA ACTUAL APROBADA

SHELL-CON-021 — Crear contrato canónico de línea de venta

##### SIGUIENTE TAREA RESERVADA

SHELL-CON-022 — Crear contrato de mapeo de identificadores externos


### ✅ SHELL-CON-022 — Crear contrato de mapeo de identificadores externos

**Estado:** APROBADA
**Tarea anterior:** SHELL-CON-021 — Crear contrato canónico de línea de venta
**Tarea siguiente:** SHELL-CON-023 — Crear contrato de idempotencia y conciliación
**Tipo de tarea:** Documental; definición normativa documental del contrato compartido de mapeo de identificadores externos, con referencias tipadas, namespaces, clases de identificador, relaciones, estados de resolución, versionado, vigencia, evidencia y trazabilidad, preservando la semántica de `INT-EXT-013`, las especializaciones posteriores `INT-POS` y la separación frente a autenticidad, idempotencia, autorización, propiedad empresarial y efectos, sin implementar código, persistencia, migraciones ni cambios en Supabase
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/01_CONTRATOS_DE_INTEGRACIONES_EXTERNAS.md`
**Superficie lógica objetivo:** `@vento/contracts/integrations`
**Estado físico resultante:** `CONTRATO_COMPARTIDO_DE_MAPEO_DE_IDENTIFICADORES_EXTERNOS_DEFINIDO_NO_MATERIALIZADO`
**Implementación física autorizada:** ninguna
**Cambios de código, DDL, DML, migraciones, RLS, RPC, Storage, Edge Functions, endpoints, colas, workers, secretos, credenciales, proveedores, datos, configuración remota o despliegues:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-CON-022` centraliza en la fundación compartida de Vento OS la forma consumible y estática del mapeo entre identificadores externos y recursos canónicos VENTO ya definido normativamente por `INT-EXT-013`, sin convertir coincidencias de valor en identidad y sin crear una segunda fuente de verdad sobre mappings propietarios de producto, sede, terminal, caja, venta, línea, impresora, pago, usuario u otros recursos.

La regla central es:

```text
REFERENCIA EXTERNA TIPADA
+
NAMESPACE Y AMBIENTE
+
RELACIÓN ACREDITADA
+
RECURSO CANÓNICO EXACTO CUANDO APLIQUE
+
ESTADO, VERSIÓN Y EVIDENCIA
=
MAPEO TRAZABLE
```

Y permanece estrictamente separado de:

```text
COINCIDENCIA DE TEXTO O UUID
AUTENTICIDAD DE LA ENTRADA
AUTORIZACIÓN EMPRESARIAL
CLAVE IDEMPOTENTE
CORRELACIÓN SIN EQUIVALENCIA
CREDENCIAL O SECRETO
PROPIEDAD DEL HECHO
EFECTO EMPRESARIAL
```

La tarea materializa el handoff explícito dejado por `INT-EXT-013`, `SHELL-CON-019`, `SHELL-CON-020` y `SHELL-CON-021`: las referencias `mapping_refs[]` pasan a disponer de una semántica compartida tipada sin adelantar idempotencia, conciliación, cuarentena, rechazo o compensación.

---

#### 2. Resultado canónico

Quedan definidos dentro de `@vento/contracts/integrations` los siguientes artefactos lógicos compartidos:

1. `ExternalIdentifierMappingId`, identidad estable, opaca y no secreta de una relación de mapping materializada;
2. `ExternalIdentifierRef`, referencia externa tipada y delimitada por sistema, ambiente, superficie, namespace y clase de identificador;
3. `ExternalIdentifierMapping`, relación compartida, versionada y trazable entre una referencia externa y un recurso canónico cuando la semántica lo permita;
4. `ExternalIdentifierMappingRef`, referencia mínima e inmutable hacia un mapping identificado, destinada a sustituir referencias genéricas no tipadas en contratos consumidores cuando exista materialización física;
5. `ExternalIdentifierClass`, vocabulario lógico de clasificación del identificador o referencia recibida;
6. `ExternalIdentifierRelationKind`, vocabulario lógico de significado de la relación;
7. `ExternalIdentifierMappingState`, vocabulario lógico de estado compartido de resolución.

La superficie compartida queda preparada conceptualmente para que:

```text
ExternalReceivedEvent.mapping_refs[]
→ ExternalIdentifierMappingRef[]
```

```text
CanonicalSaleLine.mapping_refs[]
→ ExternalIdentifierMappingRef[]
```

cuando el package físico sea materializado y adoptado mediante su ciclo autorizado.

Esta tarea no crea archivos TypeScript, exports, JSON Schema, tablas, registros físicos, mappings operativos ni consumidores migrados.

---

#### 3. Fuentes y precedencia

`SHELL-CON-022` consume y conserva sin redefinir:

| Fuente                                    | Uso vinculante                                                                                                                      |
| ----------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| `SHELL-CON-001`                           | autoridad estática de `@vento/contracts`, sin runtime, red, secretos ni persistencia                                                |
| `SHELL-CON-017`                           | `IntegrationPrincipal`, identidad técnica separada del identificador externo y del recurso empresarial                              |
| `SHELL-CON-018`                           | referencia de credencial separada de identidad, mapping y valor secreto                                                             |
| `SHELL-CON-019`                           | `ExternalReceivedEvent` y `mapping_refs[]` como referencias hacia una forma compartida posterior                                    |
| `SHELL-CON-020`                           | `CanonicalSale`, procedencia y correlación sin equiparar identidad de fuente con identidad canónica                                 |
| `SHELL-CON-021`                           | `CanonicalSaleLine`, `mapping_refs[]`, estabilidad de línea y prohibición de usar producto, fila o hash como identidad de línea     |
| `INT-EXT-013`                             | `VENTO-EXTERNAL-ID-MAPPING-CONTRACT-001`, vocabularios, namespaces, relaciones, estados, matriz 21/21 y prohibiciones de inferencia |
| `INT-POS-010`                             | mapping contextual de empresa, sede, terminal y caja con vigencia e historia                                                        |
| `INT-POS-011`                             | mapping de producto, presentación y receta con estados propietarios de resolución                                                   |
| `INT-POS-013`                             | separación entre identidad de venta/línea, recepción, fila, hash, mapping e idempotencia                                            |
| `INT-DB-004`                              | destino físico posterior para crear mapeos de identificadores externos y canónicos                                                  |
| Registro Canónico de Requisitos de Prueba | cobertura vigente de integración, equivalencia, mapping, trazabilidad, fuente única y bloqueo de efectos no resolubles              |

Precedencia aplicable:

```text
INT-EXT-013
→ semántica propietaria y matriz de evidencia del mapping externo

INT-POS-010 / INT-POS-011 / INT-POS-013
→ especializaciones posteriores del POS donde corresponda

SHELL-CON-022
→ contrato compartido consumible de la semántica vigente

INT-DB-004
→ persistencia física posterior, únicamente dentro de implementación autorizada
```

Una decisión posterior y más específica aprobada no se degrada para reproducir un estado histórico anterior de evidencia.

---

#### 4. Frontera exacta de la tarea

La tarea incluye:

- identidad lógica de un mapping compartido;
- referencia externa tipada;
- vocabulario compartido de clases de identificador;
- vocabulario compartido de tipos de relación;
- vocabulario compartido de estados de mapping;
- delimitación obligatoria por sistema, ambiente, superficie y namespace;
- referencia al recurso canónico cuando la relación lo requiera;
- contrato de evidencia y procedencia por referencia;
- vigencia, retiro y sucesión conceptual;
- cardinalidad y unicidad semántica;
- compatibilidad con los mappings específicos de POS;
- compatibilidad con `ExternalReceivedEvent` y `CanonicalSaleLine`;
- reglas de fallo cerrado para efectos que dependen de una resolución exacta;
- adopción explícita del inventario `EXT-SYS-001` a `EXT-SYS-021` sin fabricar mappings nuevos.

La tarea no incluye:

- resolución física de mappings;
- tabla o índice de mapping;
- algoritmo de consulta;
- caché;
- endpoint;
- RPC;
- trigger;
- worker;
- secreto o credencial;
- autenticidad de proveedor;
- política de idempotencia;
- conciliación de resultados;
- cuarentena, dead-letter, rechazo o compensación;
- creación automática de recursos empresariales;
- fusión automática de identidades;
- migración de datos;
- cambios Supabase;
- implementación de `INT-DB-004`;
- desarrollo de `SHELL-CON-023` o `SHELL-CON-024`.

---

#### 5. Identidad de `ExternalIdentifierMappingId`

`ExternalIdentifierMappingId` identifica una relación de mapping materializada y no el objeto externo ni el recurso canónico relacionado.

Invariantes:

1. es estable, opaco y no secreto;
2. no se deriva del valor de una API key, token, certificado o credencial;
3. no se deriva automáticamente de `external_id_value`;
4. no se deriva automáticamente de `canonical_id`;
5. no es `ExternalIdentifierRef`;
6. no es `CanonicalSaleId` ni `CanonicalSaleLineId`;
7. no es `IntegrationPrincipalId`;
8. no es una idempotency key;
9. no es event ID, receipt ID ni correlation ID;
10. una sucesión que cambie de forma material el target, namespace, relación o semántica no reescribe la relación histórica;
11. esta tarea no fija UUID, prefijo, secuencia, slug ni otro formato físico;
12. esta tarea crea cero valores físicos de `ExternalIdentifierMappingId`.

---

#### 6. Forma lógica de `ExternalIdentifierRef`

La referencia externa compartida conserva como mínimo:

```text
ExternalIdentifierRef = {
  external_system_id
  environment
  surface
  external_namespace
  external_id_class
  external_id_kind
  external_id_value
}
```

Semántica:

- `external_system_id` identifica la frontera externa inventariada, no el objeto;
- `environment` impide reutilización cruzada entre ambientes;
- `surface` identifica el contrato, interfaz o superficie material que da significado al identificador;
- `external_namespace` delimita el espacio de identidad del emisor o plataforma;
- `external_id_class` clasifica la naturaleza del identificador o referencia;
- `external_id_kind` conserva la clase específica declarada por el contrato de la fuente;
- `external_id_value` conserva el valor normalizado solo en la medida permitida por el namespace y sin reinterpretar su significado.

Reglas de normalización:

1. no se aplica `trim`, case-folding, eliminación de prefijos, conversión numérica, canonicalización de UUID u otra transformación si el contrato del namespace no la autoriza;
2. una normalización permitida debe ser determinista y no puede fusionar dos valores externos semánticamente distintos;
3. la evidencia fuente o procedencia debe permitir reconstruir de dónde provino el valor;
4. la referencia no contiene secretos ni credenciales;
5. la misma cadena puede representar objetos diferentes en namespaces diferentes sin colisión contractual.

---

#### 7. Vocabulario `ExternalIdentifierClass`

Se adopta sin renombrar la taxonomía definida por `INT-EXT-013`:

| Clase                      | Significado compartido                                                                                                                 |
| -------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| `EXTERNAL_OBJECT_ID`       | identificador emitido o administrado por el sistema externo para un objeto, evento, transacción, dispositivo o recurso de su namespace |
| `CANONICAL_VENTO_ID`       | identificador propietario de VENTO para un recurso canónico                                                                            |
| `PROPAGATED_CANONICAL_ID`  | identificador canónico VENTO enviado deliberadamente al tercero y devuelto bajo un contrato aprobado                                   |
| `EXTERNAL_ROUTING_REF`     | referencia externa de destino o routing que no equivale a identidad empresarial                                                        |
| `IDEMPOTENCY_REF`          | referencia de operación estable; protege repetición, no identidad del recurso                                                          |
| `CORRELATION_REF`          | referencia que enlaza artefactos o intercambios sin declarar equivalencia de identidad                                                 |
| `DISPLAY_SEARCH_ATTRIBUTE` | atributo de búsqueda o presentación que nunca constituye equivalencia por sí solo                                                      |
| `TECHNICAL_NAMESPACE_ID`   | identificador de proyecto, class, pass type, aplicación, tenant, bridge u otro namespace técnico                                       |
| `EXTERNAL_ALIAS`           | alias externo que no autoriza fusión de identidades VENTO                                                                              |
| `MAPPING_RECORD`           | relación versionada y trazable que representa un mapping materializado                                                                 |

La clasificación describe semántica. No convierte automáticamente un valor en registro de mapping.

---

#### 8. Forma lógica de `ExternalIdentifierMapping`

La forma normativa objetivo es:

```text
ExternalIdentifierMapping = {
  mapping_id
  contract_version

  external_ref {
    external_system_id
    environment
    surface
    external_namespace
    external_id_class
    external_id_kind
    external_id_value
  }

  relation_kind

  canonical_resource_type
  canonical_id

  mapping_state
  resolution_detail

  evidence_refs[]
  correlation_refs[]

  valid_from
  retired_at
  predecessor_mapping_ref
  successor_mapping_ref
}
```

Esta notación es lógica. No fija:

- lenguaje de implementación;
- nombres físicos de archivos;
- tipos escalares;
- representación JSON definitiva;
- enum TypeScript;
- esquema de base de datos;
- índice de unicidad;
- estrategia de caché;
- formato de timestamps;
- algoritmo de resolución;
- persistencia física de evidencia.

`canonical_resource_type` y `canonical_id` son obligatorios únicamente cuando la relación y el estado afirman una asociación con un recurso canónico concreto. No se fabrican para `NO_EQUIVALENCE`, `NOT_APPLICABLE`, `BLOCKED` o una referencia todavía no resoluble.

---

#### 9. `ExternalIdentifierRelationKind`

El vocabulario compartido conserva exactamente los significados aprobados por `INT-EXT-013`:

| Relación                        | Semántica                                                                                                           |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| `EXTERNAL_TO_CANONICAL`         | un identificador de objeto externo se asocia con un recurso canónico VENTO                                          |
| `CANONICAL_PROPAGATED_EXTERNAL` | VENTO propagó su ID canónico al tercero y el valor regresó; la identidad sigue siendo VENTO                         |
| `EXTERNAL_ROUTE_TO_OWNER`       | una referencia técnica de destino se vincula con el registro técnico y propietario canónico que la administra       |
| `EXTERNAL_EVENT_TO_RECEIPT`     | un identificador de evento externo se vincula con el receipt interno y no con el hecho empresarial por equivalencia |
| `EXTERNAL_NAMESPACE_BINDING`    | un namespace técnico se vincula con una frontera VENTO sin afirmar equivalencia empresarial                         |
| `CORRELATION_ONLY`              | referencias relacionadas para reconstrucción o búsqueda sin declarar que representan el mismo objeto                |
| `NO_EQUIVALENCE`                | la referencia se conserva deliberadamente sin afirmar identidad canónica                                            |

Reglas:

1. una relación `CORRELATION_ONLY` no se promociona a `EXTERNAL_TO_CANONICAL` sin nueva evidencia y decisión acreditada;
2. `NO_EQUIVALENCE` es una decisión explícita, no un fallback silencioso;
3. el tipo de relación no concede permiso ni propiedad empresarial;
4. cambiar de tipo de relación de forma material exige una nueva relación/sucesión y conserva historia.

---

#### 10. `ExternalIdentifierMappingState`

El estado compartido adopta el vocabulario general de `INT-EXT-013`:

| Estado               | Significado                                                                                                   |
| -------------------- | ------------------------------------------------------------------------------------------------------------- |
| `RESOLVED`           | existe una relación única y acreditada dentro del namespace, ambiente y contrato aplicables                   |
| `PARTIALLY_RESOLVED` | parte de las relaciones de la superficie están acreditadas y otras permanecen no resolubles                   |
| `UNRESOLVED`         | existe referencia externa pero no evidencia suficiente para vincularla a un recurso canónico exacto           |
| `AMBIGUOUS`          | más de un candidato canónico permanece plausible sin evidencia suficiente para escoger uno                    |
| `CONFLICT`           | la referencia o nueva evidencia contradice una relación vigente o pretende reutilizarla de forma incompatible |
| `RETIRED`            | una relación histórica dejó de estar activa y conserva trazabilidad                                           |
| `NOT_APPLICABLE`     | el intercambio no requiere relación externo↔canónico en el alcance vigente                                    |
| `BLOCKED`            | falta proveedor, binding, namespace o contrato suficiente para materializar una decisión concreta             |

Reglas:

1. `UNRESOLVED`, `AMBIGUOUS`, `CONFLICT` y `BLOCKED` nunca se degradan silenciosamente a `RESOLVED`;
2. `NOT_APPLICABLE` exige fundamento contractual y no equivale a `null`;
3. `PARTIALLY_RESOLVED` no autoriza usar como resueltas las dimensiones faltantes;
4. `RETIRED` conserva historia y no libera el identificador para reinterpretarlo como si nunca hubiera existido la relación anterior;
5. el estado compartido representa la relación de mapping, no el estado empresarial del recurso.

---

#### 11. Compatibilidad con estados propietarios de `INT-POS-011`

`INT-POS-011` conserva su vocabulario propietario para producto, presentación y receta:

```text
RESOLVED
NOT_APPLICABLE
PENDING_EVIDENCE
NOT_PROVIDED
AMBIGUOUS
CONFLICT
INACTIVE
```

`SHELL-CON-022` no lo sustituye ni crea una segunda autoridad sobre la decisión propietaria.

Cuando una relación POS se proyecte al contrato compartido:

| Estado propietario | Proyección compartida permitida                                                         | Regla                                              |
| ------------------ | --------------------------------------------------------------------------------------- | -------------------------------------------------- |
| `RESOLVED`         | `RESOLVED`                                                                              | únicamente con una relación exacta acreditada      |
| `NOT_APPLICABLE`   | `NOT_APPLICABLE`                                                                        | conserva fundamento explícito                      |
| `AMBIGUOUS`        | `AMBIGUOUS`                                                                             | ningún candidato se elige por orden o semejanza    |
| `CONFLICT`         | `CONFLICT`                                                                              | no se sobrescribe la relación incompatible         |
| `PENDING_EVIDENCE` | `UNRESOLVED` cuando exista una referencia que deba seguirse                             | `resolution_detail` conserva el estado propietario |
| `NOT_PROVIDED`     | `UNRESOLVED` cuando el mapping sea requerido                                            | no se fabrica identificador de fuente              |
| `INACTIVE`         | `RETIRED` solo cuando el contrato propietario confirme retiro de la relación compartida | no existe equivalencia automática por nombre       |

`resolution_detail` permite conservar el estado especializado sin ampliar el vocabulario compartido ni perder semántica propietaria.

---

#### 12. Namespace, ambiente y superficie

El namespace mínimo de resolución es:

```text
external_system_id
+
environment
+
surface
+
external_namespace
+
external_id_kind
```

Invariantes:

1. un identificador externo no es globalmente único fuera de su namespace acreditado;
2. la misma cadena puede existir en dos proveedores, ambientes o clases sin representar el mismo objeto;
3. `DEVELOPMENT`, `STAGING` y `PRODUCTION` no comparten mappings por conveniencia;
4. un ID de otro tenant, proyecto, pass type, store, terminal o instancia no se reutiliza por semejanza;
5. `surface` aporta el contrato que da significado al valor y no puede omitirse si su ausencia produce ambigüedad;
6. un namespace técnico no se convierte en recurso empresarial;
7. resolver un canonical ID de forma inversa no implica que exista un único proveedor, binding o external ID.

---

#### 13. Cardinalidad y unicidad semántica

Reglas:

1. una relación activa de identidad exacta `EXTERNAL_TO_CANONICAL` resuelve como máximo a un recurso canónico dentro de su namespace;
2. varias referencias externas pueden apuntar al mismo recurso canónico cuando el contrato lo permita y cada relación esté tipada;
3. un recurso puede tener múltiples destinos técnicos sin que cada destino se convierta en su identidad;
4. una relación many-to-many solo existe cuando el contrato propietario la define explícitamente;
5. la cardinalidad no se infiere de conteos actuales de datos;
6. la ausencia de duplicados observados no prueba cardinalidad uno-a-uno;
7. un external ID reutilizado o reasignado por el proveedor requiere retiro de la relación anterior y nueva relación acreditada;
8. una colisión de external ID dentro del mismo namespace produce `CONFLICT` hasta resolución autorizada.

---

#### 14. Prohibición de equivalencia heurística

No constituyen prueba suficiente de mapping:

- UUID textual coincidente sin prueba contractual de propagación;
- correo;
- teléfono;
- nombre o razón social;
- `display_name`;
- dirección;
- coordenadas;
- alias;
- estado;
- monto o moneda;
- timestamp;
- IP;
- nombre de producto;
- código o categoría de producto;
- posición en un archivo;
- `source_row_number`;
- hash de archivo o payload;
- UID visible sin namespace;
- referencia encontrada en otra integración;
- parecido estructural de un payload.

Cuando un atributo participe como evidencia auxiliar, la decisión exacta sigue requiriendo un vínculo contractual suficiente y autoridad del dominio propietario.

---

#### 15. Identificadores canónicos propagados

Un ID VENTO enviado a un tercero y retornado después conserva la clase `PROPAGATED_CANONICAL_ID`.

Reglas:

1. se valida contra el tipo de recurso esperado;
2. se valida contra el ambiente correcto;
3. se valida contra superficie, contrato y propietario esperados;
4. la forma UUID no demuestra procedencia VENTO;
5. el tercero no adquiere propiedad del identificador;
6. una contradicción con otro identificador externo autenticado produce `CONFLICT`;
7. autenticidad del mensaje se valida de forma independiente;
8. autorización sobre el recurso se revalida de forma independiente;
9. el ID propagado no se reetiqueta como `EXTERNAL_OBJECT_ID` por haber atravesado un proveedor.

---

#### 16. Evidencia, procedencia y correlación

Todo mapping que afirme una relación exacta debe ser reconstruible mediante referencias de evidencia suficientes.

`evidence_refs[]` puede relacionar, según el contrato propietario:

- recepción externa gobernada por `SHELL-CON-019`;
- evidencia fuente protegida;
- mapping propietario de POS;
- respuesta o receipt del proveedor;
- registro de configuración autorizado;
- inventario técnico acreditado;
- otra evidencia canónica identificable.

Reglas:

1. la evidencia no se copia íntegramente dentro del mapping cuando una referencia protegida sea suficiente;
2. un payload completo no es la identidad del mapping;
3. un hash puede proteger integridad o conflicto, pero no sustituye la relación;
4. `correlation_refs[]` enlaza hechos sin convertir correlación en equivalencia;
5. perder evidencia suficiente puede degradar la capacidad de resolver o reconciliar la relación; no autoriza mantener `RESOLVED` por costumbre;
6. secretos y credenciales nunca se incorporan como evidencia embebida.

---

#### 17. Vigencia, retiro y sucesión

Cuando la temporalidad sea material, la relación conserva:

- `valid_from`;
- `retired_at`;
- `predecessor_mapping_ref`;
- `successor_mapping_ref`.

Reglas:

1. una relación histórica no se sobrescribe para aparentar que siempre apuntó al target nuevo;
2. reasignar un external ID a otro recurso exige una relación sucesora y preservación de la anterior;
3. una fusión de recursos VENTO no se ejecuta porque dos external IDs converjan;
4. dividir un recurso no reparte aliases o external IDs por heurística;
5. cambios incompatibles de namespace, emisor o significado requieren nueva relación y clasificación de compatibilidad;
6. cuando el contrato propietario defina vigencia temporal, la resolución histórica usa el instante empresarial o de fuente aplicable y no `received_at` por conveniencia;
7. retiro de un mapping no borra receipts, eventos, ventas, líneas ni efectos históricos que lo referencien.

---

#### 18. Relación con `ExternalReceivedEvent`

`SHELL-CON-019` conserva la recepción externa antes del hecho empresarial.

La relación queda:

```text
ExternalReceivedEvent
→ external identifiers / normalized assertion
→ ExternalIdentifierMappingRef[]
→ VALIDACIÓN POR DOMINIO PROPIETARIO
→ hecho canónico cuando corresponda
```

Reglas:

1. un evento puede existir con cero mappings resueltos si su conservación como evidencia es válida;
2. `mapping_refs[]` solo referencia mappings materializados o decisiones trazables, no candidatos heurísticos;
3. event ID, receipt ID y mapping ID permanecen identidades distintas;
4. `EXTERNAL_EVENT_TO_RECEIPT` vincula evento con receipt sin convertir el event ID en ID del recurso empresarial;
5. una entrada `UNRESOLVED` puede conservarse, pero no habilita un efecto que requiera conocer un recurso exacto.

---

#### 19. Relación con `CanonicalSale` y `CanonicalSaleLine`

`SHELL-CON-020` y `SHELL-CON-021` preservan identidad de venta y línea independientemente del mapping.

Para una línea:

```text
CanonicalSaleLineId
≠ external product id
≠ external line id
≠ product_ref
≠ mapping_id
```

Reglas:

1. cambiar mapping de producto no cambia `CanonicalSaleLineId`;
2. resolver presentación o receta posteriormente no crea otra línea;
3. `product_ref`, `presentation_ref` y `recipe_ref` permanecen referencias propietarias del dominio;
4. `mapping_refs[]` explica cómo se acreditó una correspondencia, no reemplaza el recurso resuelto;
5. una línea estructural puede conservarse con mapping pendiente;
6. un efecto dependiente de producto exige resolución suficiente conforme a `INT-POS-011` y sus puertas propietarias;
7. `source_row_number` no se convierte en external line ID ni mapping ID;
8. el flujo agregado `makos_excel` no obtiene identidad de venta o línea individual mediante este contrato.

---

#### 20. Separación frente a idempotencia

```text
MAPPING
→ qué recurso representa o con qué recurso se relaciona una referencia
```

```text
IDEMPOTENCIA
→ si una operación ya fue reclamada y qué resultado debe recuperarse
```

Consecuencias:

1. `mapping_id` no es idempotency key;
2. `external_id_value` no es idempotency key por defecto;
3. una idempotency key puede existir sin identificar un recurso empresarial;
4. un mapping resuelto no demuestra que una operación sea nueva;
5. una redelivery conserva la identidad idempotente aunque el mapping ya esté resuelto;
6. una revisión de mapping no autoriza repetir un efecto ya producido;
7. `SHELL-CON-023` conserva en exclusiva el contrato compartido de idempotencia y conciliación.

---

#### 21. Separación frente a autenticidad y autorización

El orden conceptual para una entrada que necesita mapping es:

```text
AUTENTICAR / VALIDAR ORIGEN
→ CLASIFICAR IDENTIFICADOR
→ RESOLVER NAMESPACE Y AMBIENTE
→ CONSULTAR RELACIÓN ACREDITADA
→ CLASIFICAR ESTADO DE MAPPING
→ VALIDAR RECURSO EN SU DOMINIO PROPIETARIO
→ REVALIDAR AUTORIZACIÓN Y ESTADO
→ APLICAR O RECHAZAR EL EFECTO
```

Reglas:

1. autenticidad válida no implica mapping resuelto;
2. mapping `RESOLVED` no implica autorización;
3. `IntegrationPrincipal` conocido no implica equivalencia de recursos;
4. una `ExternalCredentialRef` válida no concede autoridad empresarial;
5. el dominio propietario conserva la decisión de existencia, estado y uso del recurso canónico;
6. `@vento/contracts` describe la relación y nunca ejecuta el efecto.

---

#### 22. Política de fallo cerrado

Cuando un efecto dependa de conocer un recurso exacto:

- `RESOLVED` permite continuar únicamente a las demás puertas aplicables;
- `PARTIALLY_RESOLVED` permite usar solo dimensiones explícitamente resueltas;
- `UNRESOLVED` bloquea el efecto dependiente de esa identidad;
- `AMBIGUOUS` bloquea el efecto y prohíbe elegir el primer candidato;
- `CONFLICT` bloquea el efecto y conserva ambas evidencias para tratamiento propietario;
- `BLOCKED` impide materializar una relación ficticia;
- `NOT_APPLICABLE` no inventa un recurso para satisfacer un esquema;
- `RETIRED` no se usa para nuevas operaciones fuera de su vigencia.

Bloquear un efecto dependiente del mapping no exige descartar la recepción, la evidencia o el hecho estructural que pueda conservarse válidamente sin ese efecto.

La disposición compartida permanece bajo `SHELL-CON-024`; la especialización externa permanece bajo `INT-EXT-016` y la especialización de líneas POS bajo `INT-POS-012`.

---

#### 23. Adopción de las veintiuna identidades externas

`SHELL-CON-022` preserva exactamente `EXT-SYS-001` a `EXT-SYS-021`. No crea una identidad adicional ni elimina una existente.

La unidad de la matriz siguiente es la **decisión de adopción del contrato compartido**, no un registro físico de mapping por sistema.

| ID            | Sistema / plataforma                     | Decisión de adopción compartida                                                                                                                                                   |
| ------------- | ---------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `EXT-SYS-001` | Supabase                                 | no crear mapping empresarial global por pertenecer a infraestructura; los IDs empresariales conservan dominio propietario                                                         |
| `EXT-SYS-002` | Wompi                                    | admitir mappings tipados para transaction ID, canonical ID propagado y event→receipt, preservando `reference` como correlación/idempotencia según su contrato                     |
| `EXT-SYS-003` | RevenueCat                               | admitir mappings tipados por plataforma/store y canonical IDs propagados; `original_transaction_id` y aliases no se fusionan con identidad VENTO sin relación acreditada          |
| `EXT-SYS-004` | Resend                                   | no inventar provider message ID; correo permanece dirección/atributo y los IDs internos continúan canónicos VENTO                                                                 |
| `EXT-SYS-005` | Expo / EAS Update                        | conservar IDs de proyecto, channel, profile y runtime como referencias técnicas, sin mapping empresarial universal                                                                |
| `EXT-SYS-006` | Expo Push Service                        | modelar push token como routing ref vinculado a registro técnico/owner; no convertirlo en employee ID                                                                             |
| `EXT-SYS-007` | Sentry                                   | conservar referencias de observabilidad como técnicas/correlacionales mientras no exista mapping empresarial acreditado                                                           |
| `EXT-SYS-008` | Google Maps / Google Reviews             | conservar `place_id` como referencia externa; cualquier asociación durable con recurso VENTO exige mapping explícito                                                              |
| `EXT-SYS-009` | Apple Wallet / PassKit y APNs            | separar serial, pass type, device library ID, push token y canonical owner; usar relación tipada por cada plano                                                                   |
| `EXT-SYS-010` | Vercel                                   | mantener project/deployment/domain como referencias técnicas sin equivalencia empresarial universal                                                                               |
| `EXT-SYS-011` | Zebra BrowserPrint                       | exigir relación explícita entre `device.uid` y la identidad canónica de impresora antes de usarlo como binding durable                                                            |
| `EXT-SYS-012` | Google Wallet / Google Pay & Wallet      | conservar modelo de `id`/`classId` sin declarar mapping remoto hasta acreditar binding y recurso relacionado                                                                      |
| `EXT-SYS-013` | POS externo vigente                      | consumir las especializaciones aprobadas posteriormente en `INT-POS-010`, `INT-POS-011` y `INT-POS-013`; no fabricar venta/línea desde `makos_excel`, fila, hash, nombre o código |
| `EXT-SYS-014` | Shopify / comercio electrónico           | no instanciar mappings mientras no exista binding autorizado y namespace acreditado                                                                                               |
| `EXT-SYS-015` | Rappi / marketplace                      | no instanciar order/store/courier mappings sin binding y contrato reales                                                                                                          |
| `EXT-SYS-016` | ManyChat / automatización conversacional | no instanciar subscriber/contact/flow mappings sin binding acreditado                                                                                                             |
| `EXT-SYS-017` | WhatsApp                                 | no convertir número, contacto o conversación en persona/caso canónico sin proveedor, namespace y contrato acreditados                                                             |
| `EXT-SYS-018` | Instagram / social                       | no convertir handle, profile o message ID en identidad empresarial sin binding y relación aprobados                                                                               |
| `EXT-SYS-019` | Correo corporativo y alias funcionales   | no equiparar mailbox, correo o alias con persona, expediente o proveedor canónico por coincidencia                                                                                |
| `EXT-SYS-020` | Telefonía / voz                          | permanecer sin mapping material hasta que `TI-INT-003` acredite operador, cuenta, interfaz, IDs y semántica; caller ID no basta                                                   |
| `EXT-SYS-021` | Transporte externo                       | no convertir tracking, guía, conductor o referencia de envío en salida/entrega canónica sin binding y contrato acreditados                                                        |

Control de cobertura:

```text
identidades esperadas = 21
identidades adoptadas = 21
faltantes = 0
duplicados = 0
identificadores EXT-SYS únicos = 21
```

La matriz de `INT-EXT-013` sigue siendo la fuente de evidencia y clasificación histórica de esas identidades. Esta tarea no la duplica como registro editable ni presenta como diagnóstico vigente un bloqueo que una especialización posterior ya haya refinado.

---

#### 24. Casos de interoperabilidad materializados

| Caso                                         | Clase / relación compartida                                                          | Decisión                                                                                        |
| -------------------------------------------- | ------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------- |
| Wompi `transaction.id` → transacción VENTO   | `EXTERNAL_OBJECT_ID` + `EXTERNAL_TO_CANONICAL`                                       | relación exacta scoped por proveedor/ambiente; `provider_reference` no se convierte en order ID |
| Wompi event ID → receipt interno             | `EXTERNAL_OBJECT_ID` + `EXTERNAL_EVENT_TO_RECEIPT`                                   | event ID y transaction ID permanecen distintos                                                  |
| RevenueCat `app_user_id` propagado por VENTO | `PROPAGATED_CANONICAL_ID` + `CANONICAL_PROPAGATED_EXTERNAL`                          | validar tipo, ambiente y contrato; no clasificar como ID nativo del proveedor                   |
| Expo push token → registro técnico/owner     | `EXTERNAL_ROUTING_REF` + `EXTERNAL_ROUTE_TO_OWNER`                                   | token no es identidad del trabajador                                                            |
| Google `place_id` sin asociación durable     | `EXTERNAL_OBJECT_ID` + `NO_EQUIVALENCE` o `CORRELATION_ONLY` según el flujo          | no convertir en `site_id`                                                                       |
| PassKit `deviceLibraryIdentifier`            | `EXTERNAL_OBJECT_ID`                                                                 | no convertir en user ID                                                                         |
| PassKit push token                           | `EXTERNAL_ROUTING_REF`                                                               | cambio de token no cambia identidad del usuario o pase                                          |
| Zebra `device.uid`                           | identificador técnico externo + `EXTERNAL_TO_CANONICAL` únicamente tras acreditación | nombre/modelo/orden de enumeración no sustituyen el vínculo                                     |
| POS `source_row_number`                      | no elegible como external line ID                                                    | permanece localizador técnico de la recepción                                                   |
| correo/teléfono/nombre                       | `DISPLAY_SEARCH_ATTRIBUTE`                                                           | nunca mapping exacto por sí solo                                                                |

Estos casos demuestran la semántica del contrato; no crean registros físicos.

---

#### 25. Versionado y compatibilidad

`ExternalIdentifierMapping` hereda el gobierno SemVer de `@vento/contracts`.

Reglas:

1. la superficie lógica permanece en `@vento/contracts/integrations`;
2. cambiar el significado de una clase, relación o estado es cambio contractual material;
3. agregar un campo opcional solo es compatible si un consumidor anterior puede ignorarlo sin alterar la semántica existente;
4. cambiar una relación de `CORRELATION_ONLY` a identidad exacta no se resuelve con un cambio silencioso de datos;
5. una nueva versión de contrato no reinterpreta mappings históricos por defecto;
6. `contract_version` identifica la semántica con que se interpretó la relación;
7. la sucesión de una relación y la versión del contrato son conceptos distintos;
8. esta tarea no declara una release física ni un número de package publicado inexistente.

---

#### 26. Seguridad, privacidad y contenido prohibido

El contrato de mapping nunca contiene como contenido ordinario:

- API keys;
- client secrets;
- passwords;
- access tokens;
- refresh tokens;
- private keys;
- service-role keys;
- certificados privados;
- firmas completas cuando una referencia sea suficiente;
- credenciales de proveedor;
- URLs firmadas persistentes;
- payloads fuente completos cuando una referencia protegida sea suficiente.

Además:

1. un identificador externo no se trata como secreto por defecto, pero su exposición se limita según sensibilidad y finalidad del recurso;
2. conocer un `mapping_id` no concede lectura del recurso canónico;
3. conocer un `canonical_id` no concede acceso al proveedor;
4. mappings de personas, dispositivos o destinos no autorizan exponer email, teléfono u otros atributos auxiliares;
5. logs y errores deberán poder referenciar mapping/namespace sin copiar material sensible innecesario cuando la implementación física sea autorizada.

---

#### 27. Propiedad y autoridad

`@vento/contracts/integrations` es autoridad sobre la **forma compartida** del mapping, no sobre el hecho empresarial ni sobre la persistencia de cada dominio.

Reglas:

1. el dominio propietario conserva el identificador canónico y la semántica del recurso;
2. el proveedor conserva sus identificadores externos sin convertirse en propietario del recurso VENTO;
3. un adapter puede resolver mappings sin adquirir propiedad funcional;
4. `vento-shell` conserva la propiedad técnica de la futura infraestructura Supabase de integración bajo las tareas de BLOQUE R;
5. `INT-DB-004` materializará la persistencia física exclusivamente dentro de un `package_id` autorizado por `E5-GATE-008::<package_id>` y abierto mediante `SHELL-CI-020::<package_id>`;
6. ninguna consumidora crea una tabla o enum local incompatible para redefinir esta semántica compartida una vez publicada la superficie física.

---

#### 28. Estado de materialización física

En el corte documental actual:

```text
SHELL-CON-022
→ ExternalIdentifierMappingId definido lógicamente
→ ExternalIdentifierRef definido lógicamente
→ ExternalIdentifierMapping definido lógicamente
→ ExternalIdentifierMappingRef definido lógicamente
→ ExternalIdentifierClass preservado desde INT-EXT-013
→ ExternalIdentifierRelationKind preservado desde INT-EXT-013
→ ExternalIdentifierMappingState preservado desde INT-EXT-013
→ compatibilidad con estados propietarios INT-POS-011 definida
→ EXT-SYS-001..021 adoptados 21/21
→ mapping_refs[] obtiene semántica compartida objetivo
→ 0 valores físicos de mapping_id creados
→ 0 mappings operativos creados
→ 0 tipos TypeScript creados
→ 0 schemas ejecutables creados
→ 0 tablas creadas
→ 0 índices creados
→ 0 RPC creadas
→ 0 migraciones creadas
→ 0 cambios Supabase
→ 0 consumidores migrados
```

La aprobación documental no acredita implementación física, publicación del package, persistencia de mappings, backfill, adopción por consumidores ni validación E2E.

---

#### 29. Handoffs exactos

| Trabajo posterior                                  | Estado desde esta tarea             | Propietario / tarea          | Condición de salida                                                                                                                                            |
| -------------------------------------------------- | ----------------------------------- | ---------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| idempotencia y conciliación compartidas            | `FUERA_DE_ALCANCE`                  | `SHELL-CON-023`              | operación, clave, huella, resultado recuperable y conciliación quedan tipados sin reutilizar mapping ID como identidad operacional                             |
| cuarentena, rechazo y compensación compartidos     | `FUERA_DE_ALCANCE`                  | `SHELL-CON-024`              | entradas `UNRESOLVED`, `AMBIGUOUS`, `CONFLICT` o incompatibles reciben disposición explícita sin efecto silencioso                                             |
| persistencia física de mappings externos/canónicos | `DEFINIDO_NO_MATERIALIZADO`         | `INT-DB-004`                 | se crea infraestructura autorizada con compatibilidad, constraints, RLS/grants, backfill, reconciliación, tipos, pruebas y rollback según el orden de BLOQUE R |
| mapping contextual POS                             | preservado por contrato propietario | `INT-POS-010`                | empresa, sede, terminal y caja se resuelven con contexto, vigencia e historia acreditados                                                                      |
| mapping producto/presentación/receta POS           | preservado por contrato propietario | `INT-POS-011`                | los planos obligatorios alcanzan resolución suficiente sin heurísticas y conservan su estado propietario                                                       |
| identidad/idempotencia POS                         | preservada por contrato propietario | `INT-POS-013`                | venta, línea, recepción, revisión, payload, transporte y efecto permanecen identidades distintas                                                               |
| disposición externa no resoluble                   | preservada por contrato propietario | `INT-EXT-016`                | entradas sin mapping suficiente reciben cuarentena/dead-letter o tratamiento autorizado sin efecto empresarial silencioso                                      |
| auditoría y reconciliación externa de mappings     | preservada por contrato propietario | `INT-EXT-017`                | cambios, conflictos, relaciones retiradas y resoluciones manuales quedan reconstruibles                                                                        |
| binding de telefonía/voz                           | `BLOQUEADO_POR_EVIDENCIA`           | `TI-INT-003`                 | operador, cuenta, interfaz, namespaces, IDs y semántica quedan acreditados antes de materializar mappings                                                      |
| materialización física del contrato compartido     | `DEFINIDO_NO_MATERIALIZADO`         | `SHELL-CI-020::<package_id>` | el package se implementa solo tras `E5-GATE-008::<package_id>` y con la fundación CI previa certificada                                                        |

Todos los pendientes poseen tarea propietaria y condición de salida explícita.

---

#### 30. Cobertura de prueba preexistente

La semántica centralizada por `SHELL-CON-022` ya está protegida por requisitos canónicos vigentes, entre ellos:

- `TREQ-INTEGRATION-001`, que exige coherencia de ambiente y contrato en superficies externas;
- `TREQ-INTEGRATION-006`, que exige fuente empresarial única y resolución de fuentes competidoras sin sobrescribir historia;
- `TREQ-INTEGRATION-009`, que exige mapping explícito de identificadores externos hacia producto, presentación y receta cuando aplique y bloquea efectos automáticos de una línea no mapeada;
- `TREQ-INTEGRATION-046`, que prohíbe mapear material legacy a una definición canónica por simple semejanza de nombre o payload;
- `TREQ-INTEGRATION-049`, que exige conservar proveedor, identificador externo, autenticidad, evidencia fuente y correlación antes de producir un hecho interno;
- la cobertura de `INT-EXT-013`, que ya materializó reglas de namespace, relación, estado, equivalencia, historia y resolución para las veintiuna identidades externas;
- la cobertura PULSO e INTEGRATION ya consumida por `SHELL-CON-021` para estabilidad de venta/línea y efectos dependientes de mapping.

`SHELL-CON-022` no introduce un comportamiento operacional nuevo. Centraliza como contrato compartido estático la representación que las reglas vigentes ya exigen.

---

#### 31. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

**Justificación:** `SHELL-CON-022` materializa documentalmente en `@vento/contracts/integrations` la forma compartida de un mapping ya definido y protegido por `INT-EXT-013`, `INT-POS-010`, `INT-POS-011`, `INT-POS-013` y requisitos vigentes. No introduce una operación ejecutable, una fuente nueva, un proveedor nuevo, un algoritmo de resolución nuevo, una autorización nueva, una regla de negocio nueva, una persistencia, un endpoint, una política de idempotencia, una disposición, una migración ni un cambio Supabase. El Registro Canónico de Requisitos de Prueba permanece sin cambios.

---

#### 32. Criterios de aceptación

`SHELL-CON-022` queda documentalmente completa cuando se cumplen simultáneamente estos criterios:

1. existe exactamente una forma compartida lógica `ExternalIdentifierMapping`;
2. existe una identidad lógica `ExternalIdentifierMappingId` estable, opaca y no secreta;
3. existe `ExternalIdentifierRef` con sistema, ambiente, superficie, namespace, clase, kind y valor;
4. existe `ExternalIdentifierMappingRef` como referencia tipada para contratos consumidores;
5. la superficie permanece en `@vento/contracts/integrations`;
6. no se fija un formato físico de `mapping_id`;
7. se preservan las diez clases de identificador definidas por `INT-EXT-013`;
8. se preservan los siete tipos de relación definidos por `INT-EXT-013`;
9. se preservan los ocho estados compartidos de mapping definidos por `INT-EXT-013`;
10. los estados propietarios de `INT-POS-011` no se sustituyen ni pierden semántica;
11. `PENDING_EVIDENCE` y `NOT_PROVIDED` no se convierten en `RESOLVED`;
12. `INACTIVE` no se convierte automáticamente en `RETIRED` sin decisión propietaria;
13. el namespace mínimo incluye sistema, ambiente, superficie, namespace externo y kind;
14. un external ID no se presume globalmente único;
15. una relación exacta activa resuelve como máximo a un recurso canónico dentro de su namespace;
16. múltiples referencias externas hacia un mismo recurso requieren relaciones explícitas;
17. many-to-many no se infiere;
18. mappings no cruzan ambientes por conveniencia;
19. coincidencia de UUID no prueba identidad;
20. correo, teléfono, nombre, dirección, coordenadas, alias y texto visible no prueban identidad;
21. código, categoría o nombre de producto no prueban mapping por sí solos;
22. fila, `source_row_number`, hash y timestamp no se convierten en identidad;
23. un ID VENTO propagado conserva `PROPAGATED_CANONICAL_ID` al regresar;
24. un ID propagado se valida por tipo, ambiente, contrato y propietario;
25. mapping `RESOLVED` no concede autorización;
26. autenticidad no sustituye mapping;
27. `IntegrationPrincipal` no sustituye mapping;
28. credencial no sustituye mapping;
29. mapping no sustituye idempotencia;
30. mapping no sustituye correlación ni receipt;
31. un evento externo puede conservarse con mapping no resuelto sin producir el efecto dependiente;
32. `UNRESOLVED`, `AMBIGUOUS`, `CONFLICT` y `BLOCKED` fallan cerrados para efectos que requieren identidad exacta;
33. una relación retirada conserva historia;
34. una reasignación de external ID no sobrescribe el mapping anterior;
35. `contract_version` y sucesión de mapping permanecen conceptos distintos;
36. se preserva compatibilidad con `ExternalReceivedEvent.mapping_refs[]`;
37. se preserva compatibilidad con `CanonicalSaleLine.mapping_refs[]`;
38. cambiar mapping no cambia `CanonicalSaleLineId`;
39. se preservan exactamente `EXT-SYS-001` a `EXT-SYS-021`;
40. identidades adoptadas = 21 de 21;
41. faltantes = 0;
42. duplicados = 0;
43. POS externo consume las especializaciones posteriores `INT-POS` sin restaurar un diagnóstico histórico obsoleto;
44. Wompi separa transaction ID, reference, canonical ID propagado y event ID;
45. RevenueCat separa `app_user_id`, product mapping, original transaction y aliases;
46. push token Expo no se convierte en employee ID;
47. `place_id` no se convierte en `site_id`;
48. PassKit separa serial, pass type, device library ID, push token y owner;
49. Zebra UID requiere vínculo acreditado con impresora canónica;
50. sistemas sin binding no reciben mappings ficticios;
51. `INT-DB-004` conserva en exclusiva la persistencia física posterior;
52. `SHELL-CON-023` no se adelanta;
53. `SHELL-CON-024` no se adelanta;
54. no se crean mappings físicos;
55. no se crean tipos TypeScript ni schemas ejecutables;
56. no se crean tablas, índices, RPC, RLS o migraciones;
57. no se modifica Supabase;
58. no se modifica código;
59. se crean cero requisitos de prueba;
60. se modifican cero requisitos de prueba;
61. la continuidad reserva exclusivamente `SHELL-CON-023`.

---

#### 33. Decisiones vinculantes

1. `ExternalIdentifierMappingId` identifica la relación de mapping y no el recurso externo o canónico.
2. `ExternalIdentifierRef` conserva sistema, ambiente, superficie, namespace, clase, kind y valor.
3. `ExternalIdentifierMapping` es el contrato compartido estático de mapping externo↔canónico.
4. `ExternalIdentifierMappingRef` es la referencia tipada objetivo para `mapping_refs[]`.
5. La superficie lógica permanece `@vento/contracts/integrations`.
6. `ExternalIdentifierClass` conserva las diez clases de `INT-EXT-013`.
7. `ExternalIdentifierRelationKind` conserva las siete relaciones de `INT-EXT-013`.
8. `ExternalIdentifierMappingState` conserva los ocho estados generales de `INT-EXT-013`.
9. Los estados especializados `INT-POS-011` permanecen autoridad propietaria y se proyectan sin pérdida de detalle.
10. La misma cadena no implica la misma identidad fuera de su namespace.
11. Un external ID no es un canonical ID por coincidencia de formato.
12. Un canonical ID propagado sigue siendo VENTO.
13. Un routing ref no es identidad del owner.
14. Una idempotency ref no es identidad del recurso.
15. Una correlation ref no declara equivalencia.
16. Un atributo de búsqueda o presentación no declara equivalencia.
17. Un namespace técnico no es un recurso empresarial.
18. `CORRELATION_ONLY` no se promociona silenciosamente a identidad exacta.
19. `NO_EQUIVALENCE` es una decisión explícita.
20. `UNRESOLVED`, `AMBIGUOUS`, `CONFLICT` y `BLOCKED` no producen efecto dependiente de identidad exacta.
21. `PARTIALLY_RESOLVED` solo habilita dimensiones expresamente resueltas.
22. `NOT_APPLICABLE` no se infiere desde ausencia.
23. `RETIRED` conserva historia.
24. Un mapping resuelto no concede autorización.
25. Un principal técnico no concede mapping.
26. Una credencial no concede mapping.
27. Mapping e idempotencia permanecen contratos distintos.
28. Mapping y payload original permanecen contratos distintos.
29. Mapping y conciliación permanecen responsabilidades distintas.
30. `ExternalReceivedEvent` puede referenciar mappings sin convertir al proveedor en productor empresarial.
31. `CanonicalSaleLine` conserva identidad propia aunque cambie un mapping.
32. `source_row_number` no es external line ID.
33. `makos_excel` no adquiere granularidad individual por este contrato.
34. Los 21 `EXT-SYS-*` quedan adoptados 21/21.
35. `EXT-SYS-013` consume las decisiones posteriores `INT-POS` y no restaura el bloqueo histórico de `INT-EXT-013` como si fuera diagnóstico vigente.
36. `EXT-SYS-020` conserva su bloqueo hasta la evidencia propietaria de `TI-INT-003`.
37. Sistemas sin binding no reciben IDs o mappings inventados.
38. `INT-DB-004` es el propietario de la futura infraestructura física de mapping.
39. Esta tarea crea cero mappings operativos.
40. Esta tarea crea cero valores físicos de `ExternalIdentifierMappingId`.
41. Esta tarea no crea código, tablas, índices, migraciones, RLS, RPC, secretos ni cambios Supabase.
42. Esta tarea crea cero requisitos de prueba y modifica cero requisitos existentes.
43. `SHELL-CON-023` permanece como única continuidad reservada.

---

#### 34. Hallazgos y destinos exactos

| Hallazgo                                                                                                               | Estado                       | Destino                                                                                                           |
| ---------------------------------------------------------------------------------------------------------------------- | ---------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| `mapping_refs[]` existía como referencia genérica en contratos compartidos previos                                     | resuelto documentalmente     | `SHELL-CON-022` define `ExternalIdentifierMappingRef` y la forma compartida del mapping                           |
| la semántica compartida de mapping estaba definida en BLOQUE X pero no centralizada en `@vento/contracts/integrations` | resuelto documentalmente     | `SHELL-CON-022`                                                                                                   |
| los estados generales de mapping y los estados especializados del POS no son vocabularios idénticos                    | reconciliado sin renombrar   | estado compartido conserva `INT-EXT-013`; detalle propietario conserva `INT-POS-011` mediante `resolution_detail` |
| `EXT-SYS-013` fue clasificado históricamente antes de completarse las tareas `INT-POS` posteriores                     | reconciliado por precedencia | consumir `INT-POS-010`, `INT-POS-011` y `INT-POS-013` para el POS; no restaurar el diagnóstico anterior           |
| la persistencia física de mappings compartidos todavía no existe                                                       | esperado por fase            | `INT-DB-004`                                                                                                      |
| idempotencia y conciliación compartidas todavía no están materializadas en BLOQUE H                                    | reservado                    | `SHELL-CON-023`                                                                                                   |
| disposición compartida de entradas incompatibles todavía no está materializada en BLOQUE H                             | reservado                    | `SHELL-CON-024`                                                                                                   |
| telefonía/voz carece de binding acreditado suficiente                                                                  | `BLOQUEADO_POR_EVIDENCIA`    | `TI-INT-003`                                                                                                      |

No queda un pendiente narrativo sin propietario y condición de salida.

---

#### 35. Límites de la tarea

`SHELL-CON-022` no:

- implementa `@vento/contracts`;
- crea archivos TypeScript;
- publica un package;
- crea JSON Schema ejecutable;
- crea tablas de mapping;
- crea índices de unicidad;
- crea migraciones;
- crea RLS, grants, RPC o funciones;
- modifica Supabase;
- ejecuta backfill;
- crea mappings para datos existentes;
- fusiona identidades;
- crea recursos empresariales;
- elige candidatos ambiguos;
- resuelve conflictos físicos;
- almacena payloads;
- valida firmas;
- crea principals técnicos;
- crea credenciales;
- define idempotencia compartida;
- ejecuta conciliación;
- crea cuarentena;
- ejecuta compensaciones;
- cambia decisiones propietarias de `INT-POS-010`, `INT-POS-011` o `INT-POS-013`;
- cambia la ruta canónica;
- desarrolla `SHELL-CON-023`.

---

#### 36. Continuidad

##### ÚLTIMA TAREA APROBADA

SHELL-CON-021 — Crear contrato canónico de línea de venta

##### TAREA ACTUAL APROBADA

SHELL-CON-022 — Crear contrato de mapeo de identificadores externos

##### SIGUIENTE TAREA RESERVADA

SHELL-CON-023 — Crear contrato de idempotencia y conciliación


### ✅ SHELL-CON-023 — Crear contrato de idempotencia y conciliación

**Estado:** APROBADA
**Tarea anterior:** SHELL-CON-022 — Crear contrato de mapeo de identificadores externos
**Tarea siguiente:** SHELL-CON-024 — Crear contrato de cuarentena, rechazo y compensación
**Tipo de tarea:** Documental; definición normativa documental del contrato compartido de idempotencia y conciliación para fronteras de integración, preservando los alcances, identidades, huellas, resultados recuperables, claims, incertidumbre, fuentes autoritativas, residuales y cierres ya aprobados en BLOQUE X, sin crear una clave global, una transacción distribuida, una política de retry paralela, código, persistencia, migraciones ni cambios en Supabase
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/01_CONTRATOS_DE_INTEGRACIONES_EXTERNAS.md`
**Superficie lógica objetivo:** `@vento/contracts/integrations`
**Estado físico resultante:** `CONTRATO_COMPARTIDO_DE_IDEMPOTENCIA_Y_CONCILIACION_DEFINIDO_NO_MATERIALIZADO`
**Implementación física autorizada:** ninguna
**Cambios de código, DDL, DML, migraciones, RLS, RPC, Storage, Edge Functions, endpoints, colas, workers, secretos, credenciales, proveedores, datos, configuración remota o despliegues:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-CON-023` centraliza en la fundación compartida de Vento OS la forma estática y consumible con la que una frontera de integración puede declarar:

- qué alcance idempotente protege;
- cuál es la identidad estable de la operación dentro de ese alcance;
- qué huella lógica permite distinguir duplicado compatible de reutilización conflictiva;
- qué resultado durable debe recuperarse ante retry, redelivery o replay;
- cuándo una operación permanece en curso, rechazada, stale, fuera de orden o pendiente de conciliación;
- qué fuentes y evidencias deben compararse cuando el resultado no puede determinarse de forma segura;
- qué decisión, residual y siguiente acción permiten cerrar una conciliación sin reescribir historia ni transferir autoridad entre dominios.

La regla central es:

```text
ALCANCE IDEMPOTENTE EXACTO
+
IDENTIDAD ESTABLE ANTES DEL PRIMER EFECTO
+
HUELLA LÓGICA VERSIONADA
+
RESULTADO DURABLE
=
REPETICIÓN SEGURA SIN SEGUNDO EFECTO
```

Y, cuando el resultado no sea determinable:

```text
RESULTADO INCIERTO O DIVERGENCIA
+
FUENTES AUTORITATIVAS
+
EVIDENCIA Y CORRELACIÓN
+
PROPIETARIA DE CADA EFECTO
=
CONCILIACIÓN TRAZABLE SIN REPETICIÓN CIEGA
```

La tarea no crea una clave universal de integración, no fusiona los alcances idempotentes existentes y no convierte conciliación en permiso para modificar otra fuente de verdad.

---

#### 2. Resultado canónico

Quedan definidos dentro de `@vento/contracts/integrations` los siguientes artefactos lógicos compartidos:

1. `IntegrationIdempotencyScope`, vocabulario compartido de los siete alcances idempotentes aprobados;
2. `IntegrationIdempotencyRef`, referencia estable a la identidad idempotente de una operación dentro de su alcance;
3. `IntegrationIdempotencyRecord`, representación estática de identidad, huella, claim, outcome y resultado recuperable;
4. `IntegrationIdempotencyOutcome`, vocabulario compartido de los ocho resultados idempotentes ya aprobados;
5. `ExternalIntegrationClaimState`, vocabulario específico de los siete estados de claim de una operación externa;
6. `IntegrationReconciliationRef`, identidad estable, opaca y no secreta de un caso de conciliación;
7. `IntegrationReconciliationCase`, representación compartida de fuentes comparadas, evidencia, diferencias, decisión, residuales y cierre;
8. `IntegrationReconciliationClosureOutcome`, vocabulario compartido de los ocho cierres aprobados para conciliación externa.

La superficie permite tipar conceptualmente referencias ya reservadas por contratos anteriores, en particular:

```text
ExternalReceivedEvent.idempotency_ref
→ IntegrationIdempotencyRef | null
```

sin modificar físicamente `ExternalReceivedEvent` durante esta tarea.

Los artefactos son contratos lógicos. Esta tarea no crea TypeScript, schemas ejecutables, tablas, índices, constraints, RPC, workers, colas, registros operativos ni datos.

---

#### 3. Fuentes y precedencia

`SHELL-CON-023` consume y conserva sin redefinir:

| Fuente                                    | Uso vinculante                                                                                      |
| ----------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `SHELL-CON-001`                           | `@vento/contracts` como autoridad estática, versionada y sin runtime, red, secretos ni persistencia |
| `SHELL-CON-017`                           | separación entre principal técnico, actor humano, permiso, credencial y autoridad empresarial       |
| `SHELL-CON-019`                           | `ExternalReceivedEvent`, `idempotency_ref`, receipts, correlación y evidencia fuente                |
| `SHELL-CON-020`                           | identidad de venta estable y separada de idempotency key, event ID, receipt y correlación           |
| `SHELL-CON-021`                           | identidad de línea estable frente a retry, replay, mapping y sincronización tardía                  |
| `SHELL-CON-022`                           | mapping externo/canónico separado de idempotencia, autenticidad y autorización                      |
| `INT-APP-004`                             | `ENTERPRISE-EVENT-IDEMPOTENCY-REGISTRY-001`, siete alcances y garantías end-to-end                  |
| `INT-APP-005`                             | política transversal de retry, clasificación, presupuesto y tratamiento de resultado desconocido    |
| `INT-APP-007`                             | auditoría transversal y reconstrucción de intentos, resultados y efectos                            |
| `INT-APP-008`                             | estados pendientes, `RESULT_UNKNOWN` y `RECONCILIATION_REQUIRED`                                    |
| `INT-APP-009`                             | partialidad, residuales y tratamiento seguro de resultados mixtos                                   |
| `INT-APP-010`                             | ownership, comandos propietarios y prohibición de escrituras cruzadas                               |
| `INT-EXT-012`                             | idempotencia externa, namespace, operation key, huella, claim durable y `OUTCOME_UNKNOWN`           |
| `INT-EXT-017`                             | conciliación externa, fuentes autoritativas, evidencia, residuales y cierres                        |
| `INT-POS-013`                             | especialización por sistema, venta y línea externa, sin identidades heurísticas                     |
| `INT-POS-020`                             | conciliación de ventas y efectos durante la transición del POS externo                              |
| `INT-SALES-007`                           | control permanente contra efectos duplicados por retry y recuperación selectiva                     |
| `INT-SALES-008`                           | conciliación de convivencia entre fuente externa y PULSO                                            |
| `INT-DB-005`                              | destino físico posterior de restricciones e índices de idempotencia                                 |
| `INT-DB-008`                              | destino físico posterior de mecanismos de conciliación por integración                              |
| Registro Canónico de Requisitos de Prueba | cobertura vigente de idempotencia, retry, incertidumbre, conciliación, ownership y recuperación     |

Precedencia aplicable:

```text
CONTRATOS PROPIETARIOS Y TRANSVERSALES DE BLOQUE X
→ semántica normativa de identidad, retry, resultado y conciliación

SHELL-CON-023
→ forma compartida consumible de esa semántica

INT-DB-005 / INT-DB-008
→ materialización física posterior bajo implementación autorizada
```

Una implementación local, un hash existente, una restricción aislada o un `upsert` no redefine este contrato.

---

#### 4. Frontera exacta de la tarea

La tarea incluye únicamente:

- los siete alcances idempotentes compartidos;
- la forma lógica de una referencia idempotente;
- la forma lógica de un registro idempotente;
- el uso de una huella lógica versionada;
- la separación entre identidad, huella, intento, delivery, claim, resultado y correlación;
- los ocho outcomes idempotentes ya aprobados;
- los siete estados de claim externos ya aprobados;
- la regla de un solo ganador empresarial bajo concurrencia;
- recuperación de resultado previo sin repetir efecto;
- conflicto determinista por reutilización incompatible;
- tratamiento explícito de `OUTCOME_UNKNOWN` y `RESULT_UNKNOWN`;
- forma lógica de referencia y caso de conciliación;
- comparación de fuentes autoritativas sin reescritura histórica;
- los ocho outcomes de cierre de conciliación ya aprobados;
- adopción explícita de las veintiuna identidades `EXT-SYS-001` a `EXT-SYS-021`;
- handoffs exactos hacia persistencia, conciliación física y tratamiento posterior.

La tarea no incluye:

- una política nueva de retry o backoff;
- un nuevo catálogo de errores;
- cuarentena o dead-letter;
- rechazo compartido como disposición operativa;
- ejecución de compensaciones;
- un rollback global;
- una transacción ACID entre aplicaciones;
- elección de tablas, índices, constraints, locks o RPC;
- retención física;
- implementación de outbox o inbox;
- materialización de claims;
- dashboards o alertas;
- cambios en Supabase;
- desarrollo de `SHELL-CON-024`.

---

#### 5. Principio de identidad por alcance

La idempotencia compartida protege equivalencias diferentes y, por tanto, conserva identidades distintas.

```text
REQUEST_ACCEPTANCE
≠ OWNER_COMMAND
≠ EVENT_EMISSION
≠ CONSUMER_INBOX
≠ CONSUMER_EFFECT
≠ EXTERNAL_RECEIPT
≠ REPLAY_BATCH
```

Una clave demasiado amplia puede suprimir efectos legítimos. Una clave demasiado estrecha puede permitir duplicados. Por ello:

1. el alcance debe conocerse antes del primer efecto protegido;
2. la propietaria del alcance conserva autoridad sobre el resultado;
3. un identificador de un alcance no se reutiliza como identidad universal de otro;
4. correlación entre alcances no equivale a identidad;
5. una venta, línea, mapping, receipt o event ID no se convierte por sí solo en clave universal;
6. cambiar materialmente la intención crea otra operación, no otro intento;
7. retry, redelivery y replay compatibles conservan la identidad del alcance original.

---

#### 6. `IntegrationIdempotencyScope`

El vocabulario compartido conserva exactamente los siete alcances aprobados:

| Alcance              | Identidad mínima de referencia                                     | Protege                                           |
| -------------------- | ------------------------------------------------------------------ | ------------------------------------------------- |
| `REQUEST_ACCEPTANCE` | `request_id` o `client_event_id`                                   | la misma solicitud lógica                         |
| `OWNER_COMMAND`      | `source_command_id`                                                | la misma mutación solicitada a la propietaria     |
| `EVENT_EMISSION`     | `event_id`                                                         | la misma emisión empresarial                      |
| `CONSUMER_INBOX`     | `consumer_application + event_id`                                  | la misma recepción por una consumidora            |
| `CONSUMER_EFFECT`    | `consumer_application + event_id + effect_code`                    | el mismo efecto derivado dentro de la consumidora |
| `EXTERNAL_RECEIPT`   | `source_system + external_event_id` dentro del namespace aplicable | la misma afirmación externa autenticada           |
| `REPLAY_BATCH`       | `replay_request_id`                                                | la misma instrucción controlada de replay         |

Reglas:

1. el cuadro define semántica, no formato físico de serialización;
2. la identidad mínima puede requerir namespace, ambiente o instancia adicional cuando el contrato propietario lo exija;
3. el alcance no concede autorización empresarial;
4. `CONSUMER_INBOX` no confirma `CONSUMER_EFFECT`;
5. `EVENT_EMISSION` no confirma delivery ni consumo;
6. `EXTERNAL_RECEIPT` no confirma un efecto interno;
7. `REPLAY_BATCH` no autoriza efectos sensibles por el solo hecho de existir.

---

#### 7. `IntegrationIdempotencyRef`

`IntegrationIdempotencyRef` identifica de forma estable una operación protegida dentro de un alcance concreto.

Forma lógica mínima:

```text
IntegrationIdempotencyRef = {
  scope
  scope_owner_ref
  namespace_ref
  operation_key
  generation
  contract_version
}
```

Invariantes:

1. `operation_key` es estable dentro del alcance y se fija antes del primer efecto;
2. `operation_key` no es secreto;
3. `operation_key` no cambia por retry, redelivery, reinicio, worker, dispositivo, deployment o transporte;
4. `generation` distingue una repetición intencional legítima cuando el contrato propietario permita una nueva intención;
5. una nueva generación no se crea para ocultar un conflicto o un resultado incierto;
6. `namespace_ref` delimita la identidad donde la misma cadena pueda repetirse legítimamente en otro sistema, ambiente, superficie o contrato;
7. `scope_owner_ref` identifica la frontera propietaria del resultado y no concede autoridad fuera de ella;
8. esta tarea no fija UUID, prefijo, slug, secuencia ni longitud física de `operation_key`.

---

#### 8. Namespace de operaciones externas

Para operaciones externas, el namespace mínimo conserva la decisión de `INT-EXT-012`:

```text
external_system_id
+
environment
+
surface
+
operation_kind
```

y añade `external_instance_id` cuando sea necesario para evitar colisiones entre tenants, cuentas, empresas, ambientes lógicos o espacios de numeración distintos.

Reglas:

1. el mismo valor recibido desde dos sistemas externos no implica la misma operación;
2. `DEVELOPMENT`, `STAGING` y `PRODUCTION` no comparten deduplicación por conveniencia;
3. checkout y webhook no comparten namespace únicamente porque puedan correlacionarse;
4. dos clases de operación distintas no comparten clave por defecto;
5. `external_system_id` no sustituye `operation_key`;
6. `ExternalIdentifierMappingId` no sustituye `operation_key`;
7. `IntegrationPrincipalId` no sustituye `operation_key`;
8. una credencial o secreto nunca se usa como identidad idempotente.

---

#### 9. Reglas de `operation_key`

Una clave idempotente válida podrá provenir de una identidad ya aprobada por el contrato propietario, por ejemplo:

- una operación VENTO asignada antes del primer envío;
- un `source_command_id`;
- un `event_id`;
- un identificador externo autenticado y estable cuando su semántica permita usarlo en el alcance correspondiente;
- una identidad de transacción del proveedor cuando el contrato demuestre su estabilidad y alcance;
- una composición determinista versionada solo cuando la fuente defina suficientes campos estables, inequívocos y no ambiguos.

No constituyen por sí solos una clave idempotente válida:

- timestamp de recepción;
- UUID generado después de recibir una entrada no identificada;
- nombre de archivo;
- posición de fila;
- `source_row_number`;
- correo;
- teléfono;
- `site_id` aislado;
- nombre de producto;
- monto;
- coordenadas;
- IP;
- retry count;
- `attempt_id`;
- `delivery_id`;
- `trace_id`;
- mapping ID;
- valor secreto.

---

#### 10. Huella lógica versionada

La identidad responde qué operación se está comparando. La huella responde si el contenido material de esa operación sigue siendo compatible.

`IntegrationIdempotencyRecord` conserva:

- `logical_content_hash`;
- `logical_content_hash_version`.

Reglas:

1. misma referencia idempotente + misma huella compatible recupera el resultado anterior o un estado recuperable;
2. misma referencia idempotente + huella material incompatible produce conflicto determinista;
3. el segundo contenido incompatible no se aplica parcialmente;
4. la huella usa únicamente campos materiales del contrato propietario;
5. la huella excluye retry count, tiempos de entrega, trace, connection metadata y otros datos técnicos volátiles;
6. la huella no incluye secretos ni material de credencial;
7. cambiar la canonicalización exige versión identificable;
8. una nueva versión de adapter o parser no reinterpreta silenciosamente huellas históricas;
9. el algoritmo físico de digest queda para materialización autorizada, pero deberá ser identificable y compatible con el contrato de seguridad aplicable.

---

#### 11. `IntegrationIdempotencyRecord`

La forma lógica compartida es:

```text
IntegrationIdempotencyRecord = {
  idempotency_ref

  logical_content_hash
  logical_content_hash_version

  resource_ref
  claim_state
  outcome
  result_ref

  external_system_id
  external_instance_id
  integration_principal_id
  environment
  surface
  operation_kind
  provider_ref

  first_observed_at
  last_observed_at
  attempt_count
  finalized_at

  correlation_refs[]
  audit_ref
  reconciliation_ref
}
```

La forma es conceptual y sus campos son condicionales según el alcance.

Reglas:

1. los campos externos no se exigen a una operación puramente interna;
2. `claim_state` solo se usa cuando exista semántica de claim aplicable;
3. `resource_ref` correlaciona el recurso sin convertirse en la identidad de todos sus efectos;
4. `result_ref` apunta al resultado durable propietario y no a un ACK técnico salvo que el contrato propietario lo defina como resultado final;
5. `attempt_count` describe intentos y no cambia la identidad;
6. `correlation_refs[]` enlaza hechos distintos sin fusionarlos;
7. `audit_ref` conserva trazabilidad sin convertir auditoría en fuente del estado empresarial;
8. `reconciliation_ref` solo existe cuando la operación requiere un caso de conciliación asociado;
9. el registro no contiene payload completo, secreto, token o credencial.

---

#### 12. Claim durable y un solo ganador

Cuando un alcance requiera proteger un efecto mediante reclamación durable, el comportamiento lógico es:

```text
RESOLVER ALCANCE Y NAMESPACE
→ FIJAR operation_key
→ CALCULAR HUELLA VERSIONADA
→ RECLAMAR LA MISMA IDENTIDAD DE FORMA ATÓMICA O EQUIVALENTE
    ├── NUEVA + COMPATIBLE → UN GANADOR PUEDE CONTINUAR
    ├── EXISTENTE + MISMA HUELLA → RECUPERAR ESTADO / RESULTADO
    └── EXISTENTE + HUELLA DISTINTA → CONFLICTO
→ PERSISTIR RESULTADO O INCERTIDUMBRE
```

Invariantes:

1. dos ejecuciones concurrentes de la misma identidad producen un solo ganador empresarial;
2. un `SELECT` previo seguido de efecto y registro posterior sin protección equivalente no satisface el contrato;
3. un lock en memoria de una sola instancia no satisface la garantía distribuida;
4. un `upsert` sin validación semántica de identidad y huella no satisface el contrato;
5. el efecto no puede quedar confirmado sin un resultado o referencia recuperable suficiente;
6. un lease vencido no demuestra ausencia de commit;
7. adquirir un nuevo lease no habilita repetir un efecto incierto;
8. la primitiva transversal de restricción e índice pertenece a `INT-DB-005`; cualquier efecto empresarial conserva la tarea propietaria ya declarada por el contrato consumidor y no se ejecuta desde `SHELL-CON-023`.

---

#### 13. `ExternalIntegrationClaimState`

Para operaciones externas que usen claim, se conserva exactamente el vocabulario de `INT-EXT-012`:

| Estado             | Significado contractual                                                                                                  |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------ |
| `CLAIMED`          | la identidad fue reclamada y existe procesamiento vigente o recuperable                                                  |
| `SUCCEEDED`        | el efecto o resultado propietario quedó confirmado y es recuperable                                                      |
| `FAILED_RETRYABLE` | la ausencia de efecto o condición transitoria permite retry bajo la política vigente                                     |
| `FAILED_FINAL`     | el contrato demuestra cierre final sin retry automático de la misma operación                                            |
| `OUTCOME_UNKNOWN`  | no puede determinarse si el efecto ocurrió; exige consulta o conciliación antes de repetir                               |
| `CANCELLED`        | la operación fue cancelada conforme a su contrato sin reinterpretar historia                                             |
| `EXPIRED`          | la operación alcanzó una condición de expiración contractual; no demuestra por sí sola que un efecto incierto no ocurrió |

`ExternalIntegrationClaimState` no sustituye los estados de `ENTERPRISE-SYNC-PENDING-STATE-MACHINE-001`.

En particular:

```text
OUTCOME_UNKNOWN
≠ RESULT_UNKNOWN
```

Ambos representan incertidumbre en capas diferentes y pueden conducir a conciliación, pero no son aliases intercambiables.

---

#### 14. `IntegrationIdempotencyOutcome`

Se conservan exactamente los ocho outcomes usados por la especialización de ventas y el registro transversal:

| Outcome                     | Regla compartida                                                                                        |
| --------------------------- | ------------------------------------------------------------------------------------------------------- |
| `APPLIED`                   | primera aplicación válida dentro del alcance; existe resultado durable                                  |
| `DUPLICATE_RESULT_RETURNED` | misma identidad y huella compatible; se recupera el resultado previo sin nueva mutación                 |
| `CONFLICTING_REUSE`         | misma identidad con contenido material incompatible; no se aplica el segundo contenido                  |
| `IN_PROGRESS_RECOVERABLE`   | otra ejecución conserva la reclamación y el resultado deberá recuperarse                                |
| `STALE_VERSION`             | una versión anterior no puede hacer retroceder una versión ya confirmada                                |
| `OUT_OF_ORDER_DEFERRED`     | falta una dependencia o secuencia previa y la aplicación se difiere explícitamente                      |
| `RECONCILIATION_REQUIRED`   | no existe evidencia suficiente para decidir aplicación, duplicado, ausencia o conflicto de forma segura |
| `REJECTED`                  | el contrato, autenticidad, contexto, autorización o contenido no permiten aceptar la operación          |

Reglas:

1. un outcome no sustituye el estado empresarial del recurso;
2. `DUPLICATE_RESULT_RETURNED` significa cero nueva mutación;
3. `RECONCILIATION_REQUIRED` no autoriza retry;
4. `REJECTED` no se usa para ocultar partialidad o efecto desconocido;
5. `STALE_VERSION` no reescribe la versión vigente;
6. `OUT_OF_ORDER_DEFERRED` conserva la identidad original hasta que exista el prerequisito verificable.

---

#### 15. Duplicado, retry, redelivery, replay y repetición intencional

Los conceptos permanecen separados:

| Caso                               | Identidad                                                  | Huella                              | Regla                                                      |
| ---------------------------------- | ---------------------------------------------------------- | ----------------------------------- | ---------------------------------------------------------- |
| duplicado / redelivery             | conserva la misma                                          | compatible                          | recuperar resultado o estado previo                        |
| retry                              | conserva la misma                                          | compatible                          | nuevo intento técnico, mismo efecto lógico                 |
| replay del mismo hecho histórico   | conserva identidad histórica                               | compatible con el hecho reproducido | no crea efecto sensible salvo autorización explícita       |
| repetición empresarial intencional | nueva operación o generación cuando el contrato la permita | corresponde a la nueva intención    | se vincula al original cuando sea material                 |
| corrección / compensación          | identidad propia                                           | describe su propio hecho            | referencia explícitamente el original y conserva ownership |

Queda prohibido usar una nueva clave para transformar un retry en una operación nueva sin decisión empresarial real.

---

#### 16. Resultado desconocido y recuperación segura

La ausencia de respuesta no demuestra ausencia de efecto.

Para un `OUTCOME_UNKNOWN` externo o un `RESULT_UNKNOWN` de la máquina transversal:

```text
RESULTADO INCIERTO
→ CONSULTAR IDENTIDAD ORIGINAL
→ COMPARAR RESULTADO PROPIETARIO / RECEIPT / PROVEEDOR / LEDGER / FUENTE AUTORITATIVA
    ├── EFECTO CONFIRMADO → RECUPERAR RESULTADO
    ├── AUSENCIA DE EFECTO DEMOSTRADA + RETRY ELEGIBLE → RETRY MISMA IDENTIDAD
    └── NO DETERMINABLE → RECONCILIATION_REQUIRED
```

Reglas:

1. timeout no equivale a fallo confirmado;
2. agotar presupuesto de retry no equivale a éxito ni fracaso;
3. reiniciar worker o aplicación no limpia la incertidumbre;
4. cambiar de tabla, RPC, proveedor, aplicación o endpoint no crea una vía alternativa para conseguir éxito con otra identidad;
5. una operación incierta conserva propietaria, evidencia, residual y siguiente acción;
6. la recuperación se dirige al alcance pendiente; no reabre efectos ya confirmados.

---

#### 17. Recuperación selectiva y ausencia de commit global

La integración puede producir resultados independientes en varias propietarias.

Ejemplo conceptual:

```text
VENTA / COMANDO      → CONFIRMADO
EVENTO               → CONFIRMADO
CONSUMIDORA A        → CONFIRMADA
CONSUMIDORA B        → RESULT_UNKNOWN
CONSUMIDORA C        → NO_APLICA
```

La recuperación correcta investiga o recupera la unidad de `CONSUMIDORA B`.

No existe en este contrato:

```text
TODAS LAS PROPIETARIAS
→ UNA ÚNICA TRANSACCIÓN ACID GLOBAL
```

La consistencia transversal se obtiene mediante:

- commit durable en cada propietaria;
- identidad por alcance;
- resultado recuperable;
- retry seguro;
- compensación no destructiva cuando corresponda;
- conciliación basada en evidencia.

Un resultado mixto permanece explícito y no se presenta como éxito total.

---

#### 18. `IntegrationReconciliationRef`

`IntegrationReconciliationRef` identifica un caso concreto de conciliación.

Reglas:

1. es estable, opaca y no secreta;
2. no es la idempotency key;
3. no es `event_id`, `receipt_id`, `mapping_id`, `sale_id` ni `effect_id`;
4. puede correlacionar varias fuentes y efectos sin fusionar sus identidades;
5. una nueva revisión de evidencia conserva el mismo caso cuando investiga la misma divergencia, salvo que el contrato propietario establezca un caso sucesor;
6. un caso sucesor referencia el anterior y no borra decisiones ya tomadas;
7. esta tarea no fija formato físico del identificador.

---

#### 19. `IntegrationReconciliationCase`

La forma lógica compartida es:

```text
IntegrationReconciliationCase = {
  reconciliation_ref
  idempotency_ref
  owner_ref

  operation_ref
  event_ref
  receipt_ref
  mapping_refs[]
  correlation_refs[]

  compared_source_refs[]
  evidence_refs[]
  attempt_refs[]
  observed_difference_refs[]

  owner_outcome_ref
  external_claim_state

  decision_ref
  closure_outcome
  residual_obligations[]
  next_action_ref
  responsible_owner_ref
  reactivation_condition_ref

  opened_at
  updated_at
  closed_at
}
```

La forma es conceptual.

Reglas:

1. `idempotency_ref` puede ser nulo cuando la divergencia no pertenezca a una operación idempotente concreta;
2. `owner_outcome_ref` conserva el vocabulario de la propietaria y no crea un outcome global nuevo;
3. `external_claim_state` solo aplica a operaciones externas con claim;
4. `compared_source_refs[]` referencia fuentes autoritativas o evidencia suficiente y no copias editables competidoras;
5. `observed_difference_refs[]` describe divergencias sin permitir last-write-wins;
6. `residual_obligations[]` nunca se omite para aparentar cierre limpio;
7. `responsible_owner_ref` identifica quién debe resolver el residual sin transferir autoridad a la capa de conciliación;
8. `closed_at` solo existe cuando existe un cierre contractual suficiente;
9. la forma no contiene payload sensible completo, secretos o credenciales.

---

#### 20. Fuentes autoritativas y evidencia de conciliación

La conciliación consulta las fuentes propietarias de cada hecho; no las sustituye.

Puede comparar, según aplicabilidad:

- resultado durable de una aplicación propietaria;
- receipt externo acreditado;
- estado consultable del proveedor;
- ledger físico, económico o de fidelización de su propietaria;
- evento y versión registrados;
- inbox y resultado de efecto de una consumidora;
- mapping acreditado;
- evidencia fuente protegida;
- auditoría correlacionada;
- resultado de una compensación confirmada.

Reglas:

1. un log aislado no sustituye el resultado propietario;
2. una métrica no sustituye un ledger;
3. un ACK de transporte no sustituye un efecto empresarial;
4. una fila de proyección no se usa como autoridad si existe una fuente propietaria distinta;
5. similitud de monto, fecha, nombre, producto, terminal o timestamp no demuestra identidad;
6. nueva evidencia no reescribe la evidencia usada por una revisión anterior;
7. una diferencia confirmada se conserva hasta una resolución o residual explícito.

---

#### 21. Procedimiento lógico de conciliación

Un caso de conciliación sigue este orden conceptual:

```text
IDENTIFICAR LA UNIDAD Y SU PROPIETARIA
→ FIJAR LAS IDENTIDADES Y VERSIONES RELEVANTES
→ REUNIR FUENTES AUTORITATIVAS Y EVIDENCIA
→ COMPARAR RESULTADOS SIN REESCRIBIR HISTORIA
→ CLASIFICAR DIFERENCIAS / INCERTIDUMBRE
→ DECIDIR ACCIÓN SEGURA DENTRO DE LA PROPIETARIA
→ RECUPERAR, REINTENTAR, RECHAZAR, CORREGIR, COMPENSAR O CONSERVAR RESIDUAL SEGÚN CONTRATO
→ VERIFICAR RESULTADO
→ CERRAR SOLO CON OUTCOME DE CIERRE PERMITIDO
```

Reglas:

1. la conciliación no ejecuta directamente una mutación en otra propietaria;
2. un retry solo se habilita cuando el contrato demuestra que es seguro;
3. una corrección o compensación se solicita o ejecuta en la propietaria correspondiente;
4. los efectos ya confirmados no se reaplican;
5. un caso puede permanecer abierto con residual y siguiente acción;
6. refrescar una interfaz no cambia el resultado;
7. el paso del tiempo no cierra un resultado desconocido;
8. no se inventan entradas retrospectivas para completar una historia faltante.

---

#### 22. `IntegrationReconciliationClosureOutcome`

Se conservan exactamente los ocho cierres aprobados por la conciliación externa:

| Outcome                           | Significado compartido                                                                                    |
| --------------------------------- | --------------------------------------------------------------------------------------------------------- |
| `RESOLVED_CONFIRMED`              | la fuente autoritativa confirma el efecto o resultado esperado                                            |
| `RESOLVED_NO_EFFECT`              | existe evidencia suficiente de que el efecto no ocurrió y la unidad queda cerrada sin fabricarlo          |
| `RESOLVED_DUPLICATE_PRIOR_RESULT` | la aparente divergencia era repetición de una operación ya confirmada y se conserva el resultado anterior |
| `RESOLVED_CORRECTED`              | la propietaria confirmó una corrección trazable sin editar destructivamente el original                   |
| `RESOLVED_COMPENSATED`            | la propietaria confirmó una compensación enlazada al efecto original                                      |
| `RESOLVED_WITH_ACCEPTED_RESIDUAL` | el residual queda explícitamente aceptado con propietaria, autoridad y evidencia suficientes              |
| `PERMANENTLY_REJECTED`            | la unidad queda rechazada de forma definitiva con evidencia de que no debe aplicarse el efecto pretendido |
| `SUPERSEDED_BY_SUCCESSOR`         | una operación o caso sucesor válido asume la continuidad sin reinterpretar el historial previo            |

Reglas:

1. no existe outcome de cierre `UNKNOWN`;
2. `OUTCOME_UNKNOWN` y `RESULT_UNKNOWN` no pueden cerrar por sí solos un caso;
3. `PERMANENTLY_REJECTED` no se usa cuando existe un efecto parcial o incierto sin resolver;
4. `RESOLVED_CORRECTED` no autoriza edición destructiva del hecho original;
5. `RESOLVED_COMPENSATED` exige referencia a la compensación confirmada;
6. `RESOLVED_WITH_ACCEPTED_RESIDUAL` exige residual, responsable y autoridad explícitos;
7. `SUPERSEDED_BY_SUCCESSOR` exige referencia al sucesor;
8. ningún cierre se obtiene únicamente por edad, número de retries o ausencia de nuevas alertas.

---

#### 23. Separación entre mapping, idempotencia, correlación y conciliación

Se conserva la siguiente separación:

```text
MAPPING
→ qué recurso representa o con qué recurso se relaciona una referencia
```

```text
IDEMPOTENCIA
→ si esta operación ya fue reclamada y qué resultado debe recuperarse
```

```text
CORRELACIÓN
→ qué hechos distintos pertenecen al mismo contexto causal o investigativo
```

```text
CONCILIACIÓN
→ cómo se comparan fuentes y se resuelve una divergencia o incertidumbre sin repetir efectos ni reescribir historia
```

Consecuencias:

1. `ExternalIdentifierMappingId` no es idempotency key;
2. `correlation_id` no es idempotency key por definición universal;
3. una operación puede ser idempotente aunque no identifique un recurso empresarial;
4. un mapping `RESOLVED` no demuestra que una operación sea nueva;
5. una correlación no demuestra equivalencia de objetos;
6. una conciliación puede comparar varias operaciones sin fusionarlas;
7. la resolución de mapping no autoriza retry ni efecto;
8. el resultado idempotente no concede autorización empresarial.

---

#### 24. Relación con `ExternalReceivedEvent`

`SHELL-CON-019` conserva recepción, procedencia, autenticidad y evidencia antes del hecho empresarial.

La relación conceptual queda:

```text
ExternalReceivedEvent
→ idempotency_ref: IntegrationIdempotencyRef | null
→ mapping_refs[]
→ correlation_refs[]
→ owner_contract_ref
```

Reglas:

1. un evento externo puede existir sin una clave idempotente empresarial si el contrato solo permite conservar evidencia;
2. una recepción durable no se presenta como efecto confirmado;
3. `external_event_id` solo participa como clave cuando su estabilidad y namespace están acreditados;
4. una redelivery conserva la referencia idempotente aplicable;
5. un evento con resultado incierto puede enlazar un `IntegrationReconciliationRef` sin cambiar su receipt o identidad externa;
6. autenticidad, mapping e idempotencia permanecen controles independientes.

---

#### 25. Relación con venta, línea y efectos downstream

`CanonicalSaleId` y `CanonicalSaleLineId` no son claves universales de todos los efectos.

Para ventas externas o PULSO se conserva:

```text
VENTA
≠ EVENTO
≠ INBOX
≠ EFECTO NEXO
≠ EFECTO NUMERA
≠ EFECTO PASS
```

Reglas:

1. una misma venta puede producir varios eventos legítimos;
2. cada consumidora conserva inbox independiente;
3. cada efecto conserva su propia identidad por `effect_code` u otra semántica propietaria aprobada;
4. una línea puede conservarse con mapping pendiente sin fabricar un efecto;
5. el éxito NEXO no demuestra éxito NUMERA o PASS;
6. el éxito NUMERA no demuestra éxito NEXO o PASS;
7. el éxito PASS no demuestra éxito NEXO o NUMERA;
8. la recuperación de un efecto pendiente no reemite una venta ni reabre efectos confirmados;
9. una compensación no es retry del efecto original;
10. la conciliación puede exponer un vector de resultados sin crear una máquina global nueva.

---

#### 26. Especialización del POS externo

`INT-POS-013` conserva tres planos de idempotencia:

```text
SOURCE_SYSTEM_SCOPE
EXTERNAL_SALE_SCOPE
EXTERNAL_SALE_LINE_SCOPE
```

Y mantiene:

```text
EXTERNAL_SALE_KEY
=
source_system
+ source_instance_ref cuando aplique
+ external_sale_id
```

```text
EXTERNAL_SALE_LINE_KEY
=
EXTERNAL_SALE_KEY
+ external_line_id
```

cuando la fuente acredite esos identificadores.

Reglas:

1. `source_row_number` no es identidad de línea;
2. file hash no es identidad de venta;
3. fecha, sede, total, producto o posición no forman una identidad heurística válida;
4. una identidad de recepción puede permitir reproceso seguro de evidencia sin convertirse en external sale ID;
5. `makos_excel` permanece como guardia técnica agregada y no demuestra idempotencia individual por venta o línea;
6. `INT-POS-020` conserva la conciliación propietaria de ventas y efectos;
7. `INT-SALES-007` y `INT-SALES-008` preservan las reglas permanentes después de la transición.

---

#### 27. Matriz de adopción de las veintiuna identidades externas

La matriz adopta las veintiuna identidades existentes por referencia y decide cómo se aplica el contrato compartido en el corte vigente. No crea bindings, operaciones ni datos.

| ID            | Sistema / plataforma                     | Clasificación `SHELL-CON-023`                        | Estado                   | Decisión / bloqueo                                                                                                                                                                                                            |
| ------------- | ---------------------------------------- | ---------------------------------------------------- | ------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `EXT-SYS-001` | Supabase                                 | `GOBERNADA_POR_CONTRATO_INTERNO`                     | `ESPECIFICADO`           | Las operaciones VENTO usan sus alcances propietarios; compartir Supabase no crea una clave o conciliación global de plataforma.                                                                                               |
| `EXT-SYS-002` | Wompi                                    | `APLICA_IDEMPOTENCIA_Y_CONCILIACION`                 | `ESPECIFICADO`           | Transacciones, webhooks y resultados inciertos conservan namespace, clave, huella, claim y consulta/conciliación antes de repetir un efecto.                                                                                  |
| `EXT-SYS-003` | RevenueCat                               | `APLICA_IDEMPOTENCIA_Y_CONCILIACION`                 | `ESPECIFICADO`           | La identidad acreditada se conserva; una huella determinista versionada solo puede suplir ausencia de ID nativo bajo el contrato ya aprobado, sin fusionar usuarios o productos.                                              |
| `EXT-SYS-004` | Resend                                   | `APLICA_IDEMPOTENCIA_Y_CONCILIACION`                 | `ESPECIFICADO`           | Retry conserva la misma operación; un reenvío empresarial intencional usa nueva generación. Un ACK no equivale a entrega empresarial confirmada.                                                                              |
| `EXT-SYS-005` | Expo / EAS Update                        | `PLATAFORMA_TECNICA_SIN_EFECTO_EMPRESARIAL_EN_CORTE` | `NO_APLICA`              | Las referencias de release/configuración no se convierten en un ledger idempotente empresarial por esta tarea.                                                                                                                |
| `EXT-SYS-006` | Expo Push Service                        | `APLICA_IDEMPOTENCIA_Y_CONCILIACION`                 | `ESPECIFICADO`           | La entrega lógica conserva identidad por anuncio/destino/generación según contrato; resultados por destino permanecen independientes.                                                                                         |
| `EXT-SYS-007` | Sentry                                   | `SIN_LEDGER_DE_EFECTO_EMPRESARIAL`                   | `NO_APLICA`              | La observabilidad best-effort no se convierte en idempotencia empresarial ni en fuente de conciliación de hechos propietarios.                                                                                                |
| `EXT-SYS-008` | Google Maps / Google Reviews             | `SIN_LEDGER_DE_EFECTO_EMPRESARIAL`                   | `NO_APLICA`              | La lectura interactiva no recibe un ledger idempotente empresarial mientras no exista un efecto durable que lo requiera.                                                                                                      |
| `EXT-SYS-009` | Apple Wallet / PassKit y APNs            | `APLICA_IDEMPOTENCIA_Y_CONCILIACION`                 | `ESPECIFICADO`           | Mutación de recurso y push son superficies distintas; un resultado físico/remoto incierto se consulta o concilia antes de repetir.                                                                                            |
| `EXT-SYS-010` | Vercel                                   | `PLATAFORMA_TECNICA_SIN_EFECTO_EMPRESARIAL_EN_CORTE` | `NO_APLICA`              | Project/deployment/domain permanecen referencias técnicas y no originan una clave empresarial global.                                                                                                                         |
| `EXT-SYS-011` | Zebra BrowserPrint                       | `APLICA_IDEMPOTENCIA_Y_CONCILIACION`                 | `ESPECIFICADO`           | Un resultado físico incierto requiere verificación o conciliación antes de una nueva impresión; una reimpresión deliberada es nueva generación, no retry.                                                                     |
| `EXT-SYS-012` | Google Wallet / Google Pay & Wallet      | `MODELO_SIN_BINDING_REMOTO`                          | `NO_APLICA`              | Existe modelo documental sin binding remoto acreditado; no se fabrican operación, claim, resultado ni conciliación runtime.                                                                                                   |
| `EXT-SYS-013` | POS externo vigente                      | `APLICA_CON_ESPECIALIZACION_POS`                     | `PENDIENTE_DE_EVIDENCIA` | `INT-POS-013`, `INT-POS-020`, `INT-SALES-007` e `INT-SALES-008` gobiernan la especialización. `makos_excel` no acredita identidad individual de venta/línea; no se fabrican claves individuales mientras falte esa evidencia. |
| `EXT-SYS-014` | Shopify / comercio electrónico           | `NO_APLICA_SIN_BINDING`                              | `NO_APLICA`              | No existe binding acreditado que permita instanciar una operación idempotente concreta en el corte vigente.                                                                                                                   |
| `EXT-SYS-015` | Rappi / marketplace                      | `NO_APLICA_SIN_BINDING`                              | `NO_APLICA`              | No existe binding acreditado; no se inventan order/store/courier IDs, operaciones o conciliaciones.                                                                                                                           |
| `EXT-SYS-016` | ManyChat / automatización conversacional | `NO_APLICA_SIN_BINDING`                              | `NO_APLICA`              | No existe bot/API acreditado; no se inventan operaciones, subscriber IDs o resultados.                                                                                                                                        |
| `EXT-SYS-017` | WhatsApp                                 | `NO_APLICA_SIN_BINDING`                              | `NO_APLICA`              | No existe proveedor/API/binding acreditado; número o conversación no crean una operación canónica por inferencia.                                                                                                             |
| `EXT-SYS-018` | Instagram / social                       | `NO_APLICA_SIN_BINDING`                              | `NO_APLICA`              | No existe API/binding acreditado; no se inventan message IDs, claims o reconciliaciones.                                                                                                                                      |
| `EXT-SYS-019` | Correo corporativo y alias funcionales   | `NO_APLICA_SIN_BINDING`                              | `NO_APLICA`              | La existencia de correo o alias no acredita integración técnica ni operación idempotente.                                                                                                                                     |
| `EXT-SYS-020` | Telefonía / voz                          | `BLOQUEADO_SIN_BINDING`                              | `BLOQUEADO`              | `TI-INT-003` debe acreditar operador, cuenta, interfaz, identificadores y semántica antes de instanciar este contrato.                                                                                                        |
| `EXT-SYS-021` | Transporte externo                       | `NO_APLICA_SIN_BINDING`                              | `NO_APLICA`              | Sin proveedor e interfaz acreditados no se fabrican tracking, operación o reconciliación.                                                                                                                                     |

Reconciliación de la matriz:

```text
GOBERNADA_POR_CONTRATO_INTERNO = 1
APLICA_IDEMPOTENCIA_Y_CONCILIACION = 6
SIN_LEDGER_DE_EFECTO_EMPRESARIAL = 2
PLATAFORMA_TECNICA_SIN_EFECTO_EMPRESARIAL_EN_CORTE = 2
MODELO_SIN_BINDING_REMOTO = 1
APLICA_CON_ESPECIALIZACION_POS = 1
NO_APLICA_SIN_BINDING = 7
BLOQUEADO_SIN_BINDING = 1
TOTAL = 21
FALTANTES = 0
DUPLICADOS = 0
IDENTIFICADORES_UNICOS = 21
```

`EXT-SYS-013` consume las decisiones posteriores aprobadas del mini-bloque `INT-POS` y no restaura como diagnóstico vigente único una clasificación histórica anterior a esas tareas.

---

#### 28. Seguridad, autorización y minimización

Idempotencia y conciliación no son mecanismos de autorización.

Reglas:

1. recuperar un resultado previo exige respetar visibilidad, sensibilidad y autorización actuales sin repetir el efecto;
2. una clave idempotente no se expone como secreto ni se usa como permiso;
3. `IntegrationPrincipalId` atribuye identidad técnica y no concede autoridad empresarial;
4. una credencial válida no concede permiso para producir o conciliar un efecto;
5. `service_role` no es permiso ni principal empresarial;
6. payloads completos, tokens, firmas, passwords, API keys y material de credencial no se copian dentro del registro idempotente o del caso de conciliación;
7. referencias protegidas y hashes se usan cuando sean suficientes;
8. una conciliación no puede modificar directamente tablas, ledgers o estados de otra propietaria;
9. toda acción correctiva conserva actor o principal, autorización, causa y evidencia según su contrato propietario.

---

#### 29. Handoffs físicos y contractuales

| Trabajo posterior                                            | Estado desde esta tarea             | Propietario / tarea                                                | Condición de salida                                                                                                                       |
| ------------------------------------------------------------ | ----------------------------------- | ------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------- |
| restricciones e índices de idempotencia                      | `DEFINIDO_NO_MATERIALIZADO`         | `INT-DB-005`                                                       | la persistencia física garantiza unicidad por alcance, claim seguro, huella compatible, resultado durable y recuperación sin doble efecto |
| mecanismos de conciliación por integración                   | `DEFINIDO_NO_MATERIALIZADO`         | `INT-DB-008`                                                       | casos, fuentes, decisiones, residuales y cierres quedan persistidos y consultables sin reescribir fuentes propietarias                    |
| auditoría de procesamiento y reintentos                      | `DEFINIDO_NO_MATERIALIZADO`         | `INT-DB-007`                                                       | intentos, outcomes, referencias y acciones quedan reconstruibles en la frontera física aplicable                                          |
| tratamiento compartido de cuarentena, rechazo y compensación | `FUERA_DE_ALCANCE`                  | `SHELL-CON-024`                                                    | entradas incompatibles y efectos fallidos reciben disposición compartida sin fusionarla con idempotencia o conciliación                   |
| infraestructura de retry y recuperación                      | `FUERA_DE_ALCANCE`                  | `QUEUE-ARC-006`; `QUEUE-ARC-008`; `QUEUE-ARC-011`; `QUEUE-ARC-012` | los perfiles, fallos, métricas e intervención autorizada quedan materializados sin alterar identidad ni ownership                         |
| especialización POS                                          | preservada por contrato propietario | `INT-POS-013`; `INT-POS-020`                                       | venta/línea y sus diferencias usan identidades acreditadas y conciliación sin heurísticas                                                 |
| control permanente de ventas                                 | preservado por contrato propietario | `INT-SALES-007`; `INT-SALES-008`                                   | retries y convivencia recuperan solo el alcance pendiente y conservan fuentes históricas                                                  |
| materialización física del contrato compartido               | `DEFINIDO_NO_MATERIALIZADO`         | `SHELL-CI-020::<package_id>`                                       | el package se implementa solo tras `E5-GATE-008::<package_id>` y con la fundación CI previa certificada                                   |

No queda un pendiente sustantivo sin propietario y condición de salida.

---

#### 30. Cobertura de prueba preexistente

La semántica centralizada por `SHELL-CON-023` ya está protegida por el Registro Canónico de Requisitos de Prueba vigente, en particular:

- `TREQ-INTEGRATION-003`, para clave estable, huella, resultado durable, retry, resultado desconocido, claim y conciliación;
- `TREQ-INTEGRATION-004`, para reconstrucción de intentos, resultados, errores y efectos sin duplicación;
- `TREQ-INTEGRATION-044`, para diferir, rechazar o conciliar eventos incompatibles o fuera de orden sin aplicación silenciosa;
- `TREQ-INTEGRATION-049`, para procedencia y evidencia de hechos externos antes de producir un hecho interno;
- `TREQ-INTEGRATION-108` a `TREQ-INTEGRATION-114`, para cobertura del registro, entrega al menos una vez, separación de identidades, replay de resultado, conflicto y huella lógica;
- `TREQ-INTEGRATION-120` a `TREQ-INTEGRATION-122`, para concurrencia, recuperación después de respuesta perdida y atomicidad del resultado;
- `TREQ-INTEGRATION-131` a `TREQ-INTEGRATION-134`, para replay, backfill, autorización al recuperar resultados y retención de deduplicación;
- `TREQ-INTEGRATION-139` a `TREQ-INTEGRATION-143`, para conservación de identidad entre retries y tratamiento de `UNKNOWN_OUTCOME`;
- `TREQ-INTEGRATION-235` a `TREQ-INTEGRATION-245`, para intento durable, confirmación, conflicto, `RESULT_UNKNOWN`, conciliación, cancelación y sucesión;
- `TREQ-INTEGRATION-259` a `TREQ-INTEGRATION-265`, para partialidad, alcance, resultados independientes, residual y cierre seguro;
- `TREQ-INTEGRATION-295` a `TREQ-INTEGRATION-306`, para comandos propietarios, ownership, retry, resultado incierto, corrección, replay y adaptadores externos.

La tarea no altera identidad, texto, estado, relación, propietaria, evidencia ni secuencia de esos requisitos.

---

#### 31. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA

**Requisitos creados:** 0
**Requisitos modificados:** 0

**Justificación:** `SHELL-CON-023` materializa como contrato compartido estático comportamientos ya definidos y protegidos por los contratos transversales y especializados de BLOQUE X: alcances idempotentes, identidad estable, huella lógica versionada, un solo ganador concurrente, replay del resultado previo, conflicto por reutilización incompatible, tratamiento de resultado desconocido, retry seguro, fuentes autoritativas, conciliación, residuales y cierre. No introduce una operación ejecutable, un nuevo outcome operativo, una transición nueva, una política de retry, una mutación, una persistencia, una autorización, una migración ni un cambio de Supabase. El Registro Canónico de Requisitos de Prueba permanece sin cambios.

---

#### 32. Decisiones vinculantes

1. La superficie lógica permanece en `@vento/contracts/integrations`.
2. `IntegrationIdempotencyScope` conserva exactamente siete alcances.
3. No existe una clave idempotente global de Vento OS ni de una venta.
4. `IntegrationIdempotencyRef` identifica una operación dentro de un alcance y namespace concretos.
5. `operation_key` se fija antes del primer efecto protegido.
6. Retry, redelivery, restart, worker, dispositivo o transporte no cambian la identidad.
7. `generation` solo representa una nueva intención legítima cuando el contrato propietario la permita.
8. Mapping ID, event ID, receipt ID, sale ID, line ID, principal, credencial y correlation ref no son identidades universales intercambiables.
9. El namespace externo incluye sistema, ambiente, superficie y tipo de operación, más instancia cuando sea necesaria.
10. La huella lógica está versionada y excluye metadata técnica volátil y secretos.
11. Misma identidad + huella compatible recupera resultado o estado previo.
12. Misma identidad + huella incompatible produce `CONFLICTING_REUSE` y cero segunda aplicación.
13. La concurrencia produce un solo ganador empresarial.
14. Claim o lease vencido no prueba ausencia de commit.
15. `ExternalIntegrationClaimState` conserva exactamente siete estados.
16. `OUTCOME_UNKNOWN` y `RESULT_UNKNOWN` son conceptos de capas distintas y no aliases.
17. `IntegrationIdempotencyOutcome` conserva exactamente ocho outcomes.
18. `DUPLICATE_RESULT_RETURNED` produce cero nueva mutación.
19. `RECONCILIATION_REQUIRED` bloquea repetición ciega.
20. Retry conserva identidad, huella y presupuesto aplicable.
21. Replay conserva identidad histórica y no activa efectos sensibles por inferencia.
22. Backfill no crea efectos sensibles sin autorización explícita.
23. Corrección y compensación tienen identidad propia y referencian el original.
24. La recuperación es selectiva por alcance pendiente o incierto.
25. No existe transacción ACID global entre propietarias.
26. `IntegrationReconciliationRef` es identidad independiente de las operaciones comparadas.
27. `IntegrationReconciliationCase` compara fuentes autoritativas y conserva evidencia append-only o referencias equivalentes.
28. La conciliación no modifica directamente otra fuente propietaria.
29. Resultado confirmado no se reaplica durante conciliación.
30. El paso del tiempo no resuelve un resultado desconocido.
31. `IntegrationReconciliationClosureOutcome` conserva exactamente ocho cierres.
32. No existe cierre `UNKNOWN`.
33. Un residual aceptado conserva responsable y autoridad.
34. Un caso sucesor conserva referencia al caso previo.
35. `ExternalReceivedEvent.idempotency_ref` queda conceptualmente tipable mediante `IntegrationIdempotencyRef`.
36. `CanonicalSaleId` y `CanonicalSaleLineId` no son claves universales de efectos downstream.
37. `source_row_number` y file hash no se elevan a identidad individual de venta o línea.
38. `makos_excel` no acredita idempotencia individual por venta o línea.
39. Se adoptan explícitamente 21/21 identidades `EXT-SYS-*`, con 0 faltantes y 0 duplicados.
40. `EXT-SYS-013` consume las decisiones posteriores de `INT-POS` y mantiene pendiente la evidencia individual necesaria sin fabricar claves.
41. `EXT-SYS-020` permanece bloqueada hasta la evidencia propietaria de `TI-INT-003`.
42. `INT-DB-005` conserva la materialización física de idempotencia.
43. `INT-DB-008` conserva la materialización física de conciliación.
44. `SHELL-CON-024` conserva la responsabilidad exclusiva del contrato compartido de cuarentena, rechazo y compensación.
45. Esta tarea crea cero objetos físicos y modifica cero objetos físicos.
46. Esta tarea crea cero requisitos de prueba y modifica cero requisitos existentes.
47. Esta tarea no modifica código, datos, Supabase, secretos, credenciales ni configuración remota.
48. `SHELL-CON-024` permanece como única continuidad reservada.

---

#### 33. Hallazgos y destinos exactos

| Hallazgo                                                                                                                              | Estado                     | Destino                                                                                                         |
| ------------------------------------------------------------------------------------------------------------------------------------- | -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| `idempotency_ref` existía como referencia genérica en `ExternalReceivedEvent`                                                         | resuelto documentalmente   | `SHELL-CON-023` define `IntegrationIdempotencyRef` y el contrato compartido asociado                            |
| los siete alcances idempotentes estaban definidos transversalmente pero no centralizados en la superficie compartida de integraciones | resuelto documentalmente   | `SHELL-CON-023`                                                                                                 |
| el contrato externo de claim usa `OUTCOME_UNKNOWN` mientras la máquina transversal usa `RESULT_UNKNOWN`                               | reconciliado sin renombrar | `SHELL-CON-023` conserva ambos conceptos por capa; `INT-DB-008` materializa la conciliación física posterior    |
| la conciliación externa y la conciliación permanente de ventas comparten invariantes pero mantienen propietarias y unidades distintas | reconciliado               | contrato compartido define forma común sin crear una máquina global                                             |
| la persistencia física de restricciones idempotentes todavía no existe                                                                | esperado por fase          | `INT-DB-005`                                                                                                    |
| la persistencia física de mecanismos de conciliación todavía no existe                                                                | esperado por fase          | `INT-DB-008`                                                                                                    |
| la infraestructura física de auditoría de procesamiento y retries todavía pertenece a su fase de implementación                       | esperado por fase          | `INT-DB-007`                                                                                                    |
| la disposición compartida de cuarentena, rechazo y compensación no forma parte de esta tarea                                          | reservado                  | `SHELL-CON-024`                                                                                                 |
| el flujo `makos_excel` no demuestra identidad individual de venta/línea                                                               | `PENDIENTE_DE_EVIDENCIA`   | `INT-POS-021` / `INT-POS-022` para evidencia y piloto; `INT-POS-013` conserva la regla de no fabricar identidad |
| telefonía/voz carece de binding acreditado suficiente                                                                                 | `BLOQUEADO`                | `TI-INT-003`                                                                                                    |

No queda un pendiente narrativo sin propietario y condición de salida.

---

#### 34. Criterios de aceptación

`SHELL-CON-023` queda documentalmente completa cuando se cumplen simultáneamente estos criterios:

1. existe un contrato compartido lógico de idempotencia dentro de `@vento/contracts/integrations`;
2. existe `IntegrationIdempotencyRef` sin definir un formato físico arbitrario;
3. existen exactamente siete valores de `IntegrationIdempotencyScope`;
4. no existe una clave global que fusione los siete alcances;
5. solicitud, comando, evento, inbox, efecto, external receipt y replay batch conservan identidades distintas;
6. la identidad de cada alcance se fija antes del primer efecto;
7. retry conserva identidad;
8. redelivery conserva identidad;
9. restart conserva identidad;
10. cambio de transporte conserva identidad empresarial;
11. metadatos técnicos no crean una nueva operación;
12. `generation` solo se usa para intención nueva legítima;
13. el namespace externo distingue sistema, ambiente, superficie y operación;
14. external instance se incorpora cuando sea necesaria para evitar colisiones;
15. mapping, idempotencia, correlación y conciliación permanecen conceptos distintos;
16. la huella lógica es versionada;
17. la huella excluye secretos y metadata volátil;
18. misma identidad y huella compatible recuperan resultado;
19. misma identidad y huella incompatible producen conflicto;
20. el segundo contenido incompatible no se aplica parcialmente;
21. existe un solo ganador empresarial bajo concurrencia;
22. claim o lease vencido no se usa como prueba de ausencia de commit;
23. se conservan exactamente siete estados de claim externos;
24. `OUTCOME_UNKNOWN` exige consulta o conciliación antes de repetir;
25. `OUTCOME_UNKNOWN` no se renombra a `RESULT_UNKNOWN`;
26. se conservan exactamente ocho outcomes idempotentes;
27. duplicado devuelve resultado previo y cero nueva mutación;
28. stale no retrocede estado confirmado;
29. out-of-order queda diferido explícitamente;
30. rechazo no oculta partialidad o incertidumbre;
31. replay conserva identidades históricas;
32. backfill no activa efectos sensibles por defecto;
33. corrección y compensación conservan identidad propia;
34. recuperación se dirige al alcance pendiente;
35. un efecto confirmado no se reaplica por fallo de otro;
36. no existe commit distribuido global;
37. existe `IntegrationReconciliationRef` independiente de event, receipt, mapping y sale IDs;
38. existe `IntegrationReconciliationCase` con fuentes, evidencia, diferencias, decisión, residuales, siguiente acción y responsable;
39. conciliación consulta fuentes autoritativas y no las reemplaza;
40. una métrica, log o ACK no sustituye el resultado propietario;
41. nueva evidencia no reescribe una revisión previa;
42. el paso del tiempo no cierra un resultado desconocido;
43. se conservan exactamente ocho outcomes de cierre de conciliación;
44. no existe outcome de cierre desconocido;
45. cierre con residual exige responsable y autoridad;
46. supersesión exige referencia al sucesor;
47. `ExternalReceivedEvent.idempotency_ref` queda tipable conceptualmente mediante `IntegrationIdempotencyRef`;
48. venta y línea no se convierten en claves universales de efectos;
49. `source_row_number` no se convierte en identidad de línea;
50. file hash no se convierte en identidad individual de venta;
51. `makos_excel` continúa sin acreditar identidad individual de venta/línea;
52. la matriz materializa exactamente 21 identidades externas;
53. faltantes de la matriz = 0;
54. duplicados de la matriz = 0;
55. identificadores únicos de la matriz = 21;
56. la distribución de clasificación reconcilia exactamente `1 + 6 + 2 + 2 + 1 + 1 + 7 + 1 = 21`;
57. `EXT-SYS-013` usa la especialización vigente del POS sin restaurar un diagnóstico histórico anterior;
58. `EXT-SYS-020` permanece bloqueada hasta `TI-INT-003`;
59. `INT-DB-005` conserva la materialización física de idempotencia;
60. `INT-DB-008` conserva la materialización física de conciliación;
61. `INT-DB-007` conserva auditoría física de procesamiento y retries;
62. `SHELL-CON-024` no se adelanta;
63. no se crean tablas, índices, constraints, RPC, RLS, migraciones, colas, workers o datos;
64. no se modifica Supabase;
65. no se modifica código;
66. se crean cero requisitos de prueba;
67. se modifican cero requisitos de prueba;
68. la continuidad reserva exclusivamente `SHELL-CON-024`.

---

#### 35. Límites de la tarea

`SHELL-CON-023` no:

- implementa `@vento/contracts`;
- crea archivos TypeScript;
- publica una versión de package;
- crea schemas ejecutables;
- crea tablas, columnas, índices o constraints;
- crea migraciones;
- crea RLS, grants, RPC o funciones;
- crea endpoints, webhooks, colas, cron o workers;
- materializa outbox o inbox;
- ejecuta claims;
- reintenta operaciones;
- concilia datos reales;
- modifica ventas, líneas, pagos, inventario, hechos económicos o puntos;
- crea mappings;
- ejecuta cuarentena;
- ejecuta rechazos operativos;
- ejecuta compensaciones;
- cambia una fuente propietaria;
- crea una transacción distribuida global;
- inventa IDs de proveedor;
- inventa resultados, receipts, evidencia o bindings;
- modifica código;
- modifica Supabase;
- cambia la ruta canónica;
- desarrolla `SHELL-CON-024`.

---

#### 36. Continuidad

##### ÚLTIMA TAREA APROBADA

SHELL-CON-022 — Crear contrato de mapeo de identificadores externos

##### TAREA ACTUAL APROBADA

SHELL-CON-023 — Crear contrato de idempotencia y conciliación

##### SIGUIENTE TAREA RESERVADA

SHELL-CON-024 — Crear contrato de cuarentena, rechazo y compensación


### ✅ SHELL-CON-024 — Crear contrato de cuarentena, rechazo y compensación

**Estado:** APROBADA
**Tarea anterior:** SHELL-CON-023 — Crear contrato de idempotencia y conciliación
**Tarea siguiente:** SHELL-NORM-001 — Crear `@vento/data-normalization`
**Tipo de tarea:** Documental; definición normativa documental del contrato compartido de cuarentena, rechazo y compensación para integraciones, preservando los vocabularios transversales de error parcial, idempotencia, conciliación y compensación, las especializaciones externas y POS ya aprobadas y las fronteras de propiedad, sin implementar código, persistencia, colas, workers, migraciones ni cambios en Supabase
**Bloque:** H — Fundación compartida de VENTO-SHELL
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/01_CONTRATOS_DE_INTEGRACIONES_EXTERNAS.md`
**Superficie lógica objetivo:** `@vento/contracts/integrations`
**Estado físico resultante:** `CONTRATO_COMPARTIDO_DE_CUARENTENA_RECHAZO_Y_COMPENSACION_DEFINIDO_NO_MATERIALIZADO`
**Implementación física autorizada:** ninguna
**Cambios de código, DDL, DML, migraciones, RLS, RPC, Storage, Edge Functions, colas, workers, endpoints, secretos, credenciales, proveedores, datos, configuración remota o despliegues:** ninguno
**Requisitos de prueba creados o modificados:** 0

---

#### 1. Propósito

`SHELL-CON-024` cierra la familia de contratos compartidos de integraciones externas definiendo una forma única y consumible para representar qué ocurre cuando una unidad de integración no puede continuar normalmente, debe aislarse, debe rechazarse de forma terminal, requiere intervención o debe enlazarse con una compensación de un efecto ya confirmado.

La regla central es:

```text
FALLO O PARCIALIDAD IDENTIFICADOS
+
UNIDAD Y PROPIETARIA IDENTIFICADAS
+
IDENTIDAD E IDEMPOTENCIA PRESERVADAS
+
EVIDENCIA PROTEGIDA
+
DISPOSICIÓN EXPLÍCITA
+
AUTORIDAD Y SIGUIENTE ACCIÓN
=
TRATAMIENTO TRAZABLE SIN FABRICAR RESULTADOS
```

Y se mantiene obligatoriamente:

```text
CUARENTENA
≠
DEAD-LETTER
≠
RECHAZO EMPRESARIAL
≠
RESULTADO DESCONOCIDO
≠
CONCILIACIÓN
≠
COMPENSACIÓN
≠
CONTINGENCIA
```

El contrato compartido no crea una máquina empresarial nueva. Centraliza en `@vento/contracts/integrations` la semántica ya aprobada por las políticas transversales y por las especializaciones de integraciones externas y POS, para que futuros adaptadores, colas, persistencia y consumidoras puedan usar referencias compatibles sin inventar taxonomías locales.

---

#### 2. Resultado canónico

Quedan definidos lógicamente dentro de `@vento/contracts/integrations` los siguientes artefactos compartidos:

1. `IntegrationDispositionCaseId`, identidad estable, opaca y no secreta de un caso de disposición materializado;
2. `IntegrationDispositionCaseRef`, referencia mínima hacia un caso identificado;
3. `IntegrationDispositionCase`, sobre lógico común que enlaza unidad afectada, parcialidad, disposición, evidencia, autoridad, siguiente acción y cierre;
4. `IntegrationFailureScope`, adopción compartida de los ocho alcances cerrados de fallo;
5. `IntegrationPartialityClass`, adopción compartida de las nueve clases cerradas de parcialidad;
6. `IntegrationDisposition`, adopción compartida de las doce disposiciones cerradas;
7. `IntegrationQuarantineReason`, adopción compartida de las ocho razones transversales de cuarentena;
8. `IntegrationQuarantineRef`, referencia tipada a una materialización de cuarentena;
9. `IntegrationDeadLetterGate`, adopción compartida de las siete puertas acumulativas de dead-letter;
10. `IntegrationDeadLetterRef`, referencia tipada a una materialización dead-letter cuando todas sus puertas sean satisfechas;
11. `IntegrationManualInterventionAction`, adopción compartida de las diez acciones manuales autorizables;
12. `IntegrationCompensationPlanRef`, referencia tipada hacia un plan compensatorio gobernado por `ENTERPRISE-EVENT-COMPENSATION-POLICY-001`.

El contrato reutiliza, sin duplicarlos:

- `IntegrationIdempotencyRef` de `SHELL-CON-023`;
- `IntegrationReconciliationRef` de `SHELL-CON-023`;
- `IntegrationReconciliationClosureOutcome` de `SHELL-CON-023`;
- `IntegrationPrincipalRef` de `SHELL-CON-017`;
- `ExternalCredentialRef` de `SHELL-CON-018`;
- `ExternalReceivedEvent` de `SHELL-CON-019`;
- `ExternalIdentifierMappingRef` de `SHELL-CON-022`.

Esta tarea no crea archivos TypeScript, exports, JSON Schema, tablas, índices, registros operativos, colas, workers, casos reales ni consumidores migrados.

---

#### 3. Fuentes y precedencia

`SHELL-CON-024` consume y conserva sin redefinir:

| Fuente                                    | Autoridad preservada                                                                                                    |
| ----------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| `SHELL-CON-001`                           | `@vento/contracts` como superficie estática sin runtime, red, secretos ni persistencia                                  |
| `SHELL-CON-017`                           | identidad del principal técnico separada de actor, credencial y efecto                                                  |
| `SHELL-CON-018`                           | referencia de credencial sin secreto                                                                                    |
| `SHELL-CON-019`                           | recepción externa, evidencia, receipt y referencias de procesamiento                                                    |
| `SHELL-CON-022`                           | mappings externos tipados, estados de resolución y ausencia de equivalencias heurísticas                                |
| `SHELL-CON-023`                           | identidad idempotente, claim externo, resultado recuperable y conciliación compartida                                   |
| `INT-APP-006`                             | política transversal de compensación, reversibilidad, etapas, planes, idempotencia y resultados                         |
| `INT-APP-009`                             | política transversal de error parcial, alcances, clases, disposiciones, cuarentena, dead-letter, intervención y cierres |
| `INT-EXT-016`                             | especialización de cuarentena y dead-letter para el universo externo                                                    |
| `INT-EXT-017`                             | auditoría, observabilidad y conciliación externa                                                                        |
| `INT-POS-012`                             | especialización de cuarentena por línea de venta sin mapping suficiente                                                 |
| `INT-POS-019`                             | compensaciones de reversos sin borrar la operación original                                                             |
| `INT-POS-020`                             | conciliación de ventas y efectos internos durante la transición POS                                                     |
| `INT-DB-006`                              | persistencia física posterior de cuarentena y errores no procesables                                                    |
| `INT-DB-007`                              | auditoría física posterior de procesamiento, reintentos y compensaciones                                                |
| `INT-DB-008`                              | mecanismos físicos posteriores de conciliación por integración                                                          |
| Registro Canónico de Requisitos de Prueba | cobertura vigente de idempotencia, parcialidad, cuarentena, dead-letter, compensación, auditoría y conciliación         |

Precedencia aplicable:

```text
POLÍTICAS TRANSVERSALES INT-APP
→ vocabularios y garantías comunes

ESPECIALIZACIONES INT-EXT / INT-POS
→ decisiones propietarias por superficie o dominio

SHELL-CON-024
→ forma compartida consumible sin cambiar las decisiones propietarias

INT-DB / QUEUE-ARC / paquetes de implementación
→ materialización física posterior
```

Una especialización aprobada posterior conserva precedencia sobre un diagnóstico histórico anterior. En particular, `EXT-SYS-013` se trata con la especialización POS vigente y no se restaura a un estado de ausencia de binding ya superado documentalmente.

---

#### 4. Frontera exacta de la tarea

La tarea incluye:

- identidad lógica del caso compartido de disposición;
- referencias compartidas a cuarentena, dead-letter y compensación;
- los ocho alcances de fallo ya aprobados;
- las nueve clases de parcialidad ya aprobadas;
- las doce disposiciones ya aprobadas;
- las ocho razones transversales de cuarentena ya aprobadas;
- las siete puertas acumulativas de dead-letter ya aprobadas;
- las diez acciones manuales autorizables ya aprobadas;
- reglas de rechazo terminal seguro;
- precedencia de resultado desconocido y conciliación;
- reglas de reproceso sin cambio de identidad empresarial;
- reglas de sucesión cuando cambia la intención o el contenido material;
- enlace con la política transversal de compensación;
- preservación de historial, evidencia, ownership, sensibilidad, auditoría y residuales;
- adopción explícita para las veintiuna identidades externas vigentes;
- handoffs a `INT-DB-006`, `INT-DB-007`, `INT-DB-008`, `QUEUE-ARC-008`, `QUEUE-ARC-009`, `QUEUE-ARC-011`, `QUEUE-ARC-012`, `SHELL-CI-020::<package_id>`, `SHELL-CI-006` y, para consumidores web, `SHELL-MIG-001..008`, según la responsabilidad exacta.

Quedan fuera:

- persistencia física;
- tablas, columnas, índices o constraints;
- colas, topics, workers, cron o schedulers;
- mecanismos de claim físicos;
- APIs o endpoints;
- implementación de retry o reprocess;
- ejecución de compensaciones;
- cambios de estados empresariales reales;
- escritura sobre ledgers propietarios;
- creación de payloads o casos operativos;
- secretos y credenciales;
- RLS, grants, RPC o funciones;
- observabilidad desplegada;
- cambios en Supabase;
- cambios en proveedores o bindings;
- definición de la siguiente familia `SHELL-NORM-*`.

---

#### 5. Separaciones semánticas obligatorias

El contrato preserva estas desigualdades:

```text
CASO DE DISPOSICIÓN
≠ OPERACIÓN EMPRESARIAL
≠ EVENTO
≠ RECEIPT
≠ RESULTADO EMPRESARIAL
≠ INTENTO TÉCNICO
≠ CLAVE IDEMPOTENTE
≠ CASO DE CONCILIACIÓN
≠ PLAN DE COMPENSACIÓN
```

```text
CUARENTENA
→ aislamiento controlado de una unidad que no puede continuar de forma segura

DEAD-LETTER
→ disposición operacional posterior a puertas acumulativas satisfechas

RECHAZO TERMINAL
→ decisión de no aceptar o no aplicar la unidad cuando se demuestra ausencia de efecto y no existe incertidumbre

COMPENSACIÓN
→ efecto nuevo, propietario e idempotente que trata un efecto original confirmado
```

Ninguna de estas formas sustituye la otra por conveniencia técnica.

---

#### 6. Identidad de `IntegrationDispositionCaseId`

`IntegrationDispositionCaseId` identifica un caso concreto de tratamiento y no la operación empresarial original.

Reglas:

1. es estable durante la vida del caso;
2. es opaco y no secreto;
3. no se deriva de payload, importe, fecha, correo, teléfono, producto, proveedor o texto de error;
4. no reutiliza `event_id`, `receipt_id`, `attempt_id`, `delivery_id`, `mapping_id`, `sale_id`, `sale_line_id`, `correlation_id` o una idempotency key;
5. un nuevo intento técnico del mismo caso no crea automáticamente otro caso;
6. una nueva intención material puede requerir un caso sucesor enlazado, sin reinterpretar el caso anterior;
7. cerrar un caso no libera su identidad para reutilización;
8. esta tarea no fija UUID, prefijo, slug, longitud ni representación física.

---

#### 7. Alcances cerrados de fallo

`IntegrationFailureScope` adopta exactamente los ocho alcances de `ENTERPRISE-PARTIAL-ERROR-HANDLING-POLICY-001`:

```text
REQUEST_OR_COMMAND
OWNER_TRANSACTION
EVENT_EMISSION
DELIVERY
CONSUMER_EFFECT
BATCH_OR_BULK_ITEM
EXTERNAL_EXCHANGE
OFFLINE_OR_EVIDENCE
```

Reglas:

1. cada caso tiene un alcance primario;
2. puede enlazar alcances secundarios sin fusionar identidades;
3. el alcance determina dónde ocurrió el problema, no quién puede corregirlo;
4. un fallo de entrega no convierte automáticamente el hecho propietario en fallido;
5. un fallo de consumidora no reabre el commit de la productora;
6. un error externo no concede al adaptador autoridad sobre el dominio consumidor;
7. un lote conserva resultado por unidad y no usa el resumen global como sustituto.

---

#### 8. Clases cerradas de parcialidad

`IntegrationPartialityClass` adopta exactamente:

```text
NO_EFFECT_CONFIRMED
SOME_EFFECTS_CONFIRMED
SOME_EFFECTS_UNKNOWN
ALL_EFFECTS_UNKNOWN
DEPENDENCY_INCOMPLETE
CONFLICTING_RESULTS
UNTRUSTED_OR_TAMPERED_INPUT
CONTRACT_OR_SCHEMA_INCOMPATIBLE
EXTERNAL_STATE_DIVERGENCE
```

La clase no es una disposición. Por ejemplo:

- `UNTRUSTED_OR_TAMPERED_INPUT` puede conducir a `QUARANTINE` o a rechazo según evidencia y contrato;
- `SOME_EFFECTS_UNKNOWN` exige indagación o conciliación antes de decidir sobre efectos inciertos;
- `SOME_EFFECTS_CONFIRMED` permite evaluar compensación únicamente para los efectos confirmados elegibles;
- `EXTERNAL_STATE_DIVERGENCE` conduce ordinariamente a conciliación y no a sobrescritura automática.

---

#### 9. Disposiciones cerradas

`IntegrationDisposition` adopta exactamente las doce disposiciones transversales:

```text
RETRY_SAME_OPERATION
WAIT_FOR_DEPENDENCY
QUERY_AUTHORITATIVE_RESULT
RECONCILE
QUARANTINE
DEAD_LETTER_CANDIDATE
MANUAL_INTERVENTION_REQUIRED
PERMANENTLY_REJECT
COMPENSATE_CONFIRMED_EFFECTS
CREATE_CORRECTION_OR_SUCCESSOR
CONTINUE_INDEPENDENT_UNITS
BLOCK_DEPENDENT_UNITS
```

Reglas:

1. la disposición se elige sobre evidencia y autoridad, no por texto libre de error;
2. `RETRY_SAME_OPERATION` conserva identidad, huella e idempotencia;
3. `QUERY_AUTHORITATIVE_RESULT` precede cualquier repetición cuando el efecto pueda haber ocurrido;
4. `RECONCILE` no significa reprocess;
5. `QUARANTINE` no significa rechazo;
6. `DEAD_LETTER_CANDIDATE` no significa cierre;
7. `PERMANENTLY_REJECT` exige certeza suficiente de ausencia de efecto incompatible;
8. `COMPENSATE_CONFIRMED_EFFECTS` aplica solo a efectos confirmados y reversibles o compensables;
9. `CREATE_CORRECTION_OR_SUCCESSOR` conserva el original;
10. unidades independientes pueden continuar aunque otra quede bloqueada;
11. dependientes no pueden continuar a través de una precondición irresuelta.

---

#### 10. Contrato de cuarentena

Una unidad entra a cuarentena cuando debe preservarse pero no puede continuar de forma segura bajo el contrato vigente.

La cuarentena compartida exige, cuando aplique:

- identidad estable de la unidad;
- alcance de fallo;
- clase de parcialidad;
- disposición `QUARANTINE`;
- razón transversal;
- referencia a evidencia protegida;
- huella o integridad aplicable;
- versión de schema o contrato relevante;
- sistema, ambiente y superficie cuando sea externa;
- propietaria del hecho;
- responsable operativo;
- siguiente acción;
- referencia de autorización cuando exista intervención;
- referencias de auditoría y conciliación;
- política de retención y legal hold cuando corresponda.

La cuarentena no modifica la fuente empresarial ni transforma la unidad en un nuevo hecho.

---

#### 11. Razones transversales de cuarentena

`IntegrationQuarantineReason` adopta exactamente:

```text
UNTRUSTED_SIGNATURE_OR_AUTHENTICITY
SCHEMA_OR_VERSION_UNSUPPORTED
PAYLOAD_INTEGRITY_FAILED
IDENTITY_OR_ROUTING_AMBIGUOUS
SENSITIVITY_OR_POLICY_VIOLATION
REPEATED_POISON_MESSAGE
EVIDENCE_LINKAGE_INVALID
MANUAL_HOLD_FOR_INVESTIGATION
```

Reglas:

1. el vocabulario compartido no se amplía por conveniencia de proveedor;
2. un detalle propietario puede conservarse por referencia o campo especializado sin crear otra taxonomía transversal;
3. una razón no determina por sí sola terminalidad;
4. un mensaje no confiable no se transforma en confiable por reprocesarlo;
5. `MANUAL_HOLD_FOR_INVESTIGATION` requiere responsable y condición de salida;
6. `REPEATED_POISON_MESSAGE` no reemplaza la clasificación original del fallo;
7. una razón de cuarentena no es un estado empresarial de venta, pago, inventario, fidelización o documento.

---

#### 12. Especializaciones propietarias de cuarentena

El contrato compartido permite una especialización propietaria sin sustituir el vocabulario transversal.

Forma conceptual:

```text
IntegrationQuarantineRef
+
shared_quarantine_reason
+
owner_specialization_ref
+
owner_resolution_detail
```

Reglas:

1. `owner_specialization_ref` identifica el contrato propietario que explica la condición concreta;
2. `owner_resolution_detail` conserva el detalle especializado sin convertirlo en enum global;
3. la especialización no puede relajar seguridad, integridad, identidad o ownership compartidos;
4. una razón propietaria no se promociona automáticamente a razón transversal;
5. la proyección compartida debe conservar suficiente información para reconstruir la decisión propietaria.

Para POS, `EXTERNAL-SALE-LINE-QUARANTINE-001` conserva sus razones especializadas y la línea de venta como unidad propietaria. `SHELL-CON-024` no cambia esa taxonomía ni convierte la venta completa, archivo o lote en la unidad de cuarentena POS.

---

#### 13. Estado de una unidad en cuarentena

Una unidad en cuarentena conserva:

```text
IDENTIDAD ORIGINAL
+
CONTENIDO O EVIDENCIA ORIGINAL PROTEGIDOS
+
HUELLA / INTEGRIDAD
+
CONTRATO Y VERSIÓN
+
PROCEDENCIA
+
RAZÓN
+
PROPIETARIA
+
RESPONSABLE
+
SIGUIENTE ACCIÓN
```

Queda prohibido:

- regenerar una identidad para hacer pasar la unidad como nueva;
- editar el contenido original para eliminar la causa;
- aplicar automáticamente el efecto empresarial;
- liberar por antigüedad;
- liberar por desaparición de una alerta;
- asumir que el elemento no produjo efectos únicamente porque esté aislado;
- usar cuarentena como almacén de secretos o payloads sensibles innecesarios.

---

#### 14. Contrato de dead-letter

`IntegrationDeadLetterRef` referencia una unidad que alcanzó la disposición operacional de dead-letter conforme a todas las puertas requeridas.

Dead-letter no es un fracaso empresarial terminal por definición. Representa que la automatización ordinaria ya no debe seguir repitiendo la unidad y que el caso conserva tratamiento explícito.

La promoción desde cuarentena, retry agotado u otra condición hacia dead-letter exige evaluar las siete puertas y conservar el resultado de cada una.

---

#### 15. Siete puertas acumulativas de dead-letter

`IntegrationDeadLetterGate` adopta exactamente:

```text
AUTOMATION_BUDGET_CLOSED
ITEM_ISOLATED
IDENTITY_AND_CONTENT_PRESERVED
BUSINESS_OUTCOME_CLASSIFIED_OR_RECONCILIATION_OPEN
OWNER_AND_NEXT_ACTION_ASSIGNED
REPROCESSING_REQUIRES_AUTHORIZATION
RETENTION_AND_AUDIT_DEFINED
```

Reglas:

1. las siete puertas son acumulativas;
2. una puerta falsa impide presentar el caso como dead-letter completo;
3. retry agotado satisface como máximo la puerta de presupuesto y no las otras seis;
4. `BUSINESS_OUTCOME_CLASSIFIED_OR_RECONCILIATION_OPEN` permite mantener incertidumbre solo si la conciliación permanece explícitamente abierta;
5. dead-letter no elimina la necesidad de propietaria ni siguiente acción;
6. un caso dead-letter puede requerir reprocess, rechazo, conciliación, corrección o compensación según evidencia;
7. la antigüedad por sí sola no satisface ninguna puerta de negocio.

---

#### 16. Rechazo terminal seguro

`PERMANENTLY_REJECT` solo es válido cuando puede demostrarse que la unidad exacta no produjo un efecto empresarial que deba conservarse o compensarse y que no existe resultado desconocido material pendiente.

Condiciones mínimas:

1. identidad de la unidad conocida;
2. contrato aplicable conocido;
3. causa terminal demostrada;
4. ausencia de efecto incompatible demostrada para la unidad que se rechaza;
5. ausencia de `OUTCOME_UNKNOWN` o `RESULT_UNKNOWN` sin resolver;
6. ausencia de efecto parcial que deba permanecer visible;
7. propietaria y autoridad de la decisión identificadas;
8. evidencia y auditoría suficientes;
9. cierre permitido por el vocabulario vigente.

Un rechazo de autenticidad o schema puede ser terminal para la entrada recibida, pero no autoriza a inventar el estado del hecho externo que dicha entrada pretendía representar.

---

#### 17. Precedencia del resultado desconocido

Cuando existe posibilidad material de que un efecto haya ocurrido, se aplica:

```text
RESULTADO DESCONOCIDO
→ CONSULTAR FUENTE AUTORITATIVA O RECEIPT
   → EFECTO CONFIRMADO: RECUPERAR RESULTADO O EVALUAR COMPENSACIÓN SI PROCEDE
   → AUSENCIA DE EFECTO DEMOSTRADA: EVALUAR RETRY O RECHAZO SEGÚN CONTRATO
   → INDETERMINADO: RECONCILIATION_REQUIRED
```

Reglas:

1. timeout no equivale a fracaso;
2. ausencia de respuesta no equivale a ausencia de efecto;
3. dead-letter no resuelve la incertidumbre;
4. cuarentena no resuelve la incertidumbre;
5. rechazo no puede usarse para cerrar una incertidumbre;
6. compensación no se inicia para un efecto que solo podría haber ocurrido;
7. un caso puede estar aislado operacionalmente y simultáneamente conservar conciliación abierta.

`OUTCOME_UNKNOWN` del claim externo y `RESULT_UNKNOWN` de la máquina de pendientes permanecen capas distintas y se enlazan sin fusionarse.

---

#### 18. Intervención manual autorizable

`IntegrationManualInterventionAction` adopta exactamente las diez acciones aprobadas:

```text
RETRY_AUTHORIZED
QUERY_RECEIPT
CORRECT_METADATA
CREATE_SUCCESSOR
RELINK_EVIDENCE
REPROCESS_FROM_QUARANTINE
REPROCESS_FROM_DEAD_LETTER
PERMANENT_REJECT
START_RECONCILIATION
START_COMPENSATION
```

Toda intervención debe poder reconstruir:

- actor o principal;
- autoridad vigente;
- motivo;
- alcance exacto;
- hipótesis o fundamento;
- estado anterior;
- evidencia consultada;
- acción seleccionada;
- intento resultante cuando corresponda;
- resultado;
- referencias de auditoría;
- siguiente acción si el caso permanece abierto.

Recibir una alerta, pertenecer a soporte o tener acceso de lectura no concede automáticamente autoridad para ejecutar una de estas acciones.

---

#### 19. Reproceso de la misma intención

Un reproceso legítimo desde cuarentena o dead-letter conserva la operación empresarial original cuando la intención no cambió.

Debe conservar:

- identidad empresarial;
- idempotency scope y key;
- huella lógica compatible;
- event ID, command ID o external identity aplicable;
- propietaria;
- finalidad;
- sensibilidad;
- correlación;
- evidencia fuente;
- presupuesto y antecedentes de retry conforme a la política aplicable.

Solo cambian metadatos técnicos propios del nuevo intento, como `attempt_id`, tiempo y traza.

Nunca:

```text
REPROCESS
→ NUEVA IDENTIDAD EMPRESARIAL
→ SEGUNDO EFECTO
```

---

#### 20. Cambio material y sucesión

Si para poder continuar es necesario cambiar materialmente la intención, payload empresarial, recurso, importe, cantidad, destinatario, versión incompatible, acción o autoridad del hecho, ya no existe un simple reproceso.

Se aplica:

```text
CASO ORIGINAL
+
CAMBIO MATERIAL AUTORIZADO
→ CREATE_CORRECTION_OR_SUCCESSOR
→ NUEVA IDENTIDAD PARA LA NUEVA INTENCIÓN
→ RELACIÓN EXPLÍCITA CON EL ORIGINAL
```

El original permanece inmutable y su cierre no se reinterpreta.

---

#### 21. Referencia compartida de compensación

`IntegrationCompensationPlanRef` no crea una política compensatoria paralela. Referencia un plan gobernado por `ENTERPRISE-EVENT-COMPENSATION-POLICY-001`.

La referencia debe poder distinguir, sin copiar el plan completo:

- identidad y versión del plan;
- efecto original confirmado;
- propietaria;
- acción CCR aplicable;
- estado u outcome del plan;
- referencias de verificación y auditoría cuando correspondan.

No contiene secretos, payloads completos ni decisiones de otra propietaria.

---

#### 22. Elegibilidad para compensación

`COMPENSATE_CONFIRMED_EFFECTS` solo puede seleccionarse cuando:

1. existe un efecto original confirmado;
2. el efecto está correctamente identificado y correlacionado;
3. la política de reversibilidad lo permite o define una compensación válida;
4. la propietaria del efecto está identificada;
5. existe autoridad vigente;
6. la acción compensatoria conserva identidad e idempotencia propias;
7. las dependencias y residuales son explícitos;
8. el resultado puede verificarse.

No se compensa:

- un timeout sin resultado;
- una unidad únicamente enviada;
- un ACK técnico;
- una hipótesis de efecto;
- una entrega no confirmada;
- una entrada rechazada sin efecto;
- una diferencia todavía no conciliada;
- un mapping ambiguo que no permite saber qué recurso fue afectado.

---

#### 23. Compensación no destructiva

Toda compensación preserva:

```text
EFECTO ORIGINAL CONFIRMADO
+
IDENTIDAD DE COMPENSACIÓN PROPIA
+
CAUSALIDAD EXPLÍCITA
+
PROPIETARIA DEL EFECTO
+
AUTORIZACIÓN
+
RESULTADO RECUPERABLE
+
EVIDENCIA
```

Reglas:

1. el efecto original no se borra ni se edita para aparentar que nunca ocurrió;
2. una compensación confirmada no se repite por retry;
3. una segunda solicitud equivalente recupera el resultado previo;
4. contenido compensatorio incompatible produce conflicto;
5. una compensación parcial conserva pasos confirmados, pendientes, imposibles y residuales;
6. una compensación no revierte automáticamente efectos en otras propietarias;
7. cada propietaria ejecuta solo su propio efecto inverso, correctivo o compensatorio.

---

#### 24. No existe rollback global

Queda expresamente fuera del contrato:

```text
FALLO EN UNA INTEGRACIÓN
→ ROLLBACK GLOBAL DE PULSO + NEXO + NUMERA + PASS + PROVEEDOR
```

La consistencia se obtiene mediante:

- identidad idempotente por alcance;
- resultados durables;
- retry seguro;
- conciliación;
- correcciones o sucesores;
- compensaciones propietarias cuando correspondan;
- residuales explícitos.

Un efecto confirmado en una propietaria puede coexistir temporalmente con otro pendiente, rechazado o desconocido y debe conservarse como tal.

---

#### 25. Relación con conciliación

`IntegrationDispositionCase` puede enlazar `IntegrationReconciliationRef` cuando la evidencia sea insuficiente, existan resultados divergentes o un efecto sea desconocido.

La conciliación:

- compara fuentes autoritativas;
- conserva diferencias;
- determina certeza por unidad;
- no reescribe historia;
- no genera identidades nuevas para descubrir si la operación ocurrió;
- no habilita escritura cruzada;
- no cierra una unidad solo por desaparición de una alerta;
- puede terminar en resultado confirmado, no efecto, duplicado previo, corrección, compensación, residual aceptado, rechazo permanente o sucesor.

El caso de disposición y el caso de conciliación pueden estar correlacionados sin ser el mismo objeto.

---

#### 26. Outcomes de cierre reutilizados

`SHELL-CON-024` reutiliza `IntegrationReconciliationClosureOutcome` de `SHELL-CON-023` y no crea otro vocabulario:

```text
RESOLVED_CONFIRMED
RESOLVED_NO_EFFECT
RESOLVED_DUPLICATE_PRIOR_RESULT
RESOLVED_CORRECTED
RESOLVED_COMPENSATED
RESOLVED_WITH_ACCEPTED_RESIDUAL
PERMANENTLY_REJECTED
SUPERSEDED_BY_SUCCESSOR
```

Quedan prohibidos cierres equivalentes a:

- `CLOSED_UNKNOWN`;
- cierre por edad;
- cierre por silencio;
- cierre por desaparición de alerta;
- cierre por mover el elemento a dead-letter;
- cierre por reinicio de worker;
- cierre por borrar o archivar la unidad.

---

#### 27. Residuales y cierre responsable

`RESOLVED_WITH_ACCEPTED_RESIDUAL` exige conservar, como mínimo:

- residual exacto;
- propietaria;
- responsable;
- riesgo;
- control aplicable;
- autoridad que acepta el residual;
- condición o momento de seguimiento;
- evidencia de la decisión.

Un residual sin responsable no constituye cierre válido.

Un caso puede terminar operacionalmente sin trabajo automático pendiente y seguir abierto empresarialmente si conserva una obligación residual no aceptada.

---

#### 28. Sobre lógico de `IntegrationDispositionCase`

La forma conceptual deberá poder representar, cuando aplique:

```text
integration_disposition_case_id
failure_scope
partiality_class
disposition
owner_application
owner_domain_ref
resource_or_operation_refs[]
external_system_id
environment
surface
integration_principal_ref
external_received_event_ref
external_identifier_mapping_refs[]
idempotency_ref
reconciliation_ref
quarantine_ref
dead_letter_ref
compensation_plan_ref
original_evidence_refs[]
content_integrity_ref
contract_or_schema_version
quarantine_reason
owner_specialization_ref
owner_resolution_detail
dead_letter_gate_results[]
manual_intervention_action
authorization_reference
attempt_references[]
business_outcome_reference
responsible_owner
next_action
residual_obligations[]
retention_policy_ref
legal_hold_reference
audit_references[]
closure_outcome
created_at
updated_at
closed_at
```

Esta notación es lógica. No fija nombres físicos de columnas, tipos escalares, opcionalidad de una base de datos, formato JSON, lenguaje de implementación, índice, constraint, algoritmo de claim, cola, topic ni esquema de persistencia.

Los campos se materializan únicamente cuando son pertinentes; no se rellenan valores ficticios para aparentar completitud.

---

#### 29. Privacidad, sensibilidad y evidencia

El caso compartido aplica minimización por finalidad.

Queda prohibido incorporar por conveniencia:

- API keys;
- bearer tokens;
- service role;
- private keys;
- contraseñas;
- firmas completas reutilizables;
- payloads personales completos;
- datos bancarios completos;
- documentos completos cuando una referencia protegida sea suficiente;
- URLs firmadas o parámetros con credenciales;
- diagnósticos sensibles no necesarios para resolver el caso.

Se prefieren referencias protegidas, hashes y metadatos mínimos. Tener acceso al caso no concede acceso automático a la evidencia completa.

---

#### 30. Ownership y autorización

El contrato mantiene estas fronteras:

1. el adaptador puede registrar metadatos, receipts, mappings y evidencia técnica propia;
2. la aplicación propietaria conserva la decisión empresarial;
3. una cola no se convierte en propietaria del hecho;
4. soporte no adquiere autoridad empresarial por recibir el caso;
5. observabilidad puede diagnosticar, no modificar una fuente privada;
6. una compensación se ejecuta dentro de la propietaria del efecto;
7. una corrección de un dominio ajeno se expresa mediante contrato hacia su propietaria;
8. un principal técnico autenticado no implica autorización para retry, reprocess, rechazo o compensación;
9. una credencial externa no concede autoridad transversal en VENTO;
10. compartir Supabase, service role, conexión, esquema o package no transfiere propiedad funcional.

---

#### 31. Aplicación al universo externo vigente

`SHELL-CON-024` adopta las veintiuna identidades externas vigentes sin cambiar su identidad ni fabricar bindings.

La clasificación de contexto conserva la decisión vigente de `SHELL-CON-023`; la última columna expresa únicamente cómo consume cada identidad este contrato de disposición.

| ID            | Sistema / plataforma                     | Clasificación vigente heredada                       | Aplicación de `SHELL-CON-024`                                                                                                                               | Estado documental |
| ------------- | ---------------------------------------- | ---------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------- |
| `EXT-SYS-001` | Supabase                                 | `GOBERNADA_POR_CONTRATO_INTERNO`                     | Las disposiciones se aplican por la superficie propietaria VENTO; no se crea una cuarentena externa universal para toda la plataforma.                      | `ESPECIFICADO`    |
| `EXT-SYS-002` | Wompi                                    | `APLICA_IDEMPOTENCIA_Y_CONCILIACION`                 | Puede usar cuarentena, rechazo y conciliación por unidad; compensación solo sobre efecto confirmado y por su propietaria, nunca por timeout.                | `ESPECIFICADO`    |
| `EXT-SYS-003` | RevenueCat                               | `APLICA_IDEMPOTENCIA_Y_CONCILIACION`                 | Entrada o mapping incompatible puede aislarse; entitlement incierto se concilia antes de corrección o compensación.                                         | `ESPECIFICADO`    |
| `EXT-SYS-004` | Resend                                   | `APLICA_IDEMPOTENCIA_Y_CONCILIACION`                 | Fallos de entrega conservan generación e intento; dead-letter no significa correo entregado o rechazado empresarialmente y no se reenvía a ciegas.          | `ESPECIFICADO`    |
| `EXT-SYS-005` | Expo / EAS Update                        | `PLATAFORMA_TECNICA_SIN_EFECTO_EMPRESARIAL_EN_CORTE` | Consume tratamiento técnico propietario cuando exista; no recibe un ledger, cuarentena empresarial o compensación ficticios.                                | `ESPECIFICADO`    |
| `EXT-SYS-006` | Expo Push Service                        | `APLICA_IDEMPOTENCIA_Y_CONCILIACION`                 | Disposición por destino/generación; un lote no oculta elementos aislados y un resultado desconocido no autoriza redelivery ciego.                           | `ESPECIFICADO`    |
| `EXT-SYS-007` | Sentry                                   | `SIN_LEDGER_DE_EFECTO_EMPRESARIAL`                   | La telemetría best-effort no crea compensación empresarial ni dead-letter de negocio; cualquier aislamiento técnico conserva finalidad y evidencia mínima.  | `ESPECIFICADO`    |
| `EXT-SYS-008` | Google Maps / Google Reviews             | `SIN_LEDGER_DE_EFECTO_EMPRESARIAL`                   | Una lectura interactiva fallida puede rechazarse o degradarse según su propietaria; no se crea dead-letter o compensación empresarial por defecto.          | `ESPECIFICADO`    |
| `EXT-SYS-009` | Apple Wallet / PassKit + APNs            | `APLICA_IDEMPOTENCIA_Y_CONCILIACION`                 | Recurso y push permanecen separados; cada unidad conserva disposición propia y un push incierto no justifica recrear el recurso.                            | `ESPECIFICADO`    |
| `EXT-SYS-010` | Vercel                                   | `PLATAFORMA_TECNICA_SIN_EFECTO_EMPRESARIAL_EN_CORTE` | Consume controles de plataforma/continuidad donde correspondan; no se fabrica una cola empresarial o plan compensatorio remoto.                             | `ESPECIFICADO`    |
| `EXT-SYS-011` | Zebra BrowserPrint                       | `APLICA_IDEMPOTENCIA_Y_CONCILIACION`                 | Resultado físico incierto exige verificación o conciliación antes de reimpresión; intervención manual queda autorizada y auditada por caso.                 | `ESPECIFICADO`    |
| `EXT-SYS-012` | Google Wallet / Google Pay & Wallet      | `MODELO_SIN_BINDING_REMOTO`                          | Sin binding remoto acreditado no se materializa cuarentena, dead-letter o compensación runtime del proveedor.                                               | `NO_APLICA`       |
| `EXT-SYS-013` | POS externo vigente                      | `APLICA_CON_ESPECIALIZACION_POS`                     | Usa el contrato compartido y conserva `EXTERNAL-SALE-LINE-QUARANTINE-001`, las reglas de reverso y la conciliación POS como especializaciones propietarias. | `ESPECIFICADO`    |
| `EXT-SYS-014` | Shopify / canal de comercio electrónico  | `NO_APLICA_SIN_BINDING`                              | No se inventan unidades, razones, colas, dead-letter ni compensaciones sin binding acreditado.                                                              | `NO_APLICA`       |
| `EXT-SYS-015` | Rappi / marketplace                      | `NO_APLICA_SIN_BINDING`                              | No se inventan unidades, razones, colas, dead-letter ni compensaciones sin binding acreditado.                                                              | `NO_APLICA`       |
| `EXT-SYS-016` | ManyChat / automatización conversacional | `NO_APLICA_SIN_BINDING`                              | No se inventan unidades, razones, colas, dead-letter ni compensaciones sin binding acreditado.                                                              | `NO_APLICA`       |
| `EXT-SYS-017` | WhatsApp                                 | `NO_APLICA_SIN_BINDING`                              | No se presume proveedor, API, receipt, retry, cuarentena, dead-letter o compensación sin binding acreditado.                                                | `NO_APLICA`       |
| `EXT-SYS-018` | Instagram / perfiles sociales            | `NO_APLICA_SIN_BINDING`                              | No se inventan unidades, razones, colas, dead-letter ni compensaciones sin binding acreditado.                                                              | `NO_APLICA`       |
| `EXT-SYS-019` | Correo corporativo y alias funcionales   | `NO_APLICA_SIN_BINDING`                              | El canal organizacional no acredita por sí mismo integración runtime ni tratamiento técnico de proveedor.                                                   | `NO_APLICA`       |
| `EXT-SYS-020` | Telefonía / canal de voz                 | `BLOQUEADO_SIN_BINDING`                              | Permanece bloqueado hasta existir proveedor e interfaz acreditados; no se define una disposición específica de operador.                                    | `BLOQUEADO`       |
| `EXT-SYS-021` | Transporte externo                       | `NO_APLICA_SIN_BINDING`                              | Sin proveedor e integración acreditados no se inventan estados de entrega, dead-letter o compensaciones.                                                    | `NO_APLICA`       |

Balance:

```text
1 GOBERNADA_POR_CONTRATO_INTERNO
+ 6 APLICA_IDEMPOTENCIA_Y_CONCILIACION
+ 2 SIN_LEDGER_DE_EFECTO_EMPRESARIAL
+ 2 PLATAFORMA_TECNICA_SIN_EFECTO_EMPRESARIAL_EN_CORTE
+ 1 MODELO_SIN_BINDING_REMOTO
+ 1 APLICA_CON_ESPECIALIZACION_POS
+ 7 NO_APLICA_SIN_BINDING
+ 1 BLOQUEADO_SIN_BINDING
= 21
```

Resultado de integridad del universo documental:

- identidades esperadas: **21**;
- identidades materializadas: **21/21**;
- identificadores únicos: **21**;
- faltantes: **0**;
- duplicados: **0**;
- bindings inventados: **0**;
- compensaciones reales creadas: **0**.

---

#### 32. Especialización vigente del POS externo

`EXT-SYS-013` consume el contrato compartido con estas reglas adicionales ya aprobadas:

1. la unidad de cuarentena propietaria es la línea canónica de venta cuando el bloqueo depende del mapping de producto, presentación o receta;
2. una línea puede preservarse sin ser elegible para efecto físico;
3. una línea `ACTIVE` en cuarentena produce cero efecto NEXO dependiente de producto;
4. liberar cuarentena no ejecuta inventario ni confirma otro efecto;
5. mapping corregido no cambia la identidad de la línea;
6. si existe posibilidad de efecto previo, primero se concilia;
7. reversos, devoluciones y reembolsos conservan la venta y línea originales;
8. NEXO, NUMERA y PASS compensan únicamente sus propios efectos confirmados;
9. no existe rollback global de la venta;
10. la conciliación compara cada efecto y no vuelve a ejecutar los ya confirmados.

Las razones especializadas de `EXTERNAL-SALE-LINE-QUARANTINE-001` permanecen propietarias. Se enlazan mediante `owner_specialization_ref` y `owner_resolution_detail` sin ampliar `IntegrationQuarantineReason`.

---

#### 33. Entrada externa no confiable

Para una entrada externa con autenticidad, integridad o contrato insuficientes:

```text
RECIBIR EVIDENCIA EN FRONTERA CONFIABLE
→ VALIDAR AUTENTICIDAD / INTEGRIDAD / CONTRATO
→ CLASIFICAR FALLO
→ AISLAR O RECHAZAR SEGÚN EVIDENCIA
→ CERO EFECTO EMPRESARIAL POR CONVENIENCIA
```

Reglas:

1. una firma inválida no se convierte en error transitorio por fallback;
2. un payload incompatible no se normaliza a la fuerza;
3. una identidad ambigua no se resuelve por semejanza;
4. un mapping conflictivo no se escoge por orden de llegada;
5. conservar evidencia no valida la afirmación externa;
6. el proveedor no recibe acceso a dominios internos por existir un caso de soporte.

---

#### 34. Lotes, batches y unidades independientes

Para operaciones con varias unidades:

1. cada elemento conserva identidad y disposición propias;
2. una unidad confirmada no se repite porque otra falle;
3. una unidad rechazada no cancela otra independiente;
4. una unidad desconocida no se presenta como fallida para cerrar el batch;
5. un resumen se deriva de las unidades y no las sustituye;
6. dead-letter puede aplicarse a un elemento sin promover todo el lote;
7. compensación se evalúa por efecto confirmado y no por el estado agregado;
8. residuales y responsables se conservan por unidad cuando sea necesario.

---

#### 35. Retry, presupuesto y dead-letter

La relación es:

```text
FALLO REINTENTABLE
→ RETRY MISMA OPERACIÓN DENTRO DEL PRESUPUESTO
→ AGOTAMIENTO
→ CLASIFICAR RESULTADO Y PARCIALIDAD
→ EVALUAR PUERTAS DE DEAD-LETTER
→ INTERVENCIÓN / CONCILIACIÓN / RECHAZO / COMPENSACIÓN SEGÚN EVIDENCIA
```

Nunca:

```text
RETRY_EXHAUSTED
→ PERMANENTLY_REJECT AUTOMÁTICO
```

Nunca:

```text
RETRY_EXHAUSTED
→ DEAD-LETTER COMPLETO SIN LAS SIETE PUERTAS
```

El presupuesto pertenece a la operación y no se reinicia por restart, redeploy, cambio de worker, reencolado o cambio de transportista.

---

#### 36. Auditoría y reconstrucción

Cada caso materializado deberá poder reconstruir:

- qué unidad fue afectada;
- qué propietaria la gobierna;
- qué fallo se observó;
- qué evidencia lo sustenta;
- qué parcialidad se clasificó;
- qué disposición se decidió;
- qué razones o puertas aplicaron;
- quién autorizó una intervención;
- qué intentos existieron;
- qué resultados previos se recuperaron;
- si hubo conciliación;
- si hubo compensación;
- qué residual quedó;
- quién es responsable;
- cuál es la siguiente acción;
- cómo y por qué se cerró.

Una corrección de auditoría crea una nueva entrada enlazada; no altera la evidencia histórica original.

---

#### 37. Superficie lógica compartida

La familia conceptual queda agrupada en:

```text
@vento/contracts/integrations
```

La relación esperada entre contratos es:

```text
ExternalReceivedEvent
→ IntegrationIdempotencyRef
→ ExternalIdentifierMappingRef[]
→ IntegrationDispositionCaseRef cuando exista fallo o parcialidad
   ├── IntegrationQuarantineRef
   ├── IntegrationDeadLetterRef
   ├── IntegrationReconciliationRef
   └── IntegrationCompensationPlanRef
```

Las referencias no implican que todos los objetos existan para toda operación.

`IntegrationDispositionCaseRef` no se inserta como campo obligatorio universal en contratos anteriores por esta tarea documental; su adopción física queda sujeta al ciclo autorizado del package y de cada consumidora.

---

#### 38. Versionado y compatibilidad

1. los vocabularios cerrados se consumen con su significado aprobado;
2. renombrar un valor exige una decisión canónica previa y compatibilidad explícita;
3. ampliar un enum ejecutable no se autoriza desde esta tarea;
4. un contrato físico posterior debe representar valores desconocidos de forma segura y fallar cerrado cuando la semántica no sea reconocible;
5. un cambio incompatible crea una versión contractual sucesora;
6. un caso iniciado conserva la versión que gobernó su decisión;
7. una versión posterior no reinterpreta retrospectivamente un rechazo, cuarentena o compensación anteriores;
8. las especializaciones propietarias mantienen su propia versión y referencia.

---

#### 39. Handoffs físicos y condiciones de salida

| Trabajo posterior                                           | Estado desde esta tarea     | Propietario / tarea                                        | Condición de salida                                                                                                            |
| ----------------------------------------------------------- | --------------------------- | ---------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| persistencia de cuarentena y errores no procesables         | `DEFINIDO_NO_MATERIALIZADO` | `INT-DB-006`                                               | infraestructura autorizada preserva identidad, evidencia, razón, disposición, ownership y lifecycle                            |
| auditoría física de procesamiento, retries y compensaciones | `DEFINIDO_NO_MATERIALIZADO` | `INT-DB-007`                                               | intentos, decisiones, autoridad, resultados y compensaciones quedan reconstruibles                                             |
| conciliación física por integración                         | `DEFINIDO_NO_MATERIALIZADO` | `INT-DB-008`                                               | casos, fuentes comparadas, outcomes y residuales quedan persistidos y operables                                                |
| cola de fallos y recuperación manual                        | `DEFINIDO_NO_MATERIALIZADO` | `QUEUE-ARC-008`                                            | aislamiento durable y recuperación controlada cumplen este contrato                                                            |
| exclusión/concurrencia de reproceso                         | `DEFINIDO_NO_MATERIALIZADO` | `QUEUE-ARC-009`                                            | un mismo caso no produce reprocesos concurrentes incompatibles                                                                 |
| métricas de espera, error y recuperación                    | `DEFINIDO_NO_MATERIALIZADO` | `QUEUE-ARC-011`                                            | observabilidad usa proyecciones sin sustituir el estado propietario                                                            |
| autorización de retry o reprocess                           | `DEFINIDO_NO_MATERIALIZADO` | `QUEUE-ARC-012`                                            | acciones manuales revalidan autoridad y quedan auditadas                                                                       |
| package físico de contratos compartidos                     | `DEFINIDO_NO_MATERIALIZADO` | `SHELL-CI-020::<package_id>`                               | la implementación se abre solo tras `E5-GATE-008::<package_id>` y representa la semántica aprobada sin modificarla             |
| adopción por consumidoras                                   | `DEFINIDO_NO_MATERIALIZADO` | `SHELL-CI-006`; `SHELL-MIG-001..008` para consumidores web | cada consumidora se actualiza mediante PR después de la versión física autorizada; las web además migran por lotes reversibles |

No queda un pendiente material de esta tarea sin propietario y condición de salida.

---

#### 40. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA**

**Requisitos creados:** 0
**Requisitos modificados:** 0

Justificación: `SHELL-CON-024` centraliza en la superficie compartida comportamientos ya definidos y protegidos por las políticas aprobadas de compensación, estados pendientes, error parcial, ownership, cuarentena, dead-letter, intervención, conciliación y especializaciones externas/POS. No introduce una capacidad ejecutable nueva, no cambia un límite numérico, no amplía una taxonomía vigente, no crea un nuevo estado empresarial, no modifica seguridad o autorización y no declara infraestructura física implementada. El registro canónico permanece sin cambios.

---

#### 41. Cobertura de prueba vigente no modificada

Se preserva, entre otra cobertura existente:

- `TREQ-INTEGRATION-108` a `TREQ-INTEGRATION-137`, para idempotencia, identidad, huella, resultado recuperable, concurrencia, replay y retención;
- `TREQ-INTEGRATION-138` a `TREQ-INTEGRATION-167`, para retry, clasificación, resultado desconocido, presupuestos y recuperación;
- `TREQ-INTEGRATION-168` a `TREQ-INTEGRATION-197`, para compensación, causalidad, reversibilidad, planes, idempotencia, resultados y residuales;
- `TREQ-INTEGRATION-228` a `TREQ-INTEGRATION-257`, para pending, conflicto, resultado desconocido y conciliación;
- `TREQ-INTEGRATION-258` a `TREQ-INTEGRATION-287`, para error parcial, alcances, parcialidad, cuarentena, dead-letter, intervención y cierre;
- `TREQ-INTEGRATION-288` a `TREQ-INTEGRATION-306`, para ownership, comandos propietarios, escrituras cruzadas, correcciones y adaptadores externos;
- `TREQ-INTEGRATION-309` y la cobertura posterior del contrato compartido de integraciones, para recepción externa, procedencia y referencias sin fuentes competidoras.

Ningún requisito cambia de identidad, texto, estado, relación, propietaria, evidencia, momento de implementación o secuencia.

---

#### 42. Decisiones vinculantes

1. Existe un único contrato lógico compartido de disposición para integraciones.
2. El caso de disposición tiene identidad propia.
3. Caso, operación, evento, intento, receipt, idempotencia, conciliación y compensación permanecen identidades distintas.
4. Se reutilizan exactamente ocho alcances de fallo.
5. Se reutilizan exactamente nueve clases de parcialidad.
6. Se reutilizan exactamente doce disposiciones.
7. Se reutilizan exactamente ocho razones transversales de cuarentena.
8. Se reutilizan exactamente siete puertas acumulativas de dead-letter.
9. Se reutilizan exactamente diez acciones manuales autorizables.
10. Se reutilizan exactamente ocho outcomes de cierre ya centralizados en `SHELL-CON-023`.
11. Cuarentena no es estado empresarial.
12. Dead-letter no es rechazo empresarial.
13. Retry agotado no implica dead-letter completo.
14. Retry agotado no implica rechazo terminal.
15. Resultado desconocido bloquea repetición ciega.
16. Resultado desconocido se consulta o concilia antes de retry cuando el efecto pudo ocurrir.
17. Resultado desconocido no se compensa por hipótesis.
18. Rechazo terminal exige ausencia de efecto incompatible y ausencia de incertidumbre material.
19. Compensación exige efecto original confirmado.
20. Compensación conserva el efecto original.
21. Compensación tiene identidad e idempotencia propias.
22. Cada propietaria compensa únicamente sus propios efectos.
23. No existe rollback global entre aplicaciones o proveedor.
24. Reprocess de la misma intención conserva identidad, idempotencia y huella compatible.
25. Un nuevo intento técnico puede cambiar `attempt_id` sin cambiar la operación.
26. Cambio material de intención crea corrección o sucesor.
27. Una unidad ya confirmada no se repite por fallo de otra.
28. Lotes conservan resultado por elemento.
29. La intervención manual usa la allowlist vigente y requiere autoridad.
30. El caso no contiene secretos por conveniencia.
31. Evidencia sensible se referencia de forma protegida.
32. La auditoría no sustituye la fuente empresarial.
33. La observabilidad no autoriza acciones.
34. El adaptador no obtiene autoridad transversal.
35. Las especializaciones propietarias pueden conservar detalle sin ampliar enums compartidos.
36. POS conserva la línea como unidad de cuarentena especializada.
37. Liberar una línea POS no ejecuta inventario.
38. Un reverso POS no borra la venta o línea original.
39. `EXT-SYS-013` conserva la especialización POS vigente.
40. `EXT-SYS-020` permanece bloqueado sin binding acreditado.
41. Las siete identidades sin binding no reciben disposiciones runtime ficticias.
42. Las veintiuna identidades externas quedan materializadas en la matriz de adopción.
43. Faltantes de identidad externa en la matriz: cero.
44. Duplicados de identidad externa en la matriz: cero.
45. Casos operativos reales creados: cero.
46. Compensaciones reales ejecutadas: cero.
47. Objetos físicos creados: cero.
48. Código modificado: cero.
49. Supabase modificado: cero.
50. Requisitos de prueba creados o modificados: cero.
51. `SHELL-NORM-001` permanece únicamente reservada.

---

#### 43. Hallazgos y destinos exactos

| Hallazgo                                                                                                                                                   | Estado                       | Destino                                                                                                            |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| la semántica de error parcial, cuarentena y dead-letter estaba definida transversalmente pero no centralizada en la superficie compartida de integraciones | resuelto documentalmente     | `SHELL-CON-024`                                                                                                    |
| la compensación ya posee política transversal completa y no debe duplicarse en un contrato externo                                                         | resuelto por referencia      | `IntegrationCompensationPlanRef` enlaza `ENTERPRISE-EVENT-COMPENSATION-POLICY-001`                                 |
| los outcomes de cierre ya fueron centralizados por `SHELL-CON-023`                                                                                         | resuelto por reutilización   | `IntegrationReconciliationClosureOutcome` se consume sin enum competidor                                           |
| la especialización POS usa razones y unidad propietarias de cuarentena                                                                                     | reconciliado                 | `owner_specialization_ref` y `owner_resolution_detail` conservan el detalle de `EXTERNAL-SALE-LINE-QUARANTINE-001` |
| la matriz histórica de `INT-EXT-016` precede a la evidencia POS posterior                                                                                  | reconciliado por precedencia | `EXT-SYS-013` adopta el estado vigente `APLICA_CON_ESPECIALIZACION_POS`                                            |
| persistencia física de cuarentena aún no existe en esta fase                                                                                               | esperado por fase            | `INT-DB-006`                                                                                                       |
| auditoría física de retries y compensaciones aún no existe en esta fase                                                                                    | esperado por fase            | `INT-DB-007`                                                                                                       |
| conciliación física por integración aún no existe en esta fase                                                                                             | esperado por fase            | `INT-DB-008`                                                                                                       |
| cola de fallos y recuperación manual aún no está materializada desde este contrato                                                                         | esperado por fase            | `QUEUE-ARC-008`                                                                                                    |
| control de concurrencia de reproceso requiere infraestructura posterior                                                                                    | esperado por fase            | `QUEUE-ARC-009`                                                                                                    |
| autorización física de retry/reprocess requiere enforcement posterior                                                                                      | esperado por fase            | `QUEUE-ARC-012`                                                                                                    |

No queda una brecha narrativa sin propietario y condición de salida.

---

#### 44. Criterios de aceptación

`SHELL-CON-024` queda documentalmente completa cuando se cumplen simultáneamente:

1. existe exactamente un contrato lógico compartido para cuarentena, rechazo y compensación;
2. existe una identidad lógica propia para cada caso de disposición;
3. la identidad es estable, opaca y no secreta;
4. no se inventa un formato físico de identificador;
5. se preservan los ocho alcances de fallo sin renombrarlos;
6. se preservan las nueve clases de parcialidad sin renombrarlas;
7. se preservan las doce disposiciones sin renombrarlas;
8. se preservan las ocho razones de cuarentena sin renombrarlas;
9. se preservan las siete puertas de dead-letter sin renombrarlas;
10. se preservan las diez acciones manuales sin renombrarlas;
11. se reutilizan los ocho outcomes de cierre de `SHELL-CON-023`;
12. cuarentena permanece distinta de dead-letter;
13. dead-letter permanece distinto de rechazo terminal;
14. rechazo terminal permanece distinto de resultado desconocido;
15. conciliación permanece distinta de compensación;
16. compensación permanece distinta de retry;
17. contingencia permanece fuera del contrato de disposición;
18. cuarentena conserva identidad, contenido/evidencia, integridad, versión, procedencia, razón, propietaria y siguiente acción;
19. cuarentena no autoejecuta efectos;
20. cuarentena no libera por edad o silencio;
21. dead-letter exige las siete puertas acumulativas;
22. retry agotado no se presenta como dead-letter completo;
23. dead-letter no se presenta como business reject;
24. resultado desconocido exige consulta o conciliación antes de repetir un efecto material;
25. resultado desconocido no se cierra por rechazo;
26. compensación exige efecto original confirmado;
27. compensación conserva original, causalidad e identidad propia;
28. una compensación repetida recupera el resultado previo;
29. no existe rollback global;
30. cada propietaria conserva sus efectos y compensaciones;
31. reprocess de la misma intención conserva identidad e idempotencia;
32. un nuevo intento no crea otro hecho empresarial;
33. cambio material crea corrección o sucesor;
34. intervención manual requiere acción permitida, actor, autoridad, motivo, evidencia y resultado;
35. residuales tienen propietaria, responsable, riesgo, control y seguimiento;
36. no existe cierre desconocido ni automático por edad;
37. el caso lógico aplica minimización y no contiene secretos;
38. se conservan referencias de auditoría sin convertir auditoría en fuente empresarial;
39. se materializan exactamente 21 identidades externas en la matriz;
40. faltantes de identidades externas = 0;
41. duplicados de identidades externas = 0;
42. `EXT-SYS-013` usa especialización POS vigente;
43. `EXT-SYS-020` permanece bloqueado sin binding;
44. no se inventan bindings para sistemas sin evidencia;
45. `INT-DB-006`, `INT-DB-007` e `INT-DB-008` conservan la materialización física posterior;
46. `QUEUE-ARC-008`, `QUEUE-ARC-009`, `QUEUE-ARC-011` y `QUEUE-ARC-012` conservan infraestructura y operación posterior;
47. no se crean tablas, índices, RPC, RLS, colas, workers o migraciones;
48. no se modifica Supabase;
49. no se modifica código;
50. se crean cero requisitos de prueba;
51. se modifican cero requisitos de prueba;
52. la continuidad reserva exclusivamente `SHELL-NORM-001`.

---

#### 45. Límites finales de la tarea

`SHELL-CON-024` no:

- implementa `@vento/contracts`;
- crea archivos TypeScript;
- publica versiones de package;
- crea schemas ejecutables;
- crea tablas, columnas, índices o constraints;
- crea migraciones;
- crea RLS, grants, RPC o funciones;
- crea colas, topics, workers, cron o schedulers;
- crea registros reales de cuarentena;
- mueve elementos reales a dead-letter;
- rechaza operaciones reales;
- ejecuta retries o reprocess;
- ejecuta compensaciones;
- cambia ledgers o saldos;
- modifica ventas, líneas, pagos, puntos o inventario;
- crea casos de conciliación reales;
- modifica proveedores, cuentas, endpoints o credenciales;
- crea secretos;
- cambia decisiones de `INT-APP-006`, `INT-APP-009`, `INT-EXT-016`, `INT-POS-012`, `INT-POS-019` o `INT-POS-020`;
- restaura diagnósticos históricos que hayan sido superados por evidencia posterior aprobada;
- modifica código;
- modifica Supabase;
- cambia la ruta canónica;
- desarrolla `SHELL-NORM-001`.

---

#### 46. Continuidad

##### ÚLTIMA TAREA APROBADA

SHELL-CON-023 — Crear contrato de idempotencia y conciliación

##### TAREA ACTUAL APROBADA

SHELL-CON-024 — Crear contrato de cuarentena, rechazo y compensación

##### SIGUIENTE TAREA RESERVADA

SHELL-NORM-001 — Crear `@vento/data-normalization`
