### CONTRATOS DE INTEGRACIONES EXTERNAS

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
2. la forma física TypeScript, JSON Schema o generación exacta se decidirá al materializar el package bajo las puertas aplicables;
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

La materialización física queda condicionada por las puertas de implementación aplicables y por las tareas propietarias de package, datos, integración y consumidores.

Esta tarea no cambia el estado de ningún expediente E5 ni autoriza implementación fuera del ciclo aprobado.

---

#### 25. Handoffs exactos

| Pendiente                                         | Propietario existente                                       | Condición de salida                                                         |
| ------------------------------------------------- | ----------------------------------------------------------- | --------------------------------------------------------------------------- |
| referencia compartida de credencial sin secreto   | `SHELL-CON-018`                                             | contrato lógico aprobado y posteriormente materializado sin exponer secreto |
| evento externo recibido                           | `SHELL-CON-019`                                             | sobre y semántica de recepción definidos                                    |
| contrato canónico de venta                        | `SHELL-CON-020`                                             | venta compartida definida sin doble fuente                                  |
| contrato canónico de línea de venta               | `SHELL-CON-021`                                             | línea compartida y correlacionable definida                                 |
| mapeo de identificadores externos                 | `SHELL-CON-022`                                             | referencias externas/canónicas gobernadas sin equivalencias heurísticas     |
| idempotencia y conciliación                       | `SHELL-CON-023`                                             | identidad de operación, resultado y reconciliación definidos                |
| cuarentena, rechazo y compensación                | `SHELL-CON-024`                                             | tratamiento de entrada inválida o efecto fallido definido                   |
| procedencia de credenciales                       | `INT-EXT-003`                                               | cada superficie aplicable clasificada                                       |
| mecanismo de autenticación                        | `INT-EXT-004`                                               | mecanismo por integración aprobado                                          |
| least privilege técnico                           | `INT-EXT-005`                                               | alcance mínimo definido                                                     |
| separación de ambientes                           | `INT-EXT-006`                                               | aislamiento aplicable definido                                              |
| almacenamiento, rotación y revocación de secretos | `INT-EXT-007` / `INT-EXT-008`                               | ciclo de credencial definido                                                |
| persistencia física                               | `INT-DB-001` a `INT-DB-008` cuando corresponda              | infraestructura autorizada materializa identidad y auditoría                |
| adopción compartida                               | tareas `SHELL-MIG-*`, `SHELL-CI-*` y paquetes E5 aplicables | consumidores migrados y certificados                                        |

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

| Hallazgo                                                                                                              | Estado                                  | Destino                                                                               |
| --------------------------------------------------------------------------------------------------------------------- | --------------------------------------- | ------------------------------------------------------------------------------------- |
| el contrato semántico de principal técnico ya existe en `INT-EXT-002` pero no está centralizado en `@vento/contracts` | resuelto documentalmente por esta tarea | `SHELL-CON-017`                                                                       |
| no existen valores físicos acreditados de `IntegrationPrincipalId` para las 21 identidades                            | esperado por fase                       | materialización autorizada por binding y tareas físicas propietarias                  |
| 11 identidades poseen binding/configuración observados pero principal físico no acreditado                            | `PENDIENTE_DE_EVIDENCIA` heredado       | propietarios definidos en `INT-EXT-002`                                               |
| 10 identidades no poseen binding acreditado                                                                           | `NO_APLICA` actualmente                 | adoptar principal antes de activar un binding futuro                                  |
| referencia contractual de credencial aún no está centralizada                                                         | reservado                               | `SHELL-CON-018`                                                                       |
| `PrincipalContext.SYSTEM_SERVICE` ya existe y puede solaparse operativamente con una integración                      | conciliado conceptualmente              | conservar separación `SYSTEM_SERVICE` / `IntegrationPrincipal` en runtime y contratos |
| persistencia física del registro de integración no existe como resultado de esta tarea                                | fuera de alcance                        | `INT-DB-001` a `INT-DB-008` cuando corresponda                                        |

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

