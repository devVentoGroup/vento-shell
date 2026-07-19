## Orden de implementación recomendado

FASE 1 — DEFINICIÓN CANÓNICA

1. BLOQUE A — Auditoría integral
2. BLOQUE B — Modelo definitivo
3. BLOQUE C — Catálogo canónico
4. BLOQUE D — Matrices definitivas
5. BLOQUE E — Contexto y decisión unificada

FASE 2 — ARQUITECTURA FUNCIONAL, DATOS Y AUDITORÍA DE SUPERFICIES

6. BLOQUE E2 — Procesos, actores, pantallas y experiencia transversal
7. Ejecutar AUTH-UI-001 a AUTH-UI-029
8. Aprobar catálogo de procesos
9. Aprobar propiedad funcional de cada proceso
10. Aprobar contrato transversal de pantallas
11. BLOQUE X — Definir integraciones internas, externas, credenciales técnicas y eventos empresariales
12. Aprobar traspasos entre aplicaciones y contrato canónico de ventas
13. Aprobar integración temporal del POS externo
14. BLOQUE E3 — Auditar Supabase, normalización y calidad de datos
15. Aprobar mapa de dominios, fuentes de verdad y propietarios
16. Aprobar arquitectura de esquemas, Auth, acceso, Storage, Realtime y automatizaciones
17. Aprobar política canónica de normalización
18. Aprobar plan de transición y roadmap de migraciones en `vento-shell`

En esta fase se define:

qué proceso existe;
qué aplicación es propietaria;
qué actor participa;
qué pantallas existen;
qué eventos se producen;
qué aplicaciones y sistemas externos emiten o consumen esos eventos;
qué contratos canónicos desacoplan a los proveedores externos;
qué credenciales técnicas y scopes requiere cada integración;
qué reglas de normalización aplican a cada dato;
qué dominio conserva cada fuente de verdad;
cómo se organiza y protege Supabase;
cómo se migrará sin romper consumidores existentes.

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

33. Auditar procesos y pantallas de NEXO
34. Ejecutar SUBBLOQUE K2 — Procesos y experiencia de NEXO
35. Ejecutar AUTH-UI-052 a AUTH-UI-060 para NEXO
36. Aprobar prototipos de NEXO
37. Implementar BLOQUE K — Autorización de NEXO
38. Implementar contratos de eventos emitidos y consumidos por NEXO, incluida la salida derivada de ventas externas canónicas
39. Ejecutar piloto operativo
40. Corregir hallazgos
41. Aprobar NEXO

FASE 6 — FOGO Y ORIGO

42. Auditar y diseñar FOGO
43. Auditar y diseñar ORIGO
44. Ejecutar AUTH-UI-052 a AUTH-UI-060 para FOGO y ORIGO
45. Implementar autorización y seguridad de FOGO
46. Implementar autorización y seguridad de ORIGO
47. Implementar INT-PROD — FOGO ↔ NEXO
48. Implementar INT-PROC — ORIGO → NEXO → NUMERA
49. Ejecutar pilotos por proceso
50. Corregir hallazgos
51. Aprobar FOGO y ORIGO

FOGO y ORIGO podrán avanzar en paralelo después de estabilizar
los contratos de productos, presentaciones, existencias y movimientos
propiedad de NEXO.

FASE 7 — PULSO

52. Auditar venta, caja, pagos y salón
53. Ejecutar SUBBLOQUE N2 — Procesos y experiencia de PULSO
54. Ejecutar AUTH-UI-052 a AUTH-UI-060 para PULSO
55. Implementar autorización y seguridad de PULSO
56. Implementar INT-SALES — PULSO adopta el contrato canónico de ventas y sustituye progresivamente al POS externo
57. Ejecutar piloto en sedes satélite
58. Corregir hallazgos
59. Aprobar PULSO

FASE 8 — NUMERA

60. Auditar procesos financieros
61. Ejecutar SUBBLOQUE O2 — Procesos y experiencia de NUMERA
62. Ejecutar AUTH-UI-052 a AUTH-UI-060 para NUMERA
63. Implementar autorización y seguridad de NUMERA
64. Consumir eventos de ORIGO, FOGO, NEXO y del contrato canónico de ventas emitido por la fuente vigente
65. Ejecutar piloto con contabilidad y dirección
66. Corregir hallazgos
67. Aprobar NUMERA

FASE 9 — VISO COMPLETO

68. Ejecutar SUBBLOQUE G3 — Experiencia administrativa de VISO
69. Ejecutar AUTH-UI-052 a AUTH-UI-060 para VISO
70. Reorganizar administración por dominios
71. Integrar auditoría consolidada
72. Integrar vista previa por trabajador
73. Probar con cada rol administrativo
74. Corregir hallazgos
75. Aprobar VISO completo

FASE 10 — PASS

76. Ejecutar BLOQUE V — PASS e integración con el dominio laboral
77. Diseñar experiencia del cliente
78. Implementar acumulación desde el contrato canónico de ventas emitido por la fuente vigente
79. Implementar redención mediante la fuente comercial vigente sin duplicar identidad, saldo ni efectos
80. Probar identidad cliente separada del dominio laboral
81. Ejecutar piloto de fidelización
82. Corregir hallazgos
83. Aprobar PASS

FASE 11 — AURA

84. Ejecutar BLOQUE W — AURA como aplicación diferida
85. Completar auditoría funcional
86. Decidir continuidad, reemplazo o retiro
87. Crear roadmap propio únicamente si continúa
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

