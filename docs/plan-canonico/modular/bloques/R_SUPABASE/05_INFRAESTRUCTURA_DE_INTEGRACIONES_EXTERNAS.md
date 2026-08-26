### INFRAESTRUCTURA DE INTEGRACIONES EXTERNAS

<!-- EXECUTION-GATE-RECONCILIATION:B201-400:INT-DB -->
#### Reconciliación topológica de INT-DB-001 a INT-DB-008

La infraestructura física de una integración externa pertenece al package_id que la activa.

| Propiedad     | Valor                     |
| ------------- | ------------------------- |
| modalidad     | `TEMPLATE_PER_PACKAGE`    |
| gate temporal | `POST_E5_PACKAGE`         |
| identidad     | `<task_id>::<package_id>` |

Cada integración deberá haber sido incluida expresamente en DELIV-PKG y haber superado su puerta E5 antes de materializar tablas, colas, credenciales, políticas, funciones, jobs, sincronizaciones o efectos remotos asociados.

La existencia de patrones comunes no crea una ejecución global implícita ni autoriza configurar una integración que no pertenezca al paquete aprobado.

### ✅ INT-DB-001 — Crear registro de sistemas e integraciones externas

**Estado:** APROBADA
**Tarea anterior:** DATA-NORM-DB-010 — Probar idempotencia, rollback y ausencia de cambios semánticos
**Tarea siguiente:** INT-DB-002 — Crear referencias de credenciales sin almacenar secretos en tablas expuestas
**Tipo de tarea:** Documental; contrato y plantilla R2 repetible por `package_id` para materializar un registro versionado de sistemas externos, integraciones, instancias, cuentas referenciadas, ownership, finalidad, ambiente y bindings técnicos sin crear credenciales, secretos, staging de payloads, mapeos de identificadores, deduplicación, cuarentena, auditoría de procesamiento ni mecanismos de conciliación durante esta definición
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/05_INFRAESTRUCTURA_DE_INTEGRACIONES_EXTERNAS.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`; contrato canónico `TEMPLATE_PER_PACKAGE` cerrado para futuras instancias `INT-DB-001::<package_id>`, sujetas a `POST_E5_PACKAGE`, al inventario externo vigente, al expediente E5 del paquete, a recaptura de drift y a autorización física explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0
**Fecha de corte:** 2026-08-25

---

#### 1. Propósito

`INT-DB-001` define el registro físico que deberá usar cada paquete aprobado para representar sistemas externos e integraciones de VENTO sin confundir plataforma, instancia, cuenta, principal técnico, credencial, contrato, endpoint, propietario empresarial ni responsable técnico.

La tarea convierte el inventario documental aprobado de BLOQUE X en un contrato de persistencia por paquete, pero no ejecuta DDL, DML, migraciones, seeds, cambios remotos ni configuración de proveedores.

El registro deberá permitir responder de forma reproducible:

1. qué sistema externo está involucrado;
2. qué integración VENTO lo consume o publica;
3. a qué `package_id` pertenece esa integración;
4. qué instancia externa concreta está acreditada;
5. qué cuenta externa está referenciada sin almacenar secretos;
6. qué contrato y endpoint gobiernan el binding;
7. qué aplicación o dominio conserva el hecho empresarial;
8. quién conserva la responsabilidad técnica;
9. en qué ambiente existe el binding;
10. qué evidencia permite declarar la integración registrada, activa, suspendida o retirada;
11. qué versión del registro produjo una decisión;
12. qué dependencias posteriores deberán enlazarse a la misma identidad estable.

---

#### 2. Resultado canónico

Queda definido:

```text
INT-DB-001
→ contrato documental único y reutilizable

INT-DB-001::<package_id>
→ futura instancia física por paquete

inventario externo canónico
→ selección explícita del paquete
→ sistema externo
→ integración VENTO
→ binding por ambiente
→ ownership y finalidad
→ referencias técnicas no secretas
→ versión inmutable
→ evidencia de activación
→ handoff estable hacia INT-DB-002..008
```

La definición global no se reabre por cada paquete.

Una futura instancia puede cerrar sin materializar una integración cuando el `package_id` no contenga ningún binding externo aplicable. Ese cierre deberá quedar demostrado como `NO_APPLICABLE` para el paquete y no autoriza una ejecución global.

---

#### 3. Topología vinculante

La topología aplicable es:

```text
mode = TEMPLATE_PER_PACKAGE
execution_gate = POST_E5_PACKAGE
instance_pattern = INT-DB-001::<package_id>
```

Consecuencias:

1. no existe `INT-DB-001::GLOBAL`;
2. cada `package_id` conserva su propio conjunto de integraciones y evidencia;
3. el registro de un paquete no habilita integraciones de otro;
4. una plataforma compartida puede aparecer en varios paquetes sin fusionar sus bindings;
5. la definición documental no crea tablas ni registros remotos;
6. la existencia de infraestructura compartida no cambia la cardinalidad por paquete.

---

#### 4. Gate temporal

Una futura instancia solo podrá materializar el registro cuando, para el mismo `package_id`, estén satisfechas las puertas físicas aplicables.

Como mínimo:

```text
package E5 aplicable = CERRADO
E5-GATE-008::<package_id> = PASS
drift aplicable = RECONCILED
inventario externo = VIGENTE
binding del paquete = EXPLÍCITO
ownership = RESUELTO
rollback = PREPARADO
physical_authorization = EXPLICIT
```

Si el paquete no ha superado E5, la tarea permanece especificada pero no materializada.

---

#### 5. Fuentes vinculantes

Cada futura instancia deberá consumir sin reinterpretación silenciosa:

- `INT-EXT-001` y `VENTO-EXTERNAL-SYSTEM-INVENTORY-001`;
- `INT-EXT-002` a `INT-EXT-020` para principal técnico, procedencia de credenciales, autenticación, alcance, ambientes, custodia, lifecycle, contratos, transporte, autenticidad, idempotencia, mappings, payload original, retry, cuarentena, auditoría, contingencia, retiro y segregación;
- `INT-APP-001` a `INT-APP-010` para propiedad, productor, consumidor, autoridad, idempotencia, trazabilidad y prohibición de escritura cruzada;
- `DELIV-PKG` y `E5-GATE` aplicables al `package_id`;
- BLOQUE Z para infraestructura, soporte, health y dependencias tecnológicas;
- BLOQUE E4 para capacidades transversales materializadas;
- los contratos de datos, autorización y consumidores del paquete;
- el registro canónico de requisitos de prueba vigente;
- el estado remoto recapturado al iniciar la futura instancia.

Una discrepancia entre inventario, paquete, código y remoto se clasifica como drift y bloquea únicamente la materialización afectada.

---

#### 6. Universo canónico heredado

`INT-EXT-001` materializa 21 identidades externas estables.

`INT-DB-001` conserva exactamente ese universo como catálogo de referencia y no crea un vigésimo segundo sistema por inferencia.

| ID            | Sistema / plataforma                     | Evidencia heredada                   | Disposición del registro                                              |
| ------------- | ---------------------------------------- | ------------------------------------ | --------------------------------------------------------------------- |
| `EXT-SYS-001` | Supabase                                 | `BINDING_TECNICO_OBSERVADO`          | catálogo canónico; materialización solo si el paquete lo incluye      |
| `EXT-SYS-002` | Wompi                                    | `BINDING_CONDICIONAL_OBSERVADO`      | catálogo canónico; binding por paquete y ambiente                     |
| `EXT-SYS-003` | RevenueCat                               | `BINDING_CONDICIONAL_OBSERVADO`      | catálogo canónico; binding por paquete y ambiente                     |
| `EXT-SYS-004` | Resend                                   | `BINDING_CONDICIONAL_OBSERVADO`      | catálogo canónico; binding por paquete y ambiente                     |
| `EXT-SYS-005` | Expo / EAS Update                        | `CONFIGURACION_OBSERVADA`            | catálogo canónico; configuración no equivale a integración activa     |
| `EXT-SYS-006` | Expo Push Service                        | `BINDING_TECNICO_OBSERVADO`          | catálogo canónico; binding por paquete y ambiente                     |
| `EXT-SYS-007` | Sentry                                   | `BINDING_CONDICIONAL_OBSERVADO`      | catálogo canónico; binding condicionado a evidencia vigente           |
| `EXT-SYS-008` | Google Maps / Google Reviews             | `BINDING_CONDICIONAL_OBSERVADO`      | catálogo canónico; separar APIs autenticadas de enlaces públicos      |
| `EXT-SYS-009` | Apple Wallet / PassKit y APNs            | `BINDING_CONDICIONAL_OBSERVADO`      | catálogo canónico; subbindings separados cuando corresponda           |
| `EXT-SYS-010` | Vercel                                   | `CONFIGURACION_OBSERVADA`            | catálogo canónico; hosting no acredita cuenta o integración operativa |
| `EXT-SYS-011` | Zebra BrowserPrint                       | `BINDING_TECNICO_OBSERVADO`          | catálogo canónico; bridge local no se confunde con credencial         |
| `EXT-SYS-012` | Google Wallet / Google Pay & Wallet      | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | catálogo canónico; no materializar binding operativo sin evidencia    |
| `EXT-SYS-013` | POS externo vigente                      | `PROVEEDOR_NO_ACREDITADO`            | catálogo canónico; bloqueado hasta acreditar proveedor e interfaz     |
| `EXT-SYS-014` | Shopify / canal de comercio electrónico  | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | catálogo canónico; no activar por sola mención                        |
| `EXT-SYS-015` | Rappi / marketplace                      | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | catálogo canónico; no activar por sola mención                        |
| `EXT-SYS-016` | ManyChat / automatización conversacional | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | catálogo canónico; no activar por sola mención                        |
| `EXT-SYS-017` | WhatsApp                                 | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | catálogo canónico; proveedor/API deben acreditarse                    |
| `EXT-SYS-018` | Instagram / perfiles sociales            | `DOCUMENTADO_SIN_BINDING_ACREDITADO` | catálogo canónico; cuenta/API no se presumen                          |
| `EXT-SYS-019` | Correo corporativo y alias funcionales   | `PROVEEDOR_NO_ACREDITADO`            | catálogo canónico; proveedor y binding permanecen explícitos          |
| `EXT-SYS-020` | Telefonía / canal de voz                 | `PROVEEDOR_NO_ACREDITADO`            | catálogo canónico; operador e integración no se presumen              |
| `EXT-SYS-021` | Transporte externo                       | `PROVEEDOR_NO_ACREDITADO`            | catálogo canónico; proveedor, SLA, tracking y API no se presumen      |

Balance documental:

```text
identidades heredadas = 21
identidades conservadas = 21
faltantes = 0
duplicados = 0
identidades nuevas = 0
```

---

#### 7. Separación de identidades

El registro preserva la separación ya aprobada:

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

`INT-DB-001` materializa únicamente la identidad y metadata de sistema, integración y binding no secreto.

No materializa `external_credential_id`; esa responsabilidad pertenece a `INT-DB-002`.

---

#### 8. Identidad estable de integración

Se define `external_integration_id` como identidad estable de la relación técnica entre VENTO y un sistema externo dentro de un alcance aprobado.

Reglas:

1. pertenece a exactamente un `external_system_id`;
2. pertenece a exactamente un `package_id` propietario;
3. no se deriva de una URL, token, cuenta, nombre visible ni secreto;
4. no cambia por rotación de credenciales;
5. no cambia por una nueva versión compatible del contrato;
6. no se reutiliza para otra finalidad;
7. no se reutiliza para otro paquete;
8. no se elimina para ocultar historia;
9. es la FK lógica que consumirán `INT-DB-002` a `INT-DB-008`;
10. dos bindings con distinta autoridad, finalidad o aislamiento operativo requieren identidades distintas.

---

#### 9. Familia lógica `EXTERNAL_SYSTEM_REGISTRY_RECORD`

Cada sistema materializado por un paquete deberá conservar como mínimo:

```text
external_system_id
system_name
provider_ref
provider_evidence_state
business_owner_ref
technical_owner_ref
purpose
inventory_source_id
inventory_source_version
inventory_source_digest
record_status
effective_from
effective_to
created_at
created_by_ref
```

Reglas:

1. `external_system_id` conserva `EXT-SYS-*`;
2. `provider_ref` puede ser nulo cuando el proveedor no esté acreditado;
3. ausencia de proveedor no autoriza inventarlo;
4. `purpose` conserva la finalidad aprobada;
5. el registro no convierte la plataforma en propietaria del hecho empresarial;
6. `inventory_source_digest` permite detectar drift contra la definición canónica;
7. la vigencia se conserva sin sobrescribir historia.

---

#### 10. Familia lógica `EXTERNAL_INTEGRATION_REGISTRY_RECORD`

Cada integración concreta deberá conservar como mínimo:

```text
external_integration_id
external_system_id
package_id
integration_name
integration_purpose
direction
business_owner_ref
technical_owner_ref
integration_principal_id
contract_version
registry_version
content_digest
registry_status
effective_from
effective_to
supersedes_registry_version_id
source_definition_ref
source_definition_digest
created_at
created_by_ref
```

`direction` clasifica la dirección del intercambio y no autoriza operaciones por sí misma.

El registro de integración no almacena payloads de negocio, secretos ni resultados de procesamiento.

---

#### 11. Familia lógica `EXTERNAL_INTEGRATION_ENVIRONMENT_BINDING`

Cuando una integración posea una instancia externa acreditada en un ambiente, el binding deberá conservar:

```text
external_environment_binding_id
external_integration_id
environment_ref
external_instance_id
provider_account_ref
endpoint_ref
binding_evidence_state
binding_status
valid_from
valid_to
source_evidence_ref
source_evidence_digest
```

Reglas:

1. una integración puede tener cero o más bindings ambientales;
2. un binding ambiental pertenece a una sola integración;
3. `external_instance_id` no se inventa si no existe evidencia;
4. `provider_account_ref` es una referencia, no un secreto;
5. `endpoint_ref` no puede contener credenciales embebidas;
6. un ambiente no hereda silenciosamente instancia, cuenta o endpoint de otro;
7. una configuración observable no equivale por sí sola a activación operativa.

---

#### 12. Cardinalidad

La cardinalidad lógica queda cerrada:

```text
external_system_id
1 → N external_integration_id

external_integration_id
1 → N external_environment_binding_id

package_id
1 → N external_integration_id
```

Invariantes:

1. un `external_integration_id` no puede apuntar a dos sistemas;
2. un `external_environment_binding_id` no puede apuntar a dos ambientes;
3. el mismo sistema puede participar en varios paquetes mediante integraciones distintas;
4. la misma integración no puede pertenecer simultáneamente a dos paquetes;
5. la misma cuenta externa puede ser referenciada por bindings diferentes solo cuando el contrato aprobado lo permita y sin compartir credenciales por inferencia.

---

#### 13. Unicidad

La materialización física deberá imponer unicidad equivalente a:

```text
external_system_id = UNIQUE por catálogo de sistema
external_integration_id = UNIQUE global
external_environment_binding_id = UNIQUE global
(external_integration_id, environment_ref, external_instance_id) = no duplicado
```

Cuando `external_instance_id` sea nulo, la unicidad del binding deberá resolverse mediante la identidad estable del binding y no mediante un valor ficticio.

---

#### 14. Ownership

Toda integración deberá mantener separados:

```text
business_owner_ref
technical_owner_ref
integration_principal_id
human_actor_ref
provider_ref
```

`business_owner_ref` conserva la autoridad sobre el hecho empresarial.

`technical_owner_ref` conserva operación, mantenimiento y troubleshooting del binding.

El proveedor externo no adquiere ownership empresarial.

El principal técnico no reemplaza al actor humano causal.

---

#### 15. Estado de evidencia

`provider_evidence_state` y `binding_evidence_state` preservan la evidencia heredada y no son estados de operación.

Como mínimo deberán poder expresar los estados documentales vigentes:

```text
BINDING_TECNICO_OBSERVADO
BINDING_CONDICIONAL_OBSERVADO
CONFIGURACION_OBSERVADA
DOCUMENTADO_SIN_BINDING_ACREDITADO
PROVEEDOR_NO_ACREDITADO
```

Ninguno equivale automáticamente a `ACTIVE`.

---

#### 16. Estado de registro

Se define un lifecycle separado para el registro físico:

```text
REGISTERED
ACTIVATION_PENDING
ACTIVE
SUSPENDED
RETIRED
BLOCKED_BY_EVIDENCE
```

Reglas:

1. `REGISTERED` significa identidad persistida y trazable;
2. `ACTIVATION_PENDING` exige evidencia adicional antes de efectos remotos;
3. `ACTIVE` requiere evidencia de activación del paquete y no se deriva del inventario;
4. `SUSPENDED` impide nuevos efectos sin borrar historia;
5. `RETIRED` impide nuevos usos y conserva referencias históricas;
6. `BLOCKED_BY_EVIDENCE` representa un binding que no puede activarse por información insuficiente;
7. una transición de estado conserva actor o principal, timestamp, motivo y versión.

---

#### 17. Versionado

Las revisiones del registro son inmutables.

Cada cambio normativo de sistema, provider binding, finalidad, ownership, ambiente, instancia, cuenta referenciada, endpoint referenciado, contrato, estado o vigencia crea una nueva `registry_version` o versión de binding y conserva la versión previa.

Queda prohibido reutilizar una versión para contenido distinto.

`content_digest` deberá cubrir el contenido normativo de la versión excluyendo timestamps operativos no deterministas.

---

#### 18. Regla de activación

Un registro persistido no habilita por sí mismo una integración.

Para declarar `ACTIVE` deberán existir, según aplique:

```text
package_id aprobado
E5-GATE-008::<package_id> = PASS
external_system_id vigente
external_integration_id vigente
binding ambiental acreditado
contract_version aprobada
business_owner_ref resuelto
technical_owner_ref resuelto
principal técnico aplicable resuelto
credencial aplicable referenciada por INT-DB-002
controles downstream aplicables cerrados
physical_authorization = EXPLICIT
```

Si una integración no usa credencial externa, la condición de credencial se resuelve como `NOT_APPLICABLE`, no mediante una credencial ficticia.

---

#### 19. Frontera con INT-DB-002

`INT-DB-002` es propietario de la referencia de credencial externa.

`INT-DB-001` no almacena API keys, client secrets, certificados privados, passwords, service account JSON, bearer tokens, webhook secrets, valores OAuth, valores de `service_role`, tokens de dispositivo ni secretos embebidos en URLs.

El handoff hacia `INT-DB-002` es:

```text
external_integration_id
external_environment_binding_id
external_system_id
external_instance_id
environment_ref
integration_principal_id cuando aplique
```

---

#### 20. Frontera con INT-DB-003

`INT-DB-003` es propietario del staging inmutable de payloads externos.

`INT-DB-001` no conserva body de webhook, payload original, headers completos, archivos recibidos, respuesta externa, adjuntos, raw request ni raw response.

Solo conserva referencias de identidad necesarias para que el staging posterior pueda correlacionarse.

---

#### 21. Frontera con INT-DB-004

`INT-DB-004` es propietario del mapeo de identificadores externos y canónicos.

`INT-DB-001` no crea equivalencias entre identidades externas y canónicas de entidades empresariales.

El registro solo define la integración que será propietaria del mapping posterior.

---

#### 22. Frontera con INT-DB-005

`INT-DB-005` es propietario de restricciones e índices de idempotencia.

`INT-DB-001` no almacena idempotency keys, hashes de operación ni resultados recuperables.

Solo entrega `external_integration_id` y el binding ambiental como dimensión estable para la clave idempotente posterior.

---

#### 23. Frontera con INT-DB-006

`INT-DB-006` es propietario de cuarentena y errores no procesables.

`INT-DB-001` no crea dead-letter, quarantine payloads, razones de descarte ni workflows de reparación.

Solo aporta la identidad de integración y ambiente.

---

#### 24. Frontera con INT-DB-007

`INT-DB-007` es propietario de auditoría de procesamiento, reintentos y compensaciones.

`INT-DB-001` no se convierte en ledger operacional.

Los cambios de metadata del registro y la auditoría de procesamiento son responsabilidades distintas.

---

#### 25. Frontera con INT-DB-008

`INT-DB-008` es propietario de mecanismos de conciliación por integración.

`INT-DB-001` no ejecuta reconciliation jobs ni persiste resultados de conciliación.

Entrega la identidad estable que permitirá seleccionar exactamente qué integración debe reconciliarse.

---

#### 26. Ambientes

Todo binding físico deberá usar la taxonomía de ambientes aprobada por el paquete.

Reglas:

1. desarrollo, CI, staging, preview y producción no se fusionan;
2. una cuenta o proyecto externo puede ser compartido entre ambientes solo con evidencia y decisión explícita;
3. una URL de staging no puede activar producción;
4. credenciales se gobiernan separadamente en `INT-DB-002`;
5. un binding faltante se representa como ausencia o estado bloqueado, nunca copiando el de otro ambiente.

---

#### 27. Integridad referencial

Toda materialización futura deberá bloquear:

1. integración sin sistema;
2. integración sin `package_id`;
3. integración sin finalidad;
4. integración sin ownership empresarial;
5. integración sin ownership técnico o regla explícita de custodia;
6. binding ambiental sin integración;
7. binding ambiental con ambiente desconocido;
8. endpoint con secreto embebido;
9. referencia a `EXT-SYS-*` inexistente;
10. duplicado de identidad estable;
11. versión con digest incompatible;
12. transición de estado sin motivo;
13. activación de binding bloqueado por evidencia.

---

#### 28. Fuente de verdad

La fuente de cambio continúa en `vento-shell`.

El registro remoto materializado no crea sistemas externos por observación, no redefine proveedores, no cambia ownership, no cambia finalidad, no activa nuevas integraciones por configuración manual, no sustituye el contrato documental y no se convierte en catálogo autoritativo independiente.

Cualquier diferencia entre repo y remoto deberá reconciliarse como drift antes de una nueva activación.

---

#### 29. Selección por package_id

Una futura instancia deberá construir explícitamente:

```text
PACKAGE_EXTERNAL_INTEGRATION_SET
```

Cada miembro deberá resolver:

```text
package_id
external_system_id
external_integration_id
environment_ref
applicable = YES | NO
reason
source_reference
```

La suma de miembros aplicables define el universo que puede materializar la instancia.

Ninguna identidad externa fuera de ese conjunto puede insertarse por completitud.

---

#### 30. Bootstrap

El bootstrap deberá ser determinista e idempotente.

Para el mismo `package_id`, `source_definition_digest` y `PACKAGE_EXTERNAL_INTEGRATION_SET`, dos ejecuciones deberán converger al mismo conjunto lógico de registros y versiones.

Una segunda ejecución no crea sistemas duplicados, integraciones duplicadas, bindings duplicados, versiones semánticamente idénticas ni estados más permisivos.

---

#### 31. Concurrencia

La futura materialización deberá bloquear carreras entre dos despliegues o workers que intenten registrar la misma identidad o versión.

Como mínimo:

1. identidades estables con unicidad física;
2. control de versión o compare-and-set equivalente;
3. conflicto explícito ante contenido diferente con la misma versión;
4. relectura posterior al commit;
5. ausencia de upsert silencioso que reescriba historia.

---

#### 32. Retiro

Un sistema o integración con referencias históricas no se elimina físicamente para simular que nunca existió.

El retiro usa estado y vigencia.

Antes de `RETIRED` deberán quedar nuevos efectos detenidos, referencias downstream identificadas, bindings ambientales cerrados, credenciales tratadas por `INT-DB-002`, trabajo en curso tratado por las tareas posteriores aplicables y evidencia de retiro disponible.

---

#### 33. Exposición y seguridad

El registro no es una tabla pública de secretos.

Si una materialización usa superficies accesibles mediante Supabase:

1. escritura anónima queda prohibida;
2. escritura desde clientes no privilegiados queda prohibida salvo contrato explícito posterior;
3. lectura se limita a los consumidores que necesiten metadata de integración;
4. `service_role` no se almacena como dato del registro;
5. referencias sensibles se minimizan;
6. los valores secretos permanecen fuera de esta familia;
7. logs y errores no imprimen referencias que permitan recuperar secretos.

---

#### 34. Evidencia mínima por instancia

Cada `INT-DB-001::<package_id>` deberá conservar evidencia suficiente para demostrar:

```text
package_id
source_cut
source_definition_digest
external_system_count
external_integration_count
environment_binding_count
missing_identity_count
duplicate_identity_count
blocked_by_evidence_count
version_conflict_count
secret_value_scan_result
ownership_coverage
rollback_readiness
commit_reference
```

Un resumen agregado no sustituye la lista materializada de identidades.

---

#### 35. Rollback y recuperación

La recuperación no depende de borrar historia.

Clases:

```text
REGISTRY_VERSION_SUPERSEDE
BINDING_SUSPEND
BINDING_RETIRE
TRANSACTION_ROLLBACK_BEFORE_COMMIT
MANUAL_RECONCILIATION_REQUIRED
```

Reglas:

1. una transacción fallida antes de commit no deja registros parciales;
2. una versión incorrecta ya comprometida se supersede o suspende;
3. un binding retirado conserva su identidad;
4. referencias downstream no quedan huérfanas;
5. rollback nunca restaura un secreto dentro del registro;
6. una recuperación manual conserva evidencia y owner.

---

#### 36. Handoff hacia INT-DB-002

El handoff mínimo es:

```text
package_id
external_system_id
external_integration_id
external_environment_binding_id
external_instance_id
environment_ref
integration_principal_id
provider_account_ref
contract_version
endpoint_ref
business_owner_ref
technical_owner_ref
registry_version
content_digest
registry_status
binding_evidence_state
```

`INT-DB-002` deberá consumir estas identidades sin reidentificar la integración por URL, proveedor o secreto.

---

#### 37. Requisitos de prueba derivados

**NO GENERA REQUISITOS DE PRUEBA**

**Requisitos creados:** **0**

**Requisitos modificados:** **0**

Justificación: la tarea materializa contractualmente una infraestructura prevista por requisitos de integración ya vigentes y no añade una regla de aceptación nueva. Las pruebas existentes cubren la convergencia de integraciones, trazabilidad, idempotencia y conciliación por paquete; esta tarea únicamente fija el registro físico y sus claves estables para que esas pruebas puedan referenciar una integración sin ambigüedad.

---

#### 38. Cobertura de prueba vigente reutilizada

La cobertura vigente directamente relacionada incluye:

- `TREQ-INTEGRATION-016` para logística y terceros externos mediante contratos correlacionados e idempotentes;
- `TREQ-INTEGRATION-017` para hechos financieros y sistemas externos mediante contratos versionados, correlacionados e idempotentes;
- `TREQ-INTEGRATION-018` para instalaciones y proveedores externos mediante contratos versionados, correlacionados e idempotentes.

Estas referencias son trazabilidad heredada y no representan cambios al registro de requisitos.

---

#### 39. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                                                                                                                        |
| --------- | -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | No se ejecutó la batería npm del checkout completo durante la preparación documental.                                                                                                                                                                                            |
| LOCAL     | PASS           | El artefacto exacto fue comprobado como UTF-8, estructura de una sola tarea, metadata obligatoria, continuidad, cero requisitos en la sección derivada, ausencia de instrucciones operativas internas y consistencia de las 21 identidades heredadas.                            |
| REMOTA    | PASS           | Se verificó `main` en `9b6f014efc961dc2052c027ac068f48add5b7ede`, el archivo propietario, continuidad, topología `TEMPLATE_PER_PACKAGE`, gate `POST_E5_PACKAGE`, inventario `INT-EXT-001`, contrato de entrega, políticas, 04A de integración y scripts documentales aplicables. |
| OPERATIVA | NOT_EXECUTED   | No se ejecutaron integraciones, webhooks, proveedores, jobs, credenciales, seeds ni pruebas contra ambientes externos.                                                                                                                                                           |
| FÍSICA    | NOT_APPLICABLE | La definición documental autoriza cero DDL, DML, migraciones, secrets, configuración remota o cambios de Supabase.                                                                                                                                                               |

---

#### 40. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. conserva `TEMPLATE_PER_PACKAGE`;
2. conserva `POST_E5_PACKAGE`;
3. usa `INT-DB-001::<package_id>`;
4. no crea instancia global;
5. conserva las 21 identidades `EXT-SYS-*`;
6. diferencia sistema, integración, instancia, cuenta, principal, credencial, contrato, endpoint y owners;
7. define `external_integration_id` estable;
8. define binding ambiental sin copiar credenciales;
9. impide que configuración observada equivalga a activación;
10. impide inventar proveedor, cuenta, endpoint o instancia;
11. define versionado y digests;
12. define unicidad y cardinalidad;
13. define lifecycle de registro separado de evidencia;
14. define selección explícita por `package_id`;
15. define bootstrap idempotente;
16. define control de concurrencia;
17. define seguridad sin secretos;
18. define rollback no destructivo;
19. entrega un handoff completo a `INT-DB-002`;
20. mantiene fuera de alcance `INT-DB-002` a `INT-DB-008`;
21. declara cero requisitos creados o modificados;
22. no ejecuta cambios físicos durante la aprobación documental.

---

#### 41. Límites

`INT-DB-001` no crea tablas, vistas, índices, constraints, RLS, grants, funciones, RPC, triggers, migrations, seeds, cuentas externas, proyectos externos, endpoints, credenciales, staging de payloads, mappings de identidad, claves de idempotencia, cuarentena, auditoría de procesamiento ni conciliadores.

Tampoco ejecuta webhooks, polling, jobs, modifica configuración remota, modifica Supabase, modifica el registro 04A ni desarrolla `INT-DB-002`.

---

#### 42. Continuidad

**ÚLTIMA TAREA APROBADA**
`DATA-NORM-DB-010 — Probar idempotencia, rollback y ausencia de cambios semánticos`

**TAREA ACTUAL APROBADA**
`INT-DB-001 — Crear registro de sistemas e integraciones externas`

**SIGUIENTE TAREA RESERVADA**
`INT-DB-002 — Crear referencias de credenciales sin almacenar secretos en tablas expuestas`


### ✅ INT-DB-002 — Crear referencias de credenciales sin almacenar secretos en tablas expuestas

**Estado:** APROBADA
**Tarea anterior:** INT-DB-001 — Crear registro de sistemas e integraciones externas
**Tarea siguiente:** INT-DB-003 — Crear staging inmutable de payloads externos
**Tipo de tarea:** Documental; contrato y plantilla R2 repetible por `package_id` para persistir referencias opacas y no secretas de credenciales externas, vinculadas al registro de integraciones de INT-DB-001 y al contrato compartido `ExternalCredentialRef` de SHELL-CON-018, sin persistir, revelar, resolver ni transportar valores de autenticación, secretos, rutas de secret store, locators runtime, staging de payloads, mappings, idempotencia, cuarentena, auditoría de procesamiento ni conciliación durante esta definición
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/05_INFRAESTRUCTURA_DE_INTEGRACIONES_EXTERNAS.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`; contrato canónico `TEMPLATE_PER_PACKAGE` cerrado para futuras instancias `INT-DB-002::<package_id>`, sujetas a `POST_E5_PACKAGE`, a un registro INT-DB-001 vigente del mismo paquete, al contrato estático verificado de SHELL-CON-018, al expediente E5 del paquete, a recaptura de drift y a autorización física explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0
**Fecha de corte:** 2026-08-25

---

#### 1. Propósito

`INT-DB-002` define cómo deberá persistirse, por paquete aprobado, la identidad no secreta de una credencial externa sin convertir una tabla empresarial o expuesta en almacén de secretos.

La tarea fija una frontera estricta:

```text
REFERENCIA DE CREDENCIAL
≠ VALOR DE CREDENCIAL
≠ PRINCIPAL TÉCNICO
≠ PERMISO EMPRESARIAL
≠ CUENTA DEL PROVEEDOR
≠ ENDPOINT
≠ RUTA DE SECRET STORE
≠ MECANISMO RUNTIME DE RESOLUCIÓN
```

El resultado deberá permitir que una integración, una evidencia o un evento posterior apunten a la credencial lógica utilizada mediante `external_credential_id`, sin que el registro permita reconstruir, localizar operativamente o recuperar el material de autenticación.

---

#### 2. Resultado canónico

Queda definido el contrato documental de persistencia `VENTO-EXTERNAL-CREDENTIAL-REFERENCE-REGISTRY-001`.

```text
INT-DB-002
→ contrato documental único y reutilizable

INT-DB-002::<package_id>
→ futura instancia física por paquete

INT-DB-001::<package_id>
→ sistema + integración + binding + ambiente
→ principal técnico y ownership
→ ExternalCredentialRef compatible con SHELL-CON-018
→ referencia física no secreta
→ historial y estado
→ handoff estable hacia INT-DB-003
```

La definición global no se reabre por paquete. Cada paquete materializa únicamente sus propias referencias elegibles.

Esta definición crea:

- **21 decisiones de aplicabilidad heredadas y reconciliadas**;
- **0 valores físicos de `ExternalCredentialId`**;
- **0 valores secretos**;
- **0 rutas de secret store**;
- **0 locators runtime**;
- **0 tablas, columnas, índices, constraints, RLS, RPC o migraciones ejecutadas**.

---

#### 3. Entradas canónicas vinculantes

La tarea consume sin redefinir:

1. `INT-DB-001`, incluido su registro de sistemas, integraciones, bindings por ambiente, ownership, estado, versión y digest;
2. `INT-EXT-001` y las 21 identidades `EXT-SYS-001..021`;
3. `INT-EXT-003` para procedencia de credenciales;
4. `INT-EXT-004` para mecanismo de autenticación;
5. `INT-EXT-005` para alcance mínimo;
6. `INT-EXT-006` para separación por ambiente;
7. `INT-EXT-007` para clasificación de material y custodia segura;
8. `INT-EXT-008` para lifecycle, rotación, expiración y revocación;
9. `INT-EXT-020` para segregación y prohibición de compartición entre bindings independientes;
10. `SHELL-CON-018::GLOBAL`, ya verificada, y su contrato `ExternalCredentialId` + `ExternalCredentialRef`;
11. el registro de requisitos vigente de integración y Supabase;
12. la regla transversal de que toda modificación Supabase de VENTO se versiona y ejecuta desde `vento-shell`.

`INT-DB-002` no sustituye ninguna de estas autoridades. Solo define su persistencia física posterior por paquete.

---

#### 4. Topología, cardinalidad y gate temporal

La topología aplicable es:

| Propiedad                             | Decisión                                          |
| ------------------------------------- | ------------------------------------------------- |
| `mode`                                | `TEMPLATE_PER_PACKAGE`                            |
| identidad física                      | `INT-DB-002::<package_id>`                        |
| instancia global propia               | ninguna                                           |
| `execution_gate`                      | `POST_E5_PACKAGE`                                 |
| prerrequisito temporal                | `E5-GATE-008::<package_id> = PASS`                |
| prerrequisito registral               | `INT-DB-001::<package_id>` vigente y reconciliado |
| contrato estático compartido          | `SHELL-CON-018::GLOBAL = VERIFIED`                |
| cambio físico durante esta definición | ninguno                                           |

No existe `INT-DB-002::GLOBAL`.

---

#### 5. Handoff obligatorio recibido de INT-DB-001

La futura instancia de `INT-DB-002::<package_id>` deberá recibir, como mínimo:

```text
package_id
external_system_id
external_integration_id
external_environment_binding_id
external_instance_id
environment_ref
integration_principal_id
provider_account_ref
contract_version
endpoint_ref
business_owner_ref
technical_owner_ref
registry_version
content_digest
registry_status
binding_evidence_state
```

Reglas:

1. ninguna referencia de credencial puede existir sin `external_integration_id`;
2. ninguna referencia puede cambiar de `external_environment_binding_id` por actualización;
3. `external_system_id` se hereda del registro de INT-DB-001 y no se reidentifica por nombre de proveedor;
4. `environment_ref` se hereda del binding y no se deduce desde una variable o URL;
5. `integration_principal_id` sigue siendo identidad técnica, no credencial;
6. `provider_account_ref` sigue siendo cuenta externa referenciada, no secreto;
7. `contract_version` sigue perteneciendo al binding de integración y no se reutiliza como versión de credencial;
8. un binding bloqueado por evidencia no habilita la creación especulativa de una referencia de credencial.

---

#### 6. Autoridad compartida de SHELL-CON-018

`SHELL-CON-018::GLOBAL` ya materializa estáticamente `ExternalCredentialId` y `ExternalCredentialRef` dentro de `@vento/contracts/integrations`.

`INT-DB-002` preserva literalmente estas propiedades:

- `ExternalCredentialId` es estable, opaco y no secreto;
- la serialización física del identificador no se deriva del contrato estático;
- no se deriva del valor secreto;
- no se deriva de `integration_principal_id`;
- no se deriva de `external_system_id`;
- no se deriva de `provider_account_ref`;
- no se deriva del endpoint;
- no se deriva del nombre de variable de ambiente;
- conocer el identificador no concede acceso al secreto;
- la referencia no contiene material de autenticación;
- la referencia no contiene ruta de secret store;
- la referencia no contiene locator runtime de secreto;
- la referencia no implementa una API runtime de resolución;
- no existe fallback a credencial global, legacy ni de otro ambiente.

El contrato fuente estático consumido conserva SHA-256:

```text
b22094113048ee52d8ea8abe961af7fcb8be2b1924eabe69d0eb048d928bbb69
```

---

#### 7. Identidad `external_credential_id`

`external_credential_id` identifica una credencial lógica gobernada o una referencia aplicable, nunca el valor aceptado por el proveedor.

Invariantes:

1. es opaco;
2. es estable mientras represente la misma credencial lógica;
3. no codifica proveedor, cuenta, endpoint, ambiente, scope ni secreto;
4. no contiene prefijos que revelen material de autenticación;
5. no es hash del secreto;
6. no es token, API key, JWT, certificado, private key ni password;
7. no se reutiliza para una credencial sucesora independiente;
8. no se reutiliza después del retiro para una nueva credencial;
9. conocerlo no permite resolver el secreto;
10. su comparación sirve para correlación y gobierno, no para autenticación.

---

#### 8. Familia lógica de persistencia

La futura materialización por paquete se compone de cuatro familias lógicas.

| Familia                                  | Responsabilidad                                                                             |
| ---------------------------------------- | ------------------------------------------------------------------------------------------- |
| `EXTERNAL_CREDENTIAL_REFERENCE_RECORD`   | identidad, binding, superficie, ambiente, metadata no sensible y lifecycle de la referencia |
| `EXTERNAL_CREDENTIAL_SCOPE_RECORD`       | proyección normalizada de `minimum_scope` y `scope_ceiling` cuando apliquen                 |
| `EXTERNAL_CREDENTIAL_CONSUMER_BINDING`   | consumidores autorizados de una referencia, sin entregarles el secreto                      |
| `EXTERNAL_CREDENTIAL_REFERENCE_REVISION` | historia inmutable de metadata y estado de la referencia                                    |

Los nombres anteriores son identidades lógicas del contrato. La migración física posterior deberá escoger nombres SQL compatibles con el package_id y el modelo Supabase vigente sin alterar esta semántica.

---

#### 9. Shape mínimo de `EXTERNAL_CREDENTIAL_REFERENCE_RECORD`

Cada referencia persistida deberá poder representar:

| Campo lógico                         | Cardinalidad | Regla                                                             |
| ------------------------------------ | -----------: | ----------------------------------------------------------------- |
| `external_credential_id`             |            1 | identidad opaca no secreta                                        |
| `package_id`                         |            1 | paquete propietario                                               |
| `external_system_id`                 |            1 | heredado de INT-DB-001                                            |
| `external_integration_id`            |            1 | integración propietaria                                           |
| `external_environment_binding_id`    |            1 | binding exacto del ambiente                                       |
| `integration_principal_id`           |            1 | principal técnico separado                                        |
| `credential_surface`                 |            1 | superficie acreditada de la credencial                            |
| `environment`                        |            1 | `DEVELOPMENT`, `STAGING` o `PRODUCTION` según contrato compartido |
| `external_instance_id`               |         0..1 | instancia externa acreditada                                      |
| `provider_account_ref`               |         0..1 | cuenta externa no secreta                                         |
| `provenance`                         |         0..1 | procedencia aprobada por BLOQUE X                                 |
| `mechanism`                          |         0..1 | mecanismo aprobado, sin material                                  |
| `material_class`                     |         0..1 | clasificación documental, no valor                                |
| `functional_owner_ref`               |         0..1 | owner funcional cuando aplique                                    |
| `technical_custodian_ref`            |         0..1 | custodio técnico, no locator del secreto                          |
| `lifecycle_state`                    |         0..1 | estado heredado del lifecycle aprobado                            |
| `predecessor_external_credential_id` |         0..1 | referencia anterior cuando corresponda                            |
| `successor_external_credential_id`   |         0..1 | referencia sucesora cuando corresponda                            |
| `reference_revision`                 |            1 | revisión monotónica de metadata                                   |
| `registry_version`                   |            1 | versión del registro INT-DB-001 consumida                         |
| `recorded_at`                        |            1 | tiempo de persistencia de la revisión                             |
| `recorded_by_ref`                    |            1 | principal o proceso que registró la revisión                      |
| `evidence_ref`                       |         0..1 | referencia no sensible a evidencia                                |
| `evidence_digest`                    |         0..1 | huella de evidencia, nunca del secreto                            |

`minimum_scope`, `scope_ceiling`, `known_dates` y `authorized_consumers` conservan la semántica de `ExternalCredentialRef` mediante relaciones normalizadas o una representación físicamente equivalente.

---

#### 10. Correspondencia con `ExternalCredentialRef`

La persistencia no redefine el contrato estático. Debe poder proyectar, sin pérdida y sin campos secretos:

```text
ExternalCredentialRef.external_credential_id
ExternalCredentialRef.external_system_id
ExternalCredentialRef.integration_principal_id
ExternalCredentialRef.credential_surface
ExternalCredentialRef.environment
ExternalCredentialRef.external_instance_id
ExternalCredentialRef.provider_account_ref
ExternalCredentialRef.provenance
ExternalCredentialRef.mechanism
ExternalCredentialRef.minimum_scope
ExternalCredentialRef.scope_ceiling
ExternalCredentialRef.material_class
ExternalCredentialRef.functional_owner_ref
ExternalCredentialRef.technical_custodian_ref
ExternalCredentialRef.lifecycle_state
ExternalCredentialRef.predecessor_external_credential_id
ExternalCredentialRef.successor_external_credential_id
ExternalCredentialRef.known_dates
ExternalCredentialRef.authorized_consumers
```

Los campos `package_id`, `external_integration_id`, `external_environment_binding_id`, `reference_revision`, `registry_version`, `recorded_at`, `recorded_by_ref`, `evidence_ref` y `evidence_digest` pertenecen al envelope físico de persistencia de `INT-DB-002` y no modifican el shape compartido de `ExternalCredentialRef`.

---

#### 11. Universo heredado y decisión por identidad externa

La tarea conserva exactamente las 21 decisiones de aplicabilidad de `SHELL-CON-018`.

| ID            | Sistema                                  | Estado heredado          | Decisión de persistencia de INT-DB-002                                             |
| ------------- | ---------------------------------------- | ------------------------ | ---------------------------------------------------------------------------------- |
| `EXT-SYS-001` | Supabase                                 | `PENDIENTE_DE_EVIDENCIA` | referencia elegible únicamente para superficies y bindings acreditados del paquete |
| `EXT-SYS-002` | Wompi                                    | `PENDIENTE_DE_EVIDENCIA` | referencia elegible únicamente para superficies y bindings acreditados del paquete |
| `EXT-SYS-003` | RevenueCat                               | `PENDIENTE_DE_EVIDENCIA` | referencia elegible únicamente para superficies y bindings acreditados del paquete |
| `EXT-SYS-004` | Resend                                   | `PENDIENTE_DE_EVIDENCIA` | referencia elegible únicamente para superficies y bindings acreditados del paquete |
| `EXT-SYS-005` | Expo / EAS Update                        | `PENDIENTE_DE_EVIDENCIA` | referencia elegible únicamente para superficies y bindings acreditados del paquete |
| `EXT-SYS-006` | Expo Push Service                        | `NO_APLICA`              | no crear referencia de credencial externa para el binding observado                |
| `EXT-SYS-007` | Sentry                                   | `PENDIENTE_DE_EVIDENCIA` | referencia elegible únicamente para superficies y bindings acreditados del paquete |
| `EXT-SYS-008` | Google Maps / Google Reviews             | `PENDIENTE_DE_EVIDENCIA` | referencia elegible únicamente para superficies y bindings acreditados del paquete |
| `EXT-SYS-009` | Apple Wallet / PassKit y APNs            | `PENDIENTE_DE_EVIDENCIA` | referencia elegible únicamente para superficies y bindings acreditados del paquete |
| `EXT-SYS-010` | Vercel                                   | `PENDIENTE_DE_EVIDENCIA` | referencia elegible únicamente para superficies y bindings acreditados del paquete |
| `EXT-SYS-011` | Zebra BrowserPrint                       | `NO_APLICA`              | no crear referencia de credencial externa para el binding observado                |
| `EXT-SYS-012` | Google Wallet / Google Pay & Wallet      | `NO_APLICA_ACTUAL`       | no crear referencia hasta acreditar binding y credencial aplicable                 |
| `EXT-SYS-013` | POS externo vigente                      | `NO_APLICA_ACTUAL`       | no crear referencia hasta acreditar proveedor, binding y credencial aplicable      |
| `EXT-SYS-014` | Shopify / canal de comercio electrónico  | `NO_APLICA_ACTUAL`       | no crear referencia hasta acreditar binding y credencial aplicable                 |
| `EXT-SYS-015` | Rappi / marketplace                      | `NO_APLICA_ACTUAL`       | no crear referencia hasta acreditar binding y credencial aplicable                 |
| `EXT-SYS-016` | ManyChat / automatización conversacional | `NO_APLICA_ACTUAL`       | no crear referencia hasta acreditar binding y credencial aplicable                 |
| `EXT-SYS-017` | WhatsApp                                 | `NO_APLICA_ACTUAL`       | no crear referencia hasta acreditar proveedor/API, binding y credencial aplicable  |
| `EXT-SYS-018` | Instagram / perfiles sociales            | `NO_APLICA_ACTUAL`       | no crear referencia hasta acreditar binding y credencial aplicable                 |
| `EXT-SYS-019` | Correo corporativo y alias funcionales   | `NO_APLICA_ACTUAL`       | no crear referencia hasta acreditar proveedor, binding y credencial aplicable      |
| `EXT-SYS-020` | Telefonía / canal de voz                 | `NO_APLICA_ACTUAL`       | no crear referencia hasta acreditar proveedor, binding y credencial aplicable      |
| `EXT-SYS-021` | Transporte externo                       | `NO_APLICA_ACTUAL`       | no crear referencia hasta acreditar proveedor, binding y credencial aplicable      |

La decisión no crea una referencia física para ninguna de las 21 identidades durante esta definición.

---

#### 12. Reconciliación cuantitativa del universo

| Control                                         |    Resultado |
| ----------------------------------------------- | -----------: |
| identidades esperadas                           |       **21** |
| decisiones materializadas documentalmente       | **21 de 21** |
| faltantes                                       |        **0** |
| duplicadas                                      |        **0** |
| `PENDIENTE_DE_EVIDENCIA`                        |        **9** |
| `NO_APLICA`                                     |        **2** |
| `NO_APLICA_ACTUAL`                              |       **10** |
| `external_credential_id` físicos creados        |        **0** |
| referencias persistidas                         |        **0** |
| secretos creados, copiados, movidos o revelados |        **0** |

---

#### 13. Separación obligatoria por ambiente

Cada `external_credential_id` pertenece a exactamente un ambiente VENTO:

```text
DEVELOPMENT
STAGING
PRODUCTION
```

Reglas:

1. una referencia no puede abarcar más de un ambiente;
2. una referencia de `DEVELOPMENT` no puede servir de fallback a `STAGING` o `PRODUCTION`;
3. una referencia de `STAGING` no puede servir de fallback a `PRODUCTION`;
4. una referencia de `PRODUCTION` no se reutiliza para pruebas;
5. la transición entre ambientes crea o enlaza referencias independientes conforme a la evidencia real;
6. el ambiente proviene del binding de INT-DB-001;
7. el nombre de una variable no demuestra ambiente;
8. un mismo proveedor o cuenta externa no elimina la separación ambiental.

---

#### 14. Superficie y cardinalidad

La cardinalidad se gobierna por `credential_surface` + ambiente, no solo por sistema externo.

Por tanto:

```text
un external_system_id
→ puede tener múltiples superficies
→ cada superficie puede requerir una referencia independiente por ambiente
```

Ejemplos conceptuales preservados por BLOQUE X incluyen credenciales públicas, secretos de webhook, claves server-side, certificados, claves privadas o superficies sin credencial externa observada.

Reglas:

1. varias referencias por `external_system_id` están permitidas;
2. una superficie independiente no hereda automáticamente la referencia de otra;
3. un mismo `integration_principal_id` puede relacionarse con varias referencias sin fusionarlas;
4. una credencial no se deduce por el nombre del sistema;
5. una superficie `NO_APLICA` no recibe una referencia ficticia.

---

#### 15. Procedencia, mecanismo y alcance

`provenance`, `mechanism`, `minimum_scope` y `scope_ceiling` solo se persisten cuando provienen de las decisiones canónicas de BLOQUE X o de evidencia acreditada posterior.

Reglas:

1. `provenance` no se inventa desde el nombre del proveedor;
2. `mechanism` no contiene el secreto ni un header completo;
3. `minimum_scope` expresa el mínimo alcance aprobado;
4. `scope_ceiling` impide ampliar la credencial por conveniencia técnica;
5. una solicitud de scope por encima del ceiling falla cerrada;
6. `service_role` sigue siendo credencial privilegiada y no autoridad empresarial;
7. una credencial publicable no se convierte en secreto por estar referenciada;
8. una credencial secreta no se convierte en metadata publicable por estar cifrada.

---

#### 16. Material, custodia y frontera de resolución

La persistencia distingue metadata no sensible de material de autenticación.

La referencia puede conservar:

- clase documental de material;
- custodio técnico;
- owner funcional;
- procedencia;
- mecanismo;
- estado;
- fechas conocidas;
- scopes;
- consumidores autorizados;
- referencias de predecessor/successor.

La referencia no puede conservar:

- el valor secreto;
- una copia cifrada recuperable del secreto;
- una ruta operativa de secret store;
- un locator runtime capaz de recuperar el secreto;
- instrucciones para resolverlo;
- un header reutilizable;
- fragmentos suficientes para reconstruir material criptográfico.

La ubicación y resolución runtime del secreto pertenecen al mecanismo de custodia autorizado, no al registro empresarial de `INT-DB-002`.

---

#### 17. Material prohibido dentro del registro

Queda prohibido persistir como parte de la referencia cualquiera de estas clases del contrato compartido:

```text
operational_api_key
secret_key
service_role_key
complete_jwt
access_token
refresh_token
webhook_secret
password
client_secret
private_key
private_certificate_material
recoverable_service_account_private_material
reusable_session_cookie
complete_authentication_header
reusable_signature_credential
recoverable_cryptographic_material
secret_reconstruction_fragment
operational_secret_store_locator
runtime_secret_recovery_instruction
```

La prohibición aplica igualmente a:

- campos principales;
- JSON auxiliar;
- metadata libre;
- comentarios;
- labels;
- evidencias;
- dumps;
- fixtures;
- logs;
- traces;
- errores;
- exports.

---

#### 18. Regla de no derivación desde el secreto

No se permite usar como `external_credential_id`:

- el secreto completo;
- una parte del secreto;
- un prefijo o sufijo operativo del secreto;
- un hash creado específicamente desde el secreto para sustituir su almacenamiento;
- una codificación reversible;
- un ciphertext recuperable;
- un token de sesión;
- un `Authorization` header;
- una variable de ambiente cuyo nombre actúe como locator runtime.

Cuando un proveedor exponga un identificador público de key, versión o certificado, ese dato podrá conservarse únicamente como metadata acreditada y no reemplaza `external_credential_id`.

---

#### 19. Relación con principal, cuenta, sistema y endpoint

Las siguientes identidades permanecen separadas:

```text
external_system_id
≠ external_integration_id
≠ external_environment_binding_id
≠ integration_principal_id
≠ provider_account_ref
≠ external_credential_id
≠ endpoint_ref
```

Consecuencias:

1. cambiar endpoint no cambia automáticamente la credencial;
2. cambiar cuenta externa exige reconciliar referencias afectadas, no renombrarlas;
3. una credencial no identifica al actor humano;
4. una credencial no reemplaza al principal técnico;
5. un principal técnico no concede acceso al secreto;
6. una credencial válida no concede autoridad para ejecutar una acción empresarial;
7. autenticidad técnica y autorización empresarial siguen siendo controles distintos.

---

#### 20. Lifecycle de la referencia

El registro conserva el estado de lifecycle aprobado por la autoridad semántica de credenciales.

La persistencia debe permitir distinguir, sin perder historia:

- referencia aplicable y vigente;
- referencia pendiente de evidencia;
- referencia expirada;
- referencia revocada;
- referencia retirada;
- referencia sucesora;
- referencia no aplicable;
- referencia bloqueada por falta de binding o evidencia.

No se define un enum físico nuevo en esta tarea. La migración posterior deberá materializar únicamente los estados canónicos vigentes para la superficie afectada.

---

#### 21. Rotación y sucesión

Cuando una rotación produzca una credencial sucesora independiente:

1. se crea un `external_credential_id` nuevo;
2. la referencia anterior no se renombra como la sucesora;
3. se conserva `predecessor_external_credential_id`;
4. se conserva `successor_external_credential_id`;
5. historia de revocadas, expiradas y retiradas no se borra;
6. el `integration_principal_id` no cambia únicamente por rotación ordinaria;
7. una sucesora no puede cruzar de ambiente;
8. los consumidores se migran de forma explícita;
9. la ausencia del valor secreto en la tabla se mantiene antes, durante y después de la rotación.

---

#### 22. Segregación entre bindings

`INT-EXT-020` permanece vinculante.

Existe riesgo de compartición cuando la misma credencial material aceptada por una autoridad externa cruza bindings independientes.

La persistencia de referencias deberá soportar los estados de aislamiento aprobados:

- `ISOLATED_BY_BINDING`;
- `EXCLUSIVITY_PENDING_EVIDENCE`;
- `SHARED_CREDENTIAL_DETECTED`;
- `SHARED_CREDENTIAL_REMEDIATION_IN_PROGRESS`;
- `NO_CREDENTIAL_APPLICABLE`;
- `BLOCKED_NO_BINDING`.

Reglas:

1. el estado nunca incluye el valor secreto;
2. `EXCLUSIVITY_PENDING_EVIDENCE` no prueba incumplimiento ni conformidad;
3. `ISOLATED_BY_BINDING` requiere evidencia;
4. una compartición confirmada bloquea nuevos consumidores y ampliaciones de scope;
5. no existe fallback a una credencial compartida global;
6. la remediación crea sucesores independientes por binding.

---

#### 23. Materialización idempotente por paquete

La futura materialización deberá ser repetible.

Para una misma entrada lógica:

```text
package_id
+ external_integration_id
+ external_environment_binding_id
+ external_credential_id
+ reference_revision
```

la repetición compatible deberá converger al mismo registro y no crear duplicados.

Una repetición incompatible deberá bloquearse si intenta cambiar:

- sistema externo;
- integración;
- binding;
- ambiente;
- principal;
- superficie;
- identidad de la credencial;
- contenido histórico ya aprobado.

La idempotencia de procesamiento de eventos sigue reservada a `INT-DB-005`; esta sección solo gobierna la creación/reconciliación del registro de referencias.

---

#### 24. Concurrencia y revisión

La persistencia deberá impedir `last writer wins` silencioso.

Reglas:

1. `reference_revision` es monotónica;
2. una actualización parte de la revisión vigente esperada;
3. una revisión stale no sobrescribe la vigente;
4. una modificación incompatible genera conflicto;
5. el cambio de metadata produce nueva revisión, no reescritura de historia;
6. el cambio de identidad material no se simula con una revisión: usa sucesor;
7. la concurrencia no puede alterar el ambiente o binding de una referencia existente.

---

#### 25. Exposición, RLS y mínimo privilegio

Que una tabla contenga solo metadata no secreta no la convierte en pública.

La futura materialización deberá:

1. usar RLS, grants o aislamiento equivalente acorde con consumidores;
2. negar acceso a roles cliente que no necesiten la metadata;
3. impedir mutación desde frontends por conocimiento de `external_credential_id`;
4. impedir que `anon` o `authenticated` obtengan autoridad administrativa por leer una referencia;
5. evitar exponer scopes, cuentas o metadata operacional innecesaria;
6. mantener `service_role` exclusivamente en backend autorizado;
7. probar acceso permitido y denegado;
8. tratar cualquier proyección cliente como contrato mínimo independiente.

---

#### 26. Consumidores autorizados

`EXTERNAL_CREDENTIAL_CONSUMER_BINDING` conserva únicamente identidades de consumidores autorizados.

No contiene:

- secreto;
- instrucciones de recuperación;
- variables de entorno;
- valor de header;
- token;
- clave;
- contraseña.

Un consumidor autorizado a conocer una referencia no queda automáticamente autorizado a resolver o usar el secreto.

La autorización para usar material real se valida en la frontera runtime propietaria.

---

#### 27. Evidencia y frescura

Cada referencia física futura deberá enlazar evidencia suficiente para demostrar:

- sistema;
- integración;
- binding;
- ambiente;
- superficie;
- procedencia cuando aplique;
- principal;
- owner;
- custodio;
- lifecycle;
- aislamiento;
- consumidores.

`evidence_ref` y `evidence_digest` son referencias no sensibles.

La evidencia:

1. no contiene el secreto;
2. no contiene un dump de variables;
3. no contiene un header reutilizable;
4. no contiene ruta operativa de secret store;
5. conserva fecha o corte;
6. se recaptura cuando cambie binding, cuenta, mecanismo, ambiente, lifecycle o consumidor.

---

#### 28. Drift y reconciliación de referencias

Una futura instancia deberá detectar como drift, al menos:

- referencia persistida sin integración vigente;
- referencia ligada a binding retirado;
- ambiente divergente;
- principal divergente;
- superficie desconocida;
- consumidor no autorizado;
- referencia retirada todavía marcada como vigente;
- predecessor/successor incoherentes;
- duplicidad material confirmada entre bindings;
- metadata que contiene material prohibido;
- referencia aplicable sin evidencia suficiente;
- referencia `NO_APLICA` materializada sin una nueva decisión canónica.

El drift no autoriza corregir el secreto desde la tabla.

---

#### 29. Bootstrap y backfill

Si un paquete debe adoptar referencias preexistentes:

1. parte del registro vigente de INT-DB-001;
2. identifica superficies acreditadas sin leer o exportar valores secretos al artefacto de migración;
3. asigna `external_credential_id` opaco;
4. vincula ambiente y principal;
5. registra metadata no sensible disponible;
6. conserva procedencia y evidencia;
7. clasifica ausencia de evidencia sin inventar datos;
8. detecta compartición antes de declarar aislamiento;
9. ejecuta dry-run y conteos;
10. solo después materializa referencias elegibles.

El backfill no copia secretos desde runtime, proveedor, logs o variables hacia tablas.

---

#### 30. Rollback

El rollback de `INT-DB-002::<package_id>` no consiste en restaurar secretos dentro de una tabla.

Debe permitir:

1. detener nuevas referencias;
2. restaurar la revisión anterior de metadata mediante nueva revisión compensatoria cuando sea seguro;
3. retirar una referencia errónea sin borrar historia;
4. revertir relaciones de consumidores;
5. conservar predecessor/successor ya observados;
6. reconstruir el estado registral previo desde evidencia;
7. no reactivar una credencial revocada;
8. no copiar un secreto antiguo para recuperar funcionamiento;
9. escalar a la autoridad de lifecycle cuando la corrección implique rotación o revocación real.

---

#### 31. Política de fallo cerrado

La referencia falla cerrada ante:

- `external_credential_id` requerido ausente;
- `external_system_id` incompatible;
- `integration_principal_id` incompatible;
- `credential_surface` incompatible;
- ambiente incorrecto;
- ambiente ambiguo;
- mecanismo incompatible;
- scope solicitado por encima del ceiling;
- lifecycle no utilizable;
- material requerido no resoluble por la frontera runtime autorizada;
- necesidad de inferir datos para completar la referencia.

Ninguno de estos casos permite fallback a una credencial global, legacy o de otro ambiente.

---

#### 32. Prohibición de fallback secreto

Queda prohibido resolver una ausencia mediante:

```text
credential missing
→ use default
```

```text
credential missing
→ use production credential
```

```text
credential missing
→ use legacy credential
```

```text
credential missing
→ use another integration credential
```

```text
credential missing
→ read secret from a business table
```

El fallo se conserva como fallo de configuración, evidencia o lifecycle.

---

#### 33. Logs, errores, exports y observabilidad

La observabilidad puede registrar:

- `external_credential_id`;
- sistema;
- integración;
- binding;
- ambiente;
- superficie;
- revisión;
- lifecycle;
- resultado de resolución en forma no sensible.

No puede registrar:

- valor secreto;
- header completo;
- JWT completo;
- token;
- password;
- private key;
- certificado privado;
- material criptográfico recuperable;
- variable de entorno con valor;
- locator operativo de secret store.

Los errores no deben ecoar inputs potencialmente secretos.

---

#### 34. Frontera con INT-DB-003

`INT-DB-003` está reservado a staging inmutable de payloads externos.

Puede consumir de `INT-DB-002` únicamente identidad y metadata no secreta necesarias para procedencia y autenticidad referenciada.

No podrá recibir desde este registro:

- secreto;
- copia cifrada recuperable;
- header;
- token;
- private key;
- locator de secret store;
- instrucción runtime de recuperación.

Una referencia de credencial demuestra qué identidad lógica intervino; no prueba por sí sola autenticidad del payload ni éxito del efecto empresarial.

---

#### 35. Handoff obligatorio hacia INT-DB-003

El handoff mínimo de `INT-DB-002::<package_id>` queda:

```text
package_id
external_system_id
external_integration_id
external_environment_binding_id
external_instance_id
environment_ref
integration_principal_id
provider_account_ref
external_credential_id
credential_surface
credential_reference_status
reference_revision
registry_version
contract_version
endpoint_ref
business_owner_ref
technical_owner_ref
evidence_ref
evidence_digest
```

Condiciones:

1. `external_credential_id` puede ser nulo únicamente cuando el contrato de la superficie declare que no aplica credencial o el binding todavía no permita materializarla;
2. el handoff no contiene valor secreto;
3. el handoff no contiene locator runtime;
4. la tarea siguiente no reidentifica credenciales por payload, URL, proveedor o variable;
5. la autenticidad del payload se resuelve mediante los contratos de integración aplicables, no por la mera existencia de la referencia.

---

#### 36. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Requisitos creados:** 0

**Requisitos modificados:** 0

Justificación: la tarea materializa en forma de persistencia posterior por paquete controles ya cubiertos por los contratos vigentes de credenciales, secretos, segregación ambiental, mínimo privilegio, ausencia de material sensible en tablas/configuración y referencia opaca. No introduce una conducta verificable nueva distinta de esas obligaciones; fija el shape, relaciones y handoff de la capa física futura.

---

#### 37. Cobertura de prueba vigente reutilizada

La tarea reutiliza, sin modificarlos:

- `TREQ-SUPABASE-117` — frontera de credenciales privilegiadas de backend;
- `TREQ-SUPABASE-192` — prohibición de secretos en configuración legible por clientes;
- `TREQ-SUPABASE-193` — retiro de credenciales desde SQL persistido;
- `TREQ-SUPABASE-217` — registro canónico no sensible de secretos y credenciales;
- `TREQ-SUPABASE-218` — prohibición de material secreto en tablas legibles, código, migraciones, logs y artefactos;
- `TREQ-SUPABASE-219` — custodia server-side separada de tablas empresariales;
- `TREQ-SUPABASE-220` — rotación coordinada posterior a exposición;
- `TREQ-SUPABASE-222` — inventario de claves privadas sin almacenar el valor;
- `TREQ-SUPABASE-226` — compatibilidad y separación ambiental;
- `TREQ-SUPABASE-227` — mínimo privilegio de credenciales de terceros;
- `TREQ-SUPABASE-239` — aislamiento de claves y secretos por ambiente;
- `TREQ-SUPABASE-241` — secret scanning de código, documentación y fixtures;
- `TREQ-INTEGRATION-051` — ausencia de secretos en contratos y ejemplos de integración;
- `TREQ-INTEGRATION-213` — autenticación referenciada sin incrustar credenciales;
- `TREQ-INTEGRATION-218` — minimización de auditoría sin secretos ni tokens;
- `TREQ-INTEGRATION-306` — frontera del adaptador externo sin credencial transversal.

Estas referencias son trazabilidad de cobertura existente y no constituyen actualización del registro de requisitos.

---

#### 38. Evidencia de validación

| Clase     | Estado         | Evidencia                                                                                                                                                                                                                                                                                     |
| --------- | -------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| BUILD     | NOT_EXECUTED   | La batería npm del checkout completo no se ejecutó durante la preparación del artefacto; no se declara build como aprobado.                                                                                                                                                                   |
| LOCAL     | PASS           | El artefacto fue comprobado estructuralmente para título, metadata obligatoria, secciones requeridas, continuidad, cero requisitos en la sección de cambios, UTF-8, LF, ausencia de BOM, placeholders ejecutables, contenido de chat prohibido y correspondencia 21/21 de la matriz heredada. |
| REMOTA    | PASS           | Se recapturó `main` en `ce93e86f0a4232224e690037928e9d8bd6e12fff` y se verificaron continuidad, owner, topología, contrato de entrega, políticas, 04A relevante, `package.json`, validators, `SHELL-CON-018::GLOBAL`, `ExternalCredentialRef` e INT-EXT-003..008/020.                         |
| OPERATIVA | NOT_EXECUTED   | No se materializó ningún `INT-DB-002::<package_id>`, no se resolvió ninguna credencial runtime y no se ejercitaron consumidores.                                                                                                                                                              |
| FÍSICA    | NOT_APPLICABLE | Esta tarea documental autoriza cero DDL, DML, migraciones, RLS, RPC, secretos, cambios Supabase o efectos remotos.                                                                                                                                                                            |

---

#### 39. Criterios de aceptación

La tarea queda documentalmente completa cuando:

1. conserva `TEMPLATE_PER_PACKAGE` y `POST_E5_PACKAGE`;
2. no crea instancia global propia;
3. consume el handoff de INT-DB-001 sin reidentificar sistemas, bindings o ambientes;
4. preserva `ExternalCredentialId` como estable, opaco y no secreto;
5. conserva exactamente las 21 decisiones de aplicabilidad de SHELL-CON-018;
6. reconcilia 9 pendientes de evidencia, 2 no aplicables y 10 no aplicables actuales;
7. crea 0 valores físicos de credencial durante la definición;
8. no introduce un secret store locator en la referencia;
9. no permite recuperar material desde la metadata persistida;
10. separa credencial, principal, cuenta, sistema, integración, binding y endpoint;
11. conserva una sola identidad lógica por credencial y un solo ambiente por referencia;
12. permite varias superficies por sistema sin fusionarlas;
13. conserva scopes y consumidores sin convertirlos en autoridad empresarial;
14. conserva historia de revisión y sucesión;
15. bloquea fallback global, legacy o entre ambientes;
16. soporta detección de compartición entre bindings;
17. define bootstrap y rollback sin copiar secretos;
18. entrega a INT-DB-003 solo identidad y metadata no sensible;
19. declara cero requisitos nuevos con cobertura heredada fuera de la sección de cambios;
20. no modifica 04A;
21. no ejecuta cambios físicos.

---

#### 40. Límites

Esta tarea no:

- crea valores `ExternalCredentialId` operativos;
- crea ni modifica secretos;
- crea cuentas de proveedor;
- rota, revoca o emite credenciales reales;
- selecciona o cambia el secret store;
- persiste rutas de secret store;
- implementa resolución runtime;
- crea tablas o migraciones;
- aplica RLS o grants;
- crea RPC o funciones;
- modifica Supabase;
- despliega configuración;
- crea staging de payloads;
- crea mappings externos;
- implementa idempotencia de eventos;
- crea cuarentena;
- crea auditoría de procesamiento;
- crea conciliación;
- modifica contratos de SHELL-CON-018;
- modifica requisitos de prueba;
- avanza `INT-DB-003`.

Toda materialización física posterior requiere `INT-DB-002::<package_id>` autorizado, `E5-GATE-008::<package_id> = PASS`, dependencias técnicas satisfechas y evidencia vigente.

---

#### 41. Continuidad

**ÚLTIMA TAREA APROBADA**
`INT-DB-001 — Crear registro de sistemas e integraciones externas`

**TAREA ACTUAL APROBADA**
`INT-DB-002 — Crear referencias de credenciales sin almacenar secretos en tablas expuestas`

**SIGUIENTE TAREA RESERVADA**
`INT-DB-003 — Crear staging inmutable de payloads externos`


### ✅ INT-DB-003 — Crear staging inmutable de payloads externos

**Estado:** APROBADA
**Tarea anterior:** INT-DB-002 — Crear referencias de credenciales sin almacenar secretos en tablas expuestas
**Tarea siguiente:** INT-DB-004 — Crear mapeos de identificadores externos y canónicos
**Tipo de tarea:** Documental; contrato y plantilla R2 repetible por `package_id` para staging inmutable de evidencia fuente y payloads externos, con captura protegida, huella, correlación, minimización, retención y disposición sin convertir el staging en fuente empresarial ni materializar mapeos, idempotencia, cuarentena, auditoría de procesamiento o conciliación durante esta definición
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/05_INFRAESTRUCTURA_DE_INTEGRACIONES_EXTERNAS.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`; contrato canónico `TEMPLATE_PER_PACKAGE` cerrado para futuras instancias `INT-DB-003::<package_id>`, sujetas a `POST_E5_PACKAGE`, al registro de integración del mismo paquete, a la política de evidencia fuente vigente, a recaptura de drift y a autorización física explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0
**Fecha de corte:** 2026-08-25

---

#### 1. Propósito

`INT-DB-003` define cómo deberá persistirse, por paquete, la evidencia fuente recibida desde sistemas externos cuando el contrato de integración exija conservar el payload original, una representación fuente protegida o un receipt externo mínimo.

El objetivo no es conservar indiscriminadamente todo lo recibido. El objetivo es preservar exactamente la evidencia necesaria para poder demostrar qué recibió VENTO, cuándo lo recibió, desde qué binding, con qué huella y bajo qué contrato, sin convertir esa evidencia en una segunda fuente de verdad empresarial y sin copiar secretos ni datos innecesarios.

La tarea debe permitir que una futura implementación responda de forma reproducible:

1. qué integración y binding recibieron o produjeron la evidencia;
2. qué representación fuente fue capturada;
3. cuándo se recibió o generó;
4. qué longitud, media type, encoding y huella tuvo;
5. qué identificador o receipt externo estaba disponible;
6. qué resultado de autenticidad fue referenciado;
7. qué política de sensibilidad, retención y hold gobierna la evidencia;
8. dónde reside la copia protegida cuando el contenido deba conservarse fuera de la fila relacional;
9. qué vista o artefacto redactado puede exponerse de forma segura;
10. qué disposición posterior se ejecutó sin alterar la captura original.

---

#### 2. Resultado canónico

Queda definido el contrato documental único de staging inmutable para `INT-DB-003`:

```text
INT-DB-003
→ definición documental única y reutilizable

INT-DB-003::<package_id>
→ futura instancia física del paquete