La tarea no cambia el estado de paquetes E5 ni autoriza implementación física fuera de las puertas aplicables.

---

#### 26. Handoffs exactos

| Pendiente                                    | Propietario existente                                           | Condición de salida                                                                   |
| -------------------------------------------- | --------------------------------------------------------------- | ------------------------------------------------------------------------------------- |
| evento externo recibido                      | `SHELL-CON-019`                                                 | contrato compartido de recepción externa definido sin convertir credencial en payload |
| contrato canónico de venta                   | `SHELL-CON-020`                                                 | venta compartida definida sin doble fuente                                            |
| contrato canónico de línea de venta          | `SHELL-CON-021`                                                 | línea compartida y correlacionable definida                                           |
| mapeo de identificadores externos            | `SHELL-CON-022`                                                 | equivalencias gobernadas sin heurísticas                                              |
| idempotencia y conciliación                  | `SHELL-CON-023`                                                 | identidad de operación y reconciliación definidas                                     |
| cuarentena, rechazo y compensación           | `SHELL-CON-024`                                                 | tratamiento de entrada inválida o efecto fallido definido                             |
| binding y persistencia física de integración | `INT-DB-001` a `INT-DB-008` cuando corresponda                  | infraestructura autorizada materializa referencias y auditoría sin secretos           |
| resolución runtime de credenciales           | packages y adapters propietarios bajo implementación autorizada | `ExternalCredentialRef` se resuelve solo en runtime autorizado y por ambiente         |
| adopción y compatibilidad                    | tareas `SHELL-MIG-*`, `SHELL-CI-*` y paquetes E5 aplicables     | consumidores migrados, probados y certificados                                        |

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

| Hallazgo                                                                                                                | Estado                                                                    | Destino                                                                        |
| ----------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------- | ------------------------------------------------------------------------------ |
| la semántica de referencia de credencial estaba distribuida entre `INT-EXT-003..008`                                    | resuelto documentalmente                                                  | `SHELL-CON-018`                                                                |
| no existen valores físicos canónicos acreditados de `ExternalCredentialId` como resultado de esta fase                  | `PENDIENTE_DE_EVIDENCIA` cuando existe credencial/configuración relevante | implementación propietaria autorizada por binding                              |
| siete identidades poseen superficies de credencial observadas, pero la referencia física canónica no está materializada | `PENDIENTE_DE_EVIDENCIA`                                                  | implementación propietaria bajo contratos `INT-EXT-*` y gates aplicables       |
| dos plataformas tienen configuración observada sin credencial administrativa acreditada                                 | `PENDIENTE_DE_EVIDENCIA`                                                  | acreditar credencial real antes de crear referencia física                     |
| Expo Push y Zebra BrowserPrint no presentan credencial externa de cliente en el binding observado                       | `NO_APLICA`                                                               | crear referencia solo si un binding futuro introduce credencial real           |
| Google Wallet tiene modelo documentado sin binding acreditado                                                           | `NO_APLICA_ACTUAL`                                                        | acreditar binding antes de materializar referencia                             |
| nueve identidades restantes carecen de binding/credencial acreditados                                                   | `NO_APLICA_ACTUAL`                                                        | adoptar referencia antes de activación futura cuando el mecanismo la requiera  |
| Apple Wallet / PassKit y APNs conserva brechas de custodia/lifecycle ya documentadas                                    | no resuelto por esta tarea                                                | propietarios de `INT-EXT-007`, `INT-EXT-008` e implementación física aplicable |

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


### [ ] SHELL-CON-019 — Crear contrato de evento externo recibido
### [ ] SHELL-CON-020 — Crear contrato canónico de venta
### [ ] SHELL-CON-021 — Crear contrato canónico de línea de venta
### [ ] SHELL-CON-022 — Crear contrato de mapeo de identificadores externos
### [ ] SHELL-CON-023 — Crear contrato de idempotencia y conciliación
### [ ] SHELL-CON-024 — Crear contrato de cuarentena, rechazo y compensación
