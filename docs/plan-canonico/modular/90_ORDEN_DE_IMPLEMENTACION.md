## Orden de implementación recomendado

FASE 1 — DEFINICIÓN CANÓNICA

1. BLOQUE A — Auditoría integral
2. BLOQUE B — Modelo definitivo mediante `AUTH-MOD-001` a `AUTH-MOD-020`
3. BLOQUE C — Catálogo canónico
4. BLOQUE D — Matrices y datasets de la versión contractual base
5. Completar BLOQUE E y el cierre diferido de BLOQUE B en este orden:
   1. `AUTH-CTX-001` a `AUTH-CTX-027`;
   2. `AUTH-MOD-021`;
   3. `AUTH-CTX-028` a `AUTH-CTX-030`.

FASE 2 — DESCUBRIMIENTO, ARQUITECTURA FUNCIONAL, DATOS Y PREPARACIÓN DE IMPLEMENTACIÓN

6. BLOQUE E1 — Auditar operación real, capacidades, dominios y cobertura de implementación

   Secuencia interna obligatoria de BLOQUE E1:

   `OPS-AUD-001` a `OPS-AUD-015`
   → `OPS-ADM-001`
   → `OPS-GOV-001`
   → `OPS-ACT-001`
   → `OPS-PLAN-001` a `OPS-PLAN-004`
   → `CAP-MAP-001` a `CAP-MAP-015`
   → `CODE-AUD-001` a `CODE-AUD-007`
   → `QA-GOV-001`
   → `CODE-AUD-008` a `CODE-AUD-020`
   → `QA-REG-001`
   → `CAP-SCOPE-001` a `CAP-SCOPE-019`
   → `CAP-COVER-001` a `CAP-COVER-012`
   → `GAP-CTRL-001` a `GAP-CTRL-008`.

   `EXT-GOV-001` podrá ejecutarse después de `OPS-GOV-001` cuando exista el
   expediente requerido. Su ejecución es paralela, condicional y no bloquea
   la continuidad ni el cierre documental de E1.

   La recolección de evidencia de `OPS-PLAN-002` a `OPS-PLAN-004` puede comenzar en paralelo, pero su aprobación formal respetará esta secuencia.
7. Aprobar línea base de capacidades, registro de brechas y matriz de cobertura por repositorio
8. BLOQUE E2 — Diseñar procesos TO-BE, actores, pantallas, experiencia y requisitos no funcionales, incluyendo `OPS-CAN-001`, `OPS-LOG-001`, `OPS-B2B-001` y `CAP-TAL-001` a `CAP-TAL-006`
9. Ejecutar AUTH-UI-001 a AUTH-UI-029 y aprobar propiedad funcional y contrato de pantallas
10. BLOQUE X — Definir integraciones internas, externas y contrato canónico de ventas
11. Aprobar traspasos entre aplicaciones e integración temporal del POS externo
12. BLOQUE E3 — Auditar Supabase, normalización, fuentes de verdad y arquitectura objetivo
13. Aprobar dominios, arquitectura de datos, normalización y plan de transición
14. BLOQUE E4 — Definir colas, impresión, notificaciones, documentos y evidencia
15. Aprobar contratos, planes de implementación y criterios de piloto de los servicios transversales
16. BLOQUE E5 — Convertir capacidades aprobadas en paquetes de implementación, readiness, cutover, piloto, rollback e hypercare
17. Reabrir el catálogo y actualizar matrices o datasets únicamente cuando una capacidad nueva madura lo requiera
18. Aprobar puerta de entrada a fundación compartida e implementación por paquetes

En esta fase se define:

- qué capacidades necesita realmente Vento Group;
- qué procesos existen y cuál es su diseño TO-BE;
- qué está completo, parcial, provisional, roto o ausente;
- qué aplicación, dominio y repositorio son propietarios;
- qué actor, pantalla y dispositivo son necesarios;
- qué eventos, colas, documentos e impresiones se producen;
- qué fuentes de verdad y dominios conservan los datos;
- qué requisitos no funcionales son obligatorios;
- qué cambios exactos requiere cada repositorio;
- cómo se probará, desplegará, revertirá y estabilizará cada paquete;
- cómo se migrará sin romper consumidores existentes.

