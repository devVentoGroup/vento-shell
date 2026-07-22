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

### Orden contractual interno

```text
SHELL-CON-001 a SHELL-CON-008
        ↓
SHELL-AUTH-001
+
SHELL-CTX-001 a SHELL-CTX-005
        ↓
SHELL-AUTH-002
        ↓
SHELL-AUTH-003
        ↓
SHELL-AUTH-004
        ↓
AUTH-DB-033
        ↓
AUTH-DB-034
        ↓
AUTH-DB-032
        ↓
SHELL-AUTH-005
```

Reglas:

- `SHELL-AUTH-001` define la estructura y exports del único SDK compartido;
- `SHELL-CTX-001..005` implementan piezas contextuales dentro del mismo paquete;
- `SHELL-AUTH-002` depende de los contratos y módulos contextuales;
- `SHELL-AUTH-003` crea scope por solicitud y registro de consumidores;
- `SHELL-AUTH-004` impide nuevos consumos legacy antes de la migración;
- `AUTH-DB-033` y `AUTH-DB-034` implementan las fuentes autoritativas;
- `AUTH-DB-032` agrega persistencia durable y vínculo con ejecución;
- `SHELL-AUTH-005` migra consumidores solo después de disponer del backend,
  adapters, gates, pruebas y rollback.
