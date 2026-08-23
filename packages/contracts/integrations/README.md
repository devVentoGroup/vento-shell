# Integration contracts

Materialización estática interna de la superficie lógica `@vento/contracts/integrations`.

## Autoridad semántica

- `INT-EXT-002` conserva la definición propietaria de `IntegrationPrincipal`.
- `SHELL-CON-017::GLOBAL` materializa `IntegrationPrincipalId`, `IntegrationPrincipal` e `IntegrationPrincipalRef`.
- `INT-EXT-003..008` conservan procedencia, mecanismo, alcance mínimo, ambiente, custodia y lifecycle de credenciales.
- `SHELL-CON-018::GLOBAL` materializa `ExternalCredentialId` + `ExternalCredentialRef` sin transportar el secreto.
- `INT-EXT-009..017` conservan contrato de entrada, transporte, autenticidad, idempotencia, mapping, evidencia, resiliencia, auditoría y conciliación de integraciones externas.
- `SHELL-CON-019::GLOBAL` materializa `ExternalReceivedEvent<TNormalizedAssertion>` antes de cualquier efecto empresarial.
- `INT-DB-001` conserva el registro físico posterior de sistemas, bindings y principales.
- `INT-DB-002` conserva la persistencia física posterior de referencias de credenciales sin secretos.
- `INT-POS-005` e `INT-SALES-001` conservan la semántica empresarial de venta individual y registro durable.
- `SHELL-CON-020::GLOBAL` materializa `CanonicalSaleId` y `CanonicalSale<TSaleLine>`.
- `INT-POS-005..013` e `INT-SALES-001` conservan la semántica propietaria de identidad, revisión, cantidad, snapshots, mapping y efectos de línea.
- `SHELL-CON-021::GLOBAL` materializa `CanonicalSaleLineId` y `CanonicalSaleLine` y concreta la composición `CanonicalSale<CanonicalSaleLine>` sin redefinir `CanonicalSale`.
- `INT-EXT-013` conserva la semántica propietaria del mapping externo; `INT-POS-010`, `INT-POS-011` e `INT-POS-013` conservan sus especializaciones posteriores.
- `SHELL-CON-022::GLOBAL` materializa `ExternalIdentifierMappingId`, `ExternalIdentifierRef`, `ExternalIdentifierMapping` y `ExternalIdentifierMappingRef` como forma estática compartida de mapping.
- `INT-DB-004` conserva la persistencia física posterior de mappings externos/canónicos.
- `INT-APP-004..010`, `INT-EXT-012`, `INT-EXT-017`, `INT-POS-013`, `INT-POS-020`, `INT-SALES-007` e `INT-SALES-008` conservan la semántica propietaria de idempotencia, retry, incertidumbre y conciliación.
- `SHELL-CON-023::GLOBAL` materializa la forma estática compartida de idempotencia y conciliación.
- `INT-DB-005`, `INT-DB-008` e `INT-DB-007` conservan respectivamente persistencia física de idempotencia, conciliación y auditoría de procesamiento.
- `SHELL-CON-024` conserva en exclusiva la disposición compartida de rechazo/cuarentena/compensación.

## Principal técnico de integración

`IntegrationPrincipalId` permanece estable, opaco, no secreto y sin formato serial físico definido. Está separado de actor humano, `PermissionKey`, cuenta de proveedor, credencial, secreto, endpoint, dispositivo, `external_system_id` y `AppCode`.

La cobertura heredada de `INT-EXT-002` conserva 21 decisiones `ESPECIFICADO`, 11 `PENDIENTE_DE_EVIDENCIA`, 10 `NO_APLICA` y 0 valores físicos de `IntegrationPrincipalId`.

Source contract SHA-256 `SHELL-CON-017`: `c4ca8bdc55f98113d235107f99355ef6a69dbb59a7f0853a6e087c8fcad14839`.

## Referencia de credencial externa

`ExternalCredentialId` identifica una referencia gobernada, nunca su valor. `ExternalCredentialRef` conserva metadata no sensible y no contiene ni resuelve API keys, tokens, passwords, private keys, secretos, material criptográfico recuperable ni instrucciones runtime de recuperación.