Todavía no se implementan interfaces definitivas ni se reorganiza
físicamente Supabase.

### Ciclo obligatorio de los requisitos de prueba

```text
E1 — DESCUBRIMIENTO
identificar la regla y crear `TREQ-*`
        ↓
E2 / E3 / E4 — DISEÑO
definir escenario, datos, resultado esperado y riesgo
        ↓
E5 — PLANIFICACIÓN
vincular el requisito con un paquete mediante `DELIV-PKG-016`
        ↓
T / R0 — INFRAESTRUCTURA
crear runner, harness, entorno reproducible y CI
        ↓
IMPLEMENTACIÓN POR PAQUETE
escribir y ejecutar la prueba junto con el código
        ↓
PILOTO E HYPERCARE
convertir cada defecto encontrado en una prueba de regresión
        ↓
U — CIERRE INTEGRAL
ejecutar regresión completa, E2E, seguridad, UX y pruebas operativas
```

Reglas:

- E1 identifica el requisito, pero no necesariamente implementa la prueba.
- E2, E3 y E4 completan su especificación.
- E5 asigna cada requisito a un paquete concreto.
- T y R0 crean la infraestructura necesaria.
- La prueba se implementa junto con el código del paquete.
- Los defectos encontrados durante piloto o hypercare generan pruebas de regresión.
- U ejecuta la certificación integral y no sustituye las pruebas de cada paquete.


FASE 3 — FUNDACIÓN COMPARTIDA, DATOS Y SEGURIDAD

1.  BLOQUE H — Crear la fundación de VENTO-SHELL como núcleo compartido
2.  Crear contratos, eventos, normalización compartida, helpers puros y estructura inicial de @vento/supabase
3.  Ejecutar AUTH-UI-030 a AUTH-UI-039
4.  BLOQUE T — Establecer CI, pruebas, staging, drift y rollback base
5.  BLOQUE J — Inventariar y proteger acciones de servidor
6.  BLOQUE R — Ejecutar R0, R1 y los primeros paquetes aprobados de R2
7.  BLOQUE S — Mensajes y experiencia de bloqueo

AUTH-UI-030 a AUTH-UI-039 define:

permisos;
turno;
check-in;
sede;
área;
dispositivos;
simulación;
datos sensibles;
masking.

BLOQUE T deberá establecer la capacidad mínima de validar migraciones,
reconstruir la base, ejecutar pruebas, desplegar en staging, detectar drift
y verificar rollback antes del primer paquete estructural.

BLOQUE J protege acciones de servidor.

BLOQUE R ejecuta inicialmente:

- R0 — preparación y contención;
- R1 — fundación física;
- los primeros paquetes de R2 aprobados y necesarios para habilitar
  las fases siguientes.

R2 continuará progresivamente durante las fases de cada aplicación.

R3 se ejecutará durante el cierre transversal.

<!-- AUTH-DB-032-035:START -->
### Secuencia contractual obligatoria de autorización dentro de R1

```text
AUTH-DB-019
        ↓
AUTH-DB-033
        ↓
AUTH-DB-035
        ↓
AUTH-DB-034
        ↓
AUTH-DB-032
        ↓
AUTH-DB-006 a AUTH-DB-010
```

`AUTH-DB-027` deberá acompañar cada paquete como harness obligatorio.

Reglas:

