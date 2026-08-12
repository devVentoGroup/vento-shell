## BLOQUE Z

**Tecnología, dispositivos, redes, impresión, soporte y seguridad técnica**

Este bloque define el modelo transversal de gestión tecnológica de Vento Group.

No crea una aplicación monolítica de TI ni sustituye las fuentes de verdad
de SHELL, NEXO, ANIMA, VISO, ORIGO, NUMERA, el servicio transversal de
impresión o los bloques de calidad y continuidad.

Propiedad funcional:

```text
SHELL
→ identidad, aplicaciones, cuentas y política de acceso

NEXO
→ activos tecnológicos, ubicación, custodia, mantenimiento y retiro físico

ANIMA
→ portal del trabajador, solicitudes propias y capacitación

VISO
→ mesa de servicio, incidentes, problemas, cambios, SLA y supervisión

PRINT-ARC
→ colas, routing, adaptadores y resultados de impresión

ORIGO
→ compras, proveedores, contratos y renovaciones

NUMERA
→ compromisos, gastos y costos tecnológicos

BLOQUE T
→ pruebas, releases, despliegue y rollback

BLOQUE Z
→ modelo operativo transversal, configuración tecnológica,
  redes, soporte, observabilidad y coordinación
```

### Organización documental del bloque

<!-- PLAN-SECTION-META:START -->
El bloque se divide en mini-bloques funcionales. Cada archivo conserva juntas las tareas que comparten propósito y resultado, evitando tanto el archivo monolítico como la fragmentación de una tarea por archivo.

| Orden | Mini-bloque | Cobertura | Tareas |
|---:|---|---|---:|
| 1 | DOMINIO DE TECNOLOGÍA Y SOPORTE | `TI-DOM-001`–`TI-DOM-013` | 13 |
| 2 | AUTORIZACIÓN Y ACCESO PRIVILEGIADO | `TI-AUTH-001`–`TI-AUTH-004` | 4 |
| 3 | EXPERIENCIA DE SOPORTE Y OPERACION TI | `TI-UX-001`–`TI-UX-006` | 6 |
| 4 | INTEGRACIONES Y TELEMETRIA | `TI-INT-001`–`TI-INT-003` | 3 |
<!-- PLAN-SECTION-META:END -->

### Correcciones canónicas vigentes del mini-bloque TI-DOM

Esta sección resuelve exclusivamente contradicciones de coherencia detectadas entre `TI-DOM-007` a `TI-DOM-011` y el gobierno canónico de pruebas. No modifica alcance funcional, estados de tarea, secuencia, autorizaciones ni implementación física.

Las siguientes sustituciones son normativas y prevalecen sobre las cláusulas incompatibles del archivo `01_DOMINIO_DE_TECNOLOGIA_Y_SOPORTE.md`:

1. **`TI-DOM-007`** crea `TREQ-VISO-046`. Quedan sin efecto únicamente las afirmaciones de esa tarea que indiquen `0` requisitos creados o modificados, `NO GENERA REQUISITOS DE PRUEBA` o que prohíban crear/modificar requisitos como criterio de aceptación. La matriz exacta impacto × urgencia, los cuatro perfiles SLA, sus relojes y pausas válidas y los umbrales preventivos de escalamiento deben quedar protegidos por `TREQ-VISO-046`.
2. **`TI-DOM-008`** crea `TREQ-VISO-047`. Quedan sin efecto únicamente las afirmaciones de esa tarea que indiquen `0` requisitos creados o modificados, `NO GENERA REQUISITOS DE PRUEBA` o que prohíban crear/modificar requisitos como criterio de aceptación. El ciclo de problema, sus estados y transiciones, la separación hipótesis/causa, el gobierno de error conocido y workaround, la recurrencia y la verificación de eficacia deben quedar protegidos por `TREQ-VISO-047`.
3. **`TI-DOM-009`** crea `TREQ-VISO-048`. Quedan sin efecto únicamente las afirmaciones de esa tarea que indiquen `0` requisitos creados o modificados, `NO GENERA REQUISITOS DE PRUEBA` o que prohíban crear/modificar requisitos como criterio de aceptación. Las clases y el ciclo de cambio, aprobaciones, prerrequisitos, ventana, prueba, rollback, emergencia y revisión posterior deben quedar protegidos por `TREQ-VISO-048`.
4. **`TI-DOM-011`**: la fila que asigna `Implementación Supabase de cualquier mecanismo nuevo` a `DELIV-PKG-001..025::<package_id>` queda sustituida. `NEXO-REMISSIONS-001` no es autoridad transversal de recuperación tecnológica. Cualquier implementación nueva que implique migraciones o cambios físicos en Supabase queda bajo **BLOQUE R y el paquete de implementación propietario que resulte explícitamente autorizado**, conservando `TI-DOM-011` como contrato documental de recuperación y sin autorizar implementación en esta tarea.

Estas correcciones no renumeran requisitos existentes, no reutilizan identificadores históricos y no alteran `TI-AUTH-001` ni ninguna tarea posterior.