La cobertura de `SHELL-CON-018` conserva 9 `PENDIENTE_DE_EVIDENCIA`, 2 `NO_APLICA`, 10 `NO_APLICA_ACTUAL`, 0 valores físicos de `ExternalCredentialId`, 0 referencias persistidas y 0 secretos creados, copiados, revelados o movidos. `INT-EXT-003..008` e `INT-DB-002` conservan su autoridad.

Source contract SHA-256 `SHELL-CON-018`: `b22094113048ee52d8ea8abe961af7fcb8be2b1924eabe69d0eb048d928bbb69`.

## Evento externo recibido

`ExternalReceivedEvent<TNormalizedAssertion>` conserva identidad de sistema, referencias técnicas, ambiente, versiones, contrato de entrada, transporte, `external_event_id`, `receipt_id`, temporalidad, autenticidad referenciada, evidencia protegida, huella, afirmación normalizada y referencias de mapping, idempotencia, correlación y propietario.

Una afirmación externa no es un hecho empresarial; receipt, ACK, callback, webhook o `2xx` no confirman el efecto; el payload original no viaja por defecto y autenticidad técnica no equivale a corrección empresarial.

La matriz de `SHELL-CON-019` conserva 21 decisiones: 2 `APLICA_EVENTO_INBOUND_ACREDITADO` para Wompi y RevenueCat y 19 sin evento externo recibido acreditado. Estados físicos: 2 `DEFINIDO_NO_MATERIALIZADO`, 9 `NO_APLICA`, 8 `NO_APLICA_ACTUAL` y 2 `BLOQUEADO`.

Source contract SHA-256 `SHELL-CON-019`: `0faeb8d65edcf9b5806c6c962aefb76ab9cfd13e434d43cb549d559cd5cbaed1`.

## Venta canónica

`SHELL-CON-020::GLOBAL` materializa `CanonicalSaleId` y `CanonicalSale<TSaleLine>` dentro de `@vento/contracts/integrations`.

La forma conserva exactamente 22 campos de nivel superior y 6 componentes del `monetary_snapshot`. Una venta completa exige al menos una línea mediante `readonly [TSaleLine, ...TSaleLine[]]`.

La fuente empresarial se conserva: una venta histórica Makos permanece Makos en `source_system`; PULSO solo es fuente bajo autoridad aprobada. `source_sale_id`, `source_revision`, `CanonicalSaleId`, `occurred_at` y `recorded_at` permanecen conceptos separados. `INT-POS-005` e `INT-SALES-001` conservan la semántica propietaria.

La venta canónica permanece distinta de pedido, pago, caja, documento fiscal, inventario, fidelización, hecho económico, entrega, evento de integración y payload de proveedor.

Esta materialización crea 0 ventas operativas, 0 persistencia, 0 eventos empresariales emitidos, 0 consumidores migrados, 0 efectos downstream, 0 secretos y 0 cambios Supabase.

Source contract SHA-256 `SHELL-CON-020`: `5495541814c4bf5387462d98e638c9f25dbd128dc94706e7bbba7317a7f75182`.

## Línea de venta canónica

`SHELL-CON-021::GLOBAL` materializa `CanonicalSaleLineId` y `CanonicalSaleLine` dentro de `@vento/contracts/integrations`. `sale_id` reutiliza `CanonicalSaleId`, por lo que cada línea pertenece inequívocamente a una venta sin fusionar las dos identidades.

`CanonicalSaleLine` conserva exactamente 20 campos de nivel superior y exactamente 7 componentes del `monetary_snapshot`. La composición física común queda `CanonicalSale<CanonicalSaleLine>`.

La línea conserva `sale_line_id`, `sale_id`, `source_line_id`, `source_line_sequence`, `source_line_revision`, `sold_item_ref`, `product_ref`, `presentation_ref`, `recipe_ref`, `mapping_refs`, `quantity`, `unit_ref`, `source_line_state`, `canonical_line_state`, `line_state_mapping_result`, `line_occurred_at`, procedencia y correlación. Los componentes monetarios incluyen `currency_ref`, `applied_unit_price`, `line_subtotal`, `discount_total`, `tax_total`, `tip_total` y `line_total`.

`CanonicalSaleLineId` es estable, opaco y no secreto. `ACTIVE` y `CANCELLED` solo aplican con equivalencia semántica acreditada. `MAPPED`, `NOT_PROVIDED` y `UNRESOLVED` conservan la semántica aprobada sin crear un enum físico ejecutable.