- `AUTH-DB-033` requiere la arquitectura aprobada de esquemas, helpers, `SECURITY DEFINER`, grants y RLS;
- `AUTH-DB-035` depende del resolver canónico y debe implementar generaciones transaccionales, token de frescura y outbox de invalidación;
- `AUTH-DB-034` se implementa después de disponer del resolver y del contrato físico de frescura;
- `AUTH-DB-032` integra persistencia durable después de disponer de decisiones canónicas;
- `AUTH-DB-006` a `AUTH-DB-010` adoptan el resolver y el evaluador en RPC sensibles;
- las funciones boolean legacy solo se retiran después de compatibilidad, pruebas y certificación.
<!-- AUTH-DB-032-035:END -->

<!-- SHELL-AUTH-CANONICAL:START -->
### Secuencia canónica de autorización compartida

```text
FUNDACIÓN COMPARTIDA
SHELL-AUD-002..005
→ SHELL-PKG-001..008
→ SHELL-CON-001..008
→ SHELL-AUTH-001 + SHELL-CTX-001

PREPARACIÓN Y NÚCLEO FÍSICO
AUTH-DB-015 + AUTH-DB-027..029 + AUTH-DB-001..005
→ AUTH-DB-019
→ AUTH-DB-033
→ AUTH-DB-035
→ AUTH-DB-034
→ AUTH-DB-032

CONVERGENCIA Y ADOPCIÓN
SHELL-CTX-002..006
→ SHELL-AUTH-002
→ SHELL-AUTH-003
→ SHELL-AUTH-004
→ AUTH-DB-020
→ AUTH-DB-006..010 + AUTH-DB-021
→ SHELL-AUTH-005
→ AUTH-DB-030
→ AUTH-DB-031
```

`AUTH-DB-027` acompaña cada paquete físico. La migración multi-repositorio
no puede completarse antes de resolver contexto, demostrar frescura e invalidación, evaluar, persistir, adaptar
RPC y RLS, demostrar rollback y bloquear nuevos consumos legacy.
<!-- SHELL-AUTH-CANONICAL:END -->

FASE 4 — HABILITADORES TRANSVERSALES

26. BLOQUE F — ANIMA
27. BLOQUE G — VISO como administrador del modelo
28. SUBBLOQUE G2 — VISO Core
29. BLOQUE H2 — SHELL como aplicación
30. Ejecutar AUTH-UI-040 a AUTH-UI-051
31. BLOQUE P — Dispositivos compartidos
32. BLOQUE Q — Simulación estricta
32A. BLOQUE Z — Tecnología y soporte como habilitador transversal

Secuencia interna recomendada:

```text
TI-DOM-001 a TI-DOM-013
→ TI-AUTH-001 a TI-AUTH-004
→ TI-UX-001 a TI-UX-006
→ TI-INT-001 a TI-INT-003
```

Reglas:

- el modelo operativo, los recursos y los ciclos se definen antes de la experiencia;
- la autorización precede accesos privilegiados, soporte remoto y configuración sensible;
- red, dispositivos, impresión y soporte mínimos deberán estar listos antes de los pilotos que dependan de ellos;
- el BLOQUE Z no sustituye AUTH-DEV, PRINT-ARC, BLOQUE T, BLOQUE X ni continuidad.

32B. BLOQUE AA — Gobierno de información como habilitador transversal

Secuencia interna recomendada:

```text
INFO-DOM-001
→ INFO-DOM-002 e INFO-DOM-003
→ INFO-DOM-004 a INFO-DOM-013
→ INFO-AUTH-001 a INFO-AUTH-004
→ INFO-UX-001 a INFO-UX-006
→ INFO-INT-001 a INFO-INT-003
```

Reglas:

- inventario, responsables y finalidades se definen primero;
- clasificación y taxonomía preceden bibliotecas, búsquedas y exportaciones;
- INFO-DOM-006 deberá aprobarse antes de eliminación o disposición automatizada;
- INFO-DOM-008 e INFO-DOM-009 deberán aprobarse antes de ampliar el tratamiento de datos personales;
- eliminar una cuenta no autoriza eliminar expedientes sujetos a conservación.

32C. BLOQUE AB — Analítica, indicadores y datos maestros como habilitador transversal

