## REGISTRO CANÓNICO DE REQUISITOS DE PRUEBA

### Propósito

Este registro conserva todos los comportamientos que deberán quedar protegidos
mediante pruebas automatizadas o validaciones manuales controladas.

Un requisito de prueba no equivale por sí mismo a una tarea del roadmap.

Cada requisito deberá vincularse con:

- la tarea que lo originó;
- la regla o comportamiento protegido;
- el riesgo que evita;
- el tipo de prueba;
- la tarea o paquete que deberá implementarlo;
- la etapa en la que deberá implementarse;
- la evidencia de su ejecución.

### Convención de identificadores

Los requisitos utilizarán:

`TREQ-<DOMINIO>-<NNN>`

Dominios iniciales:

- `AUTH`;
- `SHELL`;
- `SUPABASE`;
- `ANIMA`;
- `VISO`;
- `NEXO`;
- `FOGO`;
- `ORIGO`;
- `PULSO`;
- `NUMERA`;
- `PASS`;
- `TALENTO`;
- `INTEGRATION`;
- `UX`.

### Estados permitidos

| Estado         | Significado                                                                      |
| -------------- | -------------------------------------------------------------------------------- |
| `IDENTIFICADO` | necesidad detectada con identificador, origen, regla, riesgo y tarea responsable |
| `ESPECIFICADO` | escenario, entradas, contexto y resultado esperado definidos                     |
| `PLANIFICADO`  | vinculado con un paquete, repositorio, ambiente y criterio de aceptación         |
| `IMPLEMENTADO` | prueba automatizada o procedimiento manual controlado disponible                 |
| `VERIFICADO`   | ejecución aprobada con evidencia reproducible                                    |
| `DIFERIDO`     | aplazado con justificación, riesgo aceptado, tarea y puerta de resolución        |
| `DESCARTADO`   | no aplica o estaba duplicado, con justificación aprobada                         |
| `OBSOLETO`     | el comportamiento fue retirado o reemplazado, conservando su historial           |

### Tipos permitidos

- unitaria;
- contractual;
- integración;
- base de datos;
- migración;
- RLS;
- RPC;
- seguridad;
- concurrencia;
- idempotencia;
- E2E;
- regresión;
- interfaz;
- manual operativa;
- experiencia;
- hardware.

### Registro