El flujo agregado `makos_excel` no se eleva a línea individual sin granularidad e identidad suficientes. Una fila agregada, número de fila, producto + fecha + sede o hash de archivo no sustituyen `CanonicalSaleLineId`.

Esta instancia crea 0 valores físicos de `CanonicalSaleLineId`, 0 líneas operativas, 0 persistencia, 0 mappings runtime, 0 cuarentenas runtime, 0 consumidores migrados, 0 efectos downstream, 0 secretos y 0 cambios Supabase.

Source contract SHA-256 `SHELL-CON-021`: `f4ac39874bfa4864973cdf52f63c2519f03cdbf1519afca93a1cb6dcc6fdf802`.

## Mapeo de identificadores externos

`SHELL-CON-022::GLOBAL` materializa la forma compartida estática de mapping definida por `INT-EXT-013` y reconciliada con `INT-POS-010`, `INT-POS-011` e `INT-POS-013`, sin resolver mappings runtime ni crear persistencia.

La superficie contiene:

- `ExternalIdentifierMappingId`: identidad estable, opaca y no secreta de la relación de mapping;
- `ExternalIdentifierRef`: referencia tipada con 7 campos de `ExternalIdentifierRef`: `external_system_id`, ambiente, superficie, namespace, clase, kind y valor;
- `ExternalIdentifierMapping`: relación trazable con exactamente 14 campos de nivel superior;
- `ExternalIdentifierMappingRef`: referencia mínima e inmutable de 2 campos de `ExternalIdentifierMappingRef`: `mapping_id` y `contract_version`;
- `ExternalIdentifierClass`: exactamente 10 clases;
- `ExternalIdentifierRelationKind`: exactamente 7 relaciones;
- `ExternalIdentifierMappingState`: exactamente 8 estados.

Las 10 clases preservadas son `EXTERNAL_OBJECT_ID`, `CANONICAL_VENTO_ID`, `PROPAGATED_CANONICAL_ID`, `EXTERNAL_ROUTING_REF`, `IDEMPOTENCY_REF`, `CORRELATION_REF`, `DISPLAY_SEARCH_ATTRIBUTE`, `TECHNICAL_NAMESPACE_ID`, `EXTERNAL_ALIAS` y `MAPPING_RECORD`.

Las 7 relaciones preservadas son `EXTERNAL_TO_CANONICAL`, `CANONICAL_PROPAGATED_EXTERNAL`, `EXTERNAL_ROUTE_TO_OWNER`, `EXTERNAL_EVENT_TO_RECEIPT`, `EXTERNAL_NAMESPACE_BINDING`, `CORRELATION_ONLY` y `NO_EQUIVALENCE`.

Los 8 estados preservados son `RESOLVED`, `PARTIALLY_RESOLVED`, `UNRESOLVED`, `AMBIGUOUS`, `CONFLICT`, `RETIRED`, `NOT_APPLICABLE` y `BLOCKED`. Los estados propietarios de `INT-POS-011` continúan siendo autoridad de su especialización y se proyectan sin pérdida mediante `resolution_detail`.

El namespace mínimo conserva sistema, ambiente, superficie, namespace externo y kind. Coincidencia de UUID, correo, teléfono, nombre, dirección, coordenadas, alias, producto, fila, `source_row_number`, hash o timestamp no prueba identidad ni mapping exacto.

`ExternalReceivedEvent.mapping_refs[]` y `CanonicalSaleLine.mapping_refs[]` conservan físicamente sus referencias genéricas ya verificadas. Esta instancia materializa `ExternalIdentifierMappingRef` como tipo objetivo para adopción posterior, pero no modifica esos contratos históricos ni migra consumidores.

Mapping permanece separado de autenticidad, autorización, propiedad empresarial, correlación e idempotencia. `mapping_id` no es idempotency key y `SHELL-CON-023` conserva esa responsabilidad. `SHELL-CON-024` conserva la disposición compartida de rechazo, cuarentena y compensación.

La adopción estática conserva exactamente `EXT-SYS-001..021`: 21/21 identidades adoptadas, faltantes 0 y duplicados 0. Entre los casos explícitos permanecen Wompi, RevenueCat, Expo Push Service, Google `place_id`, Apple Wallet / PassKit, Zebra BrowserPrint y POS externo. `makos_excel` no adquiere granularidad individual. Telefonía / voz (`EXT-SYS-020`) permanece bloqueada hasta evidencia de `TI-INT-003`.