Secuencia interna recomendada:

```text
DATA-DOM-001 a DATA-DOM-003
→ DATA-DOM-004 a DATA-DOM-008
→ DATA-DOM-009 a DATA-DOM-013
→ DATA-DOM-014 a DATA-DOM-017
→ DATA-AUTH-001 a DATA-AUTH-004
→ DATA-UX-001 a DATA-UX-008
→ DATA-INT-001 a DATA-INT-004
```

Reglas:

- cada dominio conserva su fuente de verdad y el BLOQUE AB no crea una tabla maestra universal;
- DATA-DOM-001 a DATA-DOM-003 preceden fusiones, migraciones y crosswalks;
- DATA-DOM-004 precede la declaración de cualquier KPI oficial;
- DATA-DOM-006 y DATA-DOM-007 preceden la certificación de reportes;
- ninguna pantalla podrá definir una fórmula local competidora;
- señal, hipótesis, correlación y causa confirmada deberán permanecer separadas;
- una acción de mejora no se cerrará sin comprobar resultados;
- DATA-INT-004 precede el envío de datos a BI, hojas externas o inteligencia artificial;
- la inteligencia artificial actúa como asistente y no como autoridad empresarial.


AUTH-UI-040 a AUTH-UI-051 implementa:

ocultamiento de enlaces;
bloqueo de URL;
bloqueo de acciones;
protección de servidor;
navegación autorizada;
contexto activo;
simulación;
estados sin acceso;
carga;
vacíos;
errores recuperables.

AUTH-UI-052 a AUTH-UI-060 se ejecutará después,
aplicación por aplicación.

Regla de migración progresiva por aplicación

Antes o durante la implementación de cada aplicación deberá ejecutarse
el paquete R2 correspondiente a sus dominios y fuentes de verdad.

Cada paquete deberá incluir:

- estructuras objetivo;
- compatibilidad temporal;
- dry-run de normalización cuando corresponda;
- detección y resolución de colisiones;
- backfill;
- reconciliación;
- RLS y grants;
- RPC o vistas expuestas;
- tipos generados;
- wrappers compartidos;
- adaptación de consumidores;
- pruebas;
- medición;
- rollback.

No será obligatorio mover todo un dominio antes de comenzar a mejorar
una aplicación si el paquete aprobado permite una transición segura.

Tampoco podrá declararse migrado un dominio mientras alguna aplicación
continúe escribiendo sin control sobre su estructura legacy.

HABILITADOR TEMPORAL — INTEGRACIÓN CON POS EXTERNO

La integración temporal del POS podrá comenzar antes de implementar PULSO
completo cuando se hayan aprobado y ejecutado:

- INT-EXT aplicable;
- INT-POS-001 a INT-POS-014;
- contratos de venta y línea en BLOQUE H;
- almacenamiento seguro de secretos;
- staging de payloads;
- mapeos de sedes y productos;
- restricciones de idempotencia;
- pruebas de reintentos;
- rollback;
- piloto sin efectos.

Orden:

1. Obtener documentación y credencial de pruebas.
2. Importar ventas sin efectos.
3. Validar payloads e idempotencia.
4. Completar mapeos de sedes y productos.
5. Conciliar ventas importadas.
6. Habilitar NEXO en piloto controlado.
7. Habilitar NUMERA en piloto controlado.
8. Habilitar PASS únicamente cuando corresponda.
9. Mantener conciliación periódica.
10. Sustituir posteriormente la fuente externa por PULSO.


Este habilitador:

- no aprueba PULSO;
- no autoriza facturación propia;
- no convierte a NUMERA en sistema fiscal;
- no entrega acceso del proveedor a Supabase;
- no permite descontar inventario sin mapeo;
- no elimina la necesidad de recetas para productos preparados.

FASE 5 — NEXO

