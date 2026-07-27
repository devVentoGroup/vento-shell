## ROADMAP MAESTRO

**Autorización, capacidades, operación, datos, procesos, pantallas, integraciones y experiencia Vento**

Este roadmap contempla once aplicaciones canónicas actuales, futuras o diferidas del ecosistema:

shell
anima
viso
nexo
fogo
origo
pulso
numera
talento
aura
pass

Clasificación vigente:

APLICACIONES NÚCLEO DEL DOMINIO LABORAL
shell
anima
viso
nexo
fogo
origo
pulso
numera

APLICACIONES LABORALES FUTURAS O DIFERIDAS
talento
aura

APLICACIÓN ADYACENTE DEL DOMINIO CLIENTE
pass

Repositorios técnicos actualmente reconocidos:

vento-shell
vento-anima
vento-viso
vento-nexo
vento-fogo
vento-origo
vento-pulso
vento-numera
vento-talento
vento-pass

TALENTO conserva un repositorio técnico y una base remota parcial, pero su
alcance funcional objetivo se diseñará en E2 antes de autorizar implementación.

AURA no tiene repositorio ni implementación funcional confirmada. Deberá
mantenerse diferida hasta decidir formalmente su continuidad, reemplazo o retiro.

Separación obligatoria:

shell
→ aplicación y hub de Vento OS

vento-shell
→ repositorio técnico, migraciones y paquetes compartidos

pass
→ aplicación del dominio cliente

vento-pass
→ repositorio técnico de Vento Pass

Arquitectura objetivo:

VISO
→ administra trabajadores, perfiles, sedes, áreas, turnos,
  roles, permisos, excepciones y configuración transversal

ANIMA
→ consulta turnos, registra asistencia e inicia o termina
  el contexto operativo cuando corresponda

TALENTO
→ administra la experiencia previa a la vinculación laboral: vacantes,
  postulaciones, expediente progresivo, evaluación, decisión y traspaso
  autorizado hacia VISO y ANIMA

Supabase
→ conserva y ejecuta las fuentes de verdad de identidad, contexto,
  autorización, procesos, estados y auditoría mediante una arquitectura
  gobernada de esquemas, Auth, tablas, relaciones, RLS, RPC, Storage,
  Realtime, automatizaciones y eventos

SHELL
→ presenta el hub contextual y las aplicaciones disponibles
  para el actor efectivo

VENTO-SHELL
→ conserva migraciones, contratos, permisos, helpers,
  eventos empresariales y componentes compartidos

NEXO
→ administra catálogo de productos, inventario, ubicaciones, LPN,
  contenedores, activos reutilizables, repuestos, movimientos,
  custodia y logística

FOGO
→ administra planificación y ejecución productiva

ORIGO
→ administra abastecimiento, compras, proveedores y recepción

PULSO
→ administra ventas, caja, pagos, salón y operación comercial

NUMERA
→ administra y consolida información financiera y analítica

PASS
→ administra la experiencia de fidelización del cliente,
  sin depender del RBAC laboral para su acceso normal

AURA
→ conserva su identidad canónica como aplicación administrativa
  diferida hasta completar su auditoría funcional

Principio transversal:

CAPACIDAD EMPRESARIAL
→ define qué resultado debe poder producir Vento Group,
  aunque todavía no exista en código, datos o pantallas

AUTORIZACIÓN
→ define quién puede ejecutar una capacidad

PROCESO
→ define qué resultado empresarial se busca

DATOS
→ definen la fuente de verdad, relaciones, estados, exposición,
  retención y trazabilidad del proceso

CALIDAD DE DATOS
→ define normalización, validación, deduplicación, corrección controlada,
  búsqueda, conservación del significado y tratamiento de excepciones

CREDENCIAL TÉCNICA
→ autentica una integración o proceso de sistema mediante alcance mínimo,
  almacenamiento seguro, rotación, revocación y auditoría

PANTALLA
→ presenta la información y acciones necesarias

INTEGRACIÓN
→ transfiere el resultado a la siguiente aplicación

EXPERIENCIA
→ permite completar el trabajo de forma simple,
  comprensible, segura y trazable

La base operativa ya existe parcialmente: roles operativos por sede,
perfiles por trabajador, permisos operativos, contexto por turno,
funciones de autorización, procesos y aplicaciones funcionales.

Supabase también ha crecido de forma incremental y contiene objetos,
funciones, políticas y fuentes de verdad que deberán evaluarse como un
sistema integral, no únicamente desde la perspectiva de autorización.

Debe auditarse, consolidarse, simplificarse y extenderse a todo el
ecosistema. No deberá reconstruirse desde cero ni duplicarse entre
aplicaciones o esquemas.

El roadmap no se considerará integral hasta completar BLOQUE E1.

BLOQUE E1 deberá confrontar:

- operación real;
- procesos manuales;
- documentos y herramientas externas;
- código actual;
- datos actuales;
- pantallas actuales;
- infraestructura parcial;
- capacidades todavía ausentes.

