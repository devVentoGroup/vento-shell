# Integration contracts

Materialización estática interna de la superficie lógica `@vento/contracts/integrations`.

## Autoridad semántica

- `INT-EXT-002` conserva la definición propietaria de `IntegrationPrincipal`.
- `SHELL-CON-017::GLOBAL` materializa `IntegrationPrincipalId`, `IntegrationPrincipal` e `IntegrationPrincipalRef`.
- `INT-EXT-003..008` conservan procedencia, mecanismo, alcance mínimo, ambiente, custodia y lifecycle de credenciales.
- `SHELL-CON-018::GLOBAL` materializa la referencia contractual no sensible `ExternalCredentialId` + `ExternalCredentialRef`.
- `INT-EXT-009..017` conservan contrato de entrada, transporte, autenticidad, idempotencia, mapping, evidencia, resiliencia, auditoría y conciliación de integraciones externas.
- `SHELL-CON-019::GLOBAL` materializa `ExternalReceivedEvent<TNormalizedAssertion>` como contrato estático de recepción externa previo a cualquier efecto empresarial.
- `INT-DB-001` conserva el registro físico posterior de sistemas, bindings y principales.
- `INT-DB-002` conserva la persistencia física posterior de referencias de credenciales sin secretos.
- `SHELL-CON-020` conserva en exclusiva el contrato canónico de venta.
- `SHELL-CON-022`, `SHELL-CON-023` y `SHELL-CON-024` conservan respectivamente mapping compartido, idempotencia/conciliación y disposición de rechazo/cuarentena.

## Principal técnico de integración

`IntegrationPrincipalId` permanece:

- estable;
- opaco;
- no secreto;
- sin formato serial físico definido;
- separado de actor humano, `PermissionKey`, cuenta de proveedor, credencial, secreto, endpoint, dispositivo, `external_system_id` y `AppCode`.

La cobertura heredada de `INT-EXT-002` conserva:

- 21 decisiones `ESPECIFICADO`;
- 11 `PENDIENTE_DE_EVIDENCIA`;
- 10 `NO_APLICA`;
- 0 valores físicos de `IntegrationPrincipalId`.

Source contract SHA-256 `SHELL-CON-017`: `c4ca8bdc55f98113d235107f99355ef6a69dbb59a7f0853a6e087c8fcad14839`.

## Referencia de credencial externa

`ExternalCredentialId` identifica una credencial gobernada, nunca su valor. Es opaco, no sensible, no autenticador y no reutilizable para un sucesor independiente.

`ExternalCredentialRef` vincula únicamente metadata no sensible entre:

- `external_credential_id`;
- `external_system_id`;
- `integration_principal_id`;
- superficie de credencial;
- ambiente VENTO;
- `external_instance_id` y `provider_account_ref` cuando exista evidencia;
- procedencia y mecanismo acreditados;
- `minimum_scope` y `scope_ceiling`;
- clase de material, propietario funcional y custodio técnico;
- estado de lifecycle, predecesor/sucesor, fechas conocidas y consumidores autorizados cuando apliquen.

La referencia no contiene ni resuelve API keys, tokens, passwords, private keys, secretos, material criptográfico recuperable, rutas operacionales de secret store ni instrucciones runtime de recuperación.

La materialización conserva las 21 decisiones documentales de aplicabilidad de `SHELL-CON-018`:

- 9 `PENDIENTE_DE_EVIDENCIA`;
- 2 `NO_APLICA`;
- 10 `NO_APLICA_ACTUAL`;
- 0 valores físicos de `ExternalCredentialId`;
- 0 referencias persistidas;
- 0 secretos creados, copiados, revelados o movidos.

Toda referencia física futura pertenece exactamente a uno de `DEVELOPMENT`, `STAGING` o `PRODUCTION`. No existe fallback autorizado a credencial global, legacy o de otro ambiente.

Source contract SHA-256 `SHELL-CON-018`: `b22094113048ee52d8ea8abe961af7fcb8be2b1924eabe69d0eb048d928bbb69`.

## Evento externo recibido

`ExternalReceivedEvent<TNormalizedAssertion>` representa una afirmación o evento recibido desde una frontera externa antes de que la aplicación propietaria produzca, rechace, difiera o concilie un efecto empresarial.

La forma mantiene separadas:

