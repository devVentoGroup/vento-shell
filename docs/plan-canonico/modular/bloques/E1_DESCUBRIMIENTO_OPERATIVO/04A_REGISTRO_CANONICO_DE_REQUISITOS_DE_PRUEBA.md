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

| Estado         | Significado                                              |
| -------------- | -------------------------------------------------------- |
| `IDENTIFICADO` | necesidad detectada, todavía sin especificación completa |
| `ESPECIFICADO` | escenario, entradas y resultado esperado definidos       |
| `PLANIFICADO`  | vinculado con una tarea o paquete aprobado               |
| `IMPLEMENTADO` | prueba escrita y disponible                              |
| `VERIFICADO`   | ejecutada correctamente con evidencia                    |
| `DIFERIDO`     | aplazada con tarea y momento de resolución explícitos    |
| `DESCARTADO`   | no aplica, con justificación aprobada                    |

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

| ID  | Regla protegida | Origen | Riesgo | Tipo | Prioridad | Repositorio | Tarea o paquete destino | Etapa | Estado | Evidencia |
| --- | --------------- | ------ | ------ | ---- | --------- | ----------- | ----------------------- | ----- | ------ | --------- |

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
