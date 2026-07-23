## BLOQUE E1

**Descubrimiento integral de operación, capacidades y cobertura de implementación**

Este bloque convierte la operación real de Vento Group en una entrada
obligatoria del roadmap antes de diseñar procesos, pantallas, datos o
implementaciones definitivas.

Depende de:

BLOQUE D
→ catálogo, matrices y contratos de autorización base conocidos

BLOQUE E
→ contexto efectivo y decisión unificada de autorización

Produce entradas obligatorias para:

BLOQUE E2
→ procesos, actores, pantallas y experiencia objetivo

BLOQUE E3
→ dominios, fuentes de verdad y arquitectura de Supabase

BLOQUE E4
→ servicios operativos transversales

BLOQUES POR APLICACIÓN
→ alcance funcional, técnico y de experiencia realmente faltante

Durante este bloque no se implementan pantallas, migraciones ni cambios
físicos en Supabase.

### Regla de interpretación AS-IS y TO-BE

El resultado de BLOQUE E1 describe la operación real y sus restricciones,
pero no convierte automáticamente el funcionamiento actual en requisito de
diseño.

```text
AS-IS
→ evidencia de necesidades, actores, dependencias, riesgos y restricciones

AS-IS
≠
TO-BE obligatorio
```

Los procesos manuales, informales, duplicados, inseguros o no trazables se
registrarán como evidencia y brecha. Su corrección se diseñará en BLOQUE E2,
se sustentará en la arquitectura de BLOQUES E3, E4 y X, y se convertirá en
paquetes ejecutables mediante BLOQUE E5.

No deberá digitalizarse una práctica defectuosa únicamente porque sea la
forma de trabajo vigente.

### Regla de suficiencia y avance de E1

El descubrimiento deberá alcanzar evidencia suficiente para diseñar sin
inventar, pero no exigirá resolver cada variación menor antes de avanzar.

Una duda será bloqueante únicamente cuando pueda modificar de forma material:

- la propiedad funcional o técnica de un proceso;
- la fuente de verdad de un dato;
- dinero, impuestos, contabilidad o responsabilidad legal;
- autorización, segregación de funciones o seguridad;
- el contrato entre aplicaciones;
- un estado, transición o reversión crítica;
- una migración irreversible o de alto riesgo.

Las incertidumbres no bloqueantes deberán:

1. quedar registradas con su evidencia disponible;
2. vincularse con `OPS-AUD-015` u otra tarea exacta existente;
3. validarse con el responsable real antes del diseño definitivo o durante el
   prototipo y piloto correspondiente;
4. no provocar entrevistas indefinidas ni impedir el avance de la secuencia.

`OPS-AUD-004` a `OPS-AUD-014` deberán reutilizar prioritariamente la evidencia
ya obtenida en las tareas anteriores. Solo se formularán nuevas preguntas
cuando falte una decisión bloqueante según esta regla.
