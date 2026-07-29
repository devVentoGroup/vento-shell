### SECCIÓN — INTRO ESTACIONES COMPARTIDAS

MODELO DE ESTACIONES OPERATIVAS COMPARTIDAS

### Reglas obligatorias:

1. Ninguna modalidad de interacción se considerará predeterminada para todos los procesos.
2. Cada paso operativo deberá comparar, cuando sean aplicables:
   - interacción táctil visual;
   - escáner fijo;
   - cámara del dispositivo;
   - escáner portátil;
   - captura automática desde el contexto;
   - modalidad híbrida;
   - procedimiento manual de contingencia.
3. La modalidad deberá seleccionarse con base en:
   - operación real;
   - frecuencia;
   - movilidad;
   - ergonomía;
   - higiene;
   - manos ocupadas;
   - riesgo de error;
   - trazabilidad;
   - conectividad;
   - coste;
   - mantenimiento;
   - necesidad de periféricos.
4. No se aprobará una modalidad únicamente porque sea técnicamente posible o visualmente atractiva.
5. La alternativa definitiva deberá validarse mediante prototipo y prueba con trabajadores reales.
6. `UX-STATION-*` define la experiencia física y operativa objetivo.
7. `AUTH-DEV-*` implementa posteriormente la identidad, límites, sesión, autorización y auditoría del dispositivo compartido.
8. `PROC-SCREEN-*` no podrá diseñar una pantalla operativa definitiva antes de conocer la estación y modalidad de interacción aplicables.

### Organización documental del bloque

<!-- PLAN-SECTION-META:START -->
El bloque se divide en mini-bloques funcionales. Cada archivo conserva juntas las tareas que comparten propósito y resultado, evitando tanto el archivo monolítico como la fragmentación de una tarea por archivo.

| Orden | Mini-bloque | Cobertura | Tareas |
|---:|---|---|---:|
| 1 | INVENTARIO INTERACCION Y PERFILES DE ESTACION | `UX-STATION-001`–`UX-STATION-003` | 3 |
| 2 | IDENTIDAD SUPERFICIE PERIFERICOS Y CONTINGENCIA | `UX-STATION-004`–`UX-STATION-007` | 4 |
| 3 | PROTOTIPOS MATRIZ GRAMATICA Y COMPONENTES | `UX-STATION-008`–`UX-STATION-012` | 5 |
<!-- PLAN-SECTION-META:END -->
