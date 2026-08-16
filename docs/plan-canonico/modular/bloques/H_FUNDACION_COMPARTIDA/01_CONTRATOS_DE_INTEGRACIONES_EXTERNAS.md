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


### [ ] SHELL-CON-018 — Crear contrato de referencia de credencial externa sin incluir el secreto
### [ ] SHELL-CON-019 — Crear contrato de evento externo recibido
### [ ] SHELL-CON-020 — Crear contrato canónico de venta
### [ ] SHELL-CON-021 — Crear contrato canónico de línea de venta
### [ ] SHELL-CON-022 — Crear contrato de mapeo de identificadores externos
### [ ] SHELL-CON-023 — Crear contrato de idempotencia y conciliación
### [ ] SHELL-CON-024 — Crear contrato de cuarentena, rechazo y compensación