sistema externo seleccionado por el paquete
→ integración registrada por INT-DB-001
→ binding ambiental acreditado
→ recepción o emisión externa
→ captura fuente según política de preservación
→ huella y metadata no secreta
→ custodia protegida cuando corresponda
→ evidencia inmutable
→ handoff estable hacia INT-DB-004..008
```

No existe una instancia física `GLOBAL` de esta tarea.

---

#### 3. Topología y gate de ejecución

La topología aplicable queda cerrada así:

| Propiedad | Decisión |
| --- | --- |
| Modalidad | `TEMPLATE_PER_PACKAGE` |
| Gate temporal | `POST_E5_PACKAGE` |
| Identidad física futura | `INT-DB-003::<package_id>` |
| Instancia global | no aplica |
| Reapertura del marcador por paquete | prohibida |
| Implementación durante esta definición | ninguna |

Una futura instancia solo podrá existir para un `package_id` que haya superado la puerta E5 aplicable y haya incluido expresamente la integración y sus dependencias en su paquete de implementación.

---

#### 4. Entradas canónicas preservadas

La tarea consume sin redefinir:

- el registro de sistemas, integraciones y bindings definido por `INT-DB-001`;
- la referencia no secreta de credenciales definida por `INT-DB-002` cuando una superficie aplicable necesite enlazar una referencia de credencial;
- la separación de sistema, instancia, cuenta externa, principal técnico, credencial, contrato y endpoint ya aprobada;
- la política de conservación controlada del payload original definida por `INT-EXT-014`;
- los contratos de autenticidad, idempotencia, retry, mapping, auditoría y conciliación aprobados en BLOQUE X;
- las reglas de minimización, retención, seguridad y evidencia vigentes en BLOQUE E3;
- la propiedad empresarial de cada dominio sobre sus hechos y resultados.

La evidencia fuente no obtiene autoridad empresarial por ser más detallada, más antigua, más cercana al proveedor o más fácil de consultar.

---

#### 5. Separación semántica obligatoria

La implementación deberá conservar siempre las siguientes diferencias:

```text
PAYLOAD ORIGINAL / EVIDENCIA FUENTE
≠ PAYLOAD NORMALIZADO O ADAPTADO
≠ HECHO CANÓNICO VENTO
≠ AUDITORÍA ORDINARIA
≠ LOG TÉCNICO
≠ RESPUESTA O RECIBO DEL PROVEEDOR
≠ CREDENCIAL O SECRETO
```

Consecuencias:

1. una fila de staging no reemplaza el registro empresarial del owner;
2. una copia de payload no demuestra que el hecho sea verdadero, válido o autorizado;
3. una huella no sustituye identidad de sistema, evento, receipt, request o hecho empresarial;
4. un log no sustituye la evidencia fuente protegida;
5. una auditoría ordinaria no debe copiar el payload completo por conveniencia;
6. una referencia de credencial no forma parte del contenido fuente.

---

#### 6. Familias lógicas de persistencia

La futura materialización por paquete se compone de dos familias lógicas separadas:

| Familia lógica | Responsabilidad |
| --- | --- |
| `EXTERNAL_SOURCE_EVIDENCE_RECORD` | captura inmutable de la evidencia fuente, identidad, binding, huella, metadata, sensibilidad y referencias seguras |
| `EXTERNAL_SOURCE_EVIDENCE_CONTROL_EVENT` | eventos append-only de hold, revisión de clasificación, disposición, purga autorizada o cambio de control sin reescribir la captura original |

Los nombres anteriores describen responsabilidades lógicas del contrato. La implementación física posterior decidirá nombres SQL compatibles con el `package_id` y el modelo Supabase vigente sin alterar esta semántica.

---

#### 7. Identidad estable de la evidencia fuente

Se define `source_evidence_id` como identidad estable de una captura fuente individual.

Reglas:

1. es única para cada captura materializada;
2. no se deriva del payload, del digest, del `external_event_or_receipt_ref` ni de una credencial;
3. no sustituye `external_event_id`, `receipt_id`, `request_id`, `event_id`, `mapping_id` ni una idempotency key;
4. una redelivery puede producir una nueva captura aun cuando su contenido sea equivalente;
5. la equivalencia o duplicidad se determina posteriormente por los contratos de idempotencia y procesamiento, no por reutilizar `source_evidence_id`;
6. una captura corregida documentalmente no reutiliza ni reemplaza silenciosamente la identidad de otra captura.

---

#### 8. Shape mínimo de `EXTERNAL_SOURCE_EVIDENCE_RECORD`

Cada registro deberá poder representar, como mínimo:

| Campo lógico | Cardinalidad | Regla |
| --- | ---: | --- |
| `source_evidence_id` | 1 | identidad estable de la captura |
| `package_id` | 1 | paquete propietario de la instancia física |
| `external_system_id` | 1 | sistema externo vigente |
| `external_integration_id` | 1 | integración registrada por `INT-DB-001` |
| `external_environment_binding_id` | 1 | binding ambiental acreditado |
| `environment_ref` | 1 | ambiente exacto del binding |
| `external_credential_id` | 0..1 | referencia no secreta de `INT-DB-002` cuando aplique |
| `surface` | 1 | superficie técnica que produjo o recibió la evidencia |
| `direction` | 1 | dirección contractual de la interacción |
| `contract_version` | 1 | versión del contrato de integración aplicable |
| `received_at` | 1 | instante VENTO de recepción o captura |
| `provider_occurred_at` | 0..1 | tiempo declarado por la fuente, sin sustituir `received_at` |
| `media_type` | 0..1 | tipo de contenido observado o declarado |
| `content_encoding` | 0..1 | encoding cuando sea material para reproducibilidad |
| `source_capture_mode` | 1 | modo de captura aprobado |
| `source_byte_length` | 0..1 | longitud de la representación fuente preservada |
| `payload_digest_algorithm` | 1 | algoritmo de huella declarado |
| `payload_digest` | 1 | huella de la representación capturada, no identidad empresarial |
| `external_event_or_receipt_ref` | 0..1 | referencia externa estable cuando exista |
| `authenticity_result_ref` | 0..1 | referencia al resultado de autenticidad, nunca la credencial |
| `sensitivity_class` | 1 | clasificación de sensibilidad aplicable |
| `retention_policy_ref` | 1 | política de retención aplicable |
| `preservation_or_hold_ref` | 0..1 | hold o preservación adicional cuando exista |
| `protected_payload_locator` | 0..1 | referencia opaca a la evidencia protegida cuando deba conservarse fuera de la fila |
| `redacted_view_ref` | 0..1 | referencia a representación segura derivada |
| `disposition_evidence_ref` | 0..1 | evidencia de disposición posterior |
| `recorded_at` | 1 | instante de persistencia del registro |
| `recorded_by_ref` | 1 | principal o proceso técnico que registró la captura |
| `registry_version` | 1 | versión del registro de integración consumida |

La ausencia de un campo opcional no autoriza inferir su valor desde otro campo.

---

#### 9. Semántica de `source_capture_mode`

La captura deberá expresar explícitamente qué representación fue preservada. Como mínimo se reconocen las categorías conceptuales ya aprobadas:

```text
RAW_BYTES
PROVIDER_OBJECT
MINIMAL_RECEIPT
```

Reglas:

1. `RAW_BYTES` conserva la secuencia fuente necesaria para verificación o reproducción cuando el contrato lo exige;
2. `PROVIDER_OBJECT` conserva una representación fuente protegida cuando la evidencia contractual no requiere bytes exactos;
3. `MINIMAL_RECEIPT` conserva únicamente el receipt o evidencia mínima cuando retener el payload completo sería excesivo;
4. el modo se fija al capturar la evidencia y no se reetiqueta después para justificar una copia distinta;
5. una representación normalizada nunca se declara `RAW_BYTES`;
6. el digest se calcula sobre la representación efectivamente preservada y el algoritmo queda explícito.

---

#### 10. Captura antes de transformación

Para una entrada externa que pueda producir un hecho VENTO, el orden contractual es:

```text
recepción
→ fijar received_at
→ capturar transitoriamente la representación fuente
→ verificar autenticidad u origen cuando aplique
→ calcular huella
→ persistir evidencia protegida cuando corresponda
→ parsear / normalizar
→ resolver mapping e idempotencia en sus contratos propietarios
→ validar con el owner empresarial
→ producir, rechazar o diferir el hecho interno
```

Cuando la firma o autenticidad dependa de bytes exactos, la representación fuente se captura antes de parsear, reserializar, normalizar espacios, ordenar claves o convertir tipos.

---

#### 11. Inmutabilidad de la captura

`EXTERNAL_SOURCE_EVIDENCE_RECORD` es inmutable respecto de la representación fuente capturada y sus atributos de integridad.

Queda prohibido:

- sobrescribir el payload de una captura previa;
- sustituir su digest por el de una redelivery;
- hacer UPSERT destructivo usando identificador externo como clave de reemplazo;
- convertir una corrección de parser o mapping en edición de la evidencia fuente;
- editar el contenido fuente porque cambió el hecho empresarial resultante;
- borrar una captura para volver a insertarla con una forma distinta y conservar la misma identidad.

Una nueva recepción genera nueva captura o nueva evidencia de control, según corresponda, sin borrar historia.

---

#### 12. Redelivery, identificador externo y conflictos de huella

La recepción repetida no autoriza reemplazo.

Casos:

1. mismo `external_event_or_receipt_ref` y mismo digest: puede existir más de una captura de recepción; la clasificación como duplicado pertenece al contrato posterior de idempotencia;
2. mismo `external_event_or_receipt_ref` y digest distinto: se conserva cada captura y se registra un conflicto que debe resolverse antes de producir un efecto automático incompatible;
3. identificador externo ausente: se conserva `source_evidence_id` y el procesamiento posterior deberá usar la identidad estable definida por su contrato correspondiente;
4. digest igual con identificadores externos distintos: no demuestra identidad empresarial ni permite fusionar capturas.

El staging conserva evidencia; no decide por sí solo qué intento debe producir el efecto.

---

#### 13. Digest y límites de identidad

`payload_digest` es una prueba de integridad o equivalencia de contenido dentro de su algoritmo y representación declarados.

No puede sustituir:

- `source_evidence_id`;
- `external_system_id`;
- `external_event_or_receipt_ref`;
- `external_integration_id`;
- `external_environment_binding_id`;
- identidad de una operación idempotente;
- identidad de mapping;
- identidad del hecho empresarial.

Una futura implementación deberá versionar o declarar el algoritmo y evitar depender de una huella no especificada.

---

#### 14. `protected_payload_locator`

`protected_payload_locator` identifica de forma opaca dónde reside la evidencia fuente protegida cuando el contenido no deba o no pueda almacenarse dentro de la fila relacional.

Reglas:

1. el locator pertenece a la evidencia, no a la credencial;
2. no es un locator de secret store;
3. no contiene token de acceso, URL firmada persistente, contraseña, private key ni material recuperable de autenticación;
4. no se expone a consumidores ordinarios por el solo hecho de que puedan leer el registro empresarial relacionado;
5. debe ser suficiente para que un backend autorizado resuelva la evidencia bajo política de acceso;
6. su ciclo de vida se coordina con retención, hold y disposición de la evidencia.

---

#### 15. Frontera con credenciales y secretos

El staging puede enlazar únicamente `external_credential_id` como referencia opaca no secreta cuando sea necesario explicar qué superficie autenticada produjo la interacción.

No almacena:

- API keys operativas;
- `service_role`;
- bearer tokens;
- client secrets;
- webhook secrets;
- signing secrets;
- passwords;
- private keys;
- P8 o P12 privados;
- session cookies reutilizables;
- headers completos de autenticación;
- URLs firmadas persistentes;
- valores capaces de autenticar una nueva solicitud;
- locators operativos de secret store.

La metadata de credencial y la evidencia fuente permanecen en contratos y persistencias separadas.

---

#### 16. Headers y metadata de transporte

Los headers, atributos y metadata de transporte se conservan por allowlist mínima.

Se permite persistir únicamente información necesaria para:

- tipo y encoding del contenido;
- identificación de proveedor o superficie ya acreditada;
- correlación no secreta;
- timestamps;
- versión contractual;
- firmas o autenticidad mediante referencias o resultados no reutilizables, nunca mediante el secreto verificador;
- límites de reproducción o investigación.

Los headers de autorización, cookies, tokens y cualquier valor reutilizable se excluyen o redactan antes de la persistencia ordinaria de evidencia.

---

#### 17. Minimización y clases de evidencia

La política de `INT-EXT-014` gobierna cuánto conservar, no una regla universal de payload completo.

Cada integración se clasifica en una de estas decisiones documentales heredadas:

- preservación durable de entrada requerida;
- preservación mínima por recurso;
- no retener payload completo por minimización;
- gobernada por contrato interno VENTO;
- configuración de plataforma sin payload acreditado;
- modelo documentado sin binding remoto;
- no aplica sin binding;
- bloqueada sin binding.

La instancia del paquete materializa solo las filas que correspondan a integraciones efectivamente incluidas y acreditadas para ese paquete.

---

#### 18. Matriz heredada de las 21 identidades externas

| ID | Sistema | Decisión de evidencia fuente heredada | Decisión de INT-DB-003 |
| --- | --- | --- | --- |
| `EXT-SYS-001` | Supabase | gobernada por contrato interno VENTO | staging solo cuando el contrato interno del paquete exija evidencia fuente separada |
| `EXT-SYS-002` | Wompi | preservación durable de entrada requerida | elegible para captura protegida e inmutable antes de transformación |
| `EXT-SYS-003` | RevenueCat | preservación durable de entrada requerida | elegible para captura protegida e inmutable antes de transformación |
| `EXT-SYS-004` | Resend | no retener payload completo por minimización | conservar únicamente receipt o evidencia mínima necesaria |
| `EXT-SYS-005` | Expo / EAS Update | configuración de plataforma sin payload acreditado | no materializar staging de payload sin evidencia adicional |
| `EXT-SYS-006` | Expo Push Service | no retener payload completo por minimización | conservar evidencia mínima de operación y receipt cuando aplique |
| `EXT-SYS-007` | Sentry | no retener payload completo por minimización | no duplicar telemetría completa en staging |
| `EXT-SYS-008` | Google Maps / Google Reviews | no retener payload completo por minimización | conservar solo referencias o evidence mínima necesaria |
| `EXT-SYS-009` | Apple Wallet / PassKit y APNs | preservación mínima de operación por recurso | conservar receipt o evidencia mínima correlacionable por recurso |
| `EXT-SYS-010` | Vercel | configuración de plataforma sin payload acreditado | no materializar staging de payload sin evidencia adicional |
| `EXT-SYS-011` | Zebra BrowserPrint | no retener payload completo por minimización | conservar resultado técnico mínimo cuando sea necesario |
| `EXT-SYS-012` | Google Wallet / Google Pay & Wallet | modelo documentado sin binding remoto | no materializar staging hasta acreditar binding real |
| `EXT-SYS-013` | POS externo vigente | bloqueada sin binding | bloqueado hasta acreditar proveedor, binding y contrato de entrada |
| `EXT-SYS-014` | Shopify / canal de comercio electrónico | no aplica sin binding | no crear staging hasta acreditar binding |
| `EXT-SYS-015` | Rappi / marketplace | no aplica sin binding | no crear staging hasta acreditar binding |
| `EXT-SYS-016` | ManyChat / automatización conversacional | no aplica sin binding | no crear staging hasta acreditar binding |
| `EXT-SYS-017` | WhatsApp | no aplica sin binding | no crear staging hasta acreditar binding |
| `EXT-SYS-018` | Instagram / perfiles sociales | no aplica sin binding | no crear staging hasta acreditar binding |
| `EXT-SYS-019` | Correo corporativo y alias funcionales | no aplica sin binding | no crear staging hasta acreditar binding |
| `EXT-SYS-020` | Telefonía / canal de voz | bloqueada sin binding | bloqueado hasta acreditar proveedor, canal, binding y contrato |
| `EXT-SYS-021` | Transporte externo | no aplica sin binding | no crear staging hasta acreditar binding |

---

#### 19. Reconciliación cuantitativa del universo

La definición conserva exactamente la distribución heredada:

| Clasificación | Cantidad |
| --- | ---: |
| preservación durable de entrada requerida | **2** |
| preservación mínima de operación por recurso | **1** |
| no retener payload completo por minimización | **5** |
| gobernada por contrato interno VENTO | **1** |
| configuración de plataforma sin payload acreditado | **2** |
| modelo documentado sin binding remoto | **1** |
| no aplica sin binding | **7** |
| bloqueada sin binding | **2** |
| total | **21** |

Controles:

- identidades esperadas: **21**;
- decisiones materializadas documentalmente: **21 de 21**;
- faltantes: **0**;
- duplicadas: **0**;
- payloads físicos creados durante esta definición: **0**;
- secretos creados, copiados, movidos o revelados: **0**.

---

#### 20. Separación obligatoria por ambiente

Cada captura pertenece al `external_environment_binding_id` exacto de su integración.

Reglas:

1. una evidencia de `DEVELOPMENT` no puede ser presentada como evidencia de `STAGING` o `PRODUCTION`;
2. una evidencia de `STAGING` no se reutiliza como fuente productiva;
3. una captura productiva no se copia a ambientes inferiores por conveniencia;
4. el ambiente se deriva del binding registrado, no del nombre de una variable ni del payload;
5. un mismo proveedor o cuenta externa no elimina la separación ambiental;
6. retención, acceso y redacción pueden diferir por ambiente si la política aprobada así lo exige.

---

#### 21. Aislamiento de acceso

La visibilidad de una fila empresarial relacionada no concede acceso al payload fuente protegido.

La futura materialización deberá demostrar:

- denegación por defecto a clientes que no necesiten la evidencia;
- acceso mínimo por finalidad;
- separación entre lectura de metadata segura y recuperación del contenido protegido;
- autorización server-side para resolver `protected_payload_locator`;
- auditoría del acceso sensible mediante el contrato propietario de auditoría;
- ausencia de exposición accidental por views, RPC, logs, Storage URLs o joins de conveniencia.

Ninguna política de acceso se deduce por estar en el mismo `package_id`.

---

#### 22. Wompi: disposición objetivo del staging

Para Wompi, la definición conserva la brecha heredada: el estado observado guarda JSON parseado en una fila de webhook, duplica contenido en una respuesta de transacción y permite actualización del payload en redelivery, sin una evidencia fuente inmutable separada con huella de los bytes o representación fuente preservada.

La futura instancia aplicable deberá:

1. capturar la representación fuente antes de cualquier transformación que invalide la verificación;
2. conservar `received_at`, longitud, modo de captura y digest;
3. mantener evidencia protegida separada de la transacción empresarial;
4. impedir reemplazo del contenido por redelivery;
5. enlazar autenticidad mediante referencia, no copiar el secreto;
6. entregar la identidad de evidencia a los contratos posteriores de idempotencia, mapping, auditoría y conciliación.

Esta tarea no modifica el webhook actual.

---

#### 23. RevenueCat: disposición objetivo del staging

Para RevenueCat, la definición conserva la brecha heredada: la entrada observada se parsea antes de preservar una representación fuente separada y el payload completo aparece duplicado en superficies empresariales o de auditoría.

La futura instancia aplicable deberá:

1. separar captura fuente de la suscripción y del audit trail ordinario;
2. preservar la representación necesaria antes de normalización cuando el contrato de autenticidad lo requiera;
3. impedir duplicación del payload completo en registros empresariales;
4. limitar vistas y lecturas a metadata o representaciones redactadas;
5. conservar digest y correlación suficientes para reproducción controlada;
6. evitar que un payload del proveedor sea tratado como estado canónico de Club.

Esta tarea no modifica el webhook ni las tablas actuales.

---

#### 24. Retención, preservación y disposición

No existe una duración universal fijada por `INT-DB-003`.

Toda captura materializada debe resolver:

```text
sensitivity_class
+ finalidad
+ proceso o recurso
+ retention_policy_ref
+ preservation_or_hold_ref cuando exista
→ condición de disposición
```

Reglas:

1. retención indefinida por ausencia de decisión está prohibida;
2. un hold impide disposición mientras permanezca vigente;
3. backup no sustituye retención ni preservación;
4. purgar una evidencia no equivale a borrar el hecho empresarial ni su auditoría;
5. `disposition_evidence_ref` conserva la prueba de la disposición sin volver a copiar el payload;
6. la disposición no puede romper una obligación activa de replay, disputa, investigación o conciliación.

---

#### 25. Correcciones y revisiones de control

La representación fuente capturada no se corrige mediante UPDATE.

Cuando cambie una clasificación, hold, regla de acceso, decisión de disposición o metadata interpretativa:

- se crea un `EXTERNAL_SOURCE_EVIDENCE_CONTROL_EVENT` enlazado a `source_evidence_id`;
- se conserva razón, autoridad, tiempo y estado resultante;
- no se modifica el digest de la captura original;
- no se reemplaza `received_at`;
- no se reescribe la fuente porque un parser posterior obtenga otro resultado.

La corrección del hecho empresarial pertenece al owner empresarial y permanece separada.

---

#### 26. Datos binarios, documentos y payloads grandes

El registro relacional no obliga a almacenar inline contenido binario, documentos o cuerpos grandes.

La futura implementación deberá escoger una custodia protegida compatible con:

- integridad verificable;
- acceso mínimo;
- retención y hold;
- borrado verificable;
- recuperación autorizada;
- límites de tamaño y content type;
- ausencia de URLs firmadas persistentes en las filas;
- ausencia de duplicación innecesaria en logs, auditoría o tablas empresariales.

El staging conserva identidad y metadata aunque el contenido resida en una superficie protegida distinta.

---

#### 27. Handoff hacia INT-DB-004

`INT-DB-004` es propietario de la tabla física de mapeo entre identificadores externos y canónicos.

El handoff desde esta tarea es:

```text
source_evidence_id
package_id
external_system_id
external_integration_id
external_environment_binding_id
external_event_or_receipt_ref cuando exista
payload_digest
contract_version
```

`INT-DB-003` no crea `mapping_id`, no decide equivalencias y no convierte coincidencia de payload, UUID, correo, nombre, teléfono u otro atributo en un mapeo canónico.

---

#### 28. Handoff hacia INT-DB-005

`INT-DB-005` conserva restricciones e índices de idempotencia.

`INT-DB-003` entrega:

- `source_evidence_id`;
- identidad del sistema e integración;
- binding ambiental;
- identificador o receipt externo cuando exista;
- digest de la representación capturada;
- tiempo de recepción;
- versión contractual.

No crea idempotency keys, claims, outcomes recuperables ni deduplicación empresarial.

---

#### 29. Handoff hacia INT-DB-006

`INT-DB-006` es propietario de la cuarentena de eventos no mapeados o inválidos.

Una futura cuarentena podrá referenciar `source_evidence_id` sin copiar de nuevo el payload protegido.

`INT-DB-003` no define motivos de cuarentena, workflow de resolución ni lifecycle de dead-letter.

---

#### 30. Handoff hacia INT-DB-007

`INT-DB-007` es propietario de auditoría de procesamiento.

La auditoría podrá referenciar:

- `source_evidence_id`;
- digest;
- integración;
- binding;
- contract version;
- referencias de autenticidad o resultado.

No debe copiar por defecto el payload completo. La existencia de la evidencia fuente tampoco sustituye el audit trail de quién procesó, rechazó, reintentó o produjo un efecto.

---

#### 31. Handoff hacia INT-DB-008

`INT-DB-008` es propietario de mecanismos de conciliación.

Una conciliación podrá usar `source_evidence_id` como referencia inmutable de qué recibió VENTO y comparar esa evidencia con receipts, mappings, efectos empresariales y resultados externos.

`INT-DB-003` no decide el outcome de conciliación ni corrige fuentes durante esta definición.

---

#### 32. Contrato de materialización por paquete

Cada futura instancia `INT-DB-003::<package_id>` deberá cerrar, antes de materializarse:

```text
package_id aprobado
E5 del package_id = PASS
registro INT-DB-001 del mismo paquete disponible
integraciones aplicables seleccionadas explícitamente
binding ambiental acreditado
política INT-EXT-014 resuelta por integración
sensitivity_class resuelta
retention_policy_ref resuelta
custodia protegida decidida cuando aplique
frontera de acceso y redacción definida
rollback o forward-fix de la migración definido
```

Si una integración necesita enlazar una credencial, la referencia debe provenir del contrato de `INT-DB-002`; su valor nunca entra al staging.

---

#### 33. Evidencia mínima de certificación física futura

Una futura instancia no podrá declararse materializada únicamente porque exista una tabla.

La certificación por paquete deberá demostrar, como mínimo:

1. migración canónica y reproducible desde `vento-shell`;
2. inmutabilidad de la captura fuente;
3. ausencia de overwrite por redelivery;
4. digest reproducible sobre la representación declarada;
5. captura raw antes de parseo cuando la autenticidad dependa de bytes exactos;
6. denegación de secretos y headers reutilizables;
7. aislamiento ambiental;
8. acceso mínimo a payload protegido;
9. redacción segura de vistas, logs y auditoría;
10. retención, hold y disposición verificables;
11. referencias estables para mappings, idempotencia, cuarentena, auditoría y conciliación;
12. rollback o forward-fix compatible con evidencia ya capturada;
13. ausencia de cambios fuera del `package_id` autorizado.

---

#### 34. Rollback y forward-fix

La reversión de una futura implementación no puede destruir evidencia fuente ya aceptada como canónica de investigación.

Reglas:

1. DDL defectuoso puede revertirse o corregirse conforme a la política de migraciones;
2. datos fuente ya capturados se preservan o migran de forma controlada;
3. un rollback no reescribe el payload para acomodarlo al esquema anterior;
4. si existe evidencia producida bajo una versión defectuosa, la corrección conserva lineage y digest originales;
5. la pérdida deliberada de evidencia solo puede ocurrir mediante disposición autorizada por retención, no como efecto colateral del rollback.

---

#### 35. Límites

Esta tarea no:

- ejecuta DDL, DML, migraciones, RLS, RPC ni cambios remotos;
- crea payloads físicos, filas, buckets, blobs o objetos Storage;
- modifica webhooks de Wompi o RevenueCat;
- crea ni rota credenciales;
- define locators de secret store;
- materializa mappings externos/canónicos;
- crea idempotency keys ni claims;
- crea cuarentenas o dead-letter;
- materializa auditoría de procesamiento;
- materializa conciliación;
- cambia contratos empresariales de los owners;
- acredita un binding que BLOQUE X mantiene como no aplicable o bloqueado;
- inicia `INT-DB-004`.

---

#### 36. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Requisitos diferidos:** 0

**Requisitos obsoletos:** 0

El contrato queda cubierto por requisitos vigentes de integración, seguridad, Supabase, retención, idempotencia, auditoría y conservación de payload ya registrados. No se modifica el registro 04A.

---

#### 37. Cobertura de prueba vigente reutilizada

La cobertura vigente que sustenta esta tarea incluye, sin modificación:

- `TREQ-INTEGRATION-003` — identidad estable, huella, estado durable y resultado recuperable para operaciones reintentables;
- `TREQ-INTEGRATION-004` — reconstrucción de causa, payload, principal, intento, resultado y efecto;
- `TREQ-INTEGRATION-034` — minimización y carácter referencial del payload específico;
- `TREQ-INTEGRATION-049` — afirmación original, autenticidad, identificador externo, payload protegido, recepción y correlación;
- `TREQ-INTEGRATION-051` — prohibición de secretos y credenciales en eventos y contratos;
- `TREQ-INTEGRATION-125` — deduplicación posterior preservando payload fuente protegido y huella;
- `TREQ-INTEGRATION-126` — receipt estable cuando el proveedor no suministra identificador;
- `TREQ-INTEGRATION-127` — digest como guardia y no como identidad empresarial;
- `TREQ-INTEGRATION-213` — conservación de referencias del intercambio externo, payload protegido, digest, transformación y correlación;
- `TREQ-INTEGRATION-217` — append-only y corrección enlazada;
- `TREQ-INTEGRATION-218` — minimización de auditoría y exclusión de secretos;
- `TREQ-SUPABASE-201` — replay, retención y redacción del webhook de pagos;
- `TREQ-SUPABASE-208` — resiliencia, datos enviados, retención y conciliación de integraciones externas;
- `TREQ-SUPABASE-218` — prohibición de secretos en tablas, logs, fixtures y artefactos;
- `TREQ-SUPABASE-226` — coherencia de ambiente, proveedor y endpoints;
- `TREQ-SUPABASE-230` — redacción de payloads y datos sensibles en observabilidad;
- `TREQ-SUPABASE-271` — evidencia inmutable sin secretos;
- `TREQ-SUPABASE-386` — retención, archivo, purga y replay para tablas de eventos y webhooks;
- `TREQ-SUPABASE-387` — conservación controlada de payload, firma, resultado e idempotencia de webhooks;
- `TREQ-SUPABASE-391` — separación entre backup, retención y archivo;
- `TREQ-SUPABASE-476` — payload original, firma, identificador externo, correlación, deduplicación y conciliación antes del hecho interno.

Estas referencias son trazabilidad de cobertura existente y no representan cambios al registro.

---

#### 38. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | La batería npm del checkout completo no forma parte de la preparación estática del artefacto y deberá ejecutarse en el checkout documental vigente después de insertar la tarea. |
| LOCAL | PASS | El artefacto fue comprobado estructuralmente como UTF-8 sin BOM, LF, metadata compacta, secciones obligatorias, continuidad, cero TREQ en la sección de cambios, matriz 21/21, topología `TEMPLATE_PER_PACKAGE`, gate `POST_E5_PACKAGE`, contenido prohibido y alcance documental sin materialización física. |
| REMOTA | PASS | Se verificaron en `main` la continuidad después del cierre de INT-DB-002, el archivo propietario, topología, políticas de tarea, contrato de entrega, BLOQUE X, 04A INTEGRATION y SUPABASE, `package.json`, validadores documentales y ausencia de rama remota `task/int-db-003` al corte. |
| OPERATIVA | NOT_EXECUTED | No se ejecutaron webhooks, providers, replay, redelivery, retención ni accesos a evidencia en ambientes operativos; esas pruebas corresponden a futuras instancias por paquete. |
| FÍSICA | NOT_APPLICABLE | La definición documental autoriza cero cambios físicos y no crea instancia `GLOBAL`; la materialización futura pertenece a `INT-DB-003::<package_id>` después de E5. |

---

#### 39. Criterios de aceptación

`INT-DB-003` queda documentalmente cerrada cuando se demuestre que:

1. existe una sola definición reutilizable del staging inmutable;
2. la topología es `TEMPLATE_PER_PACKAGE` y el gate es `POST_E5_PACKAGE`;
3. ninguna instancia `GLOBAL` es creada o implícita;
4. el staging usa identidades estables de `INT-DB-001` y solo referencias no secretas de `INT-DB-002` cuando correspondan;
5. evidencia fuente, payload normalizado, hecho empresarial, auditoría, log y credencial permanecen separados;
6. la captura fuente es inmutable y redelivery no sobrescribe historia;
7. el digest no se usa como identidad empresarial;
8. la captura raw ocurre antes de parseo cuando la autenticidad depende de bytes exactos;
9. secretos y material reutilizable de autenticación están excluidos;
10. `protected_payload_locator` no puede convertirse en secret-store locator ni URL firmada persistente;
11. la matriz conserva 21 de 21 identidades y la distribución 2/1/5/1/2/1/7/2;
12. Wompi y RevenueCat conservan las brechas actuales como drivers de implementación sin declarar corrección física;
13. retención, hold y disposición quedan expresamente separados de backup;
14. `INT-DB-004..008` conservan sus responsabilidades propias;
15. la sección de requisitos derivados declara cero cambios y no contiene identificadores de requisito;
16. la cobertura existente queda trazada fuera de esa sección;
17. ninguna modificación Supabase es ejecutada durante esta tarea documental.

---

#### 40. Decisiones vinculantes

Quedan vinculantes para cualquier futura materialización de `INT-DB-003::<package_id>`:

- staging significa evidencia fuente protegida, no copia empresarial;
- la captura original no se sobrescribe;
- cada captura tiene identidad propia;
- los identificadores externos y los digests se conservan como referencias, no como identidad universal;
- raw bytes se preservan antes de transformación cuando el contrato de autenticidad los necesite;
- el contenido completo se conserva únicamente cuando la política de preservación lo exige;
- receipt mínimo o representación redactada se prefieren cuando el payload completo no es necesario;
- credenciales y secretos nunca forman parte del staging;
- la evidencia protegida no hereda automáticamente la visibilidad de la fila empresarial;
- una corrección crea nueva evidencia de control y no edita la captura;
- retención y disposición son explícitas y auditables;
- mappings, idempotencia, cuarentena, auditoría y conciliación permanecen separados;
- toda materialización pertenece a un `package_id` aprobado después de E5.

---

#### 41. Continuidad

**ÚLTIMA TAREA APROBADA**
`INT-DB-002 — Crear referencias de credenciales sin almacenar secretos en tablas expuestas`

**TAREA ACTUAL APROBADA**
`INT-DB-003 — Crear staging inmutable de payloads externos`

**SIGUIENTE TAREA RESERVADA**
`INT-DB-004 — Crear mapeos de identificadores externos y canónicos`


### ✅ INT-DB-004 — Crear mapeos de identificadores externos y canónicos

**Estado:** APROBADA
**Tarea anterior:** INT-DB-003 — Crear staging inmutable de payloads externos
**Tarea siguiente:** INT-DB-005 — Crear restricciones e índices de idempotencia
**Tipo de tarea:** Documental; contrato y plantilla R2 repetible por `package_id` para persistir relaciones versionadas entre referencias externas tipadas y recursos canónicos VENTO, conservando namespace, ambiente, relación, estado, evidencia, vigencia y lineage sin materializar idempotencia, cuarentena, auditoría de procesamiento ni conciliación durante esta definición
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/05_INFRAESTRUCTURA_DE_INTEGRACIONES_EXTERNAS.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`; contrato canónico `TEMPLATE_PER_PACKAGE` cerrado para futuras instancias `INT-DB-004::<package_id>`, sujetas a `POST_E5_PACKAGE`, al registro de integración y staging aplicables del mismo paquete, al contrato compartido de mapping vigente, a recaptura de drift y a autorización física explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0
**Fecha de corte:** 2026-08-25

---

#### 1. Propósito

`INT-DB-004` define cómo deberá persistirse, por paquete, una relación entre una referencia externa tipada y un recurso canónico VENTO cuando esa relación esté permitida y acreditada por los contratos propietarios.

La tarea no intenta convertir toda referencia externa en un identificador empresarial. Su propósito es materializar únicamente relaciones explícitas, versionadas, trazables y scoped por sistema, ambiente, superficie, namespace y tipo de identificador.

La futura persistencia deberá permitir responder de forma reproducible:

1. qué sistema externo originó o administra la referencia;
2. qué integración y binding ambiental la contextualizan;
3. qué clase y tipo de identificador externo representa;
4. qué regla de normalización contractual se aplicó, si alguna;
5. qué clase de relación fue acreditada;
6. qué recurso canónico VENTO es el destino, cuando la relación exacta lo requiera;
7. qué estado de resolución tiene la relación;
8. qué evidencia sustenta la relación;
9. qué correlaciones ayudan a reconstruir su origen sin convertirse en identidad;
10. desde cuándo es válida y cuándo fue retirada;
11. qué relación la precedió o sucedió;
12. qué paquete, contrato y versión del registro produjeron la materialización.

---

#### 2. Resultado canónico

Queda definido el contrato documental único de persistencia de mappings para `INT-DB-004`:

```text
INT-DB-004
→ definición documental única y reutilizable

INT-DB-004::<package_id>
→ futura instancia física del paquete

INT-DB-001
→ sistema, integración y binding ambiental

INT-DB-003
→ evidencia fuente y referencias de origen cuando existan

SHELL-CON-022
→ shape estático compartido de mapping

INT-EXT-013
→ semántica propietaria de clases, relaciones, estados y casos externos

owner empresarial
→ valida recurso canónico y uso permitido

resultado
→ mapping versionado, trazable y sin autoridad implícita
→ handoff estable hacia INT-DB-005..008
```

No existe una instancia física `GLOBAL` de `INT-DB-004`.

---

#### 3. Topología y gate de ejecución

La topología aplicable queda cerrada así:

| Propiedad | Decisión |
| --- | --- |
| Modalidad | `TEMPLATE_PER_PACKAGE` |
| Gate temporal | `POST_E5_PACKAGE` |
| Identidad física futura | `INT-DB-004::<package_id>` |
| Instancia global | no aplica |
| Reapertura del marcador por paquete | prohibida |
| Implementación durante esta definición | ninguna |

Una futura instancia solo podrá materializar mappings para un `package_id` que haya superado la puerta E5 aplicable y haya incluido expresamente la integración, el recurso canónico y las dependencias de mapping en su paquete de implementación.

El contrato estático compartido de `SHELL-CON-022::GLOBAL` puede existir antes de E5 como fundación común; esa materialización global no cambia la cardinalidad física posterior de `INT-DB-004`, que permanece por paquete y posterior a E5.

---

#### 4. Entradas canónicas preservadas

La tarea consume sin redefinir:

- `INT-EXT-013` y `VENTO-EXTERNAL-ID-MAPPING-CONTRACT-001`;
- la matriz `VENTO-EXTERNAL-ID-MAPPING-MATRIX-001` para `EXT-SYS-001` a `EXT-SYS-021`;
- `SHELL-CON-022::GLOBAL` y la forma estática `ExternalIdentifierMapping`;
- `INT-DB-001` para `external_system_id`, `external_integration_id`, `external_environment_binding_id`, `environment_ref` y versión del registro;
- `INT-DB-003` para `source_evidence_id`, referencia externa o receipt, digest y versión contractual cuando la relación provenga de una interacción capturada;
- `INT-EXT-012` y `SHELL-CON-023` como fronteras separadas de idempotencia;
- `SHELL-CON-019` para eventos externos recibidos que puedan referenciar mappings;
- `SHELL-CON-021` para líneas de venta que puedan referenciar mappings sin ser reidentificadas por ellos;
- los contratos propietarios de los recursos canónicos VENTO;
- las reglas de autorización, seguridad, retención, auditoría y conciliación vigentes.

La persistencia de un mapping no redefine la semántica de ninguna de estas fuentes.

---

#### 5. Separación semántica obligatoria

La implementación deberá conservar siempre las siguientes diferencias:

```text
MAPPING_ID
≠ IDENTIFICADOR EXTERNO
≠ IDENTIFICADOR CANÓNICO VENTO
≠ IDENTIFICADOR CANÓNICO PROPAGADO
≠ RECEIPT O EVENT ID
≠ CORRELATION REF
≠ IDEMPOTENCY KEY
≠ CREDENCIAL
≠ AUTORIZACIÓN
≠ PROPIEDAD EMPRESARIAL
```

Consecuencias:

1. `mapping_id` identifica la relación de mapping y no al recurso externo ni al recurso canónico;
2. un identificador externo no se convierte en `mapping_id`;
3. un ID canónico no se convierte en `mapping_id`;
4. una coincidencia de contenido no crea la relación;
5. una relación resuelta no demuestra que la operación sea nueva;
6. una relación resuelta no concede acceso ni permiso sobre el recurso;
7. una credencial o principal técnico no demuestra equivalencia de recursos;
8. una referencia de correlación puede existir sin equivalencia exacta.

---

#### 6. Fuente estática compartida de verdad contractual

La futura persistencia deberá poder proyectar sin pérdida la forma `ExternalIdentifierMapping` materializada por `SHELL-CON-022`.

La forma compartida conserva exactamente catorce campos de nivel superior:

```text
mapping_id
contract_version
external_ref
relation_kind
canonical_resource_type
canonical_id
mapping_state
resolution_detail
evidence_refs
correlation_refs
valid_from
retired_at
predecessor_mapping_ref
successor_mapping_ref
```

`external_ref` conserva exactamente:

```text
external_system_id
environment
surface
external_namespace
external_id_class
external_id_kind
external_id_value
```

La persistencia puede normalizar físicamente componentes del shape, pero deberá reconstruirlo de forma inequívoca y sin añadir semántica incompatible.

---

#### 7. Familias lógicas de persistencia

La futura materialización por paquete se compone de tres responsabilidades lógicas separables:

| Familia lógica | Responsabilidad |
| --- | --- |
| `EXTERNAL_IDENTIFIER_MAPPING_RECORD` | identidad estable de la relación, scope externo, destino canónico, estado, contrato y vigencia |
| `EXTERNAL_IDENTIFIER_MAPPING_REVISION` | historia append-only de decisiones, cambios de estado, retiro y sucesión sin reescribir el significado histórico |
| `EXTERNAL_IDENTIFIER_MAPPING_EVIDENCE_LINK` | vínculos a evidencia y correlaciones sin copiar payload protegido ni convertir referencias en identidad |

La implementación física posterior podrá expresar estas responsabilidades mediante una o más tablas compatibles con el modelo Supabase vigente, siempre que mantenga la semántica y cardinalidad definidas aquí.

---

#### 8. Identidad estable de mapping

`mapping_id` conserva la identidad `ExternalIdentifierMappingId` definida por `SHELL-CON-022`.

Reglas:

1. es estable, opaca y no secreta;
2. no se deriva de `external_id_value`;
3. no se deriva de `canonical_id`;
4. no se deriva de payload, hash, receipt, evento, credencial o principal técnico;
5. no se reutiliza para otra relación semánticamente incompatible;
6. una rotación de credencial no crea por sí sola otro mapping;
7. una nueva versión compatible del contrato no cambia por sí sola la identidad;
8. una reasignación del identificador externo hacia otro recurso canónico exige retiro y relación sucesora;
9. una relación histórica no se elimina para liberar `mapping_id`;
10. `mapping_id` no es idempotency key.

La representación física del identificador no queda fijada por esta definición documental.

---

#### 9. Envelope físico mínimo por paquete

Además de proyectar el shape compartido, cada mapping materializado deberá conservar el contexto físico necesario para pertenecer a una instancia concreta de `INT-DB-004::<package_id>`.

Como mínimo:

| Campo lógico | Cardinalidad | Regla |
| --- | ---: | --- |
| `mapping_id` | 1 | identidad estable de la relación |
| `package_id` | 1 | paquete propietario de la materialización |
| `external_integration_id` | 1 | integración registrada por `INT-DB-001` |
| `external_environment_binding_id` | 1 | binding ambiental acreditado |
| `contract_version` | 1 | versión del contrato de mapping |
| `mapping_revision` | 1 | revisión monotónica de persistencia |
| `registry_version` | 1 | versión del registro de integración consumida |
| `recorded_at` | 1 | instante de persistencia de la revisión |
| `recorded_by_ref` | 1 | principal o proceso técnico que registró la decisión |
| `source_definition_ref` | 1 | referencia documental que autorizó la semántica |
| `source_definition_digest` | 1 | huella de la definición consumida |

Los campos del envelope no sustituyen ni alteran los catorce campos compartidos.

---

#### 10. Referencia externa tipada

Toda fila o revisión que represente una relación material deberá conservar la referencia externa con el scope mínimo aprobado:

```text
external_system_id
+ environment
+ surface
+ external_namespace
+ external_id_class
+ external_id_kind
+ external_id_value
```

Reglas:

1. `external_system_id` debe existir en el registro canónico del paquete;
2. `environment` debe coincidir con el binding ambiental;
3. `surface` debe corresponder al contrato que produjo o consume la referencia;
4. `external_namespace` no se infiere desde el valor;
5. `external_id_class` usa el vocabulario cerrado del contrato compartido;
6. `external_id_kind` conserva la naturaleza específica del proveedor;
7. `external_id_value` conserva el valor según la normalización autorizada por su namespace;
8. dos valores textualmente iguales en scopes distintos no se fusionan.

---

#### 11. Vocabulario cerrado de clases

La persistencia deberá aceptar únicamente las diez clases compartidas vigentes:

```text
EXTERNAL_OBJECT_ID
CANONICAL_VENTO_ID
PROPAGATED_CANONICAL_ID
EXTERNAL_ROUTING_REF
IDEMPOTENCY_REF
CORRELATION_REF
DISPLAY_SEARCH_ATTRIBUTE
TECHNICAL_NAMESPACE_ID
EXTERNAL_ALIAS
MAPPING_RECORD
```

Una clase nueva o un cambio incompatible de significado exige evolución versionada del contrato propietario antes de persistirse.

---

#### 12. Vocabulario cerrado de relaciones

La persistencia deberá aceptar únicamente las siete relaciones compartidas vigentes:

```text
EXTERNAL_TO_CANONICAL
CANONICAL_PROPAGATED_EXTERNAL
EXTERNAL_ROUTE_TO_OWNER
EXTERNAL_EVENT_TO_RECEIPT
EXTERNAL_NAMESPACE_BINDING
CORRELATION_ONLY
NO_EQUIVALENCE
```

Reglas:

1. `EXTERNAL_TO_CANONICAL` exige un destino canónico exacto;
2. `CANONICAL_PROPAGATED_EXTERNAL` conserva que el identificador sigue siendo de VENTO;
3. `EXTERNAL_ROUTE_TO_OWNER` vincula una ruta técnica con el registro propietario aplicable sin convertir la ruta en persona o recurso empresarial;
4. `EXTERNAL_EVENT_TO_RECEIPT` vincula evento externo con recibo interno y no con el hecho empresarial como identidad;
5. `EXTERNAL_NAMESPACE_BINDING` vincula una frontera técnica sin equivalencia empresarial automática;
6. `CORRELATION_ONLY` registra relación de reconstrucción sin declarar identidad;
7. `NO_EQUIVALENCE` es una decisión explícita y no un valor nulo accidental.

---

#### 13. Vocabulario cerrado de estados

La persistencia deberá aceptar únicamente los ocho estados compartidos vigentes:

```text
RESOLVED
PARTIALLY_RESOLVED
UNRESOLVED
AMBIGUOUS
CONFLICT
RETIRED
NOT_APPLICABLE
BLOCKED
```

`mapping_state` es estado de resolución del mapping y no estado empresarial del recurso canónico.

---

#### 14. Scope de identidad y namespace

El scope mínimo de resolución exacta conserva:

```text
external_system_id
+ environment
+ surface
+ external_namespace
+ external_id_kind
```

`external_id_class` forma parte de la semántica de la referencia y deberá permanecer compatible con el tipo y relación acreditados.

Invariantes:

1. un identificador externo no se considera globalmente único fuera de su scope;
2. la misma cadena puede existir en proveedores distintos sin colisión;
3. la misma cadena puede existir en ambientes distintos sin colisión;
4. la misma cadena puede significar clases distintas si los contratos así lo establecen;
5. una búsqueda inversa desde `canonical_id` no presume una única referencia externa;
6. varias referencias externas pueden apuntar al mismo recurso canónico cuando el contrato lo permita;
7. una relación many-to-many solo existe si un owner la define expresamente.

---

#### 15. Normalización del valor externo

No existe una normalización universal del identificador externo.

Queda prohibido aplicar por defecto:

- `trim` indiscriminado;
- conversión universal a minúsculas o mayúsculas;
- retiro de prefijos;
- conversión numérica;
- canonicalización UUID;
- normalización de teléfono;
- normalización de correo como prueba de identidad;
- reserialización del valor para obtener una clave distinta.

Solo el contrato del namespace puede autorizar una normalización determinista específica y deberá conservarse procedencia suficiente para reconstruirla.

Una normalización no puede fusionar valores semánticamente distintos.