`INT-DB-004` conserva en exclusiva la futura persistencia física. Esta instancia crea 0 valores físicos de `ExternalIdentifierMappingId`, 0 mappings operativos, 0 tablas, 0 índices, 0 RPC, 0 migraciones, 0 consumidores migrados y 0 cambios Supabase.

Source contract SHA-256 `SHELL-CON-022`: `89fbd1be5e68ec81239097376a1656eb4722ad6f38f55b1b76bb1f3dd469f474`.

## Idempotencia y conciliación compartidas

`SHELL-CON-023::GLOBAL` materializa el contrato estático compartido de idempotencia y conciliación dentro de `@vento/contracts/integrations`, sin ejecutar claims, retries, conciliaciones ni efectos runtime.

La superficie contiene `IntegrationIdempotencyScope`, `IntegrationIdempotencyRef`, `IntegrationIdempotencyRecord`, `ExternalIntegrationClaimState`, `IntegrationIdempotencyOutcome`, `IntegrationReconciliationRef`, `IntegrationReconciliationCase` e `IntegrationReconciliationClosureOutcome`.

`IntegrationIdempotencyScope` conserva exactamente 7 alcances: `REQUEST_ACCEPTANCE`, `OWNER_COMMAND`, `EVENT_EMISSION`, `CONSUMER_INBOX`, `CONSUMER_EFFECT`, `EXTERNAL_RECEIPT` y `REPLAY_BATCH`. No existe una clave idempotente global de Vento OS ni de una venta.

`IntegrationIdempotencyRef` conserva exactamente 6 campos de `IntegrationIdempotencyRef`: `scope`, `scope_owner_ref`, `namespace_ref`, `operation_key`, `generation` y `contract_version`. `operation_key` se fija antes del primer efecto, no es secreto y no cambia por retry, redelivery, restart, worker, dispositivo, deployment o transporte.

`IntegrationIdempotencyRecord` conserva exactamente 21 campos de nivel superior para identidad, huella lógica versionada, claim, outcome, resultado recuperable, contexto externo condicional, temporalidad, correlación, auditoría y conciliación. `attempt_count` no cambia la identidad y no se fija aquí una representación escalar arbitraria.

`ExternalIntegrationClaimState` conserva exactamente 7 estados de claim: `CLAIMED`, `SUCCEEDED`, `FAILED_RETRYABLE`, `FAILED_FINAL`, `OUTCOME_UNKNOWN`, `CANCELLED` y `EXPIRED`. `OUTCOME_UNKNOWN` permanece distinto de `RESULT_UNKNOWN`.

`IntegrationIdempotencyOutcome` conserva exactamente 8 outcomes idempotentes: `APPLIED`, `DUPLICATE_RESULT_RETURNED`, `CONFLICTING_REUSE`, `IN_PROGRESS_RECOVERABLE`, `STALE_VERSION`, `OUT_OF_ORDER_DEFERRED`, `RECONCILIATION_REQUIRED` y `REJECTED`. Un duplicado compatible recupera el resultado previo con cero nueva mutación; una huella incompatible produce conflicto y `RECONCILIATION_REQUIRED` no autoriza repetición ciega.

`IntegrationReconciliationRef` es una identidad estable, opaca y no secreta independiente de idempotency key, event ID, receipt ID, mapping ID, sale ID y effect ID. `IntegrationReconciliationCase` conserva exactamente 23 campos de nivel superior para fuentes comparadas, evidencia, diferencias, decisión, residuales, siguiente acción, responsable y cierre.

`IntegrationReconciliationClosureOutcome` conserva exactamente 8 cierres de conciliación: `RESOLVED_CONFIRMED`, `RESOLVED_NO_EFFECT`, `RESOLVED_DUPLICATE_PRIOR_RESULT`, `RESOLVED_CORRECTED`, `RESOLVED_COMPENSATED`, `RESOLVED_WITH_ACCEPTED_RESIDUAL`, `PERMANENTLY_REJECTED` y `SUPERSEDED_BY_SUCCESSOR`. No existe un cierre `UNKNOWN` y el paso del tiempo no cierra incertidumbre.