- identidad de sistema e instancia externa;
- principal técnico y referencia de credencial, ambos opcionales según la superficie;
- ambiente VENTO;
- versión VENTO y versión del proveedor;
- contrato de entrada y referencia de transporte;
- `external_event_id` y `receipt_id`;
- `received_at` y `provider_occurred_at`;
- resultado de autenticidad y evidencia fuente protegida;
- huella de payload y afirmación normalizada;
- referencias de mapping, idempotencia y correlación;
- `owner_contract_ref` como frontera propietaria sin transferencia de autoridad.

Invariantes materiales:

- una afirmación externa no es un hecho empresarial canónico VENTO;
- un proveedor externo no es un productor empresarial interno;
- receipt, ACK, callback, webhook o `2xx` no confirman por sí solos un efecto empresarial;
- autenticidad técnica válida no equivale a corrección ni autorización empresarial;
- el payload original no viaja por defecto dentro del contrato compartido y permanece referenciado mediante evidencia protegida;
- `normalized_assertion` es tipada, validada y minimizada por contrato de entrada y puede ser `null` cuando la recepción no puede continuar;
- el hash del payload no sustituye `external_event_id`, `receipt_id` ni identidad empresarial;
- mapping, idempotencia y correlación permanecen por referencia y no se redefinen aquí;
- si el proveedor no aporta identidad externa estable, una implementación futura debe materializar un `receipt_id` durable antes del primer procesamiento con efecto.

La matriz de `SHELL-CON-019` conserva exactamente 21 decisiones:

- 2 `APLICA_EVENTO_INBOUND_ACREDITADO`: `EXT-SYS-002` Wompi — webhook de resultado de pago, y `EXT-SYS-003` RevenueCat — webhook de entitlement / suscripción;
- 19 identidades sin evento externo recibido acreditado en el corte;
- Resumen literal de cobertura: 19 sin evento externo recibido acreditado;
- estados físicos: 2 `DEFINIDO_NO_MATERIALIZADO`, 9 `NO_APLICA`, 8 `NO_APLICA_ACTUAL` y 2 `BLOQUEADO`;
- Apple Wallet / PassKit conserva sus requests inbound actuales fuera de la clasificación de evento externo recibido mediante `NO_APLICA_AL_EVENTO_EN_CORTE`.

Esta materialización crea 0 eventos runtime, 0 endpoints, 0 registros físicos de receipt, 0 secretos, 0 credenciales y 0 cambios Supabase.

Source contract SHA-256 `SHELL-CON-019`: `0faeb8d65edcf9b5806c6c962aefb76ab9cfd13e434d43cb549d559cd5cbaed1`.

## Límite físico

Las tres instancias son fundaciones estáticas `PRE_E5_FOUNDATION` con modalidad `GLOBAL_ENABLE_ONCE`.

Esta materialización no:

- publica el subpath;
- modifica `packages/contracts/package.json`;
- añade `exports`;
- cambia la versión de `@vento/contracts`;
- adopta consumidores;
- ejecuta integraciones;
- crea o ejecuta webhooks, callbacks, polling o endpoints;
- persiste receipts, inboxes, payloads o evidencia;
- crea, rota, revoca o persiste credenciales;
- crea valores físicos de `IntegrationPrincipalId` o `ExternalCredentialId`;
- accede a secret stores;
- crea cuentas, bindings, colas o workers runtime;
- crea tablas, migraciones, RLS, RPC o cambios Supabase;
- modifica 04A/TREQ;
- materializa `SHELL-CON-020..024`;
- materializa `INT-DB-001` ni `INT-DB-002`.

La reconciliación topológica del archivo propietario permite materializar esta forma estática antes de E5; la adopción por paquetes y la ejecución real de integraciones conservan sus gates propietarios.

## Archivos generados

`scripts/generate-integration-principal-contracts.mjs` valida las fuentes canónicas y mantiene:

- `generated/integration-principal.contract.ts`;
- `generated/external-credential-ref.contract.ts`;
- `generated/external-received-event.contract.ts`;
- `generated/index.ts`.

`scripts/validate-integration-principal-contracts.mjs` valida frescura, forma contractual, cobertura 21/21, Wompi/RevenueCat, fronteras de seguridad, frontera del package, READMEs y ausencia de runtime, secretos o persistencia.
