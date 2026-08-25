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
