# @vento/contracts

Raíz contractual compartida de Vento OS.

## Estado

Esta materialización corresponde a `SHELL-CON-001::GLOBAL` y establece únicamente la raíz física reutilizable de `@vento/contracts`.

Es una fundación `PRE_E5_FOUNDATION`.

No constituye una release publicada, un tag, una publicación en registry ni una adopción por consumidores.

La versión `1.0.0-alpha.1` es metadata de prerelease para autoría local y no constituye la primera versión estable.

## Responsabilidad

`@vento/contracts` es la autoridad técnica estática para contratos compartidos versionados de Vento OS.

Puede alojar, cuando sus tareas propietarias sean materializadas:

- catálogos;
- schemas;
- códigos e identificadores;
- tipos derivados;
- manifiestos;
- hashes;
- metadata contractual;
- diagnósticos estáticos.

No ejecuta:

- autorización runtime;
- acceso a Supabase;
- red;
- sesiones;
- cookies;
- SSO;
- redirects;
- lógica empresarial;
- UI;
- secretos;
- migraciones;
- RLS;
- RPC;
- persistencia.

## Alcance de SHELL-CON-001

Esta instancia crea únicamente:

- la identidad física `@vento/contracts`;
- el workspace `packages/contracts`;
- la reserva física del módulo `authorization`.

No materializa las responsabilidades reservadas a `SHELL-CON-002` a `SHELL-CON-016`.

No publica exports públicos adicionales antes de que su tarea propietaria los materialice.

## Módulo de procesos

`SHELL-CON-009::GLOBAL` materializa internamente `packages/contracts/processes` como proyección estática de identidad de procesos para el subpath lógico `@vento/contracts/processes`.

La materialización contiene exactamente 69 identidades derivadas de `PROC-CANONICAL-ID-REGISTRY-001`, desde `VPROC-0001` hasta `VPROC-0069`, junto con validación de formato y pertenencia.

Esta materialización no añade `exports` públicos, no modifica la versión de `@vento/contracts`, no publica el subpath, no adopta consumidores y no incorpora estados de proceso reservados a `SHELL-CON-010`.
