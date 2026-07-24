### COBERTURA EMPRESARIAL OBLIGATORIA

E1 deberá evaluar como mínimo los siguientes dominios. Evaluar un dominio
no obliga a construirlo dentro de Vento OS; obliga a decidir de forma
explícita su tratamiento.

Clasificaciones permitidas:

```text
BUILD
REUSE_OR_REFACTOR
INTEGRATE_EXTERNAL
BUY
CONTROLLED_MANUAL
DEFERRED
OUT_OF_SCOPE
RETIRE
```

### [ ] CAP-SCOPE-001 — Evaluar gobierno, empresas, sedes y organización
### [ ] CAP-SCOPE-002 — Evaluar personal, contratación, turnos, asistencia, capacitación y retiro
### [ ] CAP-TAL-001 — Diseñar alcance y responsabilidades de TALENTO, VISO y ANIMA
### [ ] CAP-TAL-002 — Diseñar publicación de vacantes, consulta y postulación en TALENTO
### [ ] CAP-TAL-003 — Diseñar expediente progresivo de datos, documentos, consentimiento y conservación
### [ ] CAP-TAL-004 — Diseñar evaluación, entrevista, decisión, oferta y pre-registro de candidato
### [ ] CAP-TAL-005 — Diseñar traspaso trazable e idempotente de TALENTO hacia ANIMA y VISO
### [ ] CAP-TAL-006 — Diseñar período de prueba, permisos provisionales, continuidad definitiva y cierre
### [ ] CAP-SCOPE-003 — Evaluar seguridad y salud en el trabajo
### [ ] CAP-SCOPE-004 — Evaluar catálogo, productos, presentaciones, unidades, menús y recetas
### [ ] CAP-SCOPE-005 — Evaluar compras, proveedores, contratos, precios y abastecimiento
### [ ] CAP-SCOPE-006 — Evaluar inventario, lotes, vencimientos, LOC y LPN
### [ ] CAP-SCOPE-007 — Evaluar activos, vajilla, decoración, herramientas, repuestos y mantenimiento
### [ ] CAP-SCOPE-008 — Evaluar producción, planificación, rendimiento, calidad e inocuidad
### [ ] CAP-SCOPE-009 — Evaluar ventas, pedidos, mesas, comandas, caja y pagos
### [ ] CAP-SCOPE-010 — Evaluar clientes, fidelización, reclamos y servicio
### [ ] CAP-SCOPE-011 — Evaluar logística, rutas, vehículos, combustible y entregas
### [ ] CAP-SCOPE-012 — Evaluar costos, gastos, presupuestos, tesorería, contabilidad e impuestos
### [ ] CAP-SCOPE-013 — Evaluar instalaciones, mantenimiento, limpieza, inspecciones y calibración
### [ ] CAP-SCOPE-014 — Evaluar marketing, campañas y contenido
### [ ] CAP-SCOPE-015 — Evaluar TI, dispositivos, redes, impresión, soporte y seguridad
### [ ] CAP-SCOPE-016 — Evaluar privacidad, cumplimiento, documentos, conservación y auditoría
### [ ] CAP-SCOPE-017 — Evaluar analítica, indicadores y datos maestros
### [ ] CAP-SCOPE-018 — Evaluar continuidad operativa, respaldo y recuperación
### [ ] CAP-SCOPE-019 — Aprobar clasificación y propietario de cada dominio evaluado

Las tareas `CAP-TAL-001` a `CAP-TAL-006` son destinos futuros derivados de
`BRECHA-CAP-013`. No adelantan la continuidad vigente ni autorizan
implementación. Deberán preservar estas reglas:

1. la persona postulada continúa siendo candidata hasta la vinculación autorizada;
2. TALENTO conserva postulación y expediente de selección;
3. VISO conserva vacantes, decisiones laborales y permisos administrativos;
4. ANIMA recibe al trabajador vinculado y su experiencia operativa;
5. candidato y trabajador comparten identidad enlazada, sin duplicación;
6. el período de prueba es un estado del vínculo laboral;
7. el rechazo, retiro o cierre conserva trazabilidad y retira accesos cuando corresponda;
8. cualquier migración o cambio de Supabase se creará y ejecutará desde `vento-shell`.