33. Consumir la matriz E1 y auditar implementación real de NEXO
34. Aprobar alcance de catálogo, inventario, LOC, LPN, activos, reutilizables, repuestos, flota y logística
35. Ejecutar SUBBLOQUE K2 completo, incluidas NEXO-DOM-019 a NEXO-DOM-038, NEXO-AUTH-021 a NEXO-AUTH-032 y NEXO-UX-026 a NEXO-UX-048
36. Ejecutar AUTH-UI-052 a AUTH-UI-060 y validar prototipos por actor, dispositivo y subdominio
37. Aprobar paquetes E5 de NEXO con archivos, datos, autorización, eventos, impresión, pruebas y rollback
38. Implementar funcionalidad, pantallas, acciones, datos, autorización, contratos y seguridad de NEXO
39. Completar readiness operativo, integraciones y servicios transversales requeridos
40. Ejecutar cutover, pilotos operativos, conciliación e hypercare
41. Aprobar NEXO por procesos y subdominios con evidencia de cierre

FASE 6 — FOGO Y ORIGO

42. Auditar y diseñar FOGO, incluyendo `OPS-REC-001`, `OPS-PRD-001` y `OPS-TRZ-001`
43. Auditar y diseñar ORIGO
44. Ejecutar AUTH-UI-052 a AUTH-UI-060 y validar prototipos de FOGO y ORIGO
45. Aprobar paquetes E5 de FOGO y ORIGO
46. Implementar funcionalidad, datos, autorización y seguridad de FOGO
47. Implementar funcionalidad, datos, autorización y seguridad de ORIGO
48. Implementar INT-PROD — FOGO ↔ NEXO e INT-PROC — ORIGO → NEXO → NUMERA
49. Completar readiness y ejecutar pilotos por proceso
50. Ejecutar conciliación, correcciones e hypercare
51. Aprobar FOGO y ORIGO con evidencia de cierre

FOGO y ORIGO podrán avanzar en paralelo después de estabilizar
los contratos de productos, presentaciones, existencias y movimientos
propiedad de NEXO.

FASE 7 — PULSO

52. Auditar venta, caja, pagos, mesas, comandas, preparación, entrega y salón, y ejecutar `OPS-POS-001` antes del diseño detallado del POS
53. Ejecutar SUBBLOQUE N2 — Procesos y experiencia de PULSO
54. Ejecutar AUTH-UI-052 a AUTH-UI-060 y validar prototipos por actor y dispositivo
55. Aprobar paquetes E5 de PULSO
56. Implementar funcionalidad, datos, autorización, seguridad e INT-SALES de PULSO
57. Completar readiness y ejecutar piloto progresivo en sedes satélite
58. Ejecutar conciliación, correcciones e hypercare
59. Aprobar PULSO con evidencia de cierre

FASE 8 — NUMERA

60. Consumir la matriz E1, ejecutar NUMERA-AUD-001 a NUMERA-AUD-012 y resolver `OPS-CST-001` antes de cerrar el alcance financiero objetivo
61. Aprobar alcance ejecutivo, analítico, financiero y contable de NUMERA
62. Ejecutar NUMERA-DOM-001 a NUMERA-DOM-015, SUBBLOQUE O2 y AUTH-UI-052 a AUTH-UI-060
63. Aprobar prototipos y paquetes E5 de NUMERA
64. Implementar funcionalidad, datos, autorización, contratos y seguridad de NUMERA
65. Integrar eventos, conciliaciones y fuentes aprobadas de ORIGO, FOGO, NEXO y ventas
66. Completar readiness y ejecutar piloto, conciliación e hypercare con contabilidad y dirección
67. Aprobar NUMERA únicamente con cobertura, diferencias y evidencia documentadas

FASE 9 — VISO COMPLETO

