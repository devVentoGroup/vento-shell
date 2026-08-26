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


### [ ] INT-DB-005 — Crear restricciones e índices de idempotencia
### [ ] INT-DB-006 — Crear cuarentena y registro de errores no procesables
### [ ] INT-DB-007 — Crear auditoría de procesamiento, reintentos y compensaciones
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