`ExternalReceivedEvent.idempotency_ref` permanece físicamente como referencia genérica ya verificada; `IntegrationIdempotencyRef` queda como tipo objetivo para adopción posterior sin modificar `ExternalReceivedEvent`. Mapping, idempotencia, correlación y conciliación permanecen contratos distintos.

`CanonicalSaleId` y `CanonicalSaleLineId` no son claves universales de efectos downstream. Cada consumidora conserva inbox independiente y cada efecto su identidad propietaria; recuperar un efecto pendiente no reemite la venta ni reaplica efectos confirmados.

La especialización POS conserva `SOURCE_SYSTEM_SCOPE`, `EXTERNAL_SALE_SCOPE` y `EXTERNAL_SALE_LINE_SCOPE`. `source_row_number`, file hash, fecha, sede, total, producto o posición no fabrican identidad. `makos_excel` continúa sin acreditar idempotencia individual de venta o línea.

La matriz estática conserva `EXT-SYS-001..021` con adopción 21/21, faltantes 0, duplicados 0 y distribución exacta `1 + 6 + 2 + 2 + 1 + 1 + 7 + 1 = 21`. Wompi, RevenueCat, Resend, Expo Push, PassKit/APNs y Zebra aplican idempotencia/conciliación según su contrato; POS externo permanece `PENDIENTE_DE_EVIDENCIA` para identidad individual y telefonía/voz permanece bloqueada hasta `TI-INT-003`.

`INT-DB-005`, `INT-DB-008` e `INT-DB-007` conservan la materialización física posterior. Esta instancia crea 0 registros idempotentes operativos, 0 casos de conciliación operativos, 0 claims runtime, 0 retries runtime, 0 tablas, 0 índices, 0 RPC, 0 migraciones, 0 consumidores migrados y 0 cambios Supabase.

Source contract SHA-256 `SHELL-CON-023`: `d6630e1e3280845765308579eb06302ce1b476da96475de675a1667e06ee68f0`.

## Límite físico

Las siete instancias `SHELL-CON-017::GLOBAL` a `SHELL-CON-023::GLOBAL` son fundaciones estáticas `PRE_E5_FOUNDATION` con modalidad `GLOBAL_ENABLE_ONCE`.

Esta materialización no publica el subpath, no modifica `packages/contracts/package.json`, no añade `exports`, no cambia la versión de `@vento/contracts`, no extiende `generated/index.ts`, no adopta consumidores, no ejecuta integraciones, no crea mappings, claims, retries o conciliaciones runtime, no persiste datos, no crea tablas, migraciones, RLS, RPC o cambios Supabase y no modifica 04A/TREQ.

## Archivos generados

- `scripts/generate-integration-principal-contracts.mjs` mantiene los contratos de `SHELL-CON-017..019` y `generated/index.ts`.
- `scripts/validate-integration-principal-contracts.mjs` valida esa fundación.
- `scripts/generate-canonical-sale-contract.mjs` mantiene `generated/canonical-sale.contract.ts` para `SHELL-CON-020`.
- `scripts/validate-canonical-sale-contract.mjs` valida venta canónica y sus fronteras.
- `scripts/generate-canonical-sale-line-contract.mjs` mantiene `generated/canonical-sale-line.contract.ts` para `SHELL-CON-021`.
- `scripts/validate-canonical-sale-line-contract.mjs` valida frescura, forma exacta de 20 campos, 7 componentes monetarios, dependencia con `CanonicalSaleId`, fronteras de mapping/estado/agregados, seguridad, package, índice interno y READMEs.
- `scripts/generate-external-identifier-mapping-contract.mjs` mantiene `generated/external-identifier-mapping.contract.ts` para `SHELL-CON-022`.
- `scripts/validate-external-identifier-mapping-contract.mjs` valida frescura, vocabularios 10/7/8, formas 7/14/2, cobertura 21/21, fronteras con 019/021, package, índice interno, READMEs, runtime y secretos.
- `scripts/generate-integration-idempotency-reconciliation-contract.mjs` mantiene `generated/integration-idempotency-reconciliation.contract.ts` para `SHELL-CON-023`.
- `scripts/validate-integration-idempotency-reconciliation-contract.mjs` valida vocabularios 7/7/8/8, formas 6/21/23, cobertura 21/21, fronteras con 019/022, package, índice interno, READMEs, runtime y secretos.
