# Integration Principal contracts

Materialización estática interna de `SHELL-CON-017::GLOBAL` para la superficie lógica `@vento/contracts/integrations`.

## Autoridad semántica

- `INT-EXT-002` conserva la definición propietaria de `IntegrationPrincipal` por frontera material de integración.
- `SHELL-CON-017` centraliza esa semántica como contrato compartido.
- `SHELL-CON-018` conserva en exclusiva la referencia de credencial externa sin secreto.
- `INT-DB-001` conserva la materialización posterior del registro físico de sistemas, bindings y principales.

## Superficie materializada

Esta instancia materializa exclusivamente:

- `IntegrationPrincipalId`;
- `IntegrationPrincipal`;
- `IntegrationPrincipalRef`;
- política estática de identidad;
- separaciones obligatorias de identidad;
- dimensiones conceptuales mínimas;
- metadata de adopción por referencia de las 21 decisiones de `INT-EXT-002`.

La adopción de las 21 decisiones es una proyección de cobertura, no una segunda matriz editable.

## Identidad

`IntegrationPrincipalId` es:

- estable;
- opaco;
- no secreto;
- sin formato serial físico definido;
- no derivable automáticamente de `external_system_id`;
- no derivable de credenciales, secretos o identidad humana;
- no reutilizable para una integración independiente retirada.

Esta instancia crea **0 valores físicos** de `IntegrationPrincipalId`.

## Cobertura heredada

El corte contractual conserva:

- 21 decisiones documentales `ESPECIFICADO`;
- 11 materializaciones `PENDIENTE_DE_EVIDENCIA`;
- 10 materializaciones `NO_APLICA` mientras no exista binding acreditado;
- 0 valores físicos de principal creados.

Los identificadores `EXT-SYS-001` a `EXT-SYS-021` siguen siendo identidades documentales del inventario externo y no se convierten en `IntegrationPrincipalId`.

## Separaciones

La materialización conserva la separación entre `IntegrationPrincipalId` y:

- `PrincipalContext.session_id`;
- `PrincipalContext.auth_user_id`;
- `PermissionKey`;
- `provider_account_ref`;
- `external_credential_id`;
- valores secretos;
- `endpoint_ref`;
- `device_id`;
- `external_system_id`;
- `AppCode`;
- actor humano.

`PrincipalContext.SYSTEM_SERVICE` puede describir una ejecución autenticada de servicio, pero no sustituye la identidad estable de la frontera de integración.

## Límite físico

Esta instancia es una fundación estática `PRE_E5_FOUNDATION`.

No:

- publica el subpath;
- modifica `packages/contracts/package.json`;
- añade `exports`;
- cambia la versión del package;
- adopta consumidores;
- ejecuta integraciones;
- crea bindings runtime;
- crea credenciales, secretos, endpoints o cuentas;
- crea tablas, migraciones, RLS, RPC o cambios Supabase;
- materializa el registro de `INT-DB-001`;
- modifica 04A/TREQ;
- materializa contratos reservados a `SHELL-CON-018..024`.

## Archivos generados

`scripts/generate-integration-principal-contracts.mjs` valida las fuentes canónicas y mantiene:

- `generated/integration-principal.contract.ts`;
- `generated/index.ts`.

`scripts/validate-integration-principal-contracts.mjs` valida frescura, límites de seguridad, cobertura 21/21 y frontera del package.

Source contract SHA-256: `c4ca8bdc55f98113d235107f99355ef6a69dbb59a7f0853a6e087c8fcad14839`