---

#### 16. Cardinalidad de relaciones exactas

Para una relación activa de identidad exacta `EXTERNAL_TO_CANONICAL` se cumple:

```text
una referencia externa exacta
+ un scope de namespace exacto
→ como máximo un destino canónico activo
```

Reglas:

1. ausencia de duplicados observados no demuestra uno-a-uno global;
2. múltiples referencias externas pueden apuntar al mismo recurso canónico;
3. múltiples rutas técnicas no crean múltiples identidades empresariales;
4. una relación many-to-many requiere contrato explícito;
5. una segunda relación activa incompatible para la misma referencia produce `CONFLICT`;
6. un cambio de destino no sobrescribe historia: retira la relación anterior y crea o enlaza la sucesora.

---

#### 17. Nullability del destino canónico

`canonical_resource_type` y `canonical_id` se gobiernan por relación y estado.

Reglas:

1. una relación exacta resuelta exige ambos valores;
2. `NO_EQUIVALENCE` puede existir sin destino canónico;
3. `NOT_APPLICABLE` puede existir sin destino canónico;
4. `BLOCKED` puede existir sin destino canónico;
5. `UNRESOLVED` no debe inventar un destino para satisfacer nullability física;
6. `AMBIGUOUS` conserva candidatos fuera del destino canónico definitivo y no elige el primero;
7. `CONFLICT` conserva las referencias suficientes para conciliación sin declarar un ganador silencioso;
8. `PARTIALLY_RESOLVED` solo autoriza las dimensiones explícitamente resueltas.

---

#### 18. Reglas de evidencia

Una relación exacta requiere evidencia reconstruible.

La futura persistencia deberá favorecer referencias sobre copias:

```text
mapping_id
→ evidence_refs[]
→ source_evidence_id cuando aplique
→ evidencia de owner o binding
→ decisión reproducible
```

Reglas:

1. payload completo no es identidad de mapping;
2. digest no reemplaza la relación;
3. correlación no crea equivalencia;
4. `source_evidence_id` puede sustentar la decisión sin copiar el payload protegido;
5. secretos y credenciales no pueden almacenarse como evidencia de mapping;
6. pérdida de evidencia suficiente puede obligar a conciliación o impedir nuevas decisiones automáticas;
7. una evidencia nueva incompatible no reescribe silenciosamente la evidencia histórica.

---

#### 19. Handoff heredado desde INT-DB-003

Cuando el mapping nazca de una interacción capturada por `INT-DB-003`, la relación podrá conservar:

```text
source_evidence_id
package_id
external_system_id
external_integration_id
external_environment_binding_id
external_event_or_receipt_ref cuando exista
payload_digest
contract_version
```

Límites:

1. `source_evidence_id` no se convierte en `mapping_id`;
2. `external_event_or_receipt_ref` no se convierte en `mapping_id`;
3. `payload_digest` no se convierte en `mapping_id`;
4. el staging no decide equivalencia;
5. el mapping puede referenciar evidencia sin obtener acceso ordinario al payload protegido.

---

#### 20. Correlación y referencias auxiliares

`correlation_refs[]` conserva referencias útiles para reconstrucción, pero no amplía la semántica de la relación.

Puede enlazar, cuando corresponda:

- receipt interno;
- external event ID;
- request ID;
- source command ID;
- sale o sale line canónicos;
- job o dispositivo técnico;
- caso de conciliación;
- evidencia de owner;
- identificador propagado acreditado.

Queda prohibido promover automáticamente una `correlation_ref` a identidad exacta.

---

#### 21. Frontera de autenticidad

Autenticidad y mapping permanecen separados.

Un mensaje auténtico puede contener un identificador todavía `UNRESOLVED`, `AMBIGUOUS` o `CONFLICT`.

Un mapping `RESOLVED` no demuestra que un mensaje concreto sea auténtico.

La futura ejecución deberá preservar el resultado de autenticidad mediante referencia cuando sea material para la evidencia, sin almacenar el secreto verificador dentro del mapping.

---

#### 22. Frontera de autorización y propiedad

Un mapping resuelto solo habilita los gates posteriores que corresponda; nunca concede por sí mismo:

- permiso;
- rol;
- alcance territorial;
- acceso al recurso canónico;
- autoridad para mutar;
- propiedad empresarial;
- identidad humana;
- identidad de dispositivo compartido;
- acceso al proveedor.

El dominio propietario debe revalidar existencia, estado, versión, finalidad y autorización del recurso canónico antes de cualquier efecto.

---

#### 23. Frontera con idempotencia

`INT-DB-005` es propietario de las restricciones e índices de idempotencia.

`INT-DB-004` entrega como dimensiones o referencias posibles:

```text
mapping_id
external_system_id
external_integration_id
external_environment_binding_id
external_id_kind
external_id_value
canonical_resource_type cuando exista
canonical_id cuando exista
contract_version
```

Pero:

1. `mapping_id` no es idempotency key;
2. `external_id_value` no es idempotency key por defecto;
3. resolver un mapping no demuestra que una operación sea nueva;
4. cambiar el mapping no autoriza repetir un efecto;
5. redelivery conserva su identidad idempotente aunque la resolución de mapping mejore posteriormente.

---

#### 24. Frontera con cuarentena

`INT-DB-006` es propietario de la cuarentena y registro de errores no procesables.

Los estados `UNRESOLVED`, `AMBIGUOUS`, `CONFLICT` o `BLOCKED` pueden ser una condición de disposición para un flujo que requiera identidad exacta, pero `INT-DB-004` no crea la cuarentena ni decide su lifecycle.

Una futura cuarentena deberá referenciar `mapping_id` o la referencia externa pertinente sin duplicar evidencia fuente innecesariamente.

---

#### 25. Frontera con auditoría de procesamiento

`INT-DB-007` es propietario de la auditoría de procesamiento, reintentos y compensaciones.

La auditoría podrá referenciar:

- `mapping_id`;
- revisión del mapping;
- estado de resolución;
- relación aplicada;
- `source_evidence_id`;
- owner y recurso resuelto;
- resultado de la operación dependiente.

No deberá copiar el payload fuente ni tratar un cambio de mapping como un nuevo hecho empresarial por sí solo.

---

#### 26. Frontera con conciliación

`INT-DB-008` es propietario de los mecanismos de conciliación por integración.

Una conciliación podrá usar mappings para detectar:

- misma referencia externa activa ligada a destinos incompatibles;
- mapping resuelto hacia recurso inexistente o retirado;
- evidencia nueva incompatible con la relación vigente;
- referencias externas sin mapping cuando el contrato exige uno;
- mappings sin evidencia suficiente;
- divergencia de ambiente o namespace;
- relación retirada todavía utilizada por un consumidor;
- target canónico modificado sin lineage de sucesión.

`INT-DB-004` no decide el cierre de conciliación.

---

#### 27. Aislamiento por ambiente

Cada mapping materializado pertenece al ambiente exacto de su binding.

Reglas:

1. una relación de `DEVELOPMENT` no se reutiliza en `STAGING`;
2. una relación de `STAGING` no se promueve implícitamente a `PRODUCTION`;
3. una relación productiva no se copia hacia ambientes inferiores para facilitar pruebas;
4. el valor externo puede repetirse entre ambientes sin crear una identidad compartida;
5. el destino canónico también debe pertenecer al contexto ambiental aplicable cuando el owner lo requiera;
6. la reconciliación de ambientes no puede elegir por coincidencia textual.

---

#### 28. Matriz heredada de las 21 identidades externas

| ID | Sistema / plataforma | Clasificación heredada | Estado heredado | Decisión de INT-DB-004 |
| --- | --- | --- | --- | --- |
| `EXT-SYS-001` | Supabase | `REFERENCIA_DE_PLATAFORMA_SIN_MAPEO_EMPRESARIAL` | `NOT_APPLICABLE` | no crear mapping empresarial global; relaciones técnicas futuras requieren contrato explícito del owner tecnológico |
| `EXT-SYS-002` | Wompi | `MAPEO_CANONICO_PARCIALMENTE_ACREDITADO` | `PARTIALLY_RESOLVED` | materializar solo relaciones acreditadas por paquete y ambiente entre transacción externa, referencia propagada, receipt y recursos canónicos aplicables |
| `EXT-SYS-003` | RevenueCat | `MAPEO_CANONICO_PARCIALMENTE_ACREDITADO` | `PARTIALLY_RESOLVED` | persistir únicamente relaciones acreditadas; `app_user_id`, producto, transacción externa y aliases conservan semánticas distintas |
| `EXT-SYS-004` | Resend | `SIN_IDENTIFICADOR_EXTERNO_PERSISTIDO_ACREDITADO` | `UNRESOLVED` | no inventar message ID; correo sigue siendo dirección o atributo hasta acreditar identificador y relación externa |
| `EXT-SYS-005` | Expo / EAS Update | `REFERENCIA_DE_PLATAFORMA_SIN_MAPEO_EMPRESARIAL` | `NOT_APPLICABLE` | project, profile, channel y runtime permanecen referencias técnicas salvo contrato explícito posterior |
| `EXT-SYS-006` | Expo Push Service | `MAPEO_CANONICO_PARCIALMENTE_ACREDITADO` | `PARTIALLY_RESOLVED` | token de push puede vincularse al registro técnico propietario; nunca se persiste como employee ID |
| `EXT-SYS-007` | Sentry | `SIN_IDENTIFICADOR_EXTERNO_PERSISTIDO_ACREDITADO` | `NOT_APPLICABLE` | no crear mapping empresarial desde issue, trace, usuario, mensaje, stack o grouping sin contrato propietario |
| `EXT-SYS-008` | Google Maps / Google Reviews | `REFERENCIA_EXTERNA_TRANSITORIA_SIN_MAPEO_CANONICO` | `UNRESOLVED` | `place_id` permanece externo; una asociación durable con recurso VENTO exige mapping explícito y evidencia suficiente |
| `EXT-SYS-009` | Apple Wallet / PassKit y APNs | `MAPEO_CANONICO_PARCIALMENTE_ACREDITADO` | `PARTIALLY_RESOLVED` | serial, pass type, device library ID, push token y owner canónico se materializan como planos separados cuando el paquete lo requiera |
| `EXT-SYS-010` | Vercel | `REFERENCIA_DE_PLATAFORMA_SIN_MAPEO_EMPRESARIAL` | `NOT_APPLICABLE` | project, deployment y domain refs no crean equivalencia empresarial global |
| `EXT-SYS-011` | Zebra BrowserPrint | `MAPEO_CANONICO_REQUERIDO_SIN_VINCULO_PERSISTENTE_ACREDITADO` | `UNRESOLVED` | `device.uid` solo podrá quedar resuelto contra identidad canónica de impresora después de acreditación explícita |
| `EXT-SYS-012` | Google Wallet / Google Pay & Wallet | `MODELO_DE_IDENTIFICADOR_SIN_BINDING_REMOTO` | `UNRESOLVED` | no crear relación activa hasta acreditar binding remoto, regla de construcción de IDs, namespace y recurso VENTO |
| `EXT-SYS-013` | POS externo vigente | `BLOQUEADA_SIN_BINDING` | `BLOCKED` | no materializar mappings hasta que el paquete acredite proveedor, objetos, IDs, namespaces y contratos; una fila o hash no fabrica identidad de venta o línea |
| `EXT-SYS-014` | Shopify / canal de comercio electrónico | `NO_APLICA_SIN_BINDING` | `NOT_APPLICABLE` | no crear shop, order, customer o product mappings sin binding autorizado |
| `EXT-SYS-015` | Rappi / marketplace | `NO_APLICA_SIN_BINDING` | `NOT_APPLICABLE` | no crear order, store o courier mappings sin contrato real |
| `EXT-SYS-016` | ManyChat / automatización conversacional | `NO_APLICA_SIN_BINDING` | `NOT_APPLICABLE` | no crear subscriber, contact o flow mappings sin bot/API acreditados |
| `EXT-SYS-017` | WhatsApp | `NO_APLICA_SIN_BINDING` | `NOT_APPLICABLE` | número, contacto o conversación no se convierten en persona o caso sin proveedor, namespace y contrato acreditados |
| `EXT-SYS-018` | Instagram / perfiles sociales | `NO_APLICA_SIN_BINDING` | `NOT_APPLICABLE` | handle, profile o message ID no se convierten en identidad empresarial sin binding y relación aprobados |
| `EXT-SYS-019` | Correo corporativo y alias funcionales | `NO_APLICA_SIN_BINDING` | `NOT_APPLICABLE` | mailbox, correo o alias no equivalen a persona, expediente o proveedor canónico por coincidencia |
| `EXT-SYS-020` | Telefonía / canal de voz | `BLOQUEADA_SIN_BINDING` | `BLOCKED` | mapping bloqueado hasta acreditar operador, cuenta, interfaz, namespaces, IDs y semántica contractual |
| `EXT-SYS-021` | Transporte externo | `NO_APLICA_SIN_BINDING` | `NOT_APPLICABLE` | tracking, guía, conductor o shipment ref no equivalen a salida o entrega VENTO sin binding y contrato acreditados |

---

#### 29. Reconciliación cuantitativa del universo

La definición conserva exactamente la distribución heredada de `INT-EXT-013`:

| Clasificación | Cantidad |
| --- | ---: |
| `MAPEO_CANONICO_PARCIALMENTE_ACREDITADO` | **4** |
| `MAPEO_CANONICO_REQUERIDO_SIN_VINCULO_PERSISTENTE_ACREDITADO` | **1** |
| `REFERENCIA_EXTERNA_TRANSITORIA_SIN_MAPEO_CANONICO` | **1** |
| `SIN_IDENTIFICADOR_EXTERNO_PERSISTIDO_ACREDITADO` | **2** |
| `REFERENCIA_DE_PLATAFORMA_SIN_MAPEO_EMPRESARIAL` | **3** |
| `MODELO_DE_IDENTIFICADOR_SIN_BINDING_REMOTO` | **1** |
| `NO_APLICA_SIN_BINDING` | **7** |
| `BLOQUEADA_SIN_BINDING` | **2** |
| total | **21** |

Controles:

- identidades esperadas: **21**;
- decisiones materializadas documentalmente: **21 de 21**;
- faltantes: **0**;
- duplicadas: **0**;
- mappings físicos creados durante esta definición: **0**;
- valores físicos nuevos de `ExternalIdentifierMappingId`: **0**;
- secretos creados, copiados, movidos o revelados: **0**.

---

#### 30. Wompi

La futura instancia aplicable conservará al menos cuatro planos separados:

```text
transaction.id externo
reference de operación
external event id
transaction UUID canónico propagado cuando corresponda
```

Reglas:

1. transaction ID externo puede participar en `EXTERNAL_TO_CANONICAL` hacia la transacción canónica acreditada;
2. `reference` permanece correlación o idempotencia según contrato y no se convierte en order ID;
3. external event ID puede vincularse con receipt interno mediante `EXTERNAL_EVENT_TO_RECEIPT`;
4. un UUID canónico propagado se valida como `PROPAGATED_CANONICAL_ID` y no se reclasifica como ID nativo de Wompi;
5. contradicción entre identificadores autenticados produce `CONFLICT`;
6. una relación resuelta no evita las validaciones de pago, estado, monto, owner o autorización.

---

#### 31. RevenueCat

La futura instancia aplicable conservará separados:

- `app_user_id` propagado;
- `product_id` o store product ID;
- `original_transaction_id`;
- aliases externos;
- recurso canónico de cliente o suscripción;
- plan o producto canónico cuando exista mapping acreditado.

Reglas:

1. `app_user_id` puede ser `PROPAGATED_CANONICAL_ID` solo si se demuestra que VENTO lo emitió;
2. `product_id` requiere relación tipada con el recurso propietario aplicable;
3. `original_transaction_id` permanece externo hasta acreditar una relación durable;
4. aliases no fusionan clientes VENTO;
5. un alias conflictivo se conserva como evidencia de conflicto y no como decisión de merge;
6. el mapping no modifica saldos, entitlement ni lifecycle de suscripción.

---

#### 32. Expo Push Service

Un push token es `EXTERNAL_ROUTING_REF`.

La futura persistencia podrá relacionarlo con el registro técnico de destino y su owner bajo `EXTERNAL_ROUTE_TO_OWNER`, pero:

1. el token no es employee ID;
2. el token no es user ID;
3. el token no es device principal canónico por sí solo;
4. rotación o invalidación del token no cambia la identidad de la persona;
5. un `announcementId` propagado continúa como referencia canónica/correlacional de VENTO;
6. un nuevo token requiere su propio lifecycle técnico y no reescritura de historia incompatible.

---

#### 33. Google Places

`place_id` se conserva como `EXTERNAL_OBJECT_ID` del namespace Google Places.

Reglas:

1. `place_id` no equivale a `site_id`;
2. nombre, dirección y coordenadas son atributos auxiliares;
3. una selección transitoria puede permanecer sin mapping durable;
4. si el owner decide una asociación durable, se crea una relación explícita y acreditada;
5. una ubicación visualmente coincidente no permite resolver automáticamente el mapping;
6. un cambio de sede no reinterpreta mappings históricos.

---

#### 34. Apple Wallet / PassKit y APNs

La futura persistencia deberá separar:

| Referencia | Semántica |
| --- | --- |
| `serialNumber` | identidad del recurso de pase dentro de su contrato |
| `passTypeIdentifier` | namespace técnico |
| `deviceLibraryIdentifier` | identificador externo de dispositivo Wallet |
| `pushToken` | referencia de routing APNs |
| `user_id` del registro del pase | identificador canónico del owner |

Ninguno de estos valores sustituye automáticamente a los demás.

---

#### 35. Zebra BrowserPrint

`device.uid` solo podrá materializar una relación exacta cuando exista evidencia acreditada que lo vincule con una identidad canónica de impresora.

No constituyen evidencia suficiente por sí solos:

- nombre visible;
- modelo;
- tipo;
- orden de enumeración;
- proximidad física;
- sede inferida;
- coincidencia con una etiqueta de usuario.

Hasta resolver esa relación, el estado permanece `UNRESOLVED` y no se crea un destino canónico ficticio.

---

#### 36. Resend y Sentry

Para Resend:

- correo del destinatario permanece dirección o atributo;
- IDs de invitación, usuario o empleado permanecen canónicos VENTO;
- no se inventa provider message ID si la respuesta actual no lo acredita;
- un futuro message ID deberá vincularse a la generación de entrega correspondiente.

Para Sentry:

- event, issue, release, trace o project IDs permanecen referencias técnicas salvo contrato explícito;
- usuario, correo, stack, mensaje, pantalla o grouping no crean mapping empresarial;
- una futura relación con caso tecnológico debe ser explícita y correlacional cuando corresponda.

---

#### 37. Plataformas técnicas y Google Wallet

Para Supabase, Expo/EAS y Vercel:

- los identificadores de plataforma no crean un mapping empresarial global;
- los IDs empresariales almacenados en Supabase siguen siendo canónicos de sus dominios;
- project, profile, channel, runtime, deployment o domain refs requieren contrato técnico explícito si alguna relación posterior debe persistirse.

Para Google Wallet:

- `classId` permanece namespace técnico;
- object `id` no se declara resuelto sin binding remoto acreditado;
- issuer, claims JWT y barcode no sustituyen identidad canónica;
- una futura activación deberá acreditar regla de construcción, namespace, recurso owner y respuesta o estado del proveedor.

---

#### 38. Integraciones sin binding acreditado

Para POS externo, Shopify, Rappi, ManyChat, WhatsApp, Instagram, correo corporativo, telefonía y transporte externo, la futura instancia no podrá crear mappings por anticipación.

Reglas:

1. no se inventan namespaces;
2. no se inventan objetos externos;
3. no se inventan IDs;
4. no se infieren proveedores;
5. no se infieren owners canónicos por nombre;
6. `EXT-SYS-013` y `EXT-SYS-020` permanecen `BLOCKED` hasta la evidencia propietaria;
7. las demás identidades sin binding permanecen `NOT_APPLICABLE` para materialización mientras no cambie su contrato aprobado.

---

#### 39. Escritura, revisión y lifecycle

La persistencia del mapping debe preservar historia.

Reglas:

1. crear una relación nueva genera `mapping_id` estable;
2. cambios de metadata compatibles pueden producir una revisión monotónica;
3. cambiar relación, namespace, target o semántica incompatible no reinterpreta la relación anterior;
4. una relación retirada conserva `retired_at` y lineage;
5. una reasignación requiere predecesor y sucesor;
6. `RETIRED` no libera la historia para reutilizar el mismo valor como si nunca hubiera existido;
7. una corrección de evidencia crea una decisión trazable y no borra la anterior;
8. una revisión no puede convertir silenciosamente `CORRELATION_ONLY` en `EXTERNAL_TO_CANONICAL`.

---

#### 40. Constraints e índices propios del mapping

La futura materialización deberá imponer constraints propios de integridad del mapping, sin invadir la idempotencia reservada a `INT-DB-005`.

Como mínimo deberá garantizar:

1. `mapping_id` único;
2. `mapping_revision` monotónica por `mapping_id`;
3. coherencia entre `external_system_id`, integración y binding del mismo paquete;
4. vocabularios cerrados de clase, relación y estado;
5. cardinalidad del destino canónico según relación y estado;
6. como máximo un target activo incompatible para una referencia exacta dentro del scope aprobado;
7. lineage válido entre predecesor y sucesor;
8. ausencia de referencias circulares de sucesión;
9. ambiente coherente con el binding;
10. queries resolubles por scope externo y por target canónico sin usar escaneo heurístico de atributos.

Los índices de esta sección son únicamente los necesarios para identidad y resolución del mapping. Las claves, claims, outcomes e índices de idempotencia pertenecen a `INT-DB-005`.

---

#### 41. Lectura y resolución

Una consulta de mapping debe ser determinista dentro del scope aprobado.

Reglas:

1. la resolución exacta recibe el scope completo, no solo `external_id_value`;
2. `RESOLVED` puede devolver como máximo el target canónico permitido;
3. `PARTIALLY_RESOLVED` devuelve únicamente dimensiones acreditadas;
4. `UNRESOLVED`, `AMBIGUOUS`, `CONFLICT` y `BLOCKED` fallan cerrados para efectos que exijan identidad exacta;
5. `NOT_APPLICABLE` no crea target ficticio;
6. `RETIRED` no se utiliza para nuevas operaciones fuera de su vigencia;
7. resolución histórica usa la regla temporal del owner y no `received_at` por conveniencia;
8. lookup inverso por `canonical_id` puede devolver múltiples relaciones válidas si el contrato lo permite.

---

#### 42. Seguridad y exposición

La persistencia de mappings no deberá almacenar:

- API keys;
- passwords;
- access tokens;
- refresh tokens;
- private keys;
- service role keys;
- provider credentials;
- URLs firmadas persistentes;
- payload fuente completo por defecto;
- secretos embebidos en `evidence_refs` o `correlation_refs`.

Además:

1. poder leer `mapping_id` no concede lectura del recurso canónico;
2. poder leer `canonical_id` no concede acceso al proveedor;
3. poder leer el recurso canónico no concede acceso al payload protegido;
4. consumidores ordinarios reciben solo las proyecciones mínimas necesarias;
5. la autorización se reevalúa en el owner del recurso.

---

#### 43. Contrato de materialización por paquete

Cada futura instancia `INT-DB-004::<package_id>` deberá cerrar, antes de materializarse:

```text
package_id aprobado
E5 del package_id = PASS
registro INT-DB-001 del mismo paquete disponible
integraciones aplicables seleccionadas explícitamente
bindings ambientales acreditados
contrato SHELL-CON-022 vigente
semántica INT-EXT-013 vigente
staging INT-DB-003 disponible cuando la relación dependa de evidencia fuente
recurso canónico y owner acreditados
scope y namespace resueltos
relation_kind resuelta
mapping_state inicial resuelto
estrategia de constraints e índices de mapping definida
migración y rollback o forward-fix definidos
```

Una instancia puede cerrar `NO_APPLICABLE` cuando el paquete no necesite persistir ningún mapping externo y esa ausencia quede demostrada por el expediente del paquete.

---

#### 44. Evidencia mínima de certificación física futura

Una futura instancia no podrá declararse materializada únicamente porque exista una tabla.

La certificación por paquete deberá demostrar, como mínimo:

1. migración canónica y reproducible desde `vento-shell`;
2. proyección lossless del shape `ExternalIdentifierMapping`;
3. unicidad de `mapping_id`;
4. namespace y ambiente obligatorios en resolución;
5. rechazo de heurísticas de igualdad;
6. constraints de target según relación y estado;
7. protección contra dos targets activos incompatibles para la misma referencia exacta;
8. lifecycle append-only o equivalente con retiro y sucesión trazables;
9. evidencia por referencia sin secretos ni payload completo innecesario;
10. separación de idempotencia, cuarentena, auditoría y conciliación;
11. denegación de acceso lateral por conocer mapping o target;
12. pruebas de casos Wompi, RevenueCat, Expo Push, Google Places, PassKit, Zebra y POS externo;
13. aislamiento entre ambientes;
14. rollback o forward-fix sin reescritura de historia válida;
15. ausencia de cambios fuera del `package_id` autorizado.

---

#### 45. Rollback y forward-fix

La reversión de una futura implementación no puede convertir mappings ya utilizados en historia invisible.

Reglas:

1. DDL defectuoso puede revertirse o corregirse conforme a la política de migraciones;
2. mappings válidos ya materializados se preservan, migran o retiran de forma controlada;
3. un rollback no reasigna `external_id_value` a otro target;
4. un cambio de namespace no se resuelve reescribiendo filas históricas;
5. una revisión defectuosa conserva lineage con la revisión corregida;
6. un mapping consumido por un evento, venta, receipt o conciliación no se elimina como mecanismo de reparación;
7. una corrección posterior no puede afirmar que una relación histórica nunca existió.

---

#### 46. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Requisitos diferidos:** 0

**Requisitos obsoletos:** 0

La definición materializa documentalmente la futura persistencia de reglas de mapping ya protegidas por contratos y requisitos vigentes. No introduce un nuevo proveedor, una nueva autoridad, una nueva clase de identificador, una nueva relación, un nuevo estado compartido ni una operación empresarial adicional. El registro canónico de requisitos permanece sin cambios.

---

#### 47. Cobertura de prueba vigente reutilizada

La cobertura vigente que sustenta esta tarea incluye, sin modificación:

- `TREQ-INTEGRATION-001` — coherencia de ambiente y contrato en integraciones externas;
- `TREQ-INTEGRATION-003` — separación de identidad estable e idempotencia para operaciones reintentables;
- `TREQ-INTEGRATION-006` — fuente empresarial única y resolución de fuentes competidoras;
- `TREQ-INTEGRATION-046` — equivalencia legacy demostrada antes de mapping;
- `TREQ-INTEGRATION-049` — identificador externo, autenticidad, payload protegido, recepción y correlación antes del hecho interno;
- `TREQ-INTEGRATION-060` — terceros externos no se convierten en productores empresariales internos;
- `TREQ-INTEGRATION-061` — validación en adaptador y owner antes de persistir el hecho interno;
- `TREQ-INTEGRATION-092` — efectos limitados al dominio consumidor y prohibición de escritura cruzada;
- `TREQ-INTEGRATION-096` — terceros operan mediante adaptadores y contratos externos separados;
- `TREQ-INTEGRATION-100` — mapping legacy solo con equivalencia demostrada de proceso, finalidad, proyección, sensibilidad, condición y efectos;
- `TREQ-INTEGRATION-125` — deduplicación de afirmaciones externas conservando autenticidad, identificador y evidencia;
- `TREQ-INTEGRATION-126` — receipt estable cuando el proveedor no suministra identificador;
- `TREQ-INTEGRATION-127` — digest como guardia y no como identidad empresarial;
- `TREQ-INTEGRATION-213` — referencias externas, payload protegido, transformación y correlación auditables;
- `TREQ-SUPABASE-476` — payload original, firma, identificador externo, correlación, deduplicación y conciliación antes del hecho interno.

Estas referencias son trazabilidad de cobertura existente y no representan cambios al registro.

---

#### 48. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | La batería npm del checkout completo no forma parte de la preparación estática del artefacto y deberá ejecutarse en el checkout documental vigente después de insertar la tarea. |
| LOCAL | PASS | El artefacto fue comprobado estructuralmente como UTF-8 sin BOM, LF, metadata compacta, secciones obligatorias, continuidad, cero requisitos en la sección de cambios, matriz 21/21, vocabularios 10/7/8, topología `TEMPLATE_PER_PACKAGE`, gate `POST_E5_PACKAGE`, shape compartido de 14 campos, ausencia de placeholders y alcance documental sin materialización física. |
| REMOTA | PASS | Se verificaron en `main` la continuidad con `INT-DB-003` como tarea previa, el archivo propietario, topología, políticas de tarea, contrato de entrega, `INT-EXT-013`, `SHELL-CON-022`, el shape generado del mapping, el registro 04A de integración, `package.json`, lifecycle documental y ausencia de rama remota `task/int-db-004` al corte. |
| OPERATIVA | NOT_EXECUTED | No se resolvieron mappings runtime, providers, webhooks, receipts, recursos empresariales ni integraciones de staging; esas pruebas pertenecen a futuras instancias por paquete. |
| FÍSICA | NOT_APPLICABLE | La definición documental autoriza cero cambios físicos y no crea instancia `GLOBAL`; la materialización futura pertenece a `INT-DB-004::<package_id>` después de E5. |

---

#### 49. Criterios de aceptación

`INT-DB-004` queda documentalmente cerrada cuando se demuestre que:

1. existe una sola definición reutilizable de persistencia de mappings;
2. la topología es `TEMPLATE_PER_PACKAGE` y el gate es `POST_E5_PACKAGE`;
3. ninguna instancia `GLOBAL` es creada o implícita;
4. la persistencia puede proyectar los catorce campos de `ExternalIdentifierMapping` sin pérdida;
5. `ExternalIdentifierRef` conserva sus siete dimensiones exactas;
6. se preservan exactamente 10 clases, 7 relaciones y 8 estados compartidos;
7. `mapping_id` es estable, opaco, no secreto y no deriva de IDs, payloads, hashes ni credenciales;
8. el scope mínimo incluye sistema, ambiente, superficie, namespace y kind;
9. la normalización solo ocurre bajo regla contractual del namespace;
10. una relación exacta activa tiene como máximo un target canónico compatible dentro de su scope;
11. `UNRESOLVED`, `AMBIGUOUS`, `CONFLICT` y `BLOCKED` no fabrican target;
12. `CORRELATION_ONLY` no se eleva a identidad exacta sin nueva evidencia;
13. mapping, autenticidad, autorización, idempotencia, cuarentena, auditoría y conciliación permanecen responsabilidades separadas;
14. evidencia fuente se referencia sin copiar payload protegido ni secretos;
15. la matriz conserva 21 de 21 identidades y la distribución 4/1/1/2/3/1/7/2;
16. Wompi, RevenueCat, Expo Push, Google Places, PassKit, Zebra y POS externo conservan su semántica específica;
17. los sistemas sin binding no reciben mappings ficticios;
18. lifecycle, retiro, predecesor y sucesor conservan historia;
19. los constraints de mapping no invaden los índices de idempotencia de `INT-DB-005`;
20. la sección de requisitos derivados declara cero cambios y no contiene identificadores de requisito;
21. la cobertura existente queda trazada fuera de esa sección;
22. ninguna modificación Supabase es ejecutada durante esta tarea documental.

---

#### 50. Decisiones vinculantes

Quedan vinculantes para cualquier futura materialización de `INT-DB-004::<package_id>`:

- mapping significa relación acreditada, no coincidencia textual;
- `mapping_id` identifica la relación y nunca el recurso;
- el namespace y ambiente forman parte de la resolución;
- no existe normalización universal del valor externo;
- relaciones exactas resueltas exigen target canónico y evidencia reconstruible;
- correlación no equivale a identidad;
- un mapping resuelto no concede autorización ni propiedad;
- el owner empresarial revalida el recurso antes de cualquier efecto;
- una referencia externa incompatible produce conflicto o conciliación, no overwrite silencioso;
- una reasignación usa retiro y sucesión;
- la evidencia se conserva por referencia siempre que sea suficiente;
- mapping e idempotencia permanecen conceptos distintos;
- los 21 sistemas conservan sus decisiones heredadas sin inventar bindings;
- toda materialización pertenece a un `package_id` aprobado después de E5.

---

#### 51. Límites

Esta tarea no:

- ejecuta DDL, DML, migraciones, RLS, RPC ni cambios remotos;
- crea tablas, filas, índices, constraints o mappings físicos;
- crea valores físicos de `ExternalIdentifierMappingId`;
- modifica el contrato estático `SHELL-CON-022`;
- migra consumidores de `mapping_refs[]`;
- resuelve mappings runtime;
- crea bindings de proveedores;
- crea ni rota credenciales;
- crea idempotency keys, claims ni outcomes;
- crea cuarentena o dead-letter;
- materializa auditoría de procesamiento;
- ejecuta conciliación;
- fusiona, divide o reasigna recursos empresariales;
- cambia propietarios de recursos canónicos;
- acredita un sistema que BLOQUE X mantiene sin binding;
- inicia `INT-DB-005`.

---

#### 52. Continuidad

**ÚLTIMA TAREA APROBADA**
`INT-DB-003 — Crear staging inmutable de payloads externos`

**TAREA ACTUAL APROBADA**
`INT-DB-004 — Crear mapeos de identificadores externos y canónicos`

**SIGUIENTE TAREA RESERVADA**
`INT-DB-005 — Crear restricciones e índices de idempotencia`


### ✅ INT-DB-005 — Crear restricciones e índices de idempotencia

**Estado:** APROBADA
**Tarea anterior:** INT-DB-004 — Crear mapeos de identificadores externos y canónicos
**Tarea siguiente:** INT-DB-006 — Crear cuarentena y registro de errores no procesables
**Tipo de tarea:** Documental; contrato y plantilla R2 repetible por `package_id` para persistir identidad idempotente, huella lógica versionada, claim durable, outcome y resultado recuperable, definiendo restricciones de integridad, unicidad, concurrencia e índices de acceso sin materializar cuarentena, auditoría de procesamiento, compensaciones ni conciliación durante esta definición
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/05_INFRAESTRUCTURA_DE_INTEGRACIONES_EXTERNAS.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`; contrato canónico `TEMPLATE_PER_PACKAGE` cerrado para futuras instancias `INT-DB-005::<package_id>`, sujetas a `POST_E5_PACKAGE`, al registro de integración del mismo paquete, al contrato compartido `SHELL-CON-023`, a evidencia fuente y mappings aplicables, a recaptura de drift y a autorización física explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0
**Fecha de corte:** 2026-08-26

---

#### 1. Propósito

`INT-DB-005` define la persistencia física futura que permitirá a cada paquete proteger operaciones reintentables contra efectos duplicados, reutilización incompatible de identidad, carreras concurrentes y pérdida del resultado original.

La tarea cierra documentalmente las restricciones e índices que deberán sostener el contrato compartido de idempotencia ya materializado por `SHELL-CON-023`, sin ejecutar DDL, DML, migraciones, RLS, RPC, jobs, Edge Functions ni cambios remotos.

La definición deberá permitir responder de forma reproducible:

1. qué operación lógica está protegida;
2. bajo qué scope y owner existe la identidad;
3. cuál es su namespace;
4. qué `operation_key` fue fijada antes del primer efecto;
5. qué generación representa el intento empresarial legítimo;
6. qué versión contractual interpretó la operación;
7. qué huella lógica protege compatibilidad de contenido;
8. qué claim durable conserva la exclusión concurrente;
9. qué outcome quedó determinado;
10. qué resultado o referencia durable debe recuperarse ante duplicados;
11. qué estado permanece pendiente o incierto;
12. qué referencia de conciliación deberá consumir `INT-DB-008` cuando el outcome no pueda cerrarse de forma segura.

---

#### 2. Resultado canónico

Queda definido:

```text
INT-DB-005
→ contrato documental único y reutilizable

INT-DB-005::<package_id>
→ futura instancia física por paquete

