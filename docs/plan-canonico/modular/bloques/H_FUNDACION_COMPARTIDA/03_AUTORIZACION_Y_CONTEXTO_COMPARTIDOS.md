## AUTORIZACIÓN Y CONTEXTO COMPARTIDOS

Este archivo materializa la frontera compartida aprobada por
`AUTH-CTX-027` y consolida las tareas que anteriormente estaban mezcladas
con normalización de datos.

Arquitectura obligatoria:

```text
@vento/contracts/authorization
→ contratos, catálogos, schemas y códigos

@vento/os-context
→ adapters, scopes por solicitud, proyecciones seguras,
  compatibilidad temporal y utilidades de prueba

Supabase
→ get_access_context, evaluate_authorization,
  resolvers privados, datasets y persistencia
```

No se crearán paquetes paralelos `@vento/auth` ni
`@vento/operational-context`.

### Fundación del SDK de autorización

### [ ] SHELL-AUTH-001 — Consolidar @vento/os-context como SDK canónico de contexto y autorización
### [ ] SHELL-AUTH-002 — Implementar adapters de servidor, cliente y proyecciones seguras
### [ ] SHELL-AUTH-003 — Implementar scope por solicitud y registro canónico de consumidores
### [ ] SHELL-AUTH-004 — Implementar lint, métricas y gates contra consumidores legacy
### [ ] SHELL-AUTH-005 — Migrar consumidores de autorización en todos los repositorios

### Módulos internos de contexto

### [ ] SHELL-CTX-001 — Consolidar el módulo de contexto dentro de @vento/os-context
### [ ] SHELL-CTX-002 — Implementar consumo canónico de turno y check-in
### [ ] SHELL-CTX-003 — Implementar proyecciones seguras de sede y área efectivas
### [ ] SHELL-CTX-004 — Implementar readiness operativo sin booleanos de autorización
### [ ] SHELL-CTX-005 — Implementar razones seguras de bloqueo contextual
### [ ] SHELL-CTX-006 — Implementar caché compartida, single-flight y validación de frescura

### Orden contractual interno

```text
SHELL-AUD-002 a SHELL-AUD-005
        ↓
SHELL-PKG-001 a SHELL-PKG-008
        ↓
SHELL-CON-001 a SHELL-CON-008
        ↓
SHELL-AUTH-001
+
SHELL-CTX-001
        ↓
AUTH-DB-033
        ↓
AUTH-DB-035
        ↓
AUTH-DB-034
        ↓
AUTH-DB-032
        ↓
SHELL-CTX-002 a SHELL-CTX-006
        ↓
SHELL-AUTH-002
        ↓
SHELL-AUTH-003
        ↓
SHELL-AUTH-004
        ↓
AUTH-DB-020
        ↓
AUTH-DB-006 a AUTH-DB-010
+
AUTH-DB-021
        ↓
SHELL-AUTH-005
        ↓
AUTH-DB-030
        ↓
AUTH-DB-031
```

Reglas:

- `SHELL-AUTH-001` define estructura, exports, versionado y compatibilidad del único SDK compartido;
- `SHELL-CTX-001` consolida el módulo contextual dentro del mismo paquete sin crear otro núcleo;
- `AUTH-DB-033`, `AUTH-DB-035`, `AUTH-DB-034` y `AUTH-DB-032` implementan contexto, frescura, decisión y persistencia autoritativos;
- `SHELL-CTX-002..006` consumen el contexto canónico ya disponible y producen proyecciones contextuales seguras;
- `AUTH-DB-035` implementa el token transaccional de frescura y los eventos de invalidación;
- `SHELL-CTX-006` implementa la caché compartida validada y el single-flight sin decidir permisos;
- `SHELL-AUTH-002` implementa adapters y proyecciones sobre las fronteras canónicas;
- `SHELL-AUTH-003` implementa scope por solicitud, deduplicación y registro de consumidores;
- `SHELL-AUTH-004` bloquea nuevos consumos legacy antes de la migración masiva;
- `AUTH-DB-020`, `AUTH-DB-006..010` y `AUTH-DB-021` migran objetos, RPC y RLS por dominio;
- `SHELL-AUTH-005` coordina y certifica la migración multi-repositorio después de disponer de backend, adapters, gates y rollback;
- `AUTH-DB-030` y `AUTH-DB-031` retiran legacy y certifican paridad únicamente al final.
