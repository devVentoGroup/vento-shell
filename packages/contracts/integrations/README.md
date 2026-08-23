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
- `SHELL-CON-022`, `SHELL-CON-023` y `SHELL-CON-024` conservan respectivamente mapping compartido, idempotencia/conciliación y disposición de rechazo/cuarentena/compensación.

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

`CanonicalSaleLine` conserva exactamente 20 campos de nivel superior:

- `sale_line_id`, `sale_id` y `contract_version`;
- `source_line_id`, `source_line_sequence` y `source_line_revision`;
- `sold_item_ref`;
- `product_ref`, `presentation_ref`, `recipe_ref` y `mapping_refs`;
- `quantity` y `unit_ref`;
- `monetary_snapshot`;
- `source_line_state`, `canonical_line_state`, `line_state_mapping_result` y `line_occurred_at`;
- `provenance_refs` y `correlation_refs`.

El `monetary_snapshot` conserva exactamente 7 componentes del `monetary_snapshot`: `currency_ref`, `applied_unit_price`, `line_subtotal`, `discount_total`, `tax_total`, `tip_total` y `line_total`. Cantidad y valores monetarios no inventan tipo escalar, precisión decimal ni redondeo físico.

La identidad de línea permanece estable frente a revisión, retry, replay, sincronización tardía, resolución de mapping, entrada o liberación de cuarentena y cambios de estado. `source_line_id` se preserva cuando exista y sea estable; `source_line_sequence` no es identidad universal; `source_line_revision` no se fabrica.

`sold_item_ref` preserva el ítem realmente vendido antes de mapping. `product_ref` debe estar resuelto antes de efectos dependientes de producto; `presentation_ref` y `recipe_ref` son condicionales. `mapping_refs` solo referencia decisiones propietarias y no adelanta `SHELL-CON-022`.

`quantity` es la cantidad comercial; no se convierte automáticamente en cantidad de inventario y un valor negativo no significa por sí solo devolución o compensación. `unit_ref` se exige cuando la magnitud no sea autosuficiente.

Estado de línea, estado de venta, estado de mapping, cuarentena e inventario permanecen separados. `ACTIVE` y `CANCELLED` solo aplican con equivalencia semántica acreditada. `line_state_mapping_result` conserva la distinción semántica `MAPPED`, `NOT_PROVIDED` y `UNRESOLVED` sin crear un enum físico ejecutable.

`line_occurred_at` es condicional y no se fabrica desde importación, recepción, replay, sincronización ni desde `CanonicalSale.occurred_at` por defecto.

Una línea estructural puede conservarse con mapping pendiente, pero no queda elegible para un efecto dependiente de producto mientras falten resoluciones obligatorias o exista cuarentena activa. Elegibilidad no equivale a ejecución.

El flujo agregado `makos_excel` no satisface por sí solo una línea individual: fila agregada, número de fila, producto + fecha + sede o hash de archivo no se elevan a `CanonicalSaleLineId`.

La composición física común queda `CanonicalSale<CanonicalSaleLine>` sin añadir un alias público ni modificar el contrato de venta. `SHELL-CON-022`, `SHELL-CON-023` y `SHELL-CON-024` permanecen propietarios de mapping, idempotencia/conciliación y disposición de rechazo/cuarentena/compensación.

Esta instancia crea 0 valores físicos de `CanonicalSaleLineId`, 0 líneas operativas, 0 persistencia, 0 mappings runtime, 0 cuarentenas runtime, 0 consumidores migrados, 0 efectos downstream, 0 secretos y 0 cambios Supabase.

Source contract SHA-256 `SHELL-CON-021`: `f4ac39874bfa4864973cdf52f63c2519f03cdbf1519afca93a1cb6dcc6fdf802`.

## Límite físico

Las cinco instancias `SHELL-CON-017::GLOBAL` a `SHELL-CON-021::GLOBAL` son fundaciones estáticas `PRE_E5_FOUNDATION` con modalidad `GLOBAL_ENABLE_ONCE`.

Esta materialización no publica el subpath, no modifica `packages/contracts/package.json`, no añade `exports`, no cambia la versión de `@vento/contracts`, no adopta consumidores, no ejecuta integraciones, no crea ventas o líneas operativas, no persiste datos, no emite eventos, no ejecuta efectos NEXO/NUMERA/PASS, no crea tablas, migraciones, RLS, RPC o cambios Supabase y no modifica 04A/TREQ.

## Archivos generados

- `scripts/generate-integration-principal-contracts.mjs` mantiene los contratos de `SHELL-CON-017..019` y `generated/index.ts`.
- `scripts/validate-integration-principal-contracts.mjs` valida esa fundación.
- `scripts/generate-canonical-sale-contract.mjs` mantiene `generated/canonical-sale.contract.ts` para `SHELL-CON-020`.
- `scripts/validate-canonical-sale-contract.mjs` valida venta canónica y sus fronteras.
- `scripts/generate-canonical-sale-line-contract.mjs` mantiene `generated/canonical-sale-line.contract.ts` para `SHELL-CON-021`.
- `scripts/validate-canonical-sale-line-contract.mjs` valida frescura, forma exacta de 20 campos, 7 componentes monetarios, dependencia con `CanonicalSaleId`, fronteras de mapping/estado/agregados, seguridad, package, índice interno y READMEs.