operación protegida
→ IntegrationIdempotencyRef
→ huella lógica versionada
→ claim durable o protección atómica equivalente
→ resultado / estado recuperable
→ restricciones de unicidad y compatibilidad
→ índices de resolución y recuperación
→ handoff estable hacia INT-DB-006..008
```

La definición global no se reabre por paquete.

No existe una instancia física `INT-DB-005::GLOBAL`.

---

#### 3. Topología vinculante

La topología aplicable queda cerrada así:

| Propiedad | Decisión |
| --- | --- |
| Modalidad | `TEMPLATE_PER_PACKAGE` |
| Gate temporal | `POST_E5_PACKAGE` |
| Identidad física futura | `INT-DB-005::<package_id>` |
| Instancia global | no aplica |
| Reapertura del contrato por paquete | prohibida |
| Implementación durante esta definición | ninguna |

Cada `package_id` materializa únicamente los scopes, integraciones y efectos que le pertenecen.

La existencia de un ledger compartido o de una misma base Supabase no fusiona identidades entre paquetes.

---

#### 4. Gate temporal

Una futura instancia solo podrá materializar restricciones e índices cuando, para el mismo `package_id`, estén satisfechas las puertas físicas aplicables.

Como mínimo:

```text
package E5 aplicable = CERRADO
E5-GATE-008::<package_id> = PASS
SHELL-CON-023 = MATERIALIZADO COMO CONTRATO COMPARTIDO
registro INT-DB-001 aplicable = DISPONIBLE
staging INT-DB-003 aplicable = DISPONIBLE O NO_APLICABLE JUSTIFICADO
mapping INT-DB-004 aplicable = DISPONIBLE O NO_APLICABLE JUSTIFICADO
drift aplicable = RECONCILED
rollback = PREPARADO
physical_authorization = EXPLICIT
```

Las dependencias documentales anteriores no convierten esta tarea en implementación física anticipada.

---

#### 5. Fuentes vinculantes

La definición consume sin reinterpretación silenciosa:

- `INT-APP-004` y su identidad estable por scope, huella lógica, claim durable y resultado recuperable;
- `INT-APP-005` para retry, backoff y límites de intento, sin trasladar esa política al índice de identidad;
- `INT-APP-007` a `INT-APP-010` para trazabilidad, incertidumbre, errores parciales y conciliación;
- `INT-EXT-012` y `VENTO-EXTERNAL-IDEMPOTENCY-CONTRACT-001`;
- `INT-EXT-013` para la separación entre mapping e idempotencia;
- `INT-EXT-017` para conciliación de integraciones externas;
- `SHELL-CON-019` para el evento externo recibido;
- `SHELL-CON-022` para mappings externos/canónicos;
- `SHELL-CON-023` como forma compartida vigente de idempotencia y conciliación;
- `SHELL-CON-024` para disposición, cuarentena y compensación referenciada;
- `INT-DB-001` a `INT-DB-004` como entradas físicas previas cuando sean aplicables al paquete;
- `INT-POS-013`, `INT-POS-020`, `INT-SALES-007` e `INT-SALES-008` para especializaciones POS y venta;
- el registro canónico de requisitos de prueba vigente;
- el estado remoto recapturado al iniciar la futura instancia.

La forma compartida vigente declara a `INT-DB-005` como propietario exclusivo de la persistencia física de idempotencia.

---

#### 6. Reconciliación entre contrato histórico y contrato compartido vigente

`INT-EXT-012` conserva la definición histórica de idempotencia por las 21 identidades externas y su estado técnico observado en el momento de aprobación.

`SHELL-CON-023` materializa posteriormente la forma compartida reconciliada y especializa la proyección física sin reescribir la evidencia histórica de `INT-EXT-012`.

Regla de consumo:

```text
semántica propietaria histórica
+ especializaciones posteriores aprobadas
→ SHELL-CON-023 vigente
→ INT-DB-005 persiste la forma reconciliada
```

Por tanto:

1. la distribución histórica de `INT-EXT-012` permanece evidencia de su corte;
2. la futura materialización física usa la clasificación y shape vigentes de `SHELL-CON-023`;
3. la especialización POS no se degrada a un bloqueo genérico si el contrato compartido vigente la conserva como `PENDIENTE_DE_EVIDENCIA`;
4. ninguna clasificación posterior autoriza inventar un binding ausente.

---

#### 7. Separación semántica obligatoria

La persistencia deberá conservar siempre:

```text
IDENTIDAD IDEMPOTENTE
≠ MAPPING DE RECURSO
≠ CORRELACIÓN
≠ IDENTIDAD DE EVENTO
≠ RECEIPT EXTERNO
≠ IDENTIDAD DE INTENTO TÉCNICO
≠ CREDENCIAL
≠ AUTORIZACIÓN
≠ ESTADO EMPRESARIAL
≠ CASO DE CONCILIACIÓN
```

Además:

```text
operation_key
≠ logical_content_hash
```

La identidad responde qué operación lógica se está protegiendo.

La huella responde si una reutilización de esa identidad conserva contenido compatible.

---

#### 8. Contrato compartido que debe persistirse

`SHELL-CON-023` expone:

- **7** scopes de idempotencia;
- `IntegrationIdempotencyRef` con exactamente **6** campos;
- `IntegrationIdempotencyRecord` con exactamente **21** campos de nivel superior;
- **7** estados de claim;
- **8** outcomes de idempotencia;
- `IntegrationReconciliationRef` como referencia separada;
- `IntegrationReconciliationCase` como contrato cuya persistencia pertenece a `INT-DB-008`, no a esta tarea.

Source contract SHA-256 vigente de `SHELL-CON-023`:

```text
d6630e1e3280845765308579eb06302ce1b476da96475de675a1667e06ee68f0
```

`INT-DB-005` no redefine ese contrato ni añade campos públicos incompatibles.

---

#### 9. Scopes canónicos

Se preservan exactamente estos 7 valores:

```text
REQUEST_ACCEPTANCE
OWNER_COMMAND
EVENT_EMISSION
CONSUMER_INBOX
CONSUMER_EFFECT
EXTERNAL_RECEIPT
REPLAY_BATCH
```

Reglas:

1. no existe una idempotency key global de Vento OS;
2. no existe una idempotency key global de una venta;
3. request acceptance no equivale a owner command;
4. owner command no equivale a event emission;
5. event emission no equivale a consumer inbox;
6. consumer inbox no equivale a consumer effect;
7. external receipt no equivale a efecto empresarial;
8. replay batch no autoriza por sí solo efectos sensibles;
9. la misma cadena en scopes diferentes no representa automáticamente la misma operación.

---

#### 10. Shape exacto de `IntegrationIdempotencyRef`

La identidad lógica conserva exactamente:

| Campo | Cardinalidad | Regla |
| --- | ---: | --- |
| `scope` | 1 | uno de los 7 scopes canónicos |
| `scope_owner_ref` | 1 | owner de la operación protegida; no concede autoridad cruzada |
| `namespace_ref` | 1 | namespace estable que impide colisiones entre contextos incompatibles |
| `operation_key` | 1 | identidad estable fijada antes del primer efecto |
| `generation` | 0..1 | nueva intención empresarial legítima, no un contador de retry |
| `contract_version` | 1 | versión contractual que gobierna la identidad |

Los seis componentes forman una identidad compuesta inseparable.

---

#### 11. Shape exacto de `IntegrationIdempotencyRecord`

Se preservan exactamente los 21 campos de nivel superior de `SHELL-CON-023`:

```text
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
correlation_refs
audit_ref
reconciliation_ref
```

Si la futura tabla descompone `idempotency_ref`, deberá conservar sus 6 campos sin pérdida semántica.

La representación física de `attempt_count` no se fija aquí porque el contrato compartido conserva deliberadamente su tipo como no especificado.

---

#### 12. Identidad física y unicidad semántica

La futura persistencia deberá garantizar exactamente una identidad activa por combinación lógica completa de:

```text
scope
+ scope_owner_ref
+ namespace_ref
+ operation_key
+ generation
+ contract_version
```

Reglas:

1. `generation = null` sigue siendo un valor semántico de la identidad y no permite duplicar filas equivalentes por semántica SQL de null;
2. el mecanismo físico deberá tratar dos referencias con todos los campos iguales y `generation = null` como la misma identidad;
3. `logical_content_hash` no forma parte de la clave única;
4. incluir el hash en la unicidad permitiría insertar dos contenidos incompatibles bajo la misma operación y queda prohibido;
5. `attempt_count`, `delivery_id`, `trace_id`, timestamps o worker no forman parte de la identidad;
6. `mapping_id`, `resource_ref`, `external_event_id`, receipt o credencial no sustituyen la clave compuesta salvo que un contrato propietario los haya acreditado explícitamente como fuente de `operation_key`.

---

#### 13. Semántica de `generation`

`generation` existe únicamente para distinguir una nueva intención empresarial legítima bajo un namespace y operación base compatibles.

No puede usarse para:

- ocultar un conflicto de hash;
- convertir retry en nueva operación;
- escapar de `OUTCOME_UNKNOWN`;
- repetir un efecto cuya respuesta se perdió;
- evitar una fila ya reclamada;
- reiniciar un timeout;
- cambiar de worker, deployment, dispositivo, conexión o transporte;
- reemplazar una identidad externa ausente con un valor aleatorio por intento.

Una nueva generación requiere una razón empresarial o contractual identificable.

---

#### 14. Namespace externo mínimo

Cuando la operación pertenece a una integración externa, el namespace lógico deberá distinguir como mínimo:

```text
external_system_id
environment
surface
operation_kind
```

`external_instance_id` se incorpora cuando sea necesario para evitar colisiones entre instancias acreditadas.

Reglas:

1. el mismo valor en sistemas externos distintos no representa la misma operación;
2. desarrollo, staging y producción no comparten deduplicación por conveniencia;
3. checkout y webhook no comparten namespace únicamente porque estén correlacionados;
4. operaciones de distinta naturaleza no comparten clave por defecto;
5. una credencial nunca delimita la identidad mediante su valor secreto.

---

#### 15. Política de `operation_key`

Una `operation_key` válida puede provenir de una identidad estable aprobada antes del efecto, por ejemplo:

- command ID propietario;
- event ID canónico;
- identificador externo autenticado y estable cuando el contrato lo permita;
- identidad de transacción del proveedor cuando su estabilidad y scope estén acreditados;
- composición determinista versionada de campos suficientemente estables e inequívocos cuando el owner la haya aprobado.

No son suficientes por sí solos:

- timestamp de recepción;
- UUID generado después de recibir una entrada sin identidad estable;
- nombre de archivo;
- posición de fila;
- `source_row_number`;
- correo o teléfono;
- `site_id` aislado;
- nombre de producto o monto;
- coordenadas o IP;
- retry count, attempt ID, delivery ID o trace ID;
- mapping ID;
- valor secreto.

---

#### 16. Huella lógica versionada

Cada registro debe conservar:

```text
logical_content_hash
logical_content_hash_version
```

Invariantes:

1. la huella es obligatoria para decidir compatibilidad de reutilización;
2. la versión de canonicalización o composición es obligatoria;
3. solo participan campos materiales definidos por el contrato propietario;
4. retry metadata, transporte, conexión, delivery y trace se excluyen;
5. secretos y material de credenciales se excluyen;
6. un cambio de canonicalización no reinterpreta silenciosamente huellas históricas;
7. el algoritmo físico de digest no se fija universalmente en esta tarea;
8. el mismo contenido lógico bajo la misma versión debe producir una huella reproducible.

---

#### 17. Reutilización compatible

Cuando llega la misma identidad con una huella compatible:

```text
misma identidad
+ misma huella lógica compatible
→ NO crear nueva operación
→ recuperar estado o resultado existente
```

Según el estado vigente, la respuesta podrá representar:

- `DUPLICATE_RESULT_RETURNED` cuando existe resultado final recuperable;
- `IN_PROGRESS_RECOVERABLE` cuando la operación válida continúa en curso;
- `RECONCILIATION_REQUIRED` cuando el resultado no puede determinarse con seguridad;
- otro outcome canónico permitido por el owner sin ejecutar un segundo efecto incompatible.

El duplicado compatible produce **0** mutaciones empresariales adicionales por el solo hecho de repetirse.

---

#### 18. Reutilización incompatible

Cuando la misma identidad llega con contenido incompatible:

```text
misma identidad
+ logical_content_hash incompatible
→ CONFLICTING_REUSE
→ 0 segundo efecto incompatible
```

Queda prohibido:

- sobrescribir la huella original;
- insertar una segunda fila usando el hash como parte de la unicidad;
- crear una nueva `generation` automáticamente;
- borrar el registro anterior y reintentar;
- elegir silenciosamente uno de los contenidos;
- tratar el conflicto como retry técnico.

---

#### 19. Estados de claim canónicos

Se preservan exactamente:

```text
CLAIMED
SUCCEEDED
FAILED_RETRYABLE
FAILED_FINAL
OUTCOME_UNKNOWN
CANCELLED
EXPIRED
```

`claim_state` puede ser nulo únicamente cuando el scope no requiera materializar un claim según su contrato propietario.

La existencia de `EXPIRED` no demuestra ausencia de un efecto remoto o empresarial previamente confirmado o incierto.

---

#### 20. Outcomes canónicos

Se preservan exactamente:

```text
APPLIED
DUPLICATE_RESULT_RETURNED
CONFLICTING_REUSE
IN_PROGRESS_RECOVERABLE
STALE_VERSION
OUT_OF_ORDER_DEFERRED
RECONCILIATION_REQUIRED
REJECTED
```

Los outcomes son resultados del control idempotente y no estados empresariales del recurso.

Un outcome no concede autorización funcional ni cambia ownership.

---

#### 21. Claim durable y exclusión concurrente

Cuando un scope protege un efecto, deberá existir claim durable o protección atómica equivalente antes del primer efecto protegido.

El contrato físico deberá garantizar:

```text
N ejecuciones concurrentes
+ misma identidad compatible
→ máximo 1 ganador empresarial
```

Las demás ejecuciones:

- recuperan estado en curso;
- recuperan el resultado existente;
- o quedan sujetas a conciliación si el outcome es incierto.

No son suficientes:

- `SELECT` seguido de efecto y registro sin exclusión equivalente;
- lock solo en memoria de una instancia;
- UPSERT que no valide identidad y hash;
- crear una segunda fila por conflicto de timing;
- asumir que un timeout liberó el derecho a repetir el efecto.

---

#### 22. Resultado durable recuperable

Una operación confirmada deberá conservar `result_ref` o un mecanismo propietario equivalente que permita devolver el resultado original sin repetir el efecto.

Reglas:

1. `result_ref` apunta al resultado durable del owner;
2. un ACK de transporte no se trata por defecto como resultado empresarial final;
3. `attempt_count` no cambia la identidad;
4. una respuesta perdida no convierte una operación aplicada en fallida;
5. un retry consulta primero la identidad original;
6. si el owner demuestra el efecto, recupera el resultado sin repetir;
7. si demuestra ausencia de efecto y el contrato permite retry, conserva la misma identidad.

---

#### 23. Resultado desconocido

`OUTCOME_UNKNOWN` exige preservar la incertidumbre.

No prueban ausencia de efecto:

- timeout;
- agotamiento del retry budget;
- restart del worker o aplicación;
- expiración de lease;
- cambio de endpoint;
- cambio de tabla, RPC o proveedor técnico;
- ausencia temporal de respuesta.

Ante incertidumbre material:

```text
identidad original
+ evidencia disponible
+ fuente propietaria / receipt / proveedor cuando aplique
→ reconciliación o resolución segura
```

No se permite crear una identidad nueva para escapar de la incertidumbre.

---

#### 24. Frontera con intentos y auditoría

`INT-DB-005` persiste la identidad y el estado idempotente agregado necesario para controlar repetición.

`INT-DB-007` conserva la auditoría detallada de procesamiento, reintentos y compensaciones.

Por tanto, esta tarea no crea:

- una fila de auditoría por intento;
- historial exhaustivo de delivery IDs;
- logs de cada retry;
- payloads de error;
- compensaciones;
- decisiones humanas de intervención.

`attempt_count` permanece como dato resumido del contrato compartido y no sustituye el audit trail de `INT-DB-007`.

---

#### 25. Frontera con conciliación

`INT-DB-008` es propietario de `IntegrationReconciliationCase` y de sus mecanismos físicos de comparación y cierre.

`INT-DB-005` únicamente conserva:

```text
reconciliation_ref
```

cuando exista relación entre el estado idempotente y un caso de conciliación.

Un `RECONCILIATION_REQUIRED` no autoriza retry por sí mismo.

Esta tarea no materializa casos, comparaciones, cierres ni correcciones de conciliación.

---

#### 26. Frontera con mapping

`INT-DB-004` conserva los mappings externos/canónicos.

Un mapping puede participar en evidencia o resolución de contexto, pero:

```text
mapping_id ≠ operation_key
mapping resuelto ≠ operación nueva
mapping resuelto ≠ autorización
```

Una revisión de mapping no autoriza repetir un efecto previamente aplicado.

---

#### 27. Frontera con staging de evidencia

`INT-DB-003` conserva `source_evidence_id`, payload protegido y huella de representación fuente cuando corresponda.

La huella de payload fuente y `logical_content_hash` cumplen responsabilidades distintas:

```text
payload_digest
→ integridad/equivalencia de la representación fuente

logical_content_hash
→ compatibilidad del contenido lógico de la operación protegida
```

Ninguna de las dos sustituye la identidad idempotente.

---

#### 28. Frontera con registro de integración

`INT-DB-001` conserva sistema, integración y binding ambiental.

Cuando el registro idempotente contenga contexto externo, las referencias deberán corresponder al mismo paquete y ambiente acreditados.

`external_system_id`, `external_instance_id`, `environment`, `surface` y `operation_kind` contextualizan la operación; no sustituyen `operation_key`.

La ausencia de binding acreditado impide fabricar contexto externo.

---

#### 29. Frontera con credenciales

`INT-DB-002` conserva referencias opacas no secretas de credenciales.

`INT-DB-005` no almacena:

- API keys;
- client secrets;
- service role;
- bearer tokens;
- refresh tokens;
- passwords;
- private keys;
- webhook secrets;
- cookies reutilizables;
- URLs firmadas persistentes;
- material capaz de autenticar una nueva solicitud.

El valor de una credencial nunca participa en identidad, hash ni índice.

---

#### 30. Frontera con cuarentena

`INT-DB-006` es propietario de cuarentena y errores no procesables.

Esta tarea puede producir o conservar un outcome que impida repetir un efecto, pero no crea:

- dead-letter;
- registro de cuarentena;
- workflow de resolución;
- reason taxonomy de cuarentena;
- reactivación manual de eventos inválidos.

El handoff hacia `INT-DB-006` conserva la identidad idempotente y referencias de evidencia sin copiar payloads protegidos.

---

#### 31. Autoridad empresarial

Idempotencia no es autorización.

Antes de ejecutar un efecto, el owner correspondiente conserva la obligación de validar:

- identidad y estado del recurso;
- actor o principal aplicable;
- permisos y contexto;
- versión del recurso;
- reglas empresariales;
- vigencia del contrato.

Una fila idempotente existente no concede acceso al recurso y una clave conocida no convierte al llamador en autorizado.

---

#### 32. Universo externo reconciliado vigente

La proyección física vigente de `SHELL-CON-023` conserva exactamente 21 identidades externas:

| ID | Sistema / plataforma | Clasificación vigente | Estado compartido | Disposición de INT-DB-005 |
| --- | --- | --- | --- | --- |
| `EXT-SYS-001` | Supabase | `GOBERNADA_POR_CONTRATO_INTERNO` | `ESPECIFICADO` | no crear clave global de plataforma; materializar únicamente scopes propietarios aplicables al paquete |
| `EXT-SYS-002` | Wompi | `APLICA_IDEMPOTENCIA_Y_CONCILIACION` | `ESPECIFICADO` | elegible para identidad, huella, claim y resultado durable por superficies acreditadas |
| `EXT-SYS-003` | RevenueCat | `APLICA_IDEMPOTENCIA_Y_CONCILIACION` | `ESPECIFICADO` | elegible; no sustituir identidad estable por retries ni por fingerprint no versionado |
| `EXT-SYS-004` | Resend | `APLICA_IDEMPOTENCIA_Y_CONCILIACION` | `ESPECIFICADO` | elegible; retry conserva operación y reenvío empresarial legítimo usa nueva generación |
| `EXT-SYS-005` | Expo / EAS Update | `PLATAFORMA_TECNICA_SIN_EFECTO_EMPRESARIAL_EN_CORTE` | `NO_APLICA` | no crear ledger empresarial por referencias de release/configuración |
| `EXT-SYS-006` | Expo Push Service | `APLICA_IDEMPOTENCIA_Y_CONCILIACION` | `ESPECIFICADO` | elegible por entrega lógica; destinos conservan resultados independientes |
| `EXT-SYS-007` | Sentry | `SIN_LEDGER_DE_EFECTO_EMPRESARIAL` | `NO_APLICA` | no elevar telemetría best-effort a ledger empresarial |
| `EXT-SYS-008` | Google Maps / Google Reviews | `SIN_LEDGER_DE_EFECTO_EMPRESARIAL` | `NO_APLICA` | lecturas interactivas no crean ledger sin efecto durable acreditado |
| `EXT-SYS-009` | Apple Wallet / PassKit y APNs | `APLICA_IDEMPOTENCIA_Y_CONCILIACION` | `ESPECIFICADO` | separar mutación de recurso y push; resultado remoto incierto se reconcilia antes de repetir |
| `EXT-SYS-010` | Vercel | `PLATAFORMA_TECNICA_SIN_EFECTO_EMPRESARIAL_EN_CORTE` | `NO_APLICA` | deployment/domain no crean operation key empresarial global |
| `EXT-SYS-011` | Zebra BrowserPrint | `APLICA_IDEMPOTENCIA_Y_CONCILIACION` | `ESPECIFICADO` | resultado físico incierto requiere verificación; reimpresión deliberada es nueva generación |
| `EXT-SYS-012` | Google Wallet / Google Pay & Wallet | `MODELO_SIN_BINDING_REMOTO` | `NO_APLICA` | no crear operaciones runtime hasta acreditar binding remoto |
| `EXT-SYS-013` | POS externo vigente | `APLICA_CON_ESPECIALIZACION_POS` | `PENDIENTE_DE_EVIDENCIA` | consumir especialización POS; no fabricar identidad individual desde `makos_excel`, fila, hash, nombre o posición |
| `EXT-SYS-014` | Shopify / canal de comercio electrónico | `NO_APLICA_SIN_BINDING` | `NO_APLICA` | no crear ledger hasta acreditar binding y operación concreta |
| `EXT-SYS-015` | Rappi / marketplace | `NO_APLICA_SIN_BINDING` | `NO_APLICA` | no inventar operación de pedido, tienda o courier |
| `EXT-SYS-016` | ManyChat / automatización conversacional | `NO_APLICA_SIN_BINDING` | `NO_APLICA` | no inventar operación, subscriber o resultado sin bot/API acreditados |
| `EXT-SYS-017` | WhatsApp | `NO_APLICA_SIN_BINDING` | `NO_APLICA` | teléfono o conversación no crean identidad de operación sin proveedor y contrato |
| `EXT-SYS-018` | Instagram / perfiles sociales | `NO_APLICA_SIN_BINDING` | `NO_APLICA` | no inventar claims ni outcomes sin API acreditada |
| `EXT-SYS-019` | Correo corporativo y alias funcionales | `NO_APLICA_SIN_BINDING` | `NO_APLICA` | mailbox o alias no establecen operación idempotente por sí solos |
| `EXT-SYS-020` | Telefonía / canal de voz | `BLOQUEADO_SIN_BINDING` | `BLOQUEADO` | `TI-INT-003` debe acreditar operador, cuenta, interfaz, identificadores y semántica antes de instanciar |
| `EXT-SYS-021` | Transporte externo | `NO_APLICA_SIN_BINDING` | `NO_APLICA` | no inventar tracking operation ni conciliación sin proveedor e interfaz acreditados |

Balance vigente:

```text
identidades esperadas = 21
identidades materializadas documentalmente = 21
faltantes = 0
duplicados = 0
APLICA_IDEMPOTENCIA_Y_CONCILIACION = 6
GOBERNADA_POR_CONTRATO_INTERNO = 1
PLATAFORMA_TECNICA_SIN_EFECTO_EMPRESARIAL_EN_CORTE = 2
SIN_LEDGER_DE_EFECTO_EMPRESARIAL = 2
MODELO_SIN_BINDING_REMOTO = 1
APLICA_CON_ESPECIALIZACION_POS = 1
NO_APLICA_SIN_BINDING = 7
BLOQUEADO_SIN_BINDING = 1
```

---

#### 33. Wompi

La evidencia histórica de `INT-EXT-012` conserva un estado parcial: existen unicidades y elementos de idempotencia, pero el claim del webhook no está acreditado como protección atómica previa al efecto y existe fallback de identidad que puede generar un valor nuevo cuando falta identificador externo estable.

La futura instancia aplicable deberá:

1. conservar namespace de proveedor, ambiente, superficie y operación;
2. fijar identidad antes del efecto;
3. impedir que una redelivery sin ID acreditado reciba una identidad nueva por intento;
4. comparar huella compatible antes de devolver resultado o conflicto;
5. reclamar atómicamente antes del efecto protegido;
6. conservar resultado recuperable;
7. enviar incertidumbre a conciliación antes de repetir.

Esta tarea no modifica el webhook actual.

---

#### 34. RevenueCat

La evidencia histórica de `INT-EXT-012` no acredita claim durable previo a las mutaciones derivadas.

La futura instancia aplicable deberá:

1. usar una identidad estable acreditada cuando exista;
2. si el owner conserva una composición determinista versionada por ausencia de ID nativo, mantener su versión y campos materiales explícitos;
3. impedir que una redelivery cree una segunda suscripción, entitlement o efecto equivalente;
4. separar hash lógico de identidad;
5. recuperar resultado o estado previo cuando la operación sea compatible;
6. bloquear reutilización incompatible.

Esta tarea no modifica el webhook actual.

---

#### 35. Resend

Retry técnico y reenvío empresarial son operaciones distintas.

La futura instancia aplicable deberá preservar:

```text
misma entrega lógica + retry
→ misma identidad

reenvío empresarial deliberado
→ nueva generation autorizada
```

El ACK del proveedor no se convierte en confirmación empresarial de lectura o recepción por el destinatario.

---

#### 36. Expo Push Service

La identidad se define por la entrega lógica propietaria y el destino aplicable, no por el número de intento ni por el batch técnico.

La futura instancia deberá:

1. impedir duplicación por reintento del mismo destino y generación;
2. conservar resultado por destino;
3. no fusionar destinos distintos bajo una única mutación recuperable;
4. conservar `DeviceNotRegistered` u otros resultados técnicos en sus contratos propietarios sin convertirlos en identidad de persona.

---

#### 37. Apple Wallet / PassKit y APNs

Mutación del pase y push de actualización son superficies distintas.

Una misma correlación puede vincularlas, pero no convierte ambas en la misma operación idempotente.

Ante resultado remoto incierto, la futura instancia deberá verificar o conciliar antes de repetir una mutación que pueda duplicar o contradecir el recurso.

---

#### 38. Zebra BrowserPrint

Impresión es un efecto físico y una respuesta perdida no prueba que no haya ocurrido.

Reglas:

1. retry técnico conserva la misma identidad;
2. reimpresión deliberada es una nueva generación autorizada;
3. un timeout no autoriza impresión automática adicional;
4. el resultado incierto exige verificación operativa o conciliación;
5. `device.uid` o nombre de impresora no sustituyen la identidad de la operación de impresión.

---

#### 39. POS externo vigente

La persistencia conserva la especialización de `INT-POS-013` y `INT-POS-020`.

`makos_excel` no adquiere identidad individual de venta o línea por:

- número de fila;
- posición;
- nombre de producto;
- fecha + sede;
- hash de archivo;
- similitud de valores.

Mientras falte evidencia individual suficiente, `EXT-SYS-013` permanece `PENDIENTE_DE_EVIDENCIA` y no se materializan claves ficticias.

---

#### 40. Sistemas sin ledger de efecto o sin binding

Las clasificaciones `NO_APLICA`, `PENDIENTE_DE_EVIDENCIA` y `BLOQUEADO` son decisiones explícitas, no ausencia silenciosa de trabajo.

Reglas:

1. no se crea una tabla con filas vacías para simular cobertura;
2. no se asignan operation keys sintéticas para sistemas sin operación acreditada;
3. una nueva evidencia de binding se incorpora primero por sus contratos propietarios;
4. después de una actualización canónica aplicable, el paquete correspondiente podrá materializar su instancia sin reabrir la definición global;
5. un sistema técnico puede seguir teniendo controles propios sin convertirse en ledger empresarial global.

---

#### 41. Restricciones mínimas obligatorias

Toda futura implementación deberá demostrar restricciones equivalentes a estas invariantes:

1. exactamente una fila lógica por `IntegrationIdempotencyRef`;
2. unicidad que preserve semántica de `generation = null`;
3. `scope` limitado a los 7 valores canónicos;
4. `claim_state`, cuando exista, limitado a los 7 valores canónicos;
5. `outcome` limitado a los 8 valores canónicos;
6. `logical_content_hash` obligatorio;
7. `logical_content_hash_version` obligatorio;
8. identidad y hash almacenados separadamente;
9. reutilización incompatible produce conflicto y no segunda fila compatible con el mismo identity scope;
10. claim atómico o protección equivalente antes del efecto cuando el scope lo requiera;
11. como máximo un ganador empresarial concurrente por identidad compatible;
12. resultado confirmado recuperable sin segundo efecto;
13. incertidumbre conservada sin nueva identidad automática;
14. contexto externo coherente con paquete, sistema y ambiente acreditados cuando esté presente;
15. secretos excluidos de identidad, huella y contenido persistido;
16. references de mapping, auditoría y conciliación conservadas como referencias separadas y no como identidad universal.

---

#### 42. Índice de identidad idempotente

La futura implementación deberá disponer de un índice único o mecanismo equivalente que haga resoluble y exclusivo el `IntegrationIdempotencyRef` completo.

Semántica requerida:

```text
(scope,
 scope_owner_ref,
 namespace_ref,
 operation_key,
 generation,
 contract_version)
→ máximo una identidad lógica
```

La implementación deberá demostrar que `generation = null` no permite duplicados semánticamente equivalentes.

No se prescribe aquí el SQL concreto porque la versión de PostgreSQL y la estrategia física se recapturan al abrir cada instancia por paquete.

---

#### 43. Índice de recuperación de claims

Los registros que requieran recuperación deberán poder localizarse sin recorrer el ledger completo por los criterios propietarios de:

```text
scope / owner
+ claim_state
+ temporalidad observable
```

La implementación podrá usar índice parcial o equivalente según distribución real, siempre que:

- no cambie la identidad;
- no convierta un estado temporal en outcome final;
- no incluya secretos;
- no imponga un TTL universal no aprobado;
- permita investigar `CLAIMED`, `FAILED_RETRYABLE`, `OUTCOME_UNKNOWN` o `EXPIRED` cuando sean relevantes al owner.

---

#### 44. Índice de contexto externo

Cuando el paquete tenga integraciones externas aplicables, deberán existir accesos eficientes por contexto acreditado para investigación, redelivery y conciliación.

Dimensiones candidatas autorizadas por el contrato:

```text
external_system_id
external_instance_id cuando aplique
environment
surface
operation_kind
```

Este índice es de consulta contextual y nunca sustituye la unicidad de `IntegrationIdempotencyRef`.

No se crea para sistemas sin binding.

---

#### 45. Índices de resultado, recurso y conciliación

Cuando el patrón de acceso del paquete lo justifique, pueden existir índices no únicos sobre:

- `resource_ref`;
- `result_ref`;
- `reconciliation_ref`;
- `audit_ref`.

Reglas:

1. ninguno se convierte en clave idempotente;
2. ninguno concede acceso al recurso;
3. `reconciliation_ref` conserva ownership de `INT-DB-008`;
4. `audit_ref` conserva ownership de `INT-DB-007`;
5. la decisión de materializar cada índice se basa en consultas reales del paquete y no en crear índices indiscriminadamente.

---

#### 46. Prohibición de índices semánticamente peligrosos

Queda prohibido usar como unicidad idempotente universal:

- solo `logical_content_hash`;
- solo `resource_ref`;
- solo `external_system_id`;
- solo `external_event_id` sin namespace acreditado;
- solo `mapping_id`;
- `email` o teléfono;
- `source_row_number`;
- timestamps;
- `attempt_count`;
- `delivery_id`;
- `trace_id`;
- credenciales o secretos.

Un índice auxiliar sobre una columna no cambia su semántica ni la convierte en identidad.

---

#### 47. Atomicidad con el efecto propietario

`INT-DB-005` no define una transacción ACID global entre aplicaciones o dominios.

Cuando el efecto y el ledger idempotente pertenecen al mismo límite transaccional, la implementación deberá mantenerlos atómicamente ligados o usar un patrón propietario equivalente ya aprobado.

Cuando el efecto es remoto o cruza owners:

- cada owner conserva su commit durable;
- la identidad del scope se preserva;
- el resultado se vuelve recuperable;
- la incertidumbre se reconcilia;
- no se simula atomicidad distribuida inexistente.

---

#### 48. Compatibilidad con `ExternalReceivedEvent`

`SHELL-CON-019` conserva actualmente `idempotency_ref` como referencia genérica o nula y `SHELL-CON-023` define `IntegrationIdempotencyRef` como target tipado futuro.

Esta tarea no migra consumidores ni modifica el contrato histórico.

Una futura instancia puede enlazar la evidencia recibida con la identidad idempotente cuando el paquete materialice ambos contratos, sin exigir que todo evento externo posea automáticamente una key empresarial.

---

#### 49. Compatibilidad con venta y efectos consumidores

Una venta, línea de venta, evento, inbox y efecto consumidor conservan identidades separadas.

Reglas:

1. `CanonicalSaleId` no es clave universal de todos los efectos;
2. `CanonicalSaleLineId` no es clave universal de todos los efectos;
3. NEXO, NUMERA y PASS conservan sus propios scopes de efecto;
4. cada consumidor puede conservar inbox e identidad de efecto independientes;
5. una venta confirmada no se reemite para recuperar un efecto downstream pendiente;
6. una compensación no es retry de la operación original.

---

#### 50. Acceso y seguridad

La futura persistencia deberá tratar el ledger idempotente como control técnico server-side y no como autorización empresarial.

Queda vinculante:

- `operation_key` no es secreto ni permiso;
- conocer una key no concede lectura de `resource_ref`;
- conocer `result_ref` no concede acceso al resultado;
- `IntegrationPrincipalId` no concede autoridad empresarial por sí solo;
- service role no es principal empresarial;
- payload completo no pertenece al ledger por defecto;
- tokens y credenciales quedan excluidos;
- las superficies cliente no reciben acceso por conveniencia para resolver deduplicación.

RLS y grants físicos deberán alinearse con el paquete y los contratos de autorización aplicables durante la futura instancia.

---

#### 51. Migración de mecanismos legacy

Una futura instancia no podrá reemplazar mecanismos idempotentes existentes mediante un corte ciego.

Antes de imponer una nueva unicidad o claim deberá:

1. inventariar claves y constraints existentes del paquete;
2. identificar colisiones bajo la identidad objetivo;
3. distinguir duplicado compatible, conflicto y registros no comparables;
4. conservar resultados ya confirmados;
5. no convertir ausencia histórica de key en una identidad fabricada;
6. reconciliar operaciones inciertas antes de una restricción que las vuelva inaccesibles;
7. mantener compatibilidad temporal con consumidores activos;
8. migrar lecturas y escrituras de forma controlada;
9. validar rollback o forward-fix antes de retirar el mecanismo anterior.

---

#### 52. Backfill de identidad idempotente

No existe un backfill universal autorizado por esta definición.

Una fila histórica solo puede recibir `IntegrationIdempotencyRef` cuando las fuentes permiten reconstruir de forma inequívoca:

```text
scope
scope_owner_ref
namespace_ref
operation_key
generation
contract_version
```

Si falta evidencia suficiente:

- no se inventa la key;
- el registro histórico permanece fuera del ledger nuevo o bajo la disposición explícita del paquete;
- la incertidumbre o inconsistencia se entrega a su owner de conciliación cuando corresponda.

Hash de fila, timestamp, posición, correo, nombre o payload similar no bastan.

---

#### 53. Rollback y forward-fix

La reversión de una futura implementación no puede permitir un segundo efecto sobre operaciones que ya fueron protegidas o confirmadas.

Reglas:

1. DDL defectuoso puede revertirse o corregirse conforme a la política de migraciones;
2. identidades idempotentes ya utilizadas se preservan o migran de forma controlada;
3. un rollback no borra una key para volver a ejecutar la operación;
4. outcomes confirmados conservan resultado o referencia recuperable;
5. conflictos no se resuelven eliminando una de las huellas;
6. operaciones inciertas conservan evidencia y vínculo de conciliación;
7. cambio de índice no reinterpreta la identidad histórica;
8. una corrección posterior conserva lineage operativo mediante los contratos propietarios.

---

#### 54. Certificación física futura

Una futura instancia `INT-DB-005::<package_id>` no podrá declararse materializada únicamente porque exista un índice único.

La certificación deberá demostrar como mínimo:

1. migración canónica y reproducible desde `vento-shell`;
2. shape compatible con `SHELL-CON-023`;
3. unicidad semántica completa de `IntegrationIdempotencyRef`;
4. tratamiento correcto de `generation = null`;
5. separación entre identity y logical hash;
6. conflicto ante reutilización incompatible;
7. duplicado compatible sin segundo efecto;
8. exclusión concurrente con un solo ganador empresarial;
9. resultado confirmado recuperable;
10. `OUTCOME_UNKNOWN` sin retry destructivo;
11. aislamiento entre scopes, owners, ambientes y paquetes;
12. ausencia de secretos;
13. índices de recuperación compatibles con consultas reales;
14. compatibilidad y backfill controlados para mecanismos legacy;
15. rollback o forward-fix sin pérdida de protección ya adquirida;
16. handoff estable hacia cuarentena, auditoría y conciliación sin materializarlas aquí;
17. ausencia de cambios fuera del `package_id` autorizado.

---

#### 55. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Requisitos diferidos:** 0

**Requisitos obsoletos:** 0

La tarea persiste documentalmente reglas de identidad, hash, claim, concurrencia, resultado recuperable, conflicto, retry seguro y conciliación ya protegidas por contratos y requisitos vigentes. No introduce un nuevo scope, estado de claim, outcome, sistema externo, operación empresarial ni semántica de autorización. El registro canónico de requisitos permanece sin cambios.

---

#### 56. Cobertura de prueba vigente reutilizada

La cobertura vigente que sustenta esta tarea incluye, sin modificación:

- `TREQ-INTEGRATION-003` — clave estable, hash lógico, estado durable, resultado recuperable y protección de operaciones reintentables;
- `TREQ-INTEGRATION-004` — reconstrucción de intentos, resultados, errores y efectos sin duplicación;
- `TREQ-INTEGRATION-112` — identidad idempotente estable por operación y scope;
- `TREQ-INTEGRATION-113` — reutilización compatible con recuperación del resultado previo;
- `TREQ-INTEGRATION-114` — fingerprint lógico separado de la identidad;
- `TREQ-INTEGRATION-115` — atomicidad o vínculo equivalente entre operación protegida y resultado durable;
- `TREQ-INTEGRATION-120` — concurrencia con un solo ganador empresarial;
- `TREQ-INTEGRATION-121` — respuesta perdida recupera resultado original sin segundo efecto;
- `TREQ-INTEGRATION-122` — mutación, identidad, huella, resultado y publicación propietaria ligados dentro del límite aplicable;
- `TREQ-INTEGRATION-123` — orden por agregado y versión sin orden global inventado;
- `TREQ-INTEGRATION-124` — conflicto o diferimiento ante colisión de versión;
- `TREQ-INTEGRATION-125` — deduplicación de afirmación externa con identidad confiable;
- `TREQ-INTEGRATION-126` — receipt estable cuando el proveedor no entrega identificador;
- `TREQ-INTEGRATION-127` — hash como guardia y no como identidad empresarial;
- `TREQ-INTEGRATION-128` — operaciones offline conservan identity, hash y estado antes de sincronizar;
- `TREQ-INTEGRATION-129` — delivery, attempt, retry y trace no sustituyen la key idempotente;
- `TREQ-INTEGRATION-130` — acciones excepcionales distintas conservan identidades propias.

Estas referencias son trazabilidad de cobertura existente y no representan cambios al registro.

---

#### 57. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | La batería npm del checkout completo deberá ejecutarse después de incorporar el artefacto al owner documental vigente. |
| LOCAL | PASS | El artefacto fue comprobado estructuralmente como UTF-8 sin BOM, LF, metadata compacta, secciones obligatorias, continuidad, cero requisitos en la sección de cambios, shape 7/6/21/7/8, matriz externa 21/21, topología `TEMPLATE_PER_PACKAGE`, gate `POST_E5_PACKAGE`, ausencia de placeholders prohibidos y alcance documental sin materialización física. |
| REMOTA | PASS | Se verificaron en `main` el cierre de `INT-DB-004`, la continuidad vigente con `INT-DB-005` como tarea actual, el archivo propietario, topología, contrato de entrega, políticas de tarea, `INT-EXT-012`, `SHELL-CON-023`, el contrato generado de idempotencia/conciliación, el registro 04A de integración, `package.json` y ausencia de rama remota `task/int-db-005` al corte. |
| OPERATIVA | NOT_EXECUTED | No se ejecutaron retries, webhooks, claims, redeliveries, impresiones, pushes, provider calls ni conciliaciones reales; esas pruebas pertenecen a futuras instancias por paquete. |
| FÍSICA | NOT_APPLICABLE | La definición documental autoriza cero cambios físicos y no crea instancia `GLOBAL`; la materialización futura pertenece a `INT-DB-005::<package_id>` después de E5. |

---

#### 58. Criterios de aceptación

`INT-DB-005` queda documentalmente cerrada cuando se demuestre que:

1. existe una sola definición reutilizable de persistencia idempotente;
2. la topología es `TEMPLATE_PER_PACKAGE` y el gate es `POST_E5_PACKAGE`;
3. ninguna instancia `GLOBAL` es creada o implícita;
4. se conservan exactamente 7 scopes;
5. `IntegrationIdempotencyRef` conserva exactamente 6 campos;
6. `IntegrationIdempotencyRecord` conserva exactamente 21 campos de nivel superior;
7. se conservan exactamente 7 estados de claim y 8 outcomes;
8. la identidad compuesta incluye scope, owner, namespace, key, generation y contract version;
9. `generation = null` no permite duplicados semánticos;
10. el hash lógico permanece separado de la identidad;
11. reutilización compatible recupera estado o resultado sin segundo efecto;
12. reutilización incompatible produce `CONFLICTING_REUSE` sin overwrite;
13. claim durable o protección atómica equivalente produce como máximo un ganador empresarial;
14. timeout, lease vencido o retry agotado no se interpretan como ausencia de efecto;
15. resultado desconocido conserva la identidad original y puede requerir conciliación;
16. intentos detallados permanecen bajo `INT-DB-007`;
17. conciliación permanece bajo `INT-DB-008`;
18. cuarentena permanece bajo `INT-DB-006`;
19. mapping permanece bajo `INT-DB-004`;
20. no se almacenan secretos ni payload completo por defecto;
21. la matriz conserva 21 de 21 identidades externas sin faltantes ni duplicados;
22. la especialización POS permanece `PENDIENTE_DE_EVIDENCIA` y no fabrica keys desde `makos_excel`;
23. Telefonía / voz permanece bloqueada hasta `TI-INT-003`;
24. los índices auxiliares no cambian la semántica de identidad;
25. backfill histórico exige evidencia suficiente y no usa heurísticas;
26. rollback conserva protección y resultados ya adquiridos;
27. la sección de requisitos derivados declara cero cambios y no contiene identificadores de requisito;
28. la cobertura vigente queda trazada fuera de esa sección;
29. ninguna modificación Supabase es ejecutada durante esta tarea documental.

---

#### 59. Decisiones vinculantes

Quedan vinculantes para cualquier futura materialización de `INT-DB-005::<package_id>`:

- idempotencia se define por scope y owner, no globalmente;
- la identidad se fija antes del primer efecto;
- retry y redelivery conservan identidad compatible;
- nueva generación representa nueva intención legítima, no escape técnico;
- identity y hash son conceptos distintos;
- misma identity con hash incompatible produce conflicto;
- un claim que protege efecto debe ser durable o atómicamente equivalente;
- existe como máximo un ganador empresarial concurrente por identidad compatible;
- resultado confirmado debe poder recuperarse;
- incertidumbre no se resuelve repitiendo a ciegas;
- mapping, correlación, idempotencia y conciliación permanecen separados;
- credenciales y secretos nunca forman parte de identity o fingerprint;
- los índices auxiliares sirven consulta y recuperación, no crean autoridad;
- los 21 sistemas conservan la clasificación reconciliada vigente;
- ninguna key se fabrica para un sistema sin binding o para datos legacy ambiguos;
- toda materialización pertenece a un `package_id` aprobado después de E5.

---

#### 60. Límites

Esta tarea no:

- ejecuta DDL, DML, migraciones, RLS, RPC ni cambios remotos;
- crea tablas, filas, constraints o índices físicos;
- crea operation keys runtime;
- ejecuta claims;
- ejecuta retries;
- ejecuta efectos empresariales;
- modifica `SHELL-CON-023`;
- migra consumidores del contrato compartido;
- materializa `IntegrationReconciliationCase`;
- crea cuarentena o dead-letter;
- crea auditoría por intento;
- ejecuta compensaciones;
- cambia contratos de mapping;
- crea ni rota credenciales;
- acredita bindings ausentes;
- inventa identidades para `makos_excel`;
- fija TTL universal;
- fija un algoritmo universal de digest;
- inicia `INT-DB-006`.

---

#### 61. Continuidad

**ÚLTIMA TAREA APROBADA**
`INT-DB-004 — Crear mapeos de identificadores externos y canónicos`

**TAREA ACTUAL APROBADA**
`INT-DB-005 — Crear restricciones e índices de idempotencia`

**SIGUIENTE TAREA RESERVADA**
`INT-DB-006 — Crear cuarentena y registro de errores no procesables`


### ✅ INT-DB-006 — Crear cuarentena y registro de errores no procesables

**Estado:** APROBADA
**Tarea anterior:** INT-DB-005 — Crear restricciones e índices de idempotencia
**Tarea siguiente:** INT-DB-007 — Crear auditoría de procesamiento, reintentos y compensaciones
**Tipo de tarea:** Documental; contrato y plantilla R2 repetible por `package_id` para persistir casos de disposición, cuarentena, elegibilidad de dead-letter y errores no procesables conforme a `SHELL-CON-024`, preservando identidad, parcialidad, evidencia, ownership, autorización, retención y estado empresarial sin materializar auditoría detallada de intentos, compensaciones ni conciliación durante esta definición
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/05_INFRAESTRUCTURA_DE_INTEGRACIONES_EXTERNAS.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`; contrato canónico `TEMPLATE_PER_PACKAGE` cerrado para futuras instancias `INT-DB-006::<package_id>`, sujetas a `POST_E5_PACKAGE`, al contrato compartido `SHELL-CON-024`, al ledger idempotente aplicable, a evidencia protegida y mappings vigentes, a recaptura de drift y a autorización física explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0
**Fecha de corte:** 2026-08-26