| ID                     | Dominio                                                                                                                                                                                                                                 | Regla protegida                                                                                                                                                                                                           | Origen                                                                                                 | Riesgo / prioridad                                                                                                | Tipo / modalidad                                                                       | Tarea responsable                                                                           | Paquete                       | Repositorio / ambiente                                            | Estado         | Artefacto | Último resultado | Evidencia | Relación |
| ---------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ----------------------------- | ----------------------------------------------------------------- | -------------- | --------- | ---------------- | --------- | -------- |
| `TREQ-PASS-001`        | `PASS`                                                                                                                                                                                                                                  | Toda acción visible de movimientos deberá abrir una capacidad real y autorizada, o no deberá exponerse como acción disponible.                                                                                            | `CODE-AUD-008` / `H-CODE-008-004`                                                                      | Acción engañosa, navegación muerta y exposición de una capacidad inexistente / alta                               | interfaz + E2E / automatizada                                                          | `CODE-AUD-010 — Detectar interfaces sin lógica real detrás`                                 | Pendiente de asignación en E5 | `vento-pass` / ambiente pendiente                                 | `IDENTIFICADO` | Pendiente | Pendiente        | Pendiente | —        |
| `TREQ-PASS-002`        | `PASS`                                                                                                                                                                                                                                  | Toda acción visible de escaneo de mesa deberá ejecutar el flujo aprobado con validación de dispositivo y servidor, o permanecer retirada de la navegación hasta que exista la capacidad completa.                         | `CODE-AUD-008` / `H-CODE-008-005`                                                                      | Capacidad operativa ficticia, uso incorrecto de códigos QR y experiencia engañosa / alta                          | interfaz + hardware + E2E / híbrida                                                    | `CODE-AUD-010 — Detectar interfaces sin lógica real detrás`                                 | Pendiente de asignación en E5 | `vento-pass` / ambiente pendiente                                 | `IDENTIFICADO` | Pendiente | Pendiente        | Pendiente | —        |
| `TREQ-PASS-003`        | `PASS`                                                                                                                                                                                                                                  | El historial de Saudo deberá atribuir cada transacción a una sede de forma determinista o mostrar explícitamente su estado sin atribución, sin omitir silenciosamente registros legítimos.                                | `CODE-AUD-008` / `H-CODE-008-007`                                                                      | Historial incompleto, pérdida de trazabilidad visible y decisiones basadas en información parcial / alta          | integración + regresión / automatizada                                                 | `CODE-AUD-012 — Detectar procesos parcialmente implementados`                               | Pendiente de asignación en E5 | `vento-pass` / ambiente pendiente                                 | `IDENTIFICADO` | Pendiente | Pendiente        | Pendiente | —        |
| `TREQ-NEXO-001`        | `NEXO`                                                                                                                                                                                                                                  | La selección privilegiada de área solicitante deberá funcionar desde el código canónico y superar build y validación sin depender de workflows o scripts temporales que reescriban automáticamente una rama.              | `CODE-AUD-008` / `H-CODE-008-008` y `H-CODE-008-009`                                                   | Deriva de código, mutación insegura de ramas, implementación parcial y reejecución accidental de un parche / alta | integración + seguridad + regresión / automatizada                                     | `CODE-AUD-016 — Revisar estado de build, lint, typecheck y pruebas`                         | Pendiente de asignación en E5 | `vento-nexo` / CI y ambiente pendientes                           | `IDENTIFICADO` | Pendiente | Pendiente        | Pendiente | —        |  | `TREQ-AUTH-001`  | `AUTH`                                                                                                                                                                                                                                                        | Toda capacidad protegida deberá resolverse mediante permisos, contexto y alcance canónicos; una lista local de nombres de rol no podrá conceder por sí sola autorización final. | `CODE-AUD-009` / `H-CODE-009-001`                                | Acceso indebido, denegación incorrecta y divergencia entre aplicaciones / crítica | seguridad + autorización + regresión / automatizada | `CODE-AUD-017 — Revisar autorización, permisos, RLS y seguridad` | Pendiente de asignación en E5 | transversal / CI, staging y ambientes pendientes | `IDENTIFICADO` | Pendiente | Pendiente | Pendiente | — |
| `TREQ-AUTH-002`        | `AUTH`                                                                                                                                                                                                                                  | Todo identificador de permiso consumido por código deberá existir en la versión vigente del catálogo, utilizar la convención aprobada y quedar libre de strings huérfanos, duplicados o mal escritos.                     | `CODE-AUD-009` / `H-CODE-009-002`                                                                      | Controles inoperantes, permisos obsoletos y fallos silenciosos de autorización / crítica                          | contractual + estática + integración / automatizada                                    | `CODE-AUD-017 — Revisar autorización, permisos, RLS y seguridad`                            | Pendiente de asignación en E5 | transversal / CI pendiente                                        | `IDENTIFICADO` | Pendiente | Pendiente        | Pendiente | —        |
| `TREQ-PASS-004`        | `PASS`                                                                                                                                                                                                                                  | El nombre operativo, dirección, coordenadas, enlaces y demás datos administrables de una sede mostrados por PASS deberán corresponder a la fuente canónica vigente y no divergir por literales duplicados en componentes. | `CODE-AUD-009` / `H-CODE-009-003` y `H-CODE-009-004`                                                   | Información comercial incorrecta, navegación errónea y divergencia entre sedes / alta                             | contractual + integración + interfaz / automatizada con validación manual de ubicación | `CODE-AUD-019 — Mapear dependencias, contratos y consumidores`                              | Pendiente de asignación en E5 | `vento-pass` / local, CI, staging y dispositivo físico pendientes | `IDENTIFICADO` | Pendiente | Pendiente        | Pendiente | —        |
| `TREQ-INTEGRATION-001` | `INTEGRATION`                                                                                                                                                                                                                           | Los esquemas, dominios y URLs externas utilizados por una aplicación deberán corresponder al ambiente y contrato aprobados, y no podrán divergir entre configuración móvil, web, pagos, notificaciones o navegación.      | `CODE-AUD-009` / `H-CODE-009-005` y `H-CODE-009-006`                                                   | Deep links rotos, retorno incorrecto, navegación a destinos obsoletos y diferencias entre ambientes / alta        | contractual + integración + E2E / automatizada                                         | `CODE-AUD-019 — Mapear dependencias, contratos y consumidores`                              | Pendiente de asignación en E5 | transversal / CI, staging y builds móviles pendientes             | `IDENTIFICADO` | Pendiente | Pendiente        | Pendiente | —        |
| `TREQ-NEXO-002`        | `NEXO`                                                                                                                                                                                                                                  | Todo producto activo y elegible para un ajuste deberá poder localizarse y seleccionarse sin quedar omitido silenciosamente por límites fijos de consulta.                                                                 | `CODE-AUD-009` / `H-CODE-009-008`                                                                      | Imposibilidad de ajustar productos válidos y cobertura incompleta del catálogo / alta                             | integración + paginación + E2E / automatizada                                          | `CODE-AUD-012 — Detectar procesos parcialmente implementados`                               | Pendiente de asignación en E5 | `vento-nexo` / local, CI y staging pendientes                     | `IDENTIFICADO` | Pendiente | Pendiente        | Pendiente | —        |  | `TREQ-SHELL-001` | Ninguna aplicación podrá considerarse disponible u operativa por la sola existencia de un registro o permiso; deberá tener propietario, alcance, proceso aprobado, superficie alcanzable y despliegue verificado, o quedar marcada como reserva no navegable. | `CODE-AUD-011` / `H-CODE-011-001`                                                                                                                                               | catálogo engañoso, permisos sin capacidad y activación prematura | contractual + estática + integración / automatizada                               | media                                               | `AURA-AUD-010 — Decidir continuidad, reemplazo o retiro`         | `IDENTIFICADO`                |
| `TREQ-NEXO-004`        | Un LPN no podrá considerarse implementado hasta que un actor autorizado pueda ejecutar y auditar su ciclo aprobado de creación, contenido, ubicación, movimiento, custodia, cierre, anulación y reetiquetado sin doble contabilización. | `CODE-AUD-011` / `H-CODE-011-002` a `H-CODE-011-005`                                                                                                                                                                      | existencia duplicada, contenido huérfano, movimientos incompletos y trazabilidad falsa                 | contractual + integración + base de datos + E2E / automatizada con validación operativa                           | alta                                                                                   | `NEXO-DOM-003 — Definir ciclo de vida de LPN: crear, activar, cerrar, anular y reetiquetar` | `IDENTIFICADO`                |
| `TREQ-PULSO-001`       | El POS interno deberá demostrar de extremo a extremo apertura de caja, creación de venta, líneas, sesión, cobro, pago, inventario, lealtad, hecho económico, anulación o reversión y cierre auditable antes de declararse operativo.    | `CODE-AUD-011` / `H-CODE-011-006`                                                                                                                                                                                         | ventas o pagos inconsistentes, caja sin cuadrar, inventario divergente y hechos económicos incompletos | contractual + integración + seguridad + E2E + regresión / automatizada con validación operativa                   | crítica                                                                                | `PULSO-UX-001 — Inventariar procesos de venta, caja y salón`                                | `IDENTIFICADO`                |

### Reglas obligatorias

1. Un requisito no podrá eliminarse para ocultar que dejó de cumplirse.
2. Los requisitos cerrados permanecerán como historial.
3. El estado `VERIFICADO` exige evidencia reproducible.
4. El estado `DIFERIDO` exige tarea exacta y momento de resolución.
5. Todo paquete E5 deberá enumerar los requisitos que implementa.
6. Todo defecto corregido deberá vincular una prueba de regresión.
7. Una prueba podrá ser manual cuando el comportamiento no sea automatizable,
   pero deberá declararse expresamente.
8. Ningún requisito crítico podrá permanecer únicamente en estado
   `IDENTIFICADO` al aprobar un paquete de implementación.
9. Cada tarea deberá indicar si genera o no requisitos de prueba.
10. Toda nueva fila deberá utilizar un identificador único.

### [ ] QA-REG-001 — Consolidar retrospectivamente requisitos de prueba anteriores a QA-GOV-001
