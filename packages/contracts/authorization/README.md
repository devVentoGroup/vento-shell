# @vento/contracts/authorization

Reserva física del subpath contractual de autorización aprobado para `@vento/contracts`.

`SHELL-CON-001::GLOBAL` crea únicamente esta raíz.

Los contratos documentales `AUTH-CAT-017` y `AUTH-CAT-018` continúan gobernando el catálogo versionado, schemas, tipos derivados, checksums, changelog y metadata de autorización.

Esta instancia no materializa todavía:

- `applications.json`;
- `permissions.json`;
- aliases;
- permisos legacy o retirados;
- resource contracts;
- JSON Schemas;
- tipos TypeScript derivados;
- generadores;
- validadores propios del catálogo;
- exports públicos consumibles.

Esos artefactos solo se incorporarán cuando la instancia física propietaria correspondiente cierre su alcance sin absorber responsabilidades de otras tareas.

Hasta entonces ningún consumidor debe importar rutas internas de este directorio.