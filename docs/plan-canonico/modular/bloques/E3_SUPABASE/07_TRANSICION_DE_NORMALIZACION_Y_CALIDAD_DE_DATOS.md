# Transición de normalización y calidad de datos

Este archivo es el índice propietario del plan `DATA-NORM-TRANS`. Cada tarea se
mantiene completa en un archivo independiente para que su revisión, reemplazo
y validación no dependan de un documento monolítico.

| Orden | Archivo                            | Alcance               |
| ----- | ---------------------------------- | --------------------- |
| 001   | `07_01_DATA_NORM_TRANS_001.md`     | `DATA-NORM-TRANS-001` |
| 002   | `07_02_DATA_NORM_TRANS_002.md`     | `DATA-NORM-TRANS-002` |
| 003   | `07_03_DATA_NORM_TRANS_003.md`     | `DATA-NORM-TRANS-003` |
| 004   | `07_04_DATA_NORM_TRANS_004.md`     | `DATA-NORM-TRANS-004` |
| 005   | `07_05_DATA_NORM_TRANS_005.md`     | `DATA-NORM-TRANS-005` |
| 006   | `07_06_DATA_NORM_TRANS_006.md`     | `DATA-NORM-TRANS-006` |
| 007   | `07_07_DATA_NORM_TRANS_007.md`     | `DATA-NORM-TRANS-007` |
| 008   | `07_08_DATA_NORM_TRANS_008.md`     | `DATA-NORM-TRANS-008` |
| 009   | `07_09_DATA_NORM_TRANS_009.md`     | `DATA-NORM-TRANS-009` |
| Gate  | `07_10_SUPA_TRANS_016.md`          | `SUPA-TRANS-016`      |

Regla de transición:

```text
baseline
-> dry-run
-> detección de colisiones
-> resolución documental de duplicados
-> backfill por lote
-> activación sobre nuevas escrituras
-> validación posterior al backfill
-> rollback y recuperación del valor anterior
-> evidencia y aprobación por dominio
```

Queda prohibida una actualización global indiscriminada equivalente a
`UPDATE todas_las_tablas SET nombre = normalize(nombre)`.

## Frontera común de desarrollo

Estas tareas pertenecen a BLOQUE E3. Producen baseline, análisis, decisiones,
planes, gates y evidencia aprobable antes de modificar la base. No crean ni
ejecutan migraciones, funciones, tablas auxiliares, backfills, constraints,
índices, triggers, despliegues ni cambios remotos.

Los verbos `ejecutar`, `resolver`, `activar` y `validar` se interpretan dentro
de E3 como trabajo analítico o de transición sobre evidencia y simulaciones
sin mutación. La implementación física pertenece a BLOQUE R, especialmente a
`AUTH-DB-028` y `DATA-NORM-DB-001` a `DATA-NORM-DB-010`. Cada tarea deberá
declarar de forma explícita qué deja aprobado para R y qué ejecución continúa
pendiente.

El orden físico de compilación pertenece a `manifest.json`. Una tarea deberá
existir en un solo archivo y toda entrega `*_APROBADA_PARA_REEMPLAZAR.md`
reemplazará únicamente el archivo correspondiente a su identificador.
