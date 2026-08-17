# Paquete de relevo para implementación futura

> Plantilla transversal. Su materialización en `.delivery` es de solo lectura y
> permanece en modo `CONTROLLED_EXECUTION`: no inicia implementación por sí
> sola, no cambia el estado de una tarea y no acredita evidencia física. Toda
> autorización material pertenece a una instancia de `implementation-control.json`.

## Identidad y autoridad

- Tarea, título y estado canónicos.
- Archivo propietario y continuidad vigente.
- Estado documental del relevo.
- Límite expreso entre planeación e implementación.

## Fuentes canónicas detectadas

- Aplicaciones y repositorios mencionados.
- Pantallas `VSCREEN-*` y procesos `VPROC-*` referenciados.
- Requisitos `TREQ-*` y tareas relacionadas.
- Decisiones heredadas y límites explícitos.

## Corte futuro observable

Cada corte comienza en `NOT_STARTED`. El generador puede crear cortes faltantes
y conservar los ya registrados, pero nunca avanza su estado automáticamente.
Los estados posteriores requieren una edición local explícita y evidencia
proporcional.

## Instrucción de relevo

El paquete generado debe poder copiarse a una conversación de análisis para
proponer un corte pequeño y verificable sin alterar decisiones canónicas. La
ejecución posterior deberá volver al repositorio propietario, donde se podrán
observar diff, pruebas y evidencia real.
