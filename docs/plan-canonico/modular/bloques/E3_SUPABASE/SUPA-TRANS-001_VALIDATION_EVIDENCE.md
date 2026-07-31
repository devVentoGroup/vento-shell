# SUPA-TRANS-001 — Evidencia histórica de validación

## Propósito

Este artefacto conserva la información técnica que se retiró del cuerpo de la tarea para cumplir el contrato canónico de entrega. No cambia el alcance, las decisiones ni el estado de `SUPA-TRANS-001` o `SUPA-TRANS-002`.

## Validación remota read-only registrada el 2026-07-31

Se documentó la verificación del proyecto `vento-os-dev`, referencia `clzdpinthhtknkmefsxx`, con estos resultados:

- estado observado: `ACTIVE_HEALTHY`;
- PostgreSQL observado: `17.6.1`;
- 379 relaciones: 317 tablas y 62 vistas;
- partición exacta de las 379 relaciones en los 18 grupos indicados, sin `UNCLASSIFIED`;
- 348 firmas de funciones;
- 197 triggers empresariales no internos;
- 14 buckets;
- 24 Edge Functions activas;
- 7 cron jobs;
- migración `20260731082600_viso_monthly_schedule_186_hour_publish_guard` registrada;
- función y trigger mensuales de VISO materializados.

No se ejecutó DDL, DML, migración ni modificación de configuración.

## Artefacto SQL registrado

| Control | Resultado |
| --- | --- |
| archivo | `SUPA-TRANS-001_TRANSITION_MAP.sql` |
| líneas registradas | **868** |
| bytes UTF-8 registrados | **42.395** |
| SHA-256 histórico registrado | `b4e09b635facdc48c95728edbd5a867bf449e5d4da9ab3347cdff86df783a774` |
| sentencias mutantes | **0** |
| disposición distinta de `RESERVED_FOR_SUPA_TRANS_002` | **0** |
| relaciones sin capacidad | **0** |
| resultado esperado | **970 filas** |

Estos valores se conservan como evidencia histórica de la preparación original. La huella vigente del archivo debe calcularse sobre sus bytes actuales cuando se use como evidencia de entrega.

## Validación del repositorio

En el documento original se registró inicialmente:

```text
VALIDACIÓN REAL DEL REPOSITORIO PENDIENTE DE EJECUCIÓN LOCAL
```

Los comandos previstos eran:

```text
npm run docs:plan:build
npm run docs:plan:check
npm run docs:plan:test
npm run docs:treq:check
npm run docs:treq:test
git diff --check
```

La corrección posterior ejecutó satisfactoriamente esa batería mediante GitHub Actions sobre el repositorio actualizado.

## Requisitos explícitamente referenciados

```text
TREQ-SUPABASE-423  cobertura de las 379 relaciones
TREQ-SUPABASE-424  capacidad, owner, consumidores y estado por relación
TREQ-SUPABASE-425  cobertura y trazabilidad de funciones
TREQ-SUPABASE-426  cobertura y herencia de triggers
TREQ-SUPABASE-428  cobertura de buckets
TREQ-SUPABASE-430  Edge Functions y cron
TREQ-SUPABASE-431  catálogo de capacidades y clases especiales
TREQ-SUPABASE-432  una capacidad principal por objeto
TREQ-SUPABASE-433  definición correcta de propietario actual
TREQ-SUPABASE-438  separación productor, propietario y consumidor
TREQ-SUPABASE-439  estado de fuente por objeto
TREQ-SUPABASE-443  separación de VITAL
TREQ-SUPABASE-444  backup y staging
TREQ-SUPABASE-447  vistas, aliases y proyecciones
TREQ-SUPABASE-448  herencia de objetos derivados
TREQ-SUPABASE-449  sensibilidad y exposición
TREQ-SUPABASE-450  identidades, conteos y orden determinista
TREQ-SUPABASE-451  prohibición de cambios físicos anticipados
TREQ-SUPABASE-454  validador integral
TREQ-SUPABASE-1695 gate integral del cierre arquitectónico
```

## Alcance

- conserva la información retirada sin reinsertar instrucciones operativas dentro de la tarea;
- no autoriza cambios físicos ni remotos;
- no inicia `SUPA-TRANS-003`;
- no sustituye `TRANSITION-MAP-001@1.0.0` ni `DISPOSITION-MAP-002@1.0.1`.