Una función no se considerará cubierta por existir únicamente como tabla,
permiso, ruta, componente o prototipo.

Separación obligatoria de diseño:

```text
BLOQUE E1
→ AS-IS: operación actual, capacidades, brechas y cobertura

BLOQUE E2
→ TO-BE: procesos, actores, pantallas y experiencia objetivo

BLOQUES E3, E4, X Y ROADMAPS POR APLICACIÓN
→ pueden devolver nuevas brechas o dependencias a E1 y E2

BLOQUE E5
→ convierte el diseño aprobado en paquetes y planes de ejecución aprobables

BLOQUE T + BLOQUE R CUANDO APLIQUE
→ implementan y despliegan cada paquete aprobado

READINESS, CUTOVER, PILOTO E HYPERCARE
→ se ejecutan mediante `SHELL-CI-021` a `SHELL-CI-024`
```

### Distribución canónica de tareas derivadas de OPS-AUD-001

| Responsabilidad                  | Tareas                                                                       | Bloque                                |
| -------------------------------- | ---------------------------------------------------------------------------- | ------------------------------------- |
| Evidencia y línea base AS-IS     | `OPS-ADM-001`, `OPS-GOV-001`, `OPS-ACT-001`, `OPS-PLAN-001` a `OPS-PLAN-004` | E1                                    |
| Procesos transversales TO-BE     | `OPS-CAN-001`, `OPS-LOG-001`, `OPS-B2B-001`                                  | E2                                    |
| Diseño productivo                | `OPS-REC-001`, `OPS-PRD-001`, `OPS-TRZ-001`                                  | FOGO, con salidas a NEXO, E4 y NUMERA |
| Configuración comercial por sede | `OPS-POS-001`                                                                | PULSO                                 |
| Caso financiero de producción    | `OPS-CST-001`                                                                | NUMERA                                |

Una tarea derivada conserva su identificador transversal `OPS-*`, pero se
materializa en el bloque que posee su resultado. El prefijo no determina por sí
solo el bloque propietario.

Ningún mapa se considera inmutable hasta cerrar el diseño objetivo y sus
dependencias contractuales, técnicas y operativas.

### Estructura de bloques del roadmap maestro

| Bloque | Responsabilidad                                                           |
| ------ | ------------------------------------------------------------------------- |
| A      | Auditoría integral inicial de autorización                                |
| B      | Modelo definitivo de identidad y autorización                             |
| C      | Catálogo canónico de permisos                                             |
| D      | Matrices, revisión contractual y datasets                                 |
| E      | Contexto efectivo y decisión unificada                                    |
| E1     | Descubrimiento de operación, capacidades y cobertura                      |
| E2     | Procesos, actores, pantallas y experiencia                                |
| E3     | Arquitectura y gobierno integral de Supabase                              |
| E4     | Colas, impresión, notificaciones y evidencia                              |
| E5     | Planificación de paquetes, readiness, cutover, piloto e hypercare         |
| F      | ANIMA                                                                     |
| G      | VISO                                                                      |
| H      | VENTO-SHELL como núcleo compartido                                        |
| H2     | SHELL como aplicación y hub                                               |
| I      | Navegación, pantallas y autorización de vistas                            |
| J      | Acciones de servidor y seguridad real                                     |
| K      | NEXO                                                                      |
| L      | FOGO                                                                      |
| M      | ORIGO                                                                     |
| N      | PULSO                                                                     |
| O      | NUMERA                                                                    |
| P      | Dispositivos compartidos                                                  |
| Q      | Simulación estricta                                                       |
| R      | Implementación física y migraciones de Supabase                           |
| S      | Mensajes y experiencia de bloqueo                                         |
| T      | Calidad, CI y despliegue                                                  |
| U      | Pruebas integrales                                                        |
| V      | PASS                                                                      |
| W      | AURA                                                                      |
| X      | Integraciones internas y externas                                         |
| Y      | TALENTO — candidatos, selección y vinculación previa a ANIMA              |
| Z      | Tecnología, dispositivos, redes, impresión, soporte y seguridad técnica   |
| AA     | Gobierno de información, privacidad, documentos, conservación y auditoría |
| AB     | Analítica, indicadores, calidad de datos y datos maestros                 |
| AC     | Continuidad operativa, contingencia, incidentes, respaldo y recuperación  |

Secuencia transversal de un paquete:

```text
E5-GATE-008 — APROBACIÓN PREVIA
→ SHELL-CI-020 — IMPLEMENTACIÓN Y DESPLIEGUE
→ SHELL-CI-021 — READINESS DE EJECUCIÓN
→ SHELL-CI-022 — CUTOVER Y PILOTO
→ SHELL-CI-023 — HYPERCARE
→ SHELL-CI-024 — CIERRE Y TRANSFERENCIA
→ BLOQUE U — CERTIFICACIÓN INTEGRAL APLICABLE
```
