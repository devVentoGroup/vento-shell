## Orden de implementación recomendado

FASE 1 — DEFINICIÓN CANÓNICA

1. BLOQUE A — Auditoría integral
2. BLOQUE B — Modelo definitivo
3. BLOQUE C — Catálogo canónico
4. BLOQUE D — Matrices y datasets de la versión contractual base
5. BLOQUE E — Contexto y decisión unificada

FASE 2 — DESCUBRIMIENTO, ARQUITECTURA FUNCIONAL, DATOS Y PREPARACIÓN DE IMPLEMENTACIÓN

6. BLOQUE E1 — Auditar operación real, capacidades, dominios y cobertura de implementación
7. Aprobar línea base de capacidades, registro de brechas y matriz de cobertura por repositorio
8. BLOQUE E2 — Diseñar procesos TO-BE, actores, pantallas, experiencia y requisitos no funcionales
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

FASE 3 — FUNDACIÓN COMPARTIDA, DATOS Y SEGURIDAD

19. BLOQUE H — Crear la fundación de VENTO-SHELL como núcleo compartido
20. Crear contratos, eventos, normalización compartida, helpers puros y estructura inicial de @vento/supabase
21. Ejecutar AUTH-UI-030 a AUTH-UI-039
22. BLOQUE T — Establecer CI, pruebas, staging, drift y rollback base
23. BLOQUE J — Inventariar y proteger acciones de servidor
24. BLOQUE R — Ejecutar R0, R1 y los primeros paquetes aprobados de R2
25. BLOQUE S — Mensajes y experiencia de bloqueo

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

FASE 4 — HABILITADORES TRANSVERSALES

26. BLOQUE F — ANIMA
27. BLOQUE G — VISO como administrador del modelo
28. SUBBLOQUE G2 — VISO Core
29. BLOQUE H2 — SHELL como aplicación
30. Ejecutar AUTH-UI-040 a AUTH-UI-051
31. BLOQUE P — Dispositivos compartidos
32. BLOQUE Q — Simulación estricta

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

```text
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
```

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
35. Ejecutar SUBBLOQUE K2 completo, incluidas NEXO-DOM-019 a NEXO-DOM-028 y NEXO-UX-026 a NEXO-UX-042
36. Ejecutar AUTH-UI-052 a AUTH-UI-060 y validar prototipos por actor, dispositivo y subdominio
37. Aprobar paquetes E5 de NEXO con archivos, datos, autorización, eventos, impresión, pruebas y rollback
38. Implementar funcionalidad, pantallas, acciones, datos, autorización, contratos y seguridad de NEXO
39. Completar readiness operativo, integraciones y servicios transversales requeridos
40. Ejecutar cutover, pilotos operativos, conciliación e hypercare
41. Aprobar NEXO por procesos y subdominios con evidencia de cierre

FASE 6 — FOGO Y ORIGO

42. Auditar y diseñar FOGO
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

52. Auditar venta, caja, pagos, mesas, comandas, preparación, entrega y salón
53. Ejecutar SUBBLOQUE N2 — Procesos y experiencia de PULSO
54. Ejecutar AUTH-UI-052 a AUTH-UI-060 y validar prototipos por actor y dispositivo
55. Aprobar paquetes E5 de PULSO
56. Implementar funcionalidad, datos, autorización, seguridad e INT-SALES de PULSO
57. Completar readiness y ejecutar piloto progresivo en sedes satélite
58. Ejecutar conciliación, correcciones e hypercare
59. Aprobar PULSO con evidencia de cierre

FASE 8 — NUMERA

60. Consumir la matriz E1 y ejecutar NUMERA-AUD-001 a NUMERA-AUD-012
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

FASE 11 — AURA

84. Ejecutar BLOQUE W — AURA como aplicación diferida
85. Completar auditoría funcional
86. Decidir continuidad, reemplazo o retiro
87. Crear roadmap propio y paquetes E5 únicamente si continúa
88. No ampliar permisos ni procesos antes de la decisión

FASE 12 — CIERRE TRANSVERSAL

89. Completar y validar BLOQUE X de extremo a extremo
90. Confirmar idempotencia, reintentos y compensaciones
91. Confirmar que no existan registros manuales duplicados
92. Completar BLOQUE T — CI, versionado y despliegue
93. Ejecutar BLOQUE U — Pruebas integrales
94. Ejecutar pruebas de seguridad
95. Ejecutar pruebas funcionales
96. Ejecutar pruebas de experiencia
97. Ejecutar pruebas de integración
98. Validar rollback por aplicación
99. Ejecutar validación final de AUTH-DB-029 — respaldo, restauración y rollback
100. Ejecutar AUTH-DB-030 — retiro controlado de objetos legacy
101. Ejecutar AUTH-DB-031 — certificación de paridad documental, técnica y operativa
102. Confirmar ausencia de drift entre vento-shell, local, staging y producción
103. Certificar reglas de normalización, diccionarios, excepciones, backfills e idempotencia
104. Confirmar inventario, almacenamiento, rotación y revocación de credenciales externas
105. Confirmar que no existan secretos en código, frontend, logs ni tablas expuestas
106. Confirmar estado final del POS externo: vigente, reemplazado por PULSO o retirado
107. Confirmar conciliación entre ventas, inventario, NUMERA y PASS
108. Aprobar cierre documental y operativo

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
