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


### [ ] INT-DB-002 — Crear referencias de credenciales sin almacenar secretos en tablas expuestas
### [ ] INT-DB-003 — Crear staging inmutable de payloads externos
### [ ] INT-DB-004 — Crear mapeos de identificadores externos y canónicos
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