68. Ejecutar SUBBLOQUE G3 — Experiencia administrativa de VISO
69. Ejecutar AUTH-UI-052 a AUTH-UI-060 y validar prototipos por rol
70. Aprobar paquetes E5 de VISO
71. Implementar reorganización funcional, autorización y administración por dominios
72. Integrar auditoría consolidada y vista previa por trabajador
73. Completar readiness y ejecutar piloto con cada rol administrativo
74. Ejecutar correcciones e hypercare
75. Aprobar VISO completo con evidencia de cierre

FASE 10 — PASS

76. Ejecutar BLOQUE V — PASS e integración con el dominio laboral
77. Diseñar y validar la experiencia del cliente
78. Aprobar paquetes E5 de PASS
79. Implementar acumulación y redención desde la fuente comercial vigente sin duplicar identidad, saldo ni efectos
80. Probar identidad cliente, seguridad, datos, integraciones y readiness
81. Ejecutar piloto progresivo de fidelización
82. Ejecutar conciliación, correcciones e hypercare
83. Aprobar PASS con evidencia de cierre

FASE 11 — TALENTO

84. Completar `CAP-TAL-001` a `CAP-TAL-006` dentro de E2
85. Materializar BLOQUE Y y su roadmap propio únicamente después de la puerta definida en `CAP-TAL-006`
86. Auditar y reconciliar la base técnica existente antes de adoptarla
87. Aprobar prototipos, contratos TALENTO → VISO → ANIMA y paquetes E5
88. Implementar y pilotear sin conceder acceso laboral antes de la vinculación autorizada

FASE 12 — AURA

89. Ejecutar BLOQUE W — AURA como aplicación diferida
90. Completar auditoría funcional
91. Decidir continuidad, reemplazo o retiro
92. Crear roadmap propio y paquetes E5 únicamente si continúa
93. No ampliar permisos ni procesos antes de la decisión

FASE 13 — CIERRE TRANSVERSAL

94. Completar y validar BLOQUE X de extremo a extremo
95. Confirmar idempotencia, reintentos y compensaciones
96. Confirmar que no existan registros manuales duplicados
97. Completar BLOQUE T — CI, versionado y despliegue
98. Ejecutar BLOQUE U — Pruebas integrales
99. Ejecutar pruebas de seguridad
100. Ejecutar pruebas funcionales
101. Ejecutar pruebas de experiencia
102. Ejecutar pruebas de integración
103. Validar rollback por aplicación
104. Ejecutar validación final de AUTH-DB-029 — respaldo, restauración y rollback
105. Ejecutar AUTH-DB-030 — retiro controlado de objetos legacy
106. Ejecutar AUTH-DB-031 — certificación de paridad documental, técnica y operativa
107. Confirmar ausencia de drift entre vento-shell, local, staging y producción
108. Certificar reglas de normalización, diccionarios, excepciones, backfills e idempotencia
109. Confirmar inventario, almacenamiento, rotación y revocación de credenciales externas
110. Confirmar que no existan secretos en código, frontend, logs ni tablas expuestas
111. Confirmar estado final del POS externo: vigente, reemplazado por PULSO o retirado
112. Confirmar conciliación entre ventas, inventario, NUMERA y PASS
113. Aprobar cierre documental y operativo

Regla de avance:

DEFINICIÓN
→ AUDITORÍA FUNCIONAL
→ ARQUITECTURA DE DATOS
→ DISEÑO
→ PROTOTIPO
→ AUTORIZACIÓN
→ SEGURIDAD DE SERVIDOR
→ IMPLEMENTACIÓN
→ INTEGRACIÓN
→ PILOTO
→ CORRECCIÓN
→ APROBACIÓN

No se considerará finalizada una aplicación únicamente porque:

compile;
despliegue;
tenga rutas;
tenga tablas;
tenga permisos;
tenga infraestructura parcial.

Una aplicación se considerará finalizada cuando:

sus procesos estén conectados;
sus fuentes de verdad y contratos de datos estén definidos;
cada actor vea la experiencia correcta;
las acciones estén protegidas;
las integraciones sean idempotentes;
la trazabilidad sea completa;
el piloto operativo haya sido aprobado.
