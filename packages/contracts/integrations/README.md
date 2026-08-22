# Integration contracts

Materialización estática interna de la superficie lógica `@vento/contracts/integrations`.

## Autoridad semántica

- `INT-EXT-002` conserva la definición propietaria de `IntegrationPrincipal`.
- `SHELL-CON-017::GLOBAL` materializa `IntegrationPrincipalId`, `IntegrationPrincipal` e `IntegrationPrincipalRef`.
- `INT-EXT-003..008` conservan procedencia, mecanismo, alcance mínimo, ambiente, custodia y lifecycle de credenciales.
- `SHELL-CON-018::GLOBAL` materializa la referencia contractual no sensible `ExternalCredentialId` + `ExternalCredentialRef`.
- `INT-DB-001` conserva el registro físico posterior de sistemas, bindings y principales.
- `INT-DB-002` conserva la persistencia física posterior de referencias de credenciales sin secretos.
- `SHELL-CON-019` conserva en exclusiva el contrato de evento externo recibido.

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

## Límite físico

Ambas instancias son fundaciones estáticas `PRE_E5_FOUNDATION` con modalidad `GLOBAL_ENABLE_ONCE`.

Esta materialización no:

- publica el subpath;
- modifica `packages/contracts/package.json`;
- añade `exports`;
- cambia la versión de `@vento/contracts`;
- adopta consumidores;
- ejecuta integraciones;
- crea, rota, revoca o persiste credenciales;
- crea valores físicos de `IntegrationPrincipalId` o `ExternalCredentialId`;
- accede a secret stores;
- crea endpoints, cuentas o bindings runtime;
- crea tablas, migraciones, RLS, RPC o cambios Supabase;
- modifica 04A/TREQ;
- materializa `SHELL-CON-019..024`;
- materializa `INT-DB-001` ni `INT-DB-002`.

La reconciliación topológica del archivo propietario permite materializar esta forma estática antes de E5; la adopción por paquetes y la ejecución real de integraciones conservan sus gates propietarios.

## Archivos generados

`scripts/generate-integration-principal-contracts.mjs` valida las fuentes canónicas y mantiene:

- `generated/integration-principal.contract.ts`;
- `generated/external-credential-ref.contract.ts`;
- `generated/index.ts`.

`scripts/validate-integration-principal-contracts.mjs` valida frescura, límites de seguridad, cobertura, frontera del package y ausencia de material sensible.
