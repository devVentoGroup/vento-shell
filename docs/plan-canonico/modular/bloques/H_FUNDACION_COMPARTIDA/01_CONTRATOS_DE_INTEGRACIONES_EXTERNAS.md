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


### ✅ SHELL-CON-019 — Crear contrato de evento externo recibido

**Estado:** APROBADA  
**Tarea anterior:** `SHELL-CON-018 — Crear contrato de referencia de credencial externa sin incluir el secreto` — APROBADA  
**Tarea siguiente:** `SHELL-CON-020 — Crear contrato canónico de venta` — RESERVADA  
**Tipo de tarea:** Documental; definición normativa y materializada del contrato compartido de evento externo recibido, con sobre estable, versión, identidad de recepción, referencia de autenticidad, evidencia fuente protegida, afirmación normalizada, referencias de mapping, idempotencia y correlación, sin convertir al tercero en fuente empresarial ni implementar código, persistencia, endpoints o transporte  
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
6. la publicación física de versiones permanece sujeta al ciclo de package y release aprobado para `@vento/contracts`.

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

| Trabajo posterior                       | Estado desde esta tarea     | Propietario / tarea                              | Condición de salida                                                                                                                                                            |
| --------------------------------------- | --------------------------- | ------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| contrato canónico de venta              | `FUERA_DE_ALCANCE`          | `SHELL-CON-020`                                  | la afirmación externa que corresponda a una venta puede convertirse por la propietaria en contrato canónico de venta sin conservar semántica del proveedor como fuente interna |
| contrato canónico de línea de venta     | `FUERA_DE_ALCANCE`          | `SHELL-CON-021`                                  | las líneas quedan representadas por identidad y semántica canónicas sin depender del payload nativo externo                                                                    |
| mapping compartido de identificadores   | `FUERA_DE_ALCANCE`          | `SHELL-CON-022`                                  | `mapping_refs` puede apuntar a una representación compartida tipada y sin heurísticas de identidad                                                                             |
| idempotencia y conciliación compartidas | `FUERA_DE_ALCANCE`          | `SHELL-CON-023`                                  | `idempotency_ref` y resultados recuperables usan el contrato compartido aprobado sin fusionar evento, receipt y efecto                                                         |
| cuarentena, rechazo y compensación      | `FUERA_DE_ALCANCE`          | `SHELL-CON-024`                                  | autenticidad fallida, incompatibilidad, mapping irresoluble, conflicto o entrada no procesable tienen disposición explícita sin efecto silencioso                              |
| implementación física de la superficie  | `DEFINIDO_NO_MATERIALIZADO` | ciclo de package y release de `@vento/contracts` | existe habilitación física del expediente de package correspondiente y se materializa la superficie sin alterar este contrato documental                                       |

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

ÚLTIMA TAREA APROBADA

`SHELL-CON-018 — Crear contrato de referencia de credencial externa sin incluir el secreto`

TAREA ACTUAL APROBADA

`SHELL-CON-019 — Crear contrato de evento externo recibido`

SIGUIENTE TAREA RESERVADA

`SHELL-CON-020 — Crear contrato canónico de venta`


### [ ] SHELL-CON-020 — Crear contrato canónico de venta
### [ ] SHELL-CON-021 — Crear contrato canónico de línea de venta
### [ ] SHELL-CON-022 — Crear contrato de mapeo de identificadores externos
### [ ] SHELL-CON-023 — Crear contrato de idempotencia y conciliación
### [ ] SHELL-CON-024 — Crear contrato de cuarentena, rechazo y compensación