---

#### 1. Propósito

`INT-DB-006` define la persistencia física futura que permitirá a cada paquete aislar y gobernar unidades externas o internas de integración que no pueden continuar por el flujo ordinario sin perder identidad, evidencia, ownership, parcialidad ni obligaciones abiertas.

La tarea convierte el contrato compartido `SHELL-CON-024` en una especificación de persistencia por paquete para:

- casos de disposición;
- cuarentena;
- evaluación acumulativa de dead-letter;
- errores no procesables;
- referencias de intervención autorizada;
- referencias de evidencia, idempotencia, mapping y conciliación;
- residual y cierre seguro.

No ejecuta DDL, DML, migraciones, RLS, RPC, workers, queues, Edge Functions, cron, reprocesos, compensaciones ni cambios remotos.

La definición deberá permitir responder de forma reproducible:

1. cuál es la unidad exacta afectada;
2. qué caso estable la representa;
3. qué alcance de fallo y parcialidad conserva;
4. qué disposición está vigente;
5. por qué razón cerrada puede existir cuarentena;
6. si las siete puertas de dead-letter fueron evaluadas y satisfechas;
7. qué resultado empresarial está confirmado, ausente, incierto o pendiente;
8. qué evidencia protegida sostiene la decisión;
9. qué owner empresarial y responsable operativo conservan el caso;
10. qué acción siguiente está permitida;
11. qué autorización es exigible para intervenir o reprocesar;
12. qué referencias de idempotencia, mapping, auditoría o conciliación enlazan el caso;
13. qué retención, hold y residuales siguen vigentes;
14. qué outcome seguro permite cerrar sin borrar historia.

---

#### 2. Resultado canónico

Queda definido:

```text
INT-DB-006
→ contrato documental único y reutilizable

INT-DB-006::<package_id>
→ futura instancia física por paquete

unidad fallida o no procesable
→ IntegrationDispositionCaseId estable
→ clasificación de alcance + parcialidad
→ disposición vigente
→ cuarentena cuando corresponda
→ evaluación de siete puertas de dead-letter cuando corresponda
→ evidencia protegida por referencia
→ owner + responsable + siguiente acción
→ autorización de intervención/reproceso
→ residual + cierre seguro
→ handoff estable hacia INT-DB-007 e INT-DB-008
```

La definición global no se reabre por paquete.

No existe una instancia física `INT-DB-006::GLOBAL`.

---

#### 3. Topología vinculante

La topología aplicable queda cerrada así:

| Propiedad | Decisión |
| --- | --- |
| Modalidad | `TEMPLATE_PER_PACKAGE` |
| Gate temporal | `POST_E5_PACKAGE` |
| Identidad física futura | `INT-DB-006::<package_id>` |
| Instancia global | no aplica |
| Reapertura del contrato por paquete | prohibida |
| Implementación durante esta definición | ninguna |

Cada `package_id` materializa únicamente los casos, integraciones, superficies, owners y efectos que le pertenecen.

La existencia de un contrato compartido global o de una base Supabase común no convierte la cuarentena en un recurso transversal sin ownership ni fusiona casos de paquetes distintos.

---

#### 4. Gate temporal

Una futura instancia solo podrá materializar cuarentena y registro de errores cuando, para el mismo `package_id`, estén satisfechas las puertas físicas aplicables.

Como mínimo:

```text
package E5 aplicable = CERRADO
E5-GATE-008::<package_id> = PASS
SHELL-CON-024::GLOBAL = VERIFIED
registro INT-DB-001 aplicable = DISPONIBLE O NO_APLICABLE JUSTIFICADO
staging INT-DB-003 aplicable = DISPONIBLE O NO_APLICABLE JUSTIFICADO
mapping INT-DB-004 aplicable = DISPONIBLE O NO_APLICABLE JUSTIFICADO
idempotencia INT-DB-005 aplicable = DISPONIBLE O NO_APLICABLE JUSTIFICADO
evidencia protegida aplicable = RESOLUBLE
drift aplicable = RECONCILED
rollback = PREPARADO
physical_authorization = EXPLICIT
```

La existencia de `SHELL-CON-024::GLOBAL` no autoriza una instancia de paquete antes de E5.

---

#### 5. Fuentes vinculantes

La definición consume sin reinterpretación silenciosa:

- `INT-APP-006` para compensación únicamente sobre efectos confirmados;
- `INT-APP-007` a `INT-APP-009` para trazabilidad, incertidumbre, errores parciales, cuarentena, dead-letter, intervención y cierre;
- `INT-EXT-016` y `VENTO-EXTERNAL-QUARANTINE-DEAD-LETTER-CONTRACT-001` como definición histórica de disposición externa;
- `INT-EXT-017` para auditoría, métricas, alertas y conciliación externa;
- `SHELL-CON-017` para principal técnico;
- `SHELL-CON-018` para referencia de credencial sin secreto;
- `SHELL-CON-019` para evento externo recibido;
- `SHELL-CON-022` para mapping externo/canónico;
- `SHELL-CON-023` para idempotencia y conciliación;
- `SHELL-CON-024` como forma compartida vigente de disposición, cuarentena, dead-letter, rechazo seguro, intervención y compensación referenciada;
- `INT-DB-001` a `INT-DB-005` como entradas físicas previas cuando sean aplicables al paquete;
- `QUEUE-ARC-008`, `QUEUE-ARC-009`, `QUEUE-ARC-011` y `QUEUE-ARC-012` como contratos de infraestructura de fallos, exclusión de reproceso, métricas y autorización de trabajo;
- `INT-POS-012`, `INT-POS-019` e `INT-POS-020` para la especialización POS vigente;
- el registro canónico de requisitos de prueba vigente;
- el estado remoto recapturado al iniciar la futura instancia.

La forma compartida vigente declara a `INT-DB-006` como propietario exclusivo de la persistencia física de cuarentena.

---

#### 6. Reconciliación entre semántica histórica y contrato compartido vigente

`INT-EXT-016` conserva la clasificación histórica de cuarentena y dead-letter por las 21 identidades externas en el momento de su aprobación.

`SHELL-CON-024` materializa posteriormente la forma compartida reconciliada y especializa la proyección física sin reescribir la evidencia histórica.

Regla de consumo:

```text
semántica histórica de INT-EXT-016
+ especializaciones posteriores aprobadas
→ SHELL-CON-024 vigente
→ INT-DB-006 persiste la forma reconciliada por paquete
```

La reconciliación vigente incorpora una especialización POS explícita que ya no se trata como un bloqueo genérico de disposición.

Por tanto:

1. la distribución histórica de `INT-EXT-016` permanece evidencia de su corte;
2. la futura materialización física usa shape, políticas, estados y adopción vigentes de `SHELL-CON-024`;
3. `EXT-SYS-013` conserva `APLICA_CON_ESPECIALIZACION_POS` y `EXTERNAL-SALE-LINE-QUARANTINE-001`;
4. `EXT-SYS-020` permanece `BLOQUEADO_SIN_BINDING`;
5. ningún cambio de clasificación autoriza inventar un binding, caso runtime o efecto ausente.

---

#### 7. Contrato compartido materializado que gobierna esta tarea

La forma compartida vigente conserva:

```text
IntegrationDispositionCaseId
IntegrationDispositionCaseRef
IntegrationDispositionCase
IntegrationQuarantineRef
IntegrationDeadLetterRef
IntegrationCompensationPlanRef
```

Y preserva exactamente:

| Elemento | Cardinalidad |
| --- | ---: |
| `IntegrationDispositionCaseRef` | 2 campos |
| `IntegrationCompensationPlanRef` | 8 campos |
| `IntegrationDispositionCase` | 39 campos de nivel superior |
| `IntegrationFailureScope` | 8 valores |
| `IntegrationPartialityClass` | 9 valores |
| `IntegrationDisposition` | 12 valores |
| `IntegrationQuarantineReason` | 8 valores |
| `IntegrationDeadLetterGate` | 7 valores |
| `IntegrationManualInterventionAction` | 10 valores |
| outcomes de cierre reutilizados de `SHELL-CON-023` | 8 valores |

`INT-DB-006` no crea un segundo contrato ni una taxonomía paralela.

---

#### 8. Separación semántica obligatoria

La persistencia deberá conservar siempre:

```text
CASO DE DISPOSICIÓN
≠ OPERACIÓN EMPRESARIAL
≠ EVENTO
≠ RECEIPT
≠ INTENTO TÉCNICO
≠ CLAVE IDEMPOTENTE
≠ CASO DE CONCILIACIÓN
≠ PLAN DE COMPENSACIÓN
```

Y además:

```text
CUARENTENA
≠ DEAD_LETTER_CANDIDATE
≠ RECHAZO EMPRESARIAL
≠ RESULTADO DESCONOCIDO
≠ CONCILIACIÓN
≠ COMPENSACIÓN
≠ CONTINGENCIA
```

Mover una unidad entre estados operativos de aislamiento no modifica por sí mismo el hecho empresarial ni concede autoridad sobre su owner.

---

#### 9. Identidad estable del caso

`IntegrationDispositionCaseId` es la identidad estable del caso operativo de disposición.

Reglas:

1. es opaca y no secreta;
2. no deriva de payload, importe, fecha, correo, teléfono, producto, proveedor ni texto de error;
3. no es `event_id`, `receipt_id`, `attempt_id`, `delivery_id`, `mapping_id`, `sale_id`, `correlation_id` ni idempotency key;
4. un retry técnico no crea un caso nuevo por defecto;
5. un reproceso de la misma intención conserva el caso salvo especialización propietaria que exija sucesión explícita;
6. un caso cerrado no reutiliza su identidad para otro incidente;
7. dos paquetes no comparten la identidad física de un caso por conveniencia;
8. una identidad ambigua no se resuelve por similitud de contenido.

---

#### 10. Shape lógico `IntegrationDispositionCase`

La futura persistencia deberá poder reconstruir sin pérdida los 39 campos de nivel superior de la forma compartida vigente:

```text
integration_disposition_case_id
failure_scope
partiality_class
disposition
owner_application
owner_domain_ref
resource_or_operation_refs
external_system_id
environment
surface
integration_principal_ref
external_received_event_ref
external_identifier_mapping_refs
idempotency_ref
reconciliation_ref
quarantine_ref
dead_letter_ref
compensation_plan_ref
original_evidence_refs
content_integrity_ref
contract_or_schema_version
quarantine_reason
owner_specialization_ref
owner_resolution_detail
dead_letter_gate_results
manual_intervention_action
authorization_reference
attempt_references
business_outcome_reference
responsible_owner
next_action
residual_obligations
retention_policy_ref
legal_hold_reference
audit_references
closure_outcome
created_at
updated_at
closed_at
```

La representación física puede normalizar colecciones en relaciones hijas o usar otra forma compatible con PostgreSQL, siempre que:

- el shape compartido sea reconstruible;
- cardinalidad, integridad y ownership permanezcan verificables;
- los contratos expuestos no cambien por conveniencia de almacenamiento;
- no se dupliquen payloads sensibles;
- no se creen vocabularios alternos.

---

#### 11. Colecciones y referencias multivaluadas

Las siguientes propiedades pueden contener múltiples referencias y deberán preservar identidad y orden contractual cuando este sea material:

- `resource_or_operation_refs`;
- `external_identifier_mapping_refs`;
- `original_evidence_refs`;
- `dead_letter_gate_results`;
- `attempt_references`;
- `residual_obligations`;
- `audit_references`.

Reglas:

1. una relación hija no adquiere identidad empresarial por existir en la persistencia;
2. no se permite duplicar una misma referencia para inflar evidencia o cumplimiento de gates;
3. una referencia eliminada por corrección no borra su existencia histórica de la auditoría propietaria;
4. la implementación deberá poder distinguir ausencia legítima de colección vacía cuando el contrato propietario lo requiera.

---

#### 12. Alcances de fallo cerrados

Se conservan exactamente ocho valores:

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

Un caso tiene un alcance primario y puede enlazar otros alcances sin fusionar sus identidades.

La persistencia no podrá aceptar un noveno alcance local sin cambio contractual aprobado.

---

#### 13. Clases de parcialidad cerradas

Se conservan exactamente nueve valores:

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

Una unidad en cuarentena conserva su clase de parcialidad; el aislamiento no la reemplaza.

Un timeout no convierte resultados desconocidos en ausencia de efecto confirmada.

---

#### 14. Disposiciones cerradas

Se conservan exactamente doce valores:

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

`INT-DB-006` persiste la disposición vigente; no ejecuta las acciones asociadas.

---

#### 15. Razones cerradas de cuarentena

Solo se permiten las ocho razones canónicas:

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

1. ninguna instancia de paquete crea una novena razón local;
2. conectividad temporal, rate limit, breaker abierto o espera normal de dependencia no son cuarentena;
3. rechazo empresarial ordinario no es cuarentena;
4. `REPEATED_POISON_MESSAGE` exige identidad estable y evidencia de repetición;
5. `MANUAL_HOLD_FOR_INVESTIGATION` exige autoridad y finalidad explícitas;
6. liberar cuarentena exige resolver la causa.

---

#### 16. Puertas acumulativas de dead-letter

Se conservan exactamente siete puertas:

```text
AUTOMATION_BUDGET_CLOSED
ITEM_ISOLATED
IDENTITY_AND_CONTENT_PRESERVED
BUSINESS_OUTCOME_CLASSIFIED_OR_RECONCILIATION_OPEN
OWNER_AND_NEXT_ACTION_ASSIGNED
REPROCESSING_REQUIRES_AUTHORIZATION
RETENTION_AND_AUDIT_DEFINED
```

Elegibilidad:

```text
DEAD_LETTER_CANDIDATE
=
GATE_1
AND GATE_2
AND GATE_3
AND GATE_4
AND GATE_5
AND GATE_6
AND GATE_7
```

Una puerta falsa bloquea la clasificación completa.

Retry agotado puede satisfacer únicamente `AUTOMATION_BUDGET_CLOSED`; nunca prueba por sí solo dead-letter completo.

---

#### 17. Acciones manuales cerradas

Se conservan exactamente diez acciones:

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

La persistencia registra la acción seleccionada y su autorización cuando corresponda.

No autoriza editar una fuente propietaria, forzar éxito, borrar un caso para cerrarlo ni cambiar un outcome sin evidencia.

---

#### 18. Outcomes de cierre reutilizados

Se reutilizan exactamente los ocho outcomes de cierre definidos por `SHELL-CON-023`:

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

No existe `CLOSED_UNKNOWN`.

La edad, el silencio de una alerta, mover a dead-letter, archivar o reiniciar un worker no cierran un caso.

---

#### 19. Contrato de cuarentena persistente

Cuando `disposition = QUARANTINE`, la futura implementación deberá demostrar:

1. unidad exacta aislada del procesamiento ordinario;
2. identidad original preservada;
3. contenido lógico o evidencia protegida preservados por referencia;
4. `content_integrity_ref` conservado cuando aplique;
5. razón cerrada de cuarentena presente;
6. owner y responsable explícitos;
7. siguiente acción o condición de tratamiento resoluble;
8. autorización requerida para liberar o reprocesar;
9. resultado empresarial no inferido;
10. ausencia de mutación del payload fuente para conseguir que el caso pase.

Cuarentena no es secret store ni una segunda fuente de verdad.

---

#### 20. Contrato de dead-letter persistente

Cuando `disposition = DEAD_LETTER_CANDIDATE`, la futura implementación deberá demostrar:

1. las siete puertas fueron evaluadas;
2. existen exactamente siete resultados de gate para la evaluación vigente;
3. cada puerta está satisfecha;
4. cada resultado puede enlazar evidencia suficiente;
5. el owner y siguiente acción permanecen vigentes;
6. el reproceso requiere autorización;
7. retención y auditoría están definidas;
8. resultado desconocido conserva conciliación abierta;
9. dead-letter no modifica el business outcome;
10. el caso no se elimina para reducir backlog.

La persistencia puede distinguir un candidato a dead-letter de su ubicación física de almacenamiento; mover filas o mensajes no cambia la semántica.

---

#### 21. Resultado desconocido y precedencia de conciliación

`SOME_EFFECTS_UNKNOWN`, `ALL_EFFECTS_UNKNOWN`, `OUTCOME_UNKNOWN` u otra incertidumbre contractual equivalente tienen precedencia sobre un cierre técnico por agotamiento.

Reglas:

1. timeout no prueba fracaso;
2. no response no prueba ausencia de efecto;
3. cuarentena no resuelve incertidumbre;
4. dead-letter no resuelve incertidumbre;
5. rechazo no resuelve incertidumbre;
6. compensación de efecto hipotético queda prohibida;
7. antes de repetir un efecto material se consulta fuente autoritativa, receipt o conciliación aplicable;
8. un resultado indeterminado requiere `reconciliation_ref` o handoff explícito hacia `INT-DB-008`;
9. aislamiento operativo y conciliación abierta pueden coexistir.

---

#### 22. Reproceso de la misma intención

El reproceso de la misma intención lógica conserva:

```text
misma identidad empresarial
+ mismo scope y operation key idempotentes
+ huella compatible
+ owner y finalidad
+ correlación y evidencia fuente
+ historial de retry
```

Puede cambiar el identificador técnico del intento.

No puede producir un segundo efecto empresarial ya confirmado.

La referencia de intento nuevo se enlaza al mismo caso; el detalle del intento pertenece a `INT-DB-007`.

---

#### 23. Corrección o sucesor

Un cambio material de:

- intención;
- payload;
- recurso;
- importe;
- cantidad;
- destinatario;
- versión;
- acción;
- autoridad;

no es un simple reproceso.

Debe usar la semántica de corrección o sucesor del owner, preservar relación con el caso original y no reinterpretar la historia.

---

#### 24. Rechazo terminal seguro

`PERMANENTLY_REJECT` solo puede persistirse como cierre seguro cuando:

1. la unidad exacta está identificada;
2. el contrato aplicable es conocido;
3. existe causa terminal;
4. se demuestra ausencia de efecto incompatible con el rechazo;
5. no permanece `OUTCOME_UNKNOWN` ni `RESULT_UNKNOWN` sin resolver;
6. no se ocultan efectos parciales;
7. owner y autoridad de decisión están acreditados;
8. evidencia y auditoría quedan referenciadas.

El rechazo no fabrica un hecho externo ni modifica silenciosamente un estado del proveedor.

---

#### 25. Ownership y autoridad

Toda persistencia deberá distinguir:

```text
owner_application
owner_domain_ref
integration_principal_ref
responsible_owner
authorization_reference
```

Reglas:

1. el owner empresarial conserva la decisión sobre el hecho;
2. el adaptador puede registrar metadata técnica propia sin apropiarse del negocio;
3. una queue futura no se convierte en owner empresarial;
4. asignar un caso a soporte no concede autoridad sobre el hecho;
5. conocer el caso no concede acceso a evidencia protegida;
6. una credencial externa no concede autoridad transversal VENTO;
7. service role no es principal empresarial;
8. compensación, cuando aplique, se ejecuta dentro del owner del efecto y no desde este registro.

---

#### 26. Evidencia, integridad y minimización

La persistencia deberá preferir:

- referencias protegidas;
- hashes o digests;
- metadata mínima allowlisted;
- referencias de autenticidad;
- referencias de mapping;
- referencias de auditoría.

Queda prohibido guardar por conveniencia:

- API keys;
- bearer tokens;
- service role;
- private keys;
- passwords;
- material reutilizable de firma;
- datos bancarios completos;
- payload personal completo cuando una referencia protegida sea suficiente;
- URLs firmadas persistentes o parámetros de credencial.

La persistencia de casos no sustituye la custodia del payload original.

---

#### 27. Retención, hold y disposición

No existe un TTL universal autorizado.

Cada caso conserva, cuando aplique:

```text
retention_policy_ref
legal_hold_reference
residual_obligations
closure_outcome
closed_at
```

Reglas:

1. la edad no cierra el caso;
2. dead-letter no inicia borrado automático;
3. un caso abierto no se borra para reducir backlog;
4. un hold bloquea disposición según su política sin inferir outcome;
5. evidencia de disposición no copia el payload eliminado;
6. `RESOLVED_WITH_ACCEPTED_RESIDUAL` exige residual, owner, responsable, riesgo, control, autoridad y condición de seguimiento en las fuentes propietarias.

---

#### 28. Aislamiento por ambiente

Un caso con contexto externo deberá conservar ambiente cuando aplique.

Reglas:

1. production, staging y development no comparten casos como si fueran la misma operación;
2. no se copian payloads o credenciales de producción a otros ambientes para depurar;
3. una operación no cambia de ambiente para eludir una restricción;
4. una referencia externa debe resolverse contra el binding del ambiente correcto;
5. un paquete no accede a casos de otro por compartir instancia Supabase.

---

#### 29. Aislamiento por paquete

La cardinalidad física es por `package_id`.

Invariantes:

1. el caso pertenece al paquete que materializa la superficie aplicable;
2. una misma identidad externa puede aparecer en varios paquetes sin fusionar casos;
3. ownership de negocio no se transfiere por estar en un registro técnico común;
4. no existe un backlog global de VENTO que permita reproceso transversal sin contrato;
5. índices, RLS, grants y jobs futuros deberán respetar el package boundary.

---

#### 30. Adopción externa vigente 21/21

La futura persistencia conserva el universo vigente de `SHELL-CON-024`:

| ID | Sistema / plataforma | Clasificación vigente | Estado de disposición |
| --- | --- | --- | --- |
| `EXT-SYS-001` | Supabase | `GOBERNADA_POR_CONTRATO_INTERNO` | `ESPECIFICADO` |
| `EXT-SYS-002` | Wompi | `APLICA_IDEMPOTENCIA_Y_CONCILIACION` | `ESPECIFICADO` |
| `EXT-SYS-003` | RevenueCat | `APLICA_IDEMPOTENCIA_Y_CONCILIACION` | `ESPECIFICADO` |
| `EXT-SYS-004` | Resend | `APLICA_IDEMPOTENCIA_Y_CONCILIACION` | `ESPECIFICADO` |
| `EXT-SYS-005` | Expo / EAS Update | `PLATAFORMA_TECNICA_SIN_EFECTO_EMPRESARIAL_EN_CORTE` | `ESPECIFICADO` |
| `EXT-SYS-006` | Expo Push Service | `APLICA_IDEMPOTENCIA_Y_CONCILIACION` | `ESPECIFICADO` |
| `EXT-SYS-007` | Sentry | `SIN_LEDGER_DE_EFECTO_EMPRESARIAL` | `ESPECIFICADO` |
| `EXT-SYS-008` | Google Maps / Google Reviews | `SIN_LEDGER_DE_EFECTO_EMPRESARIAL` | `ESPECIFICADO` |
| `EXT-SYS-009` | Apple Wallet / PassKit y APNs | `APLICA_IDEMPOTENCIA_Y_CONCILIACION` | `ESPECIFICADO` |
| `EXT-SYS-010` | Vercel | `PLATAFORMA_TECNICA_SIN_EFECTO_EMPRESARIAL_EN_CORTE` | `ESPECIFICADO` |
| `EXT-SYS-011` | Zebra BrowserPrint | `APLICA_IDEMPOTENCIA_Y_CONCILIACION` | `ESPECIFICADO` |
| `EXT-SYS-012` | Google Wallet / Google Pay & Wallet | `MODELO_SIN_BINDING_REMOTO` | `NO_APLICA` |
| `EXT-SYS-013` | POS externo vigente | `APLICA_CON_ESPECIALIZACION_POS` | `ESPECIFICADO` |
| `EXT-SYS-014` | Shopify / comercio electrónico | `NO_APLICA_SIN_BINDING` | `NO_APLICA` |
| `EXT-SYS-015` | Rappi / marketplace | `NO_APLICA_SIN_BINDING` | `NO_APLICA` |
| `EXT-SYS-016` | ManyChat / automatización conversacional | `NO_APLICA_SIN_BINDING` | `NO_APLICA` |
| `EXT-SYS-017` | WhatsApp | `NO_APLICA_SIN_BINDING` | `NO_APLICA` |
| `EXT-SYS-018` | Instagram / social | `NO_APLICA_SIN_BINDING` | `NO_APLICA` |
| `EXT-SYS-019` | Correo corporativo y alias funcionales | `NO_APLICA_SIN_BINDING` | `NO_APLICA` |
| `EXT-SYS-020` | Telefonía / voz | `BLOQUEADO_SIN_BINDING` | `BLOQUEADO` |
| `EXT-SYS-021` | Transporte externo | `NO_APLICA_SIN_BINDING` | `NO_APLICA` |

No se crean casos runtime por el solo hecho de que una fila esté `ESPECIFICADO`.

---

#### 31. Reconciliación de cobertura vigente

La distribución vigente queda fijada así:

```text
21 identidades
=
1 gobernada por contrato interno
+ 6 con idempotencia y conciliación
+ 2 sin ledger de efecto empresarial
+ 2 plataformas técnicas sin efecto empresarial en corte
+ 1 modelo sin binding remoto
+ 1 especialización POS
+ 7 no aplicables sin binding
+ 1 bloqueada sin binding
```

Estados:

```text
12 ESPECIFICADO
+ 8 NO_APLICA
+ 1 BLOQUEADO
= 21
```

Faltantes = 0.

Duplicados = 0.

---

#### 32. Wompi

Para `EXT-SYS-002`, una futura instancia aplicable deberá conservar:

1. receipt e identidad idempotente antes del efecto;
2. autenticidad, integridad y ambiente como controles previos;
3. cuarentena solo por razones cerradas;
4. mismo event/receipt con huella distinta como conflicto, nunca overwrite;
5. resultado de pago incierto como consulta o conciliación antes de repetir;
6. dead-letter únicamente después de evaluar las siete puertas;
7. evidencia protegida por referencia;
8. liberación o reproceso autorizados sin crear un evento Wompi nuevo.

Dead-letter nunca demuestra que el pago no ocurrió.

---

#### 33. RevenueCat

Para `EXT-SYS-003`, la futura instancia aplicable deberá:

1. aislar input incompatible o mapping no resoluble sin alterar la fuente;
2. conservar redelivery bajo la misma identidad idempotente;
3. evitar duplicar suscripción o entitlement;
4. conciliar un entitlement incierto antes de corregir, reprocesar o compensar;
5. conservar el entitlement empresarial separado del estado técnico del caso;
6. referenciar payload protegido sin duplicarlo en el registro de error.

---

#### 34. Resend

Para `EXT-SYS-004`:

1. la generación de entrega conserva identidad;
2. retry técnico mantiene la misma operación;
3. un error permanente con no-efecto demostrado puede terminar en rechazo seguro sin dead-letter obligatorio;
4. timeout después del envío conserva resultado incierto si el proveedor pudo aceptar;
5. no existe reenvío ciego sin receipt o evidencia suficiente;
6. una nueva invitación o reenvío empresarial deliberado usa nueva generación;
7. el registro no duplica subject, body ni datos personales si una referencia es suficiente.

---

#### 35. Expo Push Service

Para `EXT-SYS-006`:

1. disposición por destino y generación;
2. resultado individual por destino;
3. un destino confirmado no se repite porque otro falle;
4. `DeviceNotRegistered` no se convierte en retry infinito;
5. resultado incierto se consulta cuando el contrato disponga de receipt aplicable;
6. dead-letter se evalúa después del agotamiento y de las siete puertas;
7. una campaña nueva no reutiliza silenciosamente el caso anterior.

---

#### 36. Sentry y Google Maps / Google Reviews

`EXT-SYS-007` y `EXT-SYS-008` no adquieren un ledger empresarial de dead-letter por existir como integraciones técnicas.

Sentry:

- telemetría best-effort no bloquea ni revierte el negocio;
- una violación de sensibilidad se bloquea sin copiar el dato prohibido a otro store;
- buffers técnicos no se convierten en backlog empresarial.

Google Maps / Reviews:

- una lectura interactiva agotada no crea un job persistente oculto;
- `ZERO_RESULTS` válido no es error de dead-letter;
- una respuesta no confiable no alimenta mappings ni hechos VENTO;
- no se fabrica un archivo masivo de respuestas para investigación.

---

#### 37. Apple Wallet / PassKit y APNs

`EXT-SYS-009` conserva superficies separadas.

PassKit inbound:

- autenticación, routing, schema, integridad y evidencia se validan antes de mutar;
- una petición inválida no se corrige alterando identifiers o tokens;
- token de autenticación no se copia al caso.

APNs outbound:

- señal de actualización conserva pass, dispositivo y generación;
- token permanentemente inválido no se reintenta indefinidamente;
- resultado incierto no confirma recepción o aplicación;
- dead-letter solo aplica si la señal sigue vigente y las siete puertas se cumplen;
- reprocesar señal no crea una versión nueva del pase.

---

#### 38. Zebra BrowserPrint

`EXT-SYS-011` representa un efecto físico con riesgo de resultado incierto.

Reglas:

1. fallo antes del envío puede demostrar no-efecto físico;
2. después de enviar ZPL, timeout o desconexión puede dejar resultado desconocido;
3. resultado desconocido bloquea auto-reprint;
4. el registro distingue envío técnico de impresión física;
5. incompatibilidad, routing ambiguo o evidencia inválida pueden activar cuarentena;
6. dead-letter exige outcome clasificado o conciliación abierta y las siete puertas;
7. reproceso desde dead-letter no equivale a reimpresión automática;
8. reimpresión voluntaria es nueva generación explícita.

---

#### 39. POS externo vigente

`EXT-SYS-013` conserva la especialización aprobada `EXTERNAL-SALE-LINE-QUARANTINE-001`.

Reglas:

1. la unidad propietaria puede ser la línea canónica cuando mapping bloquea un efecto dependiente de producto;
2. liberar cuarentena no ejecuta inventario por sí mismo;
3. corregir mapping no cambia la identidad de la línea;
4. posibilidad de efecto previo exige conciliación antes de repetir;
5. NEXO, NUMERA y PASS compensan únicamente efectos propios confirmados;
6. no existe rollback global de venta;
7. la conciliación no reejecuta efectos ya confirmados.

La especialización no crea casos físicos durante esta definición.

---

#### 40. Sistemas técnicos, sin binding y bloqueados

`EXT-SYS-001` no recibe una cuarentena externa universal para toda actividad Supabase; cada superficie interna conserva su owner.

`EXT-SYS-005` y `EXT-SYS-010` no reciben una cola empresarial ficticia por configuración de plataforma.

`EXT-SYS-012` no recibe runtime de disposición sin binding remoto acreditado.

`EXT-SYS-014`, `015`, `016`, `017`, `018`, `019` y `021` permanecen `NO_APLICA_SIN_BINDING`.

`EXT-SYS-020` permanece `BLOQUEADO_SIN_BINDING` hasta acreditar operador e interfaz conforme a `TI-INT-003`.

No se crean filas vacías para simular cobertura.

---

#### 41. Restricciones mínimas de integridad

Toda futura implementación deberá demostrar restricciones equivalentes a estas invariantes:

1. `integration_disposition_case_id` único;
2. `failure_scope` limitado a los 8 valores canónicos;
3. `partiality_class` limitado a los 9 valores canónicos;
4. `disposition` limitado a los 12 valores canónicos;
5. `quarantine_reason`, cuando exista, limitado a los 8 valores canónicos;
6. `manual_intervention_action`, cuando exista, limitado a los 10 valores canónicos;
7. `closure_outcome`, cuando exista, limitado a los 8 outcomes reutilizados;
8. `owner_application`, `owner_domain_ref` y `responsible_owner` no pueden perderse en un caso abierto;
9. `contract_or_schema_version` obligatorio;
10. `created_at` y `updated_at` obligatorios y coherentes;
11. `closed_at` no puede anteceder a `created_at`;
12. referencias de evidencia, idempotencia, mapping, conciliación y compensación conservan semántica separada;
13. secretos excluidos de campos persistidos;
14. package y ambiente permanecen aislados por el contrato físico propietario.

---

#### 42. Restricciones de cuarentena

Cuando un caso está en `QUARANTINE`:

1. `quarantine_ref` debe existir;
2. `quarantine_reason` debe existir;
3. la razón debe pertenecer al vocabulario cerrado;
4. la unidad debe estar aislada del flujo ordinario;
5. evidencia original o referencia protegida debe permanecer resoluble cuando sea exigible;
6. el caso no puede auto-reprocesarse;
7. el resultado empresarial no cambia por el aislamiento;
8. liberar cuarentena exige resolución de causa y autorización aplicable.

Un `quarantine_ref` no convierte por sí solo la disposición en cierre.

---

#### 43. Restricciones de dead-letter

Cuando un caso está en `DEAD_LETTER_CANDIDATE`:

1. `dead_letter_ref` debe existir;
2. las siete puertas deben tener resultado explícito;
3. no se admiten puertas duplicadas;
4. no falta ninguna de las siete;
5. todas deben estar satisfechas para la evaluación que habilita la disposición;
6. si existe resultado desconocido, `reconciliation_ref` debe permanecer resoluble;
7. owner y siguiente acción deben seguir asignados;
8. la autorización de reproceso debe estar representada conforme al contrato;
9. retención y auditoría deben estar definidas por referencia;
10. dead-letter no cambia `business_outcome_reference` por inferencia.

---

#### 44. Restricciones de cierre

Un caso cerrado deberá cumplir:

1. `closure_outcome` permitido;
2. `closed_at` presente;
3. ausencia de outcome desconocido no resuelto;
4. residual aceptado con evidencia y responsabilidad cuando aplique;
5. `PERMANENTLY_REJECTED` solo con terminalidad segura;
6. `RESOLVED_COMPENSATED` solo con compensación confirmada referenciada;
7. `SUPERSEDED_BY_SUCCESSOR` con relación sucesora resoluble;
8. el cierre no elimina evidencia histórica.

Un caso abierto no puede usar `closed_at` para ocultar backlog.

---

#### 45. Integridad de referencias

La futura persistencia deberá verificar, cuando la referencia sea aplicable al paquete:

- principal técnico conocido;
- evento externo recibido resoluble;
- mapping conocido o estado explícitamente no resuelto;
- idempotency ref compatible;
- reconciliation ref compatible;
- evidencia protegida accesible por la autoridad adecuada;
- compensation plan ref únicamente como referencia a plan propietario;
- audit refs emitidas por la superficie propietaria.

Una FK física no sustituye validación de autorización o semántica.

---

#### 46. Índice de identidad del caso

La futura implementación deberá disponer de unicidad o mecanismo equivalente sobre `integration_disposition_case_id`.

No se permite usar como identidad universal:

- error text;
- payload hash aislado;
- external system id;
- receipt id aislado;
- event id aislado;
- mapping id;
- idempotency key;
- email o teléfono;
- timestamp;
- attempt id;
- trace id.

Los índices auxiliares no cambian la semántica de esos campos.

---

#### 47. Índices de backlog abierto

Los casos abiertos deberán poder localizarse eficientemente por dimensiones operativas autorizadas, como:

```text
package / owner
+ responsible_owner
+ disposition
+ partiality_class
+ estado de cierre
+ temporalidad observable
```

La implementación puede usar índices parciales o equivalentes según la distribución real.

No se fija un TTL ni prioridad universal.

---

#### 48. Índices de cuarentena

Cuando el paquete materialice cuarentena, deberán ser resolubles sin escaneo completo al menos:

```text
owner / responsible_owner
+ quarantine_reason
+ estado abierto
+ ambiente cuando aplique
```

La consulta operativa no autoriza acceso automático al payload protegido.

---

#### 49. Índices de dead-letter

Cuando exista evaluación de dead-letter, deberán ser resolubles:

- casos candidatos abiertos;
- resultado de sus siete gates;
- owner y siguiente acción;
- casos con conciliación abierta;
- casos autorizables para reproceso conforme al owner.

