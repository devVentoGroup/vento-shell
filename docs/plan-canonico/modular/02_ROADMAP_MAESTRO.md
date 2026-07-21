## ROADMAP MAESTRO

**Autorización, capacidades, operación, datos, procesos, pantallas, integraciones y experiencia Vento**

Este roadmap cubre las diez aplicaciones canónicas del ecosistema:

shell
anima
viso
nexo
fogo
origo
pulso
numera
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

APLICACIÓN LABORAL DIFERIDA
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
vento-pass

AURA deberá auditarse antes de confirmar su repositorio propietario,
su continuidad o su implementación futura.

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
→ convierte el diseño aprobado en paquetes implementables
```

Ningún mapa se considera inmutable hasta cerrar el diseño objetivo y sus
dependencias contractuales, técnicas y operativas.

### Estructura de bloques del roadmap maestro

| Bloque | Responsabilidad |
| --- | --- |
| A | Auditoría integral inicial de autorización |
| B | Modelo definitivo de identidad y autorización |
| C | Catálogo canónico de permisos |
| D | Matrices, revisión contractual y datasets |
| E | Contexto efectivo y decisión unificada |
| E1 | Descubrimiento de operación, capacidades y cobertura |
| E2 | Procesos, actores, pantallas y experiencia |
| E3 | Arquitectura y gobierno integral de Supabase |
| E4 | Colas, impresión, notificaciones y evidencia |
| E5 | Paquetes de implementación, readiness, cutover e hypercare |
| F | ANIMA |
| G | VISO |
| H | VENTO-SHELL como núcleo compartido |
| H2 | SHELL como aplicación y hub |
| I | Navegación, pantallas y autorización de vistas |
| J | Acciones de servidor y seguridad real |
| K | NEXO |
| L | FOGO |
| M | ORIGO |
| N | PULSO |
| O | NUMERA |
| P | Dispositivos compartidos |
| Q | Simulación estricta |
| R | Implementación física y migraciones de Supabase |
| S | Mensajes y experiencia de bloqueo |
| T | Calidad, CI y despliegue |
| U | Pruebas integrales |
| V | PASS |
| W | AURA |
| X | Integraciones internas y externas |