Un índice de backlog no constituye una queue ni autoriza ejecución.

---

#### 50. Índices de contexto externo

Cuando el paquete tenga integración externa acreditada, se permiten índices de consulta por:

```text
external_system_id
environment
surface
integration_principal_ref
external_received_event_ref
```

Solo se materializan según patrones reales de investigación y soporte del paquete.

No se crean para bindings inexistentes.

---

#### 51. Índices de idempotencia, mapping, auditoría y conciliación

Puede requerirse acceso no único por:

- `idempotency_ref`;
- `external_identifier_mapping_refs`;
- `reconciliation_ref`;
- `audit_references`;
- `business_outcome_reference`.

Reglas:

1. ninguno se convierte en identidad del caso;
2. `idempotency_ref` conserva ownership de `INT-DB-005`;
3. detalle de auditoría conserva ownership de `INT-DB-007`;
4. conciliación conserva ownership de `INT-DB-008`;
5. la existencia de una referencia no concede acceso al recurso referenciado.

---

#### 52. RLS, grants y acceso

La futura persistencia deberá tratar cuarentena y errores no procesables como superficie sensible server-side.

Reglas:

1. acceso de lectura se limita por owner, finalidad y sensibilidad;
2. soporte no obtiene payload completo por pertenecer a un grupo operativo;
3. intervención exige autoridad distinta de la mera lectura cuando corresponda;
4. una aplicación no muta el caso de otro owner por compartir base de datos;
5. service role no sustituye autorización empresarial;
6. las superficies cliente no reciben acceso directo por conveniencia;
7. un adapter puede registrar metadata técnica de su propia frontera sin adquirir autoridad de cierre empresarial;
8. RLS y grants físicos se definirán dentro de la futura instancia conforme al paquete y los contratos de autorización vigentes.

Esta tarea documental no crea policies ni grants.

---

#### 53. Relación con `QUEUE-ARC-008`, `009`, `011` y `012`

`INT-DB-006` define persistencia de estado y referencias; no absorbe la infraestructura de ejecución.

Fronteras:

| Materia | Owner |
| --- | --- |
| cola de fallos y recuperación manual | `QUEUE-ARC-008` |
| exclusión concurrente de reproceso | `QUEUE-ARC-009` |
| métricas de backlog, espera y error | `QUEUE-ARC-011` |
| autorización operativa de retry o trabajo manual | `QUEUE-ARC-012` |

Una futura queue puede referenciar el caso, pero no se convierte en la fuente del resultado empresarial.

---

#### 54. Frontera con `INT-DB-007`

`INT-DB-007 — Crear auditoría de procesamiento, reintentos y compensaciones` es propietario de la historia detallada de procesamiento.

`INT-DB-006` conserva únicamente referencias necesarias para el caso:

```text
attempt_references[]
audit_references[]
compensation_plan_ref
manual_intervention_action
authorization_reference
```

No materializa aquí:

- cada intento;
- cada retry;
- cada transición de worker;
- cada resultado técnico;
- cada compensación ejecutada;
- la línea temporal completa de auditoría.

---

#### 55. Frontera con `INT-DB-008`

`INT-DB-008 — Crear mecanismos de conciliación por integración` es propietario de la persistencia y operación de conciliación.

`INT-DB-006` conserva:

```text
reconciliation_ref
partiality_class
disposition
business_outcome_reference
residual_obligations
```

Un caso con incertidumbre puede permanecer aislado y simultáneamente vinculado a conciliación.

Moverlo a dead-letter no cierra la conciliación.

---

#### 56. Migración de mecanismos legacy

Una futura instancia deberá inventariar antes de migrar:

- tablas o logs de errores existentes;
- dead-letter o retry stores legacy;
- estados genéricos `error`, `failed`, `pending` o equivalentes;
- payloads duplicados en logs;
- mecanismos de reintento automático;
- jobs manuales de reproceso;
- vínculos existentes con receipts, mappings o outcomes.

No se permitirá mapear un estado legacy a cuarentena o dead-letter únicamente por semejanza textual.

La migración exige evidencia suficiente para reconstruir semántica, ownership y estado.

---

#### 57. Backfill de casos históricos

No existe backfill universal.

Un registro histórico solo puede convertirse en `IntegrationDispositionCase` cuando sea posible reconstruir de forma suficientemente confiable:

```text
unidad exacta
owner
failure_scope
partiality_class
disposition
contract/version
estado empresarial conocido o explícitamente incierto
evidencia o referencias mínimas
```

Si la información no alcanza:

- no se fabrica `quarantine_reason`;
- no se marca dead-letter por retry count aislado;
- no se inventa `reconciliation_ref`;
- no se inventa resultado empresarial;
- el dato legacy conserva su tratamiento explícito del paquete hasta que exista una decisión acreditada.

---

#### 58. Rollback y forward-fix

La reversión de una futura implementación no puede borrar casos que ya protegen evidencia, resultados desconocidos o decisiones de disposición.

Reglas:

1. DDL defectuoso puede revertirse o corregirse conforme a la política de migraciones;
2. case IDs ya utilizados se preservan o migran de forma controlada;
3. un rollback no elimina cuarentena para volver a procesar una unidad;
4. dead-letter gate results ya observados no se reescriben para fabricar elegibilidad;
5. evidencia original y content integrity refs permanecen reconstruibles;
6. unknown outcomes conservan conciliación o handoff aplicable;
7. un cambio de índice no reinterpreta la semántica histórica;
8. un forward-fix conserva relación con la versión anterior;
9. restaurar el runtime anterior no autoriza reprocesar efectos confirmados.

---

#### 59. Certificación física futura

Una futura instancia `INT-DB-006::<package_id>` no podrá declararse materializada únicamente porque exista una tabla de errores.

La certificación deberá demostrar como mínimo:

1. migración canónica y reproducible desde `vento-shell`;
2. shape compatible con `SHELL-CON-024`;
3. reconstrucción de los 39 campos de nivel superior cuando sean aplicables;
4. vocabularios exactos 8/9/12/8/7/10 y 8 outcomes reutilizados;
5. case identity estable y no derivada de contenido sensible;
6. cuarentena con razón cerrada y aislamiento real;
7. dead-letter únicamente con las siete puertas satisfechas;
8. resultado desconocido con conciliación abierta o handoff explícito;
9. rechazo terminal sin ocultar efectos parciales;
10. reproceso de misma intención conservando identity e idempotency scope;
11. sucesor ante cambio material;
12. evidencia protegida por referencia y minimización;
13. ausencia de secretos y payloads duplicados por conveniencia;
14. aislamiento entre package, owner y ambiente;
15. RLS/grants alineados con autorización vigente;
16. compatibilidad y backfill controlados para mecanismos legacy;
17. rollback o forward-fix sin pérdida de historia ni protección;
18. handoff a `INT-DB-007` para auditoría detallada;
19. handoff a `INT-DB-008` para conciliación;
20. ausencia de cambios fuera del `package_id` autorizado.

---

#### 60. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Requisitos diferidos:** 0

**Requisitos obsoletos:** 0

La tarea define documentalmente la persistencia futura de reglas de errores parciales, cuarentena, dead-letter, intervención, resultado desconocido, minimización, autorización, idempotencia y cierre que ya están protegidas por contratos y cobertura de prueba vigentes. No introduce un nuevo vocabulario, una nueva razón de cuarentena, una nueva puerta, una nueva acción manual, un nuevo outcome, un nuevo sistema externo ni un nuevo efecto empresarial. El registro canónico de requisitos permanece sin cambios.

---

#### 61. Cobertura de prueba vigente reutilizada

La cobertura vigente que sustenta esta tarea incluye, sin modificación:

- `TREQ-INTEGRATION-003` — identidad estable, estado durable, resultado recuperable, idempotencia y recuperación manual controlada;
- `TREQ-INTEGRATION-004` — reconstrucción de intentos, errores y efectos sin duplicación;
- `TREQ-INTEGRATION-263` — ocho alcances de fallo y enlaces secundarios sin fusión de identidad;
- `TREQ-INTEGRATION-264` — rechazo terminal solo con ausencia de efecto demostrada;
- `TREQ-INTEGRATION-267` — reproceso conserva operación, key, huella, contenido y owner;
- `TREQ-INTEGRATION-268` — resultados desconocidos requieren consulta o conciliación antes de acciones incompatibles;
- `TREQ-INTEGRATION-269` — cuarentena limitada a ocho razones cerradas;
- `TREQ-INTEGRATION-270` — cuarentena preserva identidad, contenido o referencia, hash, procedencia, sensibilidad, intentos y evidencia;
- `TREQ-INTEGRATION-271` — dead-letter exige siete puertas acumulativas;
- `TREQ-INTEGRATION-272` — dead-letter permanece disposición operativa y no estado empresarial;
- `TREQ-INTEGRATION-273` — intervención manual atribuible, autorizada y auditada;
- `TREQ-INTEGRATION-274` — allowlist de diez acciones manuales;
- `TREQ-INTEGRATION-280` — línea temporal inmutable de tratamiento de errores parciales;
- `TREQ-INTEGRATION-281` — minimización, referencias/hashes y exclusión de secretos;
- `TREQ-INTEGRATION-282` — ownership y aging de casos abiertos sin cierre por antigüedad.

Estas referencias son trazabilidad de cobertura existente y no representan cambios al registro.

---

#### 62. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | La batería npm del checkout completo deberá ejecutarse después de incorporar el artefacto al owner documental vigente. |
| LOCAL | PASS | El artefacto fue comprobado estructuralmente como UTF-8 sin BOM, LF, metadata compacta, secciones obligatorias, continuidad, cero requisitos en la sección de cambios, shape 2/8/39, vocabularios 8/9/12/8/7/10/8, matriz externa 21/21, distribución vigente 1+6+2+2+1+1+7+1, estados 12/8/1, topología `TEMPLATE_PER_PACKAGE`, gate `POST_E5_PACKAGE`, ausencia de placeholders prohibidos y alcance documental sin materialización física. |
| REMOTA | PASS | Se verificaron en `main` el cierre de `INT-DB-005`, la continuidad vigente con `INT-DB-006` como tarea actual, el archivo propietario, topología, contrato de entrega, políticas de tarea, `INT-EXT-016`, `SHELL-CON-024`, la instancia verificada `SHELL-CON-024::GLOBAL`, el contrato generado de disposition, el registro 04A de integración, `package.json` y ausencia de rama remota `task/int-db-006` al corte. |
| OPERATIVA | NOT_EXECUTED | No se ejecutaron quarantines, dead-letter, reprocesos, provider calls, impresiones, pushes, pagos, compensaciones ni conciliaciones reales; esas pruebas pertenecen a futuras instancias por paquete. |
| FÍSICA | NOT_APPLICABLE | La definición documental autoriza cero cambios físicos y no crea instancia `GLOBAL`; la materialización futura pertenece a `INT-DB-006::<package_id>` después de E5. |

---

#### 63. Criterios de aceptación

`INT-DB-006` queda documentalmente cerrada cuando se demuestre que:

1. existe una sola definición reutilizable de persistencia de casos de disposición;
2. la topología es `TEMPLATE_PER_PACKAGE` y el gate es `POST_E5_PACKAGE`;
3. ninguna instancia `GLOBAL` de `INT-DB-006` es creada o implícita;
4. se consume `SHELL-CON-024` sin taxonomía paralela;
5. se conservan shapes 2/8/39;
6. se conservan exactamente 8 scopes, 9 partiality classes y 12 dispositions;
7. se conservan exactamente 8 quarantine reasons, 7 dead-letter gates y 10 manual actions;
8. se reutilizan exactamente 8 closure outcomes de `SHELL-CON-023`;
9. `IntegrationDispositionCaseId` permanece estable, opaco y no secreto;
10. retry técnico no crea un caso nuevo por defecto;
11. cuarentena preserva unidad, identidad, evidencia e integridad y no cambia el business outcome;
12. fallos transitorios ordinarios no se convierten en cuarentena;
13. dead-letter requiere las siete puertas, sin excepción;
14. retry agotado no produce dead-letter completo automáticamente;
15. resultado desconocido no se transforma en fracaso y exige consulta o conciliación;
16. dead-letter no cierra conciliación ni obligaciones abiertas;
17. misma intención conserva idempotencia y huella compatible;
18. cambio material exige corrección o sucesor;
19. rechazo terminal exige ausencia de efecto incompatible demostrada;
20. compensación se referencia únicamente para efectos confirmados y permanece bajo su owner;
21. secretos y payload completo no se duplican por conveniencia;
22. retención y hold no crean TTL universal;
23. la persistencia queda aislada por package, owner y ambiente;
24. la matriz conserva 21/21 identidades sin faltantes ni duplicados;
25. la distribución vigente es `1+6+2+2+1+1+7+1`;
26. los estados vigentes son `12 ESPECIFICADO + 8 NO_APLICA + 1 BLOQUEADO`;
27. POS conserva especialización `EXTERNAL-SALE-LINE-QUARANTINE-001`;
28. Telefonía / voz permanece bloqueada hasta `TI-INT-003`;
29. sistemas sin binding no reciben casos ficticios;
30. `INT-DB-007` conserva auditoría detallada de procesamiento, retries y compensaciones;
31. `INT-DB-008` conserva conciliación;
32. `QUEUE-ARC-008/009/011/012` conservan infraestructura de queue, concurrencia, métricas y autorización;
33. backfill legacy exige evidencia suficiente y no usa semejanza textual;
34. rollback conserva casos, evidencia, gates e incertidumbre ya registrada;
35. la sección de requisitos derivados declara cero cambios y no contiene identificadores de requisito;
36. la cobertura vigente queda trazada fuera de esa sección;
37. ninguna modificación Supabase es ejecutada durante esta tarea documental.

---

#### 64. Decisiones vinculantes

Quedan vinculantes para cualquier futura materialización de `INT-DB-006::<package_id>`:

- el caso de disposición no es la operación empresarial;
- cuarentena, dead-letter, rechazo, incertidumbre, conciliación y compensación permanecen conceptos distintos;
- case ID es estable y no deriva del contenido sensible;
- cuarentena usa únicamente las ocho razones cerradas;
- dead-letter exige las siete puertas acumulativas;
- retry agotado no determina outcome;
- un resultado incierto no se repite a ciegas;
- misma intención conserva idempotencia y evidencia;
- cambio material crea corrección o sucesor;
- owner empresarial retiene autoridad;
- una queue no se convierte en owner;
- evidencia protegida se referencia antes de duplicarse;
- secrets y credential material quedan excluidos;
- no existe TTL universal;
- los 21 sistemas conservan la adopción reconciliada de `SHELL-CON-024`;
- POS conserva su especialización vigente;
- no se fabrica runtime para sistemas sin binding;
- auditoría detallada pertenece a `INT-DB-007`;
- conciliación pertenece a `INT-DB-008`;
- toda materialización pertenece a un `package_id` aprobado después de E5.

---

#### 65. Límites

Esta tarea no:

- ejecuta DDL, DML, migraciones, RLS, RPC ni cambios remotos;
- crea tablas, filas, índices, constraints, queues, topics, buckets, workers, cron o schedulers físicos;
- crea casos runtime de disposition;
- crea quarantine records runtime;
- crea dead-letter records runtime;
- ejecuta reprocesos;
- ejecuta retries;
- ejecuta compensaciones;
- resuelve conciliaciones;
- modifica `SHELL-CON-024`;
- migra consumidores del contrato compartido;
- almacena payload completo como mecanismo de debug;
- crea ni rota credenciales;
- acredita bindings ausentes;
- cambia owners empresariales;
- crea backlog empresarial para Sentry;
- crea jobs persistentes para lecturas interactivas de Google Maps / Reviews;
- crea una cuarentena externa universal para Supabase;
- inventa política física para sistemas sin binding;
- absorbe la auditoría detallada reservada a `INT-DB-007`;
- absorbe la conciliación reservada a `INT-DB-008`;
- inicia `INT-DB-007`.

---

#### 66. Continuidad

**ÚLTIMA TAREA APROBADA**
`INT-DB-005 — Crear restricciones e índices de idempotencia`

**TAREA ACTUAL APROBADA**
`INT-DB-006 — Crear cuarentena y registro de errores no procesables`

**SIGUIENTE TAREA RESERVADA**
`INT-DB-007 — Crear auditoría de procesamiento, reintentos y compensaciones`


### ✅ INT-DB-007 — Crear auditoría de procesamiento, reintentos y compensaciones

**Estado:** APROBADA
**Tarea anterior:** INT-DB-006 — Crear cuarentena y registro de errores no procesables
**Tarea siguiente:** INT-DB-008 — Crear mecanismos de conciliación por integración
**Tipo de tarea:** Documental; contrato y plantilla R2 repetible por `package_id` para persistir auditoría append-only de procesamiento, intentos, reintentos, resultados, decisiones de autorización, efectos y compensaciones ejecutadas, conservando causalidad, identidad, evidencia, minimización y ownership sin materializar mecanismos de conciliación durante esta definición
**Bloque:** R — Fundación física, migraciones por dominio y normalización
**Repositorio propietario:** `devVentoGroup/vento-shell`
**Archivo propietario:** `docs/plan-canonico/modular/bloques/R_SUPABASE/05_INFRAESTRUCTURA_DE_INTEGRACIONES_EXTERNAS.md`
**Estado físico resultante:** `ESPECIFICADO_NO_MATERIALIZADO`; contrato canónico `TEMPLATE_PER_PACKAGE` cerrado para futuras instancias `INT-DB-007::<package_id>`, sujetas a `POST_E5_PACKAGE`, a los registros aplicables de INT-DB-001 a INT-DB-006, a los contratos de retry, auditoría y compensación vigentes, a recaptura de drift y a autorización física explícita
**Cambios físicos autorizados:** ninguno
**Requisitos de prueba creados o modificados:** 0
**Fecha de corte:** 2026-08-26

---

#### 1. Propósito

`INT-DB-007` define la persistencia física futura que permitirá reconstruir, por paquete, qué ocurrió durante el procesamiento de una operación de integración desde su recepción o aceptación hasta su resultado, incluidos intentos técnicos, reintentos, decisiones de autorización, efectos confirmados, resultados inciertos, intervenciones y compensaciones ejecutadas.

La auditoría no es un log libre ni una segunda fuente empresarial. Debe conservar una línea temporal causal, append-only, atribuible y minimizada que permita responder de forma reproducible:

1. qué operación, evento, entrega, efecto o caso estaba siendo procesado;
2. qué aplicación, dominio y superficie eran propietarios;
3. qué actor humano, principal técnico o principal de integración participó;
4. qué autorización fue evaluada y con qué versión de política;
5. qué intento técnico se ejecutó;
6. qué perfil de retry gobernó el intento;
7. qué error, rate limit, breaker, espera o dependencia afectó el procesamiento;
8. qué resultado técnico se observó;
9. qué efecto empresarial quedó confirmado, ausente, rechazado o incierto;
10. qué evidencia fuente, mapping, idempotency ref o caso de disposición soportan la reconstrucción;
11. qué compensación fue solicitada, autorizada, ejecutada y verificada;
12. qué corrección de auditoría fue necesaria sin alterar la entrada original;
13. qué brecha de auditoría quedó abierta cuando la historia no pudo persistirse completa;
14. qué información deberá entregar la tarea a `INT-DB-008` cuando exista conciliación pendiente.

---

#### 2. Resultado canónico

Queda definido:

```text
INT-DB-007
→ contrato documental único y reutilizable

INT-DB-007::<package_id>
→ futura instancia física por paquete

operación o unidad procesada
→ ancla auditada
→ entradas append-only
→ intentos técnicos
→ retry y budget
→ autorización y actor/principal
→ resultado técnico
→ efecto empresarial referenciado
→ compensación por pasos cuando aplique
→ correcciones enlazadas
→ brechas explícitas
→ handoff estable hacia INT-DB-008
```

La definición global no se reabre por paquete.

No existe una instancia física `INT-DB-007::GLOBAL`.

Esta definición no ejecuta DDL, DML, migraciones, RLS, RPC, workers, retries, provider calls, compensaciones ni conciliaciones.

---

#### 3. Topología vinculante

La topología aplicable queda cerrada así:

| Propiedad | Decisión |
| --- | --- |
| Modalidad | `TEMPLATE_PER_PACKAGE` |
| Gate temporal | `POST_E5_PACKAGE` |
| Identidad física futura | `INT-DB-007::<package_id>` |
| Instancia global | no aplica |
| Definición documental | única y reutilizable |
| Implementación durante esta definición | ninguna |

Cada `package_id` materializa únicamente la auditoría correspondiente a integraciones, superficies, owners y efectos incluidos y acreditados en ese paquete.

Compartir base de datos, broker, runtime o proveedor no fusiona auditorías entre paquetes ni transfiere ownership empresarial.

---

#### 4. Gate temporal

Una futura instancia solo podrá materializar la persistencia de auditoría cuando, para el mismo `package_id`, estén satisfechas las puertas físicas aplicables.

Como mínimo:

```text
package E5 aplicable = CERRADO
E5-GATE-008::<package_id> = PASS
registro INT-DB-001 aplicable = DISPONIBLE O NO_APLICABLE JUSTIFICADO
credenciales INT-DB-002 aplicables = REFERENCIABLES O NO_APLICABLE JUSTIFICADO
evidencia INT-DB-003 aplicable = DISPONIBLE O NO_APLICABLE JUSTIFICADO
mapping INT-DB-004 aplicable = DISPONIBLE O NO_APLICABLE JUSTIFICADO
idempotencia INT-DB-005 aplicable = DISPONIBLE O NO_APLICABLE JUSTIFICADO
disposición INT-DB-006 aplicable = DISPONIBLE O NO_APLICABLE JUSTIFICADO
contratos de retry, auditoría y compensación = VIGENTES
drift aplicable = RECONCILED
rollback = PREPARADO
physical_authorization = EXPLICIT
```

La falta de una dependencia opcional no se resuelve fabricando referencias.

---

#### 5. Fuentes vinculantes

La definición consume sin reinterpretación silenciosa:

- `INT-APP-004` para identidad idempotente, claim y resultado recuperable;
- `INT-APP-005` y `ENTERPRISE-EVENT-RETRY-POLICY-001` para perfiles, budget, retryability, backoff, `Retry-After`, circuit breaker y agotamiento;
- `INT-APP-006` y `ENTERPRISE-EVENT-COMPENSATION-POLICY-001` para planes y pasos compensatorios;
- `INT-APP-007` y `ENTERPRISE-INTEGRATION-AUDIT-POLICY-001` para envelope, acciones, outcomes, clases de compromiso, causalidad, acceso, corrección e integridad;
- `INT-APP-008` e `INT-APP-009` para incertidumbre, errores parciales y tratamiento seguro;
- `INT-EXT-015` para retry, backoff y rate limit externos;
- `INT-EXT-016` para cuarentena y dead-letter;
- `INT-EXT-017` y `VENTO-EXTERNAL-AUDIT-OBSERVABILITY-RECONCILIATION-CONTRACT-001` para auditoría y observabilidad externa;
- `SHELL-CON-019` para eventos externos recibidos;
- `SHELL-CON-022` para mappings externos/canónicos;
- `SHELL-CON-023` para idempotencia y referencias de conciliación;
- `SHELL-CON-024` para casos de disposición y `IntegrationCompensationPlanRef`;
- `INT-DB-001` a `INT-DB-006` como entradas físicas previas cuando sean aplicables;
- las especializaciones POS vigentes para reversos, compensaciones y conciliación;
- el registro canónico de requisitos de prueba vigente;
- el estado remoto recapturado al iniciar cada futura instancia.

`INT-DB-007` no crea un contrato público compartido nuevo ni modifica los contratos anteriores.

---

#### 6. Reconciliación de autoridades históricas y vigentes

La semántica de retry, compensación y auditoría se definió primero en BLOQUE X y fue especializada después por contratos compartidos y tareas de persistencia de BLOQUE R.

La regla de consumo queda:

```text
retry histórico y vigente de INT-APP-005 / INT-EXT-015
+ compensación de INT-APP-006
+ auditoría de INT-APP-007 / INT-EXT-017
+ contratos compartidos SHELL-CON-019/022/023/024
+ handoffs INT-DB-001..006
→ INT-DB-007 persiste la historia operacional por package_id
```

Consecuencias:

1. la evidencia histórica no se reescribe;
2. una especialización posterior aprobada prevalece para la materialización futura sin alterar el corte histórico;
3. `INT-DB-007` no crea un contrato compartido adicional;
4. una referencia a conciliación no materializa `IntegrationReconciliationCase`;
5. un plan de compensación referenciado no prueba que algún paso haya sido ejecutado;
6. un retry count agregado no sustituye el historial de intentos.

---

#### 7. Separación semántica obligatoria

La persistencia deberá conservar siempre:

```text
AUDITORÍA
≠ LOG TÉCNICO
≠ TRACE
≠ MÉTRICA
≠ ALERTA
≠ EVIDENCIA FUENTE
≠ HECHO EMPRESARIAL
≠ CASO DE DISPOSICIÓN
≠ CASO DE CONCILIACIÓN
```

Y además:

```text
OPERACIÓN LÓGICA
≠ INTENTO TÉCNICO
≠ DELIVERY
≠ RETRY
≠ COMPENSACIÓN
```

La auditoría demuestra que una acción o decisión fue registrada con identidad, causalidad y evidencia. No convierte un ACK, HTTP 2xx, trace, span, log o receipt en efecto empresarial confirmado.

---

#### 8. Familias lógicas de persistencia

La futura materialización por paquete deberá cubrir, como responsabilidades lógicas separables:

| Familia lógica | Responsabilidad |
| --- | --- |
| `INTEGRATION_PROCESSING_AUDIT_ENTRY` | entrada append-only de acción, actor/principal, causalidad, autorización, resultado y referencias |
| `INTEGRATION_PROCESSING_ATTEMPT` | identidad y detalle de cada intento técnico sobre una operación estable |
| `INTEGRATION_RETRY_TRANSITION` | programación, diferimiento, agotamiento y recuperación de retry sin cambiar identidad empresarial |
| `INTEGRATION_COMPENSATION_EXECUTION` | ejecución y verificación de un plan y sus pasos compensatorios |
| `INTEGRATION_AUDIT_CORRECTION_LINK` | relación entre entrada original y corrección append-only |
| `INTEGRATION_AUDIT_GAP_RECORD` | brecha explícita cuando una parte de la historia no pudo persistirse sin fabricar datos |

Estos nombres son identidades lógicas del contrato de persistencia. La futura migración podrá escoger nombres SQL compatibles con PostgreSQL y el paquete sin alterar esta semántica.

---

#### 9. Identidad estable de entrada de auditoría

`audit_entry_id` identifica una entrada individual e inmutable.

Reglas:

1. cada entrada tiene identidad propia;
2. no se deriva del payload, error text, timestamp, `trace_id`, secreto ni hash de fila;
3. no sustituye `operation_key`, `event_id`, `delivery_id`, `effect_id`, `attempt_id` ni `IntegrationDispositionCaseId`;
4. una misma operación puede tener múltiples entradas;
5. una corrección crea otra entrada y enlaza la original;
6. una redelivery puede producir nuevas entradas sin reinterpretar las anteriores;
7. una entrada no cambia de `package_id`, owner o ambiente después de persistida;
8. una entrada eliminada o mutada fuera del mecanismo autorizado se considera alteración, no corrección.

---

#### 10. Envelope canónico de auditoría

La persistencia deberá poder representar, cuando cada dimensión aplique, el envelope de `ENTERPRISE-INTEGRATION-AUDIT-POLICY-001`, incluyendo:

```text
audit_schema_version
audit_entry_id
correlation_id
causation_id
trace_id
span_id
owner_application
action_type
command_name
event_name
entity_type
subject_id
site_id
resource_type
resource_id
source_system
target_system
channel
environment
request_id
idempotency_key
logical_request_hash
replay_or_backfill_id
simulation_id
job_id
worker_id
client_id
device_id
station_id
effective_actor_id
effective_actor_type
user_actor_id
technical_principal_id
integration_principal_id
active_role_id
delegation_id
permission_key
authorization_scope
authorization_source
authorization_policy_version
authorization_decision
authorization_reason
ticket_or_approval_id
emergency_override
delegation_scope_match
permission_result
transport_destination
external_provider
external_reference
attempt_count
retry_count
error_code
result_type
business_outcome_ref
created_at
updated_at
```

La presencia de un campo en el envelope no lo hace obligatorio para todas las acciones. Ausencia legítima, dato desconocido, denegación, invalidez y fallo técnico permanecen estados distintos.

---

#### 11. Envelope físico por paquete e integración

La futura persistencia añadirá el contexto necesario para pertenecer de forma inequívoca a `INT-DB-007::<package_id>` sin modificar el contrato público anterior.

Como mínimo, cuando aplique:

```text
package_id
external_system_id
external_integration_id
external_environment_binding_id
source_evidence_id
mapping_reference
idempotency_ref
disposition_case_ref
reconciliation_ref
contract_version
registry_version
recorded_at
recorded_by_ref
```

Reglas:

1. `package_id` no se infiere desde la aplicación;
2. el contexto externo debe corresponder al mismo binding y ambiente;
3. `source_evidence_id` se referencia sin copiar el payload protegido;
4. `mapping_reference` no se convierte en identidad de operación;
5. `idempotency_ref` conserva ownership de `INT-DB-005`;
6. `disposition_case_ref` conserva ownership de `INT-DB-006`;
7. `reconciliation_ref` conserva ownership de `INT-DB-008`;
8. el envelope físico no amplía la autoridad de quien lee la entrada.

---

#### 12. Taxonomía cerrada de acciones

La persistencia deberá conservar la taxonomía vigente de `ENTERPRISE-INTEGRATION-AUDIT-POLICY-001`:

```text
REQUEST_RECEIVED
AUTHORIZATION_EVALUATED
COMMAND_REJECTED
COMMAND_ACCEPTED
OWNER_TRANSACTION_COMMITTED
EVENT_RECORDED
EMISSION_ATTEMPTED
EMISSION_CONFIRMED
DELIVERY_ATTEMPTED
DELIVERY_ACKNOWLEDGED
CONSUMER_CLAIMED
DUPLICATE_RESULT_RETURNED
EFFECT_STARTED
EFFECT_CONFIRMED
EFFECT_FAILED
RETRY_SCHEDULED
RETRY_EXHAUSTED
RECONCILIATION_DECIDED
COMPENSATION_STEP_RECORDED
EXTERNAL_EXCHANGE_RECORDED
REPLAY_BACKFILL_RECORDED
AUDIT_ACCESS_OR_CORRECTION_RECORDED
```

Reglas:

1. `COMMAND_ACCEPTED` no significa commit;
2. `EMISSION_CONFIRMED` no significa entrega;
3. `DELIVERY_ACKNOWLEDGED` no significa efecto empresarial;
4. `RECONCILIATION_DECIDED` registra una decisión producida por el owner de conciliación; esta tarea no la decide;
5. `COMPENSATION_STEP_RECORDED` puede representar planificación, ejecución, verificación o cierre únicamente con detalle suficiente que distinga la fase;
6. una acción específica no cambia el significado de su contrato propietario.

---

#### 13. Clases de compromiso de auditoría

Se conservan exactamente las tres clases vigentes:

```text
AUDIT_ATOMIC_REQUIRED
AUDIT_DURABLE_BEFORE_ACK
AUDIT_DURABLE_BUFFER_ALLOWED
```

Aplicación:

1. decisiones de autorización, commits propietarios, efectos financieros, físicos, de puntos, acceso, documento, calidad y compensación usan `AUDIT_ATOMIC_REQUIRED` o mecanismo reconciliable equivalente;
2. entregas, intercambios externos, accesos sensibles, exportaciones y cierres de efecto usan `AUDIT_DURABLE_BEFORE_ACK` cuando corresponda;
3. enriquecimiento técnico no decisorio puede usar `AUDIT_DURABLE_BUFFER_ALLOWED` únicamente con ancla previa e identidad fija;
4. ninguna clase permite omitir auditoría;
5. una brecha del buffer durable queda explícita y no se rellena inventando entradas.

---

#### 14. Causalidad y línea temporal

La línea temporal transversal se reconstruye por identidades y relaciones, no por timestamps aislados.

La persistencia podrá enlazar, según aplique:

```text
correlation_id
causation_id
request_id
source_command_id
event_id
delivery_id
effect_id
attempt_id
aggregate_version
result_ref
source_evidence_id
```

Reglas:

1. `correlation_id` agrupa un proceso sin convertir todos sus efectos en una sola operación;
2. `causation_id` expresa causa inmediata cuando esté acreditada;
3. un timestamp cercano no demuestra causalidad;
4. orden de llegada no sustituye versión del agregado;
5. concurrencia puede producir timestamps intercalados sin alterar la relación causal;
6. backfill y replay preservan la identidad histórica;
7. una línea temporal puede quedar incompleta de forma explícita; no se completa por inferencia.

---

#### 15. Semántica temporal

Cada entrada distinguirá, cuando aplique:

```text
occurred_at
received_at
recorded_at
completed_at
```

Además deberá preservar zona horaria y calidad de reloj cuando sean materiales.

Reglas:

1. `occurred_at` no se reescribe porque la captura haya sido tardía;
2. `received_at` representa recepción VENTO cuando exista;
3. `recorded_at` representa persistencia de auditoría;
4. `completed_at` representa cierre de la acción auditada, no cierre empresarial universal;
5. `created_at` y `updated_at` del envelope no sustituyen estas semánticas;
6. un reloj incierto se declara, no se corrige con una hora inventada.

---

#### 16. Actor humano, principal técnico y principal de integración

La auditoría deberá distinguir de forma explícita:

```text
effective_actor_id
effective_actor_type
user_actor_id
technical_principal_id
integration_principal_id
client_id
device_id
station_id
job_id
worker_id
```

Reglas:

1. el principal autenticado no siempre es el actor humano causal;
2. un dispositivo compartido no se convierte en actor;
3. `service_role` no se registra como autoridad empresarial;
4. un worker conserva principal técnico y owner;
5. un proveedor externo no se convierte en usuario VENTO;
6. una compensación ejecutada automáticamente conserva tanto su principal técnico como el actor o aprobación causal cuando existan;
7. ausencia de actor humano en una automatización legítima no autoriza inventarlo.

---

#### 17. Evidencia de autorización

Toda decisión sensible conservará, cuando aplique:

```text
permission_key
authorization_scope
authorization_source
authorization_policy_version
authorization_decision
authorization_reason
active_role_id
delegation_id
delegation_scope_match
permission_result
ticket_or_approval_id
emergency_override
```

Reglas:

1. una denegación se audita aunque no produzca mutación;
2. una aprobación previa no congela autoridad para retries o compensaciones posteriores;
3. antes de un intento sensible se revalida la autoridad exigida por el contrato;
4. un ticket o approval ref no sustituye la evaluación de permiso;
5. una credencial técnica válida no equivale a autorización empresarial;
6. emergencia no elimina trazabilidad, motivo ni owner.

---

#### 18. Auditoría del ciclo de comando

El ciclo de comando deberá distinguir:

```text
REQUEST_RECEIVED
→ AUTHORIZATION_EVALUATED
→ COMMAND_REJECTED
```

o:

```text
REQUEST_RECEIVED
→ AUTHORIZATION_EVALUATED
→ COMMAND_ACCEPTED
→ OWNER_TRANSACTION_COMMITTED
```

Reglas:

1. aceptación técnica no es commit;
2. HTTP exitoso no es commit;
3. el commit propietario mantiene un ancla auditada durable;
4. si la auditoría crítica falla, no se presenta éxito sin ancla o contención reconciliable;
5. un comando rechazado conserva causa y autorización;
6. un retry del mismo comando conserva identidad idempotente compatible.

---

#### 19. Auditoría de evento y emisión

Toda emisión deberá distinguir:

```text
EVENT_RECORDED
EMISSION_ATTEMPTED
EMISSION_CONFIRMED
```

Cada intento de emisión deberá conservar, cuando aplique:

```text
attempt_id
event_id
retry_profile
transport_destination
attempt_number
occurred_at
result_type
error_code
```

Reglas:

1. registrar el evento no demuestra publicación;
2. publicar no demuestra entrega;
3. la identidad del evento no cambia por retry;
4. `attempt_id` cambia por intento técnico;
5. una respuesta perdida del transporte no autoriza crear un evento nuevo;
6. la productora conserva el hecho y su evento durable como fuentes distintas del log técnico.

---

#### 20. Auditoría de entrega por consumidora

Cada entrega se reconstruye por consumidora y delivery independiente.

La persistencia deberá conservar, cuando aplique:

```text
consumer_application
delivery_id
event_id
attempt_id
attempt_number
contract_version
sensitivity_class
delivery_result
ack_reference
next_disposition
```

Reglas:

1. éxito de una consumidora no cierra otra;
2. agotar retry de una consumidora no consume budget de otra;
3. una audiencia histórica de replay no se expande por descubrimiento posterior;
4. ACK de transporte no equivale a efecto;
5. delivery y consumer effect permanecen scopes separados;
6. una consumidora no escribe el audit trail privado de otra salvo contrato compartido explícito.

---

#### 21. Auditoría de claim, deduplicación y efecto consumidor

El procesamiento consumidor deberá poder registrar:

```text
CONSUMER_CLAIMED
DUPLICATE_RESULT_RETURNED
EFFECT_STARTED
EFFECT_CONFIRMED
EFFECT_FAILED
```

Se deberán conservar referencias a:

```text
idempotency_ref
logical_content_hash
claim_state
resource_ref
result_ref
mapping_reference
business_outcome_ref
```

Reglas:

1. un duplicado compatible recupera el resultado previo sin segundo efecto;
2. un conflicto de huella no se registra como retry ordinario;
3. stale y out-of-order se preservan como decisiones propias;
4. el ACK del mensaje no marca el efecto como confirmado;
5. `business_outcome_ref` conserva el resultado empresarial o una referencia estable a él;
6. la auditoría no se convierte en el ledger idempotente.

---

#### 22. Identidad de intento técnico

Se define `attempt_id` como identidad estable de un intento técnico individual.

Invariantes:

1. una operación lógica puede tener cero, uno o muchos intentos;
2. cada intento materializado tiene `attempt_id` propio;
3. `attempt_id` no se reutiliza para otro intento;
4. no sustituye `operation_key`;
5. no sustituye `delivery_id`;
6. no cambia el resultado empresarial por existir;
7. el intento conserva referencia a la misma identidad empresarial e idempotente cuando es retry;
8. un nuevo `attempt_id` no concede derecho a repetir un efecto incierto;
9. un attempt ID no se fabrica para backfill histórico si no puede acreditarse.

---

#### 23. Shape lógico de intento de procesamiento

`INTEGRATION_PROCESSING_ATTEMPT` deberá poder representar, cuando aplique:

```text
attempt_id
package_id
operation_or_delivery_ref
idempotency_ref
disposition_case_ref
external_system_id
external_integration_id
external_environment_binding_id
surface
attempt_number
retry_profile
error_class
scheduled_at
started_at
completed_at
retry_after_observed_at
rate_policy_ref
breaker_state_ref
worker_id
job_id
transport_destination
authorization_reference
result_type
result_reference
business_outcome_ref
next_disposition
audit_entry_refs
```

Reglas:

1. `attempt_number` no es identidad;
2. `retry_profile` proviene del contrato vigente;
3. error técnico y business outcome permanecen separados;
4. worker/job no adquieren ownership empresarial;
5. resultado desconocido se conserva como tal;
6. las referencias de auditoría enlazan las acciones emitidas por el intento sin duplicar contenido.

---

#### 24. Retry y preservación de identidad

Un retry técnico conserva:

```text
misma operación lógica
+ misma idempotency identity
+ mismo owner y finalidad
+ mismo contenido lógico compatible
```

Puede cambiar:

```text
attempt_id
attempt_number
worker_id
job_id
delivery_id técnico cuando el transporte lo exija
scheduled_at
started_at
completed_at
```

No puede cambiar por conveniencia:

- `operation_key`;
- `generation`;
- owner;
- ambiente;
- recurso;
- contenido material;
- contract version incompatible;
- autorización exigida.

Si cambia la intención empresarial, no es retry.

---

#### 25. Programación y agotamiento de retry

`INTEGRATION_RETRY_TRANSITION` deberá permitir auditar:

```text
retry_profile
attempt_number
error_class
scheduled_at
next_attempt_at
retry_after_observed_at
remaining_attempt_budget
remaining_age_budget
breaker_state_ref
rate_policy_ref
outcome
result_recovered_ref
```

Reglas:

1. `RETRY_SCHEDULED` no confirma que el siguiente intento ocurrió;
2. `RETRY_EXHAUSTED` no fabrica éxito;
3. agotar budget no ejecuta automáticamente compensación;
4. agotar budget no convierte resultado incierto en fracaso;
5. `Retry-After` observado se conserva como dato del proveedor cuando aplique;
6. un circuit breaker abierto no pierde ni confirma trabajo;
7. el restablecimiento no libera todo el backlog sin límites y jitter definidos por la infraestructura propietaria;
8. cada consumidora conserva budget independiente.

---

#### 26. Resultado desconocido

Timeout, lease expirado, proceso reiniciado, conexión cerrada, respuesta perdida o worker detenido no prueban por sí solos que el efecto no ocurrió.

Cuando el resultado sea incierto:

```text
identidad original
+ intentos auditados
+ evidence refs
+ result refs disponibles
+ disposition case cuando aplique
→ outcome incierto preservado
→ handoff de conciliación cuando corresponda
```

Reglas:

1. no se crea nueva generación para escapar de la incertidumbre;
2. no se repite un efecto sensible sin la verificación exigida;
3. no se ejecuta compensación sobre un efecto hipotético;
4. cuarentena y dead-letter pueden coexistir con incertidumbre, pero no la resuelven;
5. `INT-DB-008` decide la conciliación; `INT-DB-007` conserva su evidencia y referencias.

---

#### 27. Handoff recibido de INT-DB-006

Cuando exista `IntegrationDispositionCase`, `INT-DB-007` consume sin reidentificar:

```text
integration_disposition_case_id
attempt_references[]
audit_references[]
compensation_plan_ref
manual_intervention_action
authorization_reference
partiality_class
disposition
business_outcome_reference
reconciliation_ref
```

`INT-DB-007` materializa el detalle que `INT-DB-006` dejó expresamente fuera:

- cada intento;
- cada retry;
- cada transición técnica relevante;
- cada resultado técnico;
- cada paso compensatorio ejecutado;
- la línea temporal de auditoría.

No modifica la taxonomía, razón de cuarentena, dead-letter gates ni cierre del caso por conveniencia.

---

#### 28. Plan de compensación

La compensación consume el plan propietario definido por `INT-APP-006` y la referencia compartida de `SHELL-CON-024`.

Un plan aplicable conserva como mínimo:

```text
compensation_plan_id
plan_version
process_family
originating_application
emergency_scenario
authorized_trigger_types
minimum_required_permission
decision_owner
manual_review_required_when
steps
final_verification
residual_owner
```

Reglas:

1. el plan no demuestra que un paso haya sido ejecutado;
2. una versión iniciada no se edita destructivamente;
3. cambiar alcance, orden, importe, cantidad, autoridad o tratamiento exige una versión sucesora compatible;
4. la ejecución conserva la versión exacta;
5. cancel, void y supersede no se confunden automáticamente con compensación;
6. un efecto irreversible o pendiente de determinar no recibe reverso automático.

---

#### 29. Identidad y ejecución de paso compensatorio

Cada paso contractual conserva:

```text
compensation_step_id
order
owner_application
effect_type
original_effect_reference
reversibility
mechanism
target
mode
preconditions
confirmation_evidence
authorization_ref
idempotency_ref
result_or_effect_ref
audit_action
```

`INTEGRATION_COMPENSATION_EXECUTION` agrega el contexto de ejecución:

```text
package_id
compensation_plan_id
plan_version
compensation_step_id
attempt_id
started_at
completed_at
execution_result
verification_result
error_class
residual_obligations
audit_entry_refs
```

La representación física podrá normalizar estos campos sin modificar el contrato del plan.

---

#### 30. Causalidad de compensación

Toda compensación deberá conservar una relación inequívoca con el efecto original.

Cuando existan, deberán permanecer enlazados:

```text
original_effect_ref
original_event_id
source_command_id
correlation_id
causation_id
action_id
confirmation_evidence
```

Queda prohibido seleccionar el efecto a compensar por semejanza de:

- texto;
- importe;
- fecha;
- producto;
- destinatario;
- proximidad temporal;
- payload parecido.

Una compensación sin efecto confirmado queda bloqueada.

---

#### 31. Idempotencia de compensación

Cada paso compensatorio usa una identidad idempotente propia dentro de su scope.

Reglas:

1. repetir la misma identidad y huella compatible devuelve el estado o resultado previo;
2. no reaplica el efecto;
3. reutilizar identidad con acción, efecto original, importe, cantidad, destinatario, recurso o plan incompatibles produce conflicto;
4. `attempt_id` no sustituye la clave idempotente;
5. un retry de compensación conserva la misma intención;
6. una nueva compensación legítima exige identidad nueva según el contrato propietario;
7. el ledger idempotente continúa bajo `INT-DB-005`; esta tarea conserva la relación auditada.

---

#### 32. Autorización y segregación de compensación

Solicitar, aprobar, ejecutar, verificar y cerrar una compensación pueden exigir capacidades separadas.

La persistencia deberá conservar, cuando aplique:

```text
requested_by_ref
approved_by_ref
executed_by_ref
verified_by_ref
authorization_ref
permission_key
authorization_policy_version
authorization_decision
ticket_or_approval_id
emergency_override
```

Reglas:

1. el actor que produjo el efecto no se autoaprueba un reverso sensible salvo contrato de emergencia explícito;
2. un plan aprobado no congela permisos futuros;
3. antes de cada paso se revalida autoridad, contexto, recurso, estado, versión y sensibilidad;
4. la ejecución automática conserva principal técnico y autoridad causal;
5. una compensación no escribe tablas privadas de otro owner.

---

#### 33. Compensación parcial y residuales

Cuando algunos pasos queden confirmados y otros no:

1. se preservan los pasos confirmados;
2. se identifica el paso fallido o incierto;
3. se conserva si es retryable o terminal conforme al contrato;
4. se conserva evidencia suficiente;
5. se asigna owner residual;
6. no se ejecuta una segunda cadena inversa por inferencia;
7. no se presenta la operación como completamente compensada;
8. si requiere conciliación, se enlaza `reconciliation_ref` sin decidir el caso;
9. el cierre del plan usa el vocabulario canónico vigente del contrato propietario.

`RESOLVED_COMPENSATED` en un caso de disposición exige compensación confirmada, no solo plan existente.

---

#### 34. Corrección append-only

La auditoría ordinaria es append-only.

Una corrección deberá:

```text
crear nueva audit_entry_id
→ enlazar original_audit_entry_id
→ conservar antes
→ conservar después
→ conservar motivo
→ conservar autoridad
→ conservar alcance
```

Reglas:

1. la entrada original permanece inmutable;
2. no se borra auditoría durante rollback, retiro o migración;
3. una corrección no cambia el hecho empresarial por sí sola;
4. una corrección de mapping o evidence ref no reescribe el intento histórico;
5. una corrección sensible también se audita mediante `AUDIT_ACCESS_OR_CORRECTION_RECORDED`.

---

#### 35. Brechas de auditoría

Cuando una entrada o enriquecimiento esperado no pueda persistirse conforme a la clase de compromiso:

1. no se presenta como existente;
2. no se crea retrospectivamente con datos inferidos;
3. se crea `INTEGRATION_AUDIT_GAP_RECORD` o mecanismo equivalente;
4. se conserva periodo, alcance, causa, riesgo y plan;
5. se usa el outcome o código canónico de brecha cuando el contrato lo exija;
6. la operación crítica queda contenida o reconciliable conforme a su clase;
7. el owner de `INT-DB-008` recibe el handoff si la brecha impide determinar un resultado.

Una brecha no se soluciona copiando logs técnicos a la tabla de auditoría.

---

#### 36. Evidencia fuente, payload y minimización

La auditoría deberá preferir:

```text
source_evidence_id
payload_digest_ref
protected_evidence_ref
mapping_reference
external_reference
result_reference
business_outcome_ref
```

Queda prohibido copiar por conveniencia:

- payload original completo cuando una referencia sea suficiente;
- secretos;
- tokens;
- firmas completas;
- passwords;
- private keys;
- `service_role`;
- datos bancarios completos;
- datos personales o sensibles no necesarios;
- URLs firmadas persistentes;
- headers reutilizables.

Auditoría, staging y evidencia protegida permanecen capas separadas.

---

#### 37. Acceso sensible y auditoría de la propia auditoría

Consultar, buscar, exportar, imprimir, compartir o corregir auditoría sensible requiere autorización por finalidad cuando corresponda.

La evidencia de acceso deberá poder conservar:

```text
actor_or_principal_ref
purpose
scope
filters
recipient_or_destination
reason
artifact_digest_ref
occurred_at
authorization_reference
```

Reglas:

1. crear una entrada no concede permiso para leerla;
2. leer metadata no concede acceso al payload protegido;
3. exportar auditoría no concede acceso al proveedor;
4. un export no contiene secretos por existir en una superficie administrativa;
5. el acceso sensible puede generar otra entrada de auditoría;
6. una consulta técnica de health no se eleva automáticamente a acceso empresarial sensible.

---

#### 38. Retención y legal hold

Cada entrada o familia física deberá enlazar la política aplicable mediante campos o referencias como:

```text
sensitivity_class
access_scope
retention_policy_ref
legal_hold_reference
```

Reglas:

1. `INT-DB-007` no fija un TTL universal;
2. edad no autoriza borrar auditoría crítica;
3. legal hold bloquea disposición conforme a su política;
4. retención no cambia business outcome;
5. backup no sustituye retención;
6. purga autorizada no permite romper referencias que deban conservarse;
7. los periodos exactos pertenecen al gobierno de información propietario.

---

#### 39. Seguridad, RLS y grants futuros

La futura persistencia se trata como superficie sensible server-side.

Deberá demostrar:

1. escritura desde clientes no privilegiados denegada salvo contrato explícito posterior;
2. lectura por owner, finalidad y sensibilidad;
3. separación entre escritura técnica y autoridad de cierre empresarial;
4. prohibición de usar `service_role` como principal empresarial;
5. minimización de vistas y proyecciones;
6. RLS/grants alineados con el package y contratos de autorización;
7. acceso de soporte separado del acceso a evidencia protegida;
8. auditoría de accesos sensibles;
9. aislamiento entre ambientes y paquetes.

Esta tarea documental no crea policies ni grants.

---

#### 40. Índices y patrones de consulta

La futura implementación deberá permitir consultas operativas sin convertir índices auxiliares en identidad.

Patrones autorizados, según necesidad real del paquete:

```text
package_id + owner_application + occurred_at
correlation_id + causation_id
operation/idempotency ref + attempt_number
event_id + consumer_application
delivery_id
effect_id
integration_disposition_case_id
compensation_plan_id + compensation_step_id
external_system_id + environment + surface
reconciliation_ref
```

Reglas:

1. `trace_id` no se convierte en identidad empresarial;
2. timestamps no sustituyen causalidad;
3. índices de retry no crean budget;
4. índices de compensación no conceden autorización;
5. índices de `reconciliation_ref` no materializan conciliación;
6. el diseño físico se ajusta a consultas reales del paquete y no a indexación indiscriminada.

---

#### 41. Universo externo reconciliado 21/21

La definición conserva el universo externo canónico y reconcilia la taxonomía histórica de `INT-EXT-017` con especializaciones posteriores aprobadas.

| ID | Sistema / plataforma | Clasificación de auditoría vigente | Estado | Disposición de INT-DB-007 |
| --- | --- | --- | --- | --- |
| `EXT-SYS-001` | Supabase | `GOBERNADA_POR_OBSERVABILIDAD_INTERNA_VENTO` | `ESPECIFICADO` | auditorar operaciones propietarias y cambios críticos; no crear un ledger externo global de toda actividad Supabase |
| `EXT-SYS-002` | Wompi | `INBOUND_EVENT_AUDIT_AND_PROVIDER_RECONCILIATION` | `ESPECIFICADO` | auditar recepción, autenticidad referenciada, identidad, intentos, efecto y resultado; conciliación pertenece a INT-DB-008 |
| `EXT-SYS-003` | RevenueCat | `INBOUND_EVENT_AUDIT_AND_PROVIDER_RECONCILIATION` | `ESPECIFICADO` | auditar redelivery, transformación, mapping, idempotencia, efecto y outcome sin copiar payload completo |
| `EXT-SYS-004` | Resend | `OUTBOUND_DELIVERY_AUDIT_AND_RECEIPT_RECONCILIATION` | `ESPECIFICADO` | auditar cada entrega e intento, ACK o receipt cuando exista y resultado técnico separado del resultado empresarial |
| `EXT-SYS-005` | Expo / EAS Update | `CONFIGURATION_OBSERVABILITY_NO_RUNTIME_EXCHANGE` | `ESPECIFICADO` | conservar auditoría de configuración o release solo cuando el owner lo requiera; no fabricar intercambio runtime |
| `EXT-SYS-006` | Expo Push Service | `OUTBOUND_DELIVERY_AUDIT_AND_RECEIPT_RECONCILIATION` | `ESPECIFICADO` | auditar por destino, intento, receipt/result y generación sin fusionar destinos |
| `EXT-SYS-007` | Sentry | `BEST_EFFORT_OBSERVABILITY_PROVIDER` | `ESPECIFICADO` | telemetría best-effort no sustituye la auditoría empresarial ni bloquea el hecho por defecto |
| `EXT-SYS-008` | Google Maps / Google Reviews | `INTERACTIVE_READ_TECHNICAL_OBSERVABILITY` | `ESPECIFICADO` | auditar uso técnico mínimo cuando sea necesario sin crear ledger empresarial por cada lectura |
| `EXT-SYS-009` | Apple Wallet / PassKit y APNs | `HYBRID_RESOURCE_AND_PUSH_OBSERVABILITY` | `ESPECIFICADO` | separar mutación de recurso, registro de dispositivo y push; cada superficie conserva intento y resultado propios |
| `EXT-SYS-010` | Vercel | `CONFIGURATION_OBSERVABILITY_NO_RUNTIME_EXCHANGE` | `ESPECIFICADO` | auditar cambios de configuración/deployment cuando corresponda sin inventar efecto empresarial |
| `EXT-SYS-011` | Zebra BrowserPrint | `PHYSICAL_EFFECT_AUDIT_AND_MANUAL_RECONCILIATION` | `ESPECIFICADO` | auditar envío, resultado técnico, incertidumbre física y verificación; timeout no demuestra que no imprimió |
| `EXT-SYS-012` | Google Wallet / Google Pay & Wallet | `MODEL_NO_REMOTE_BINDING` | `NO_APLICA` | no materializar auditoría runtime externa hasta acreditar binding real |
| `EXT-SYS-013` | POS externo vigente | `APLICA_CON_ESPECIALIZACION_POS` | `PENDIENTE_DE_EVIDENCIA` | auditar procesamiento VENTO y compensaciones internas acreditadas sin inventar receipts, campos o garantías del proveedor |
| `EXT-SYS-014` | Shopify / canal de comercio electrónico | `NO_APLICA_SIN_BINDING` | `NO_APLICA` | no crear auditoría de intercambio externo sin binding |
| `EXT-SYS-015` | Rappi / marketplace | `NO_APLICA_SIN_BINDING` | `NO_APLICA` | no crear auditoría de pedidos o entregas sin contrato acreditado |
| `EXT-SYS-016` | ManyChat / automatización conversacional | `NO_APLICA_SIN_BINDING` | `NO_APLICA` | no inventar subscriber, flow, delivery o outcome |
| `EXT-SYS-017` | WhatsApp | `NO_APLICA_SIN_BINDING` | `NO_APLICA` | no auditar un proveedor/API no acreditado como si estuviera activo |
| `EXT-SYS-018` | Instagram / perfiles sociales | `NO_APLICA_SIN_BINDING` | `NO_APLICA` | no crear ledger de mensajes o perfiles sin binding |
| `EXT-SYS-019` | Correo corporativo y alias funcionales | `NO_APLICA_SIN_BINDING` | `NO_APLICA` | no confundir mailbox o alias con integración externa operativa acreditada |
| `EXT-SYS-020` | Telefonía / canal de voz | `BLOQUEADO_SIN_BINDING` | `BLOQUEADO` | bloqueado hasta acreditar operador, interfaz, IDs y semántica |
| `EXT-SYS-021` | Transporte externo | `NO_APLICA_SIN_BINDING` | `NO_APLICA` | no inventar tracking, receipt, courier o delivery audit sin proveedor e interfaz acreditados |

---

#### 42. Reconciliación cuantitativa del universo

La distribución vigente queda:

```text
1 GOBERNADA_POR_OBSERVABILIDAD_INTERNA_VENTO
2 INBOUND_EVENT_AUDIT_AND_PROVIDER_RECONCILIATION
2 OUTBOUND_DELIVERY_AUDIT_AND_RECEIPT_RECONCILIATION
1 BEST_EFFORT_OBSERVABILITY_PROVIDER
1 INTERACTIVE_READ_TECHNICAL_OBSERVABILITY
1 HYBRID_RESOURCE_AND_PUSH_OBSERVABILITY
2 CONFIGURATION_OBSERVABILITY_NO_RUNTIME_EXCHANGE
1 PHYSICAL_EFFECT_AUDIT_AND_MANUAL_RECONCILIATION
1 MODEL_NO_REMOTE_BINDING
1 APLICA_CON_ESPECIALIZACION_POS
7 NO_APLICA_SIN_BINDING
1 BLOQUEADO_SIN_BINDING
= 21
```

Estados:

```text
11 ESPECIFICADO
+ 1 PENDIENTE_DE_EVIDENCIA
+ 8 NO_APLICA
+ 1 BLOQUEADO
= 21
```

Controles:

- identidades esperadas: **21**;
- decisiones materializadas documentalmente: **21 de 21**;
- faltantes: **0**;
- duplicadas: **0**;
- entradas runtime creadas durante esta definición: **0**;
- intentos ejecutados: **0**;
- compensaciones ejecutadas: **0**.

---

#### 43. Wompi y RevenueCat

Para Wompi, la futura instancia aplicable deberá conservar al menos:

1. recepción y `received_at`;
2. referencia a evidencia fuente;
3. autenticidad referenciada;
4. external event/receipt cuando esté acreditado;
5. mapping y idempotency refs aplicables;
6. cada intento y retry;
7. resultado técnico;
8. resultado de pago o business outcome referenciado;
9. incertidumbre explícita;
10. handoff a conciliación sin repetir pago a ciegas.

Para RevenueCat deberá conservar:

1. redelivery y correlación;
2. source evidence por referencia;
3. mapping y aliases solo como referencias acreditadas;
4. idempotency ref;
5. cada intento;
6. mutaciones derivadas por owner;
7. resultado o entitlement referenciado;
8. error y retry;
9. outcome incierto sin segunda suscripción o entitlement;
10. conciliación posterior bajo `INT-DB-008`.

Ningún caso copia por defecto el payload completo a la auditoría.

---

#### 44. Resend y Expo Push Service

Resend:

```text
misma entrega lógica + retry
→ misma identidad
→ nuevo attempt_id
```

Un reenvío empresarial deliberado usa nueva generación conforme al contrato.

El ACK de Resend no prueba lectura por el destinatario.

Expo Push Service:

1. cada destino conserva historia independiente;
2. el intento se audita por destino y generación;
3. un destino confirmado no se repite porque otro falle;
4. `DeviceNotRegistered` u otro resultado técnico no se convierte en identidad de persona;
5. batch, attempt y retry no sustituyen la operación lógica;
6. outcome incierto puede requerir receipt o conciliación antes de repetir.

---

#### 45. Apple Wallet / APNs y Zebra BrowserPrint

Apple Wallet / PassKit y APNs:

1. mutación del pase y push son operaciones distintas;
2. registro de dispositivo, pass resource y push conservan referencias separadas;
3. una correlación común no fusiona sus identidades;
4. cada intento conserva resultado propio;
5. un push ACK no demuestra que la actualización haya sido aplicada por el dispositivo.

Zebra BrowserPrint:

1. envío técnico y efecto físico son distintos;
2. una respuesta perdida no prueba que no haya impresión;
3. timeout conserva incertidumbre;
4. auto-reprint queda bloqueado mientras el contrato exija verificación;
5. reimpresión voluntaria es nueva intención o generación explícita;
6. la auditoría puede registrar verificación manual sin inventar receipt del dispositivo;
7. la conciliación del resultado incierto pertenece a `INT-DB-008`.

---

#### 46. Sentry, Google Maps y plataformas técnicas

Sentry:

- telemetría best-effort no se convierte en fuente empresarial;
- pérdida de telemetría no revierte un hecho confirmado;
- datos sensibles se minimizan;
- una entrada Sentry puede correlacionarse sin sustituir auditoría canónica.

Google Maps / Reviews:

- lecturas interactivas conservan observabilidad técnica mínima cuando sea material;
- `ZERO_RESULTS` válido no es fallo empresarial;
- una respuesta no confiable no crea mapping ni hecho VENTO;
- no se crea un audit ledger masivo de respuestas por defecto.

Expo/EAS y Vercel:

- cambios de configuración o deployment pueden ser auditables por su owner;
- no se inventa intercambio runtime si no existe;
- deployment, project, channel o domain refs no se convierten en IDs empresariales.

---

#### 47. POS externo vigente

`EXT-SYS-013` conserva el estado `PENDIENTE_DE_EVIDENCIA` para el binding remoto y usa las especializaciones POS aprobadas únicamente donde exista evidencia VENTO.

Reglas:

1. `makos_excel`, número de fila, posición, nombre, fecha o hash de archivo no fabrican identidad individual;
2. procesamiento VENTO puede auditar lote, fila, transformación, mapping, idempotencia y efecto cuando esos datos estén acreditados;
3. compensaciones internas de anulaciones o devoluciones conservan vínculo al hecho original y al owner;
4. no se inventan provider receipts, API responses ni attempt IDs remotos;
5. una compensación NEXO, NUMERA o PASS solo actúa sobre efectos propios confirmados;
6. no existe rollback global de venta;
7. conciliación diaria entre fuente y efectos permanece bajo la tarea propietaria y `INT-DB-008` cuando corresponda a la infraestructura común.

---

#### 48. Sistemas sin binding y sistema bloqueado

Para `EXT-SYS-014`, `015`, `016`, `017`, `018`, `019` y `021`:

1. no se crean entradas runtime externas por completitud;
2. no se inventan endpoints, provider IDs, receipts, retry profiles específicos ni outcomes;
3. una futura evidencia de binding se incorpora primero por su contrato propietario;
4. después podrá materializarse la auditoría correspondiente dentro del package aprobado.

`EXT-SYS-020` permanece `BLOQUEADO` hasta acreditar operador, cuenta, interfaz, IDs y semántica.

No se crean filas vacías para simular cobertura.

---

#### 49. Handoff hacia INT-DB-008

`INT-DB-008 — Crear mecanismos de conciliación por integración` conserva ownership de la persistencia y operación de conciliación.

`INT-DB-007` entrega, cuando aplique:

```text
package_id
reconciliation_ref
correlation_id
causation_id
operation_or_resource_refs
source_evidence_id
mapping_reference
idempotency_ref
disposition_case_ref
attempt_refs
audit_entry_refs
external_reference
result_reference
business_outcome_ref
partiality_or_uncertainty_ref
compensation_plan_ref
compensation_execution_refs
residual_obligations
last_known_owner
```

Límites:

1. esta tarea no crea `IntegrationReconciliationCase`;
2. no compara autoritativamente estados interno/externo para decidir ganador;
3. no cierra conciliaciones;
4. puede registrar `RECONCILIATION_DECIDED` únicamente como entrada producida a partir de una decisión de la autoridad de conciliación;
5. una referencia a conciliación no convierte incertidumbre en resultado;
6. la tarea siguiente debe consumir la historia sin reescribirla.

---

#### 50. Migración y backfill de auditoría legacy

No existe un backfill universal autorizado.

Antes de adoptar registros históricos, una futura instancia deberá inventariar:

- audit tables existentes;
- logs técnicos;
- retry stores;
- error tables;
- provider receipts;
- histories de jobs;
- compensation logs;
- exportaciones manuales;
- campos genéricos `error`, `status`, `attempt`, `retry` o equivalentes.

Una entrada histórica solo puede materializarse cuando se pueda reconstruir con evidencia suficiente su identidad, owner, acción, causalidad, tiempo, actor/principal, resultado y referencias críticas.

Si falta evidencia:

1. no se fabrica `audit_entry_id` histórico con significado falso;
2. no se inventa actor;
3. no se inventa `attempt_id`;
4. no se inventa autorización;
5. no se convierte log técnico en auditoría canónica;
6. se conserva la brecha explícita y su owner;
7. se abre handoff a conciliación si la ausencia afecta un outcome material.

---

#### 51. Rollback y forward-fix

La reversión de una futura implementación no puede borrar historia operacional ya observada.

Reglas:

1. DDL defectuoso puede revertirse o corregirse conforme a la política de migraciones;
2. entradas auditadas ya persistidas se preservan o migran;
3. un rollback de código no elimina intentos, resultados ni compensaciones ocurridas;
4. una corrección usa entrada enlazada;
5. cambiar índice no reinterpreta causalidad;
6. un attempt confirmado no se elimina para volver a ejecutarlo;
7. una compensación confirmada no se elimina para simular que el efecto original sigue intacto;
8. un audit gap permanece visible hasta su resolución;
9. un forward-fix conserva lineage;
10. el rollback de infraestructura no cierra una conciliación abierta.

---

#### 52. Certificación física futura

Una futura instancia `INT-DB-007::<package_id>` no podrá declararse materializada únicamente porque exista una tabla de auditoría.

La certificación deberá demostrar, como mínimo:

1. migración canónica y reproducible desde `vento-shell`;
2. persistencia append-only para interfaces y servicios ordinarios;
3. identidad estable de cada `audit_entry_id`;
4. causalidad por referencias y no por timestamps aislados;
5. actor humano, principal técnico y principal de integración separados;
6. evidencia de autorización en acciones sensibles;
7. clases de compromiso de auditoría aplicadas de forma correcta;
8. cada intento con `attempt_id` propio y operación estable;
9. retry conservando idempotency identity;
10. budget y agotamiento auditables sin fabricar éxito;
11. resultado desconocido preservado;
12. emisión, entrega, claim y efecto distinguidos;
13. compensación vinculada a efecto confirmado;
14. pasos compensatorios idempotentes y auditados;
15. compensación parcial con residuales visibles;
16. corrección mediante nueva entrada enlazada;
17. brecha de auditoría explícita sin backfill inventado;
18. payload y secretos minimizados por referencia;
19. acceso sensible autorizado y auditado;
20. aislamiento por package, owner y ambiente;
21. handoff completo a `INT-DB-008`;
22. ausencia de cambios fuera del `package_id` autorizado.

---

#### 53. Requisitos de prueba derivados

**Resultado:** NO GENERA REQUISITOS DE PRUEBA.

**Requisitos creados:** 0

**Requisitos modificados:** 0

**Requisitos diferidos:** 0

**Requisitos obsoletos:** 0

La tarea define documentalmente la persistencia futura de reglas de retry, causalidad, auditoría append-only, autorización, minimización, intentos, outcomes, compensaciones, correcciones y brechas ya protegidas por contratos y requisitos vigentes. No introduce una nueva acción pública, un nuevo perfil de retry, un nuevo outcome, una nueva taxonomía de compensación, un nuevo sistema externo ni una nueva semántica de conciliación. El registro canónico de requisitos permanece sin cambios.

---

#### 54. Cobertura de prueba vigente reutilizada

La cobertura vigente que sustenta esta tarea incluye, sin modificación:

- `TREQ-INTEGRATION-003` — identidad estable, idempotencia, retry, resultado recuperable y recuperación controlada;
- `TREQ-INTEGRATION-004` — reconstrucción de causa, principal, intento, resultado, error y efecto final;
- `TREQ-INTEGRATION-160` — agotamiento de retry con salida explícita y sin trabajo silenciosamente pendiente;
- `TREQ-INTEGRATION-161` — agotamiento no ejecuta compensación automáticamente;
- `TREQ-INTEGRATION-162` — revalidación de autoridad antes de intentos sensibles;
- `TREQ-INTEGRATION-163` — trazabilidad segura de retry sin copiar material sensible;
- `TREQ-INTEGRATION-168` — compensación solo sobre efecto confirmado;
- `TREQ-INTEGRATION-172` — plan de compensación versionado y no destructivo;
- `TREQ-INTEGRATION-173` — causalidad explícita entre compensación y efecto original;
- `TREQ-INTEGRATION-174` — cada owner ejecuta únicamente sus efectos compensatorios;
- `TREQ-INTEGRATION-175` — dependencias explícitas entre pasos compensatorios;
- `TREQ-INTEGRATION-177` — idempotencia por paso compensatorio;
- `TREQ-INTEGRATION-179` — outcome de compensación verificable sin falso cierre;
- `TREQ-INTEGRATION-180` — compensación parcial conserva residuales y puede requerir conciliación;
- `TREQ-INTEGRATION-183` — segregación de solicitud, aprobación, ejecución, verificación y cierre;
- `TREQ-INTEGRATION-184` — reautorización por paso compensatorio;
- `TREQ-INTEGRATION-201` — atribución de actor, principal y contexto;
- `TREQ-INTEGRATION-202` — auditoría de autorización y denegación;
- `TREQ-INTEGRATION-203` — línea temporal de comando sin confundir aceptación con commit;
- `TREQ-INTEGRATION-204` — ancla auditada del commit propietario;
- `TREQ-INTEGRATION-205` — auditoría de evento registrado con causalidad y versión;
- `TREQ-INTEGRATION-206` — auditoría por intento de emisión;
- `TREQ-INTEGRATION-207` — auditoría de entrega independiente por consumidora;
- `TREQ-INTEGRATION-208` — auditoría de claim, deduplicación y resultado previo;
- `TREQ-INTEGRATION-209` — auditoría del efecto consumidor;
- `TREQ-INTEGRATION-210` — intento, perfil, demora, próxima ejecución, outcome y budget de retry;
- `TREQ-INTEGRATION-216` — causalidad transversal mediante IDs y versiones, no timestamps;
- `TREQ-INTEGRATION-217` — append-only y corrección enlazada;
- `TREQ-INTEGRATION-218` — minimización y exclusión de secretos;
- `TREQ-INTEGRATION-219` — autorización y auditoría del acceso a auditoría sensible;
- `TREQ-INTEGRATION-220` — políticas de compromiso ante fallo de auditoría;
- `TREQ-INTEGRATION-221` — brechas explícitas sin historia retroactiva inventada;
- `TREQ-INTEGRATION-222` — semántica temporal diferenciada;
- `TREQ-INTEGRATION-223` — separación entre hecho, evento, auditoría, evidencia, log, métrica y trace;
- `TREQ-INTEGRATION-224` — sensibilidad, acceso, retención y legal hold.

Estas referencias son trazabilidad de cobertura existente y no representan cambios al registro.

---

#### 55. Evidencia de validación

| Clase | Estado | Evidencia |
| --- | --- | --- |
| BUILD | NOT_EXECUTED | La batería npm del checkout completo deberá ejecutarse después de incorporar el artefacto al owner documental vigente. |
| LOCAL | PASS | El artefacto fue comprobado estructuralmente para título, metadata compacta, secciones obligatorias, continuidad, cero requisitos en la sección de cambios, cinco clases de evidencia, matriz externa 21/21, distribución reconciliada, taxonomía de 22 acciones, tres clases de compromiso, topología `TEMPLATE_PER_PACKAGE`, gate `POST_E5_PACKAGE`, ausencia de placeholders y alcance documental sin materialización física. |
| REMOTA | PASS | Se verificaron el cierre fusionado de `INT-DB-006`, la continuidad vigente con `INT-DB-007` como tarea actual, el owner, topología, contrato de entrega, políticas, `INT-APP-005..009`, `INT-EXT-017`, `SHELL-CON-019/022/023/024`, especializaciones POS, 04A de integración, `package.json`, lifecycle documental y ausencia de rama remota `task/int-db-007` al corte. |
| OPERATIVA | NOT_EXECUTED | No se ejecutaron webhooks, retries, deliveries, provider calls, impresiones, pushes, pagos, compensaciones ni conciliaciones reales; esas pruebas pertenecen a futuras instancias por paquete. |
| FÍSICA | NOT_APPLICABLE | La definición documental autoriza cero cambios físicos y no crea instancia `GLOBAL`; la materialización futura pertenece a `INT-DB-007::<package_id>` después de E5. |

---

#### 56. Criterios de aceptación

`INT-DB-007` queda documentalmente completa cuando se demuestre que:

1. existe una sola definición reutilizable de auditoría operacional;
2. la topología es `TEMPLATE_PER_PACKAGE` y el gate es `POST_E5_PACKAGE`;
3. ninguna instancia `GLOBAL` de `INT-DB-007` es creada o implícita;
4. auditoría, log, trace, métrica, evidencia, hecho empresarial, disposición y conciliación permanecen separados;
5. `audit_entry_id` identifica una entrada append-only y no deriva de contenido sensible;
6. el envelope canónico de `INT-APP-007` puede persistirse sin pérdida semántica;
7. se preservan las 22 acciones canónicas;
8. se preservan las tres clases de compromiso de auditoría;
9. causalidad se resuelve por referencias e IDs, no por timestamps aislados;
10. `occurred_at`, `received_at`, `recorded_at` y `completed_at` permanecen distintos;
11. actor humano, principal técnico y principal de integración permanecen separados;
12. autorización sensible queda auditada aunque la decisión sea deny;
13. aceptación de comando no equivale a commit;
14. emisión confirmada no equivale a entrega;
15. entrega ACK no equivale a efecto;
16. cada intento tiene `attempt_id` propio sin cambiar la identidad empresarial;
17. cada retry conserva idempotency identity y contenido compatible;
18. agotamiento de retry no fabrica éxito ni compensación;
19. resultado desconocido se conserva sin retry ciego;
20. `INT-DB-006` entrega referencias y esta tarea materializa su detalle operacional;
21. un plan de compensación no se confunde con ejecución;
22. cada paso compensatorio conserva efecto original, autorización, idempotencia, resultado y evidencia;
23. compensación parcial no se presenta como reversión completa;
24. una corrección crea nueva entrada enlazada;
25. una brecha de auditoría no se rellena con datos inferidos;
26. payloads y secretos se minimizan por referencia;
27. acceso sensible a la auditoría requiere autoridad aplicable y deja evidencia;
28. retención y legal hold no crean TTL universal;
29. la matriz conserva 21 de 21 identidades sin faltantes ni duplicados;
30. la distribución vigente es `1+2+2+1+1+1+2+1+1+1+7+1`;
31. los estados son `11 ESPECIFICADO + 1 PENDIENTE_DE_EVIDENCIA + 8 NO_APLICA + 1 BLOQUEADO`;
32. POS no inventa provider receipts ni IDs remotos;
33. Telefonía / voz permanece bloqueada sin binding;
34. sistemas sin binding no reciben auditoría runtime ficticia;
35. conciliación permanece bajo `INT-DB-008`;
36. la sección de requisitos derivados declara cero cambios y no contiene identificadores de requisito;
37. la cobertura vigente queda trazada fuera de esa sección;
38. ninguna modificación Supabase es ejecutada durante esta tarea documental.

---

#### 57. Decisiones vinculantes

Quedan vinculantes para cualquier futura materialización de `INT-DB-007::<package_id>`:

- la auditoría es append-only;
- una corrección se enlaza y no sobrescribe;
- `audit_entry_id`, operación, intento, delivery, efecto y compensación son identidades distintas;
- cada retry conserva la identidad lógica y obtiene un intento técnico propio;
- agotamiento no determina automáticamente éxito, fracaso empresarial ni compensación;
- resultados inciertos no se repiten a ciegas;
- un ACK técnico no confirma un efecto empresarial;
- actor humano y principales técnicos permanecen separados;
- autorización sensible se audita con versión y decisión;
- el payload fuente se referencia antes de duplicarse;
- secretos y material reutilizable de autenticación quedan excluidos;
- un plan de compensación no equivale a compensación ejecutada;
- cada paso compensatorio es auditable e idempotente dentro de su scope;
- la compensación actúa solo sobre efectos confirmados;
- una compensación parcial conserva residuales y owner;
- un audit gap es explícito y no se rellena con historia fabricada;
- las 21 identidades externas conservan su disposición vigente;
- POS permanece limitado a evidencia acreditada;
- no se fabrica runtime para sistemas sin binding;
- conciliación pertenece a `INT-DB-008`;
- toda materialización pertenece a un `package_id` aprobado después de E5.

---

#### 58. Límites

Esta tarea no:

- ejecuta DDL, DML, migraciones, RLS, RPC ni cambios remotos;
- crea tablas, filas, índices, constraints, queues, workers, schedulers o cron físicos;
- ejecuta requests, webhooks, deliveries, retries o provider calls;
- crea operation keys ni claims idempotentes;
- crea o modifica payloads fuente;
- crea mappings;
- crea casos de cuarentena o dead-letter;
- cambia la taxonomía de `SHELL-CON-024`;
- ejecuta compensaciones;
- cambia planes de compensación propietarios;
- materializa `IntegrationReconciliationCase`;
- decide outcomes de conciliación;
- corrige estados empresariales de otros owners;
- crea ni rota credenciales;
- acredita bindings ausentes;
- inventa receipts, provider IDs o campos del POS externo;
- crea auditoría runtime para sistemas sin binding;
- modifica el registro 04A;
- inicia `INT-DB-008`.

---

#### 59. Continuidad

**ÚLTIMA TAREA APROBADA**
`INT-DB-006 — Crear cuarentena y registro de errores no procesables`

**TAREA ACTUAL APROBADA**
`INT-DB-007 — Crear auditoría de procesamiento, reintentos y compensaciones`

**SIGUIENTE TAREA RESERVADA**
`INT-DB-008 — Crear mecanismos de conciliación por integración`


### [ ] INT-DB-008 — Crear mecanismos de conciliación por integración

Orden obligatorio de cada paquete de dominio

1. Confirmar objeto, dominio, propietario y consumidores.
2. Crear estructura objetivo.
3. Crear compatibilidad temporal.
4. Ejecutar dry-run de normalización cuando corresponda.
5. Identificar colisiones y posibles duplicados.
6. Aprobar tratamiento de colisiones.
7. Ejecutar backfill.
8. Reconciliar datos.
9. Adaptar escrituras.
10. Adaptar lecturas.
11. Aplicar normalización en límites del dominio.
12. Aplicar constraints.
13. Aplicar RLS y grants.
14. Generar tipos.
15. Actualizar contratos y wrappers.
16. Adaptar consumidores.
17. Ejecutar pruebas.
18. Verificar drift.
19. Verificar rendimiento.
20. Confirmar rollback.
21. Aprobar adopción del paquete.

AUTH-DB-011 no podrá ejecutarse antes del backfill y la reconciliación
del paquete correspondiente.

AUTH-DB-026 no será una acción única al final del proyecto.

Los tipos deberán regenerarse después de cada cambio contractual de:

- esquemas;
- tablas;
- vistas;
- funciones;
- RPC;
- enums;
- contratos expuestos.
