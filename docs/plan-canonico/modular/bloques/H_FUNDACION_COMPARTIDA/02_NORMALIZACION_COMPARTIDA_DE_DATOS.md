### NORMALIZACIÓN COMPARTIDA DE DATOS

### [ ] SHELL-NORM-001 Crear `@vento/data-normalization`
### [ ] SHELL-NORM-002 Centralizar tipos de campo normalizable
### [ ] SHELL-NORM-003 Centralizar reglas de espacios, Unicode y capitalización
### [ ] SHELL-NORM-004 Centralizar conectores y excepciones
### [ ] SHELL-NORM-005 Centralizar diccionarios ortográficos versionados
### [ ] SHELL-NORM-006 Crear normalización de búsqueda y comparación
### [ ] SHELL-NORM-007 Crear previsualización de transformaciones
### [ ] SHELL-NORM-008 Crear metadatos de versión y auditoría de reglas
### [ ] SHELL-NORM-009 Probar idempotencia y conservación semántica

Regla:

`@vento/data-normalization`
→ contiene funciones puras, tipos, diccionarios y validadores compartidos

BLOQUE R
→ implementa únicamente persistencia, backfills, funciones SQL,
  constraints, índices y triggers defensivos

### [ ] SHELL-DB-001 Crear @vento/supabase
### [ ] SHELL-DB-002 Centralizar tipos generados por cada paquete de base de datos aprobado
### [ ] SHELL-DB-003 Crear y actualizar wrappers tipados para RPC canónicas
### [ ] SHELL-DB-004 Normalizar errores de Supabase
### [ ] SHELL-DB-005 Separar cliente server, browser y native

Regla de sincronización con BLOQUE R

SHELL-DB-001, SHELL-DB-004 y SHELL-DB-005
→ pueden establecer la infraestructura inicial del paquete compartido

SHELL-DB-002 y SHELL-DB-003
→ se ejecutan incrementalmente con AUTH-DB-026
→ se actualizan después de cada paquete contractual del BLOQUE R
→ no se consideran terminadas hasta completar la certificación final

### [ ] SHELL-UI-001 Crear @vento/ui-web
### [ ] SHELL-UI-002 Compartir Alert
### [ ] SHELL-UI-003 Compartir Button
### [ ] SHELL-UI-004 Compartir Card
### [ ] SHELL-UI-005 Compartir EmptyState
### [ ] SHELL-UI-006 Compartir indicador de contexto
### [ ] SHELL-UI-007 Compartir selector de sede
### [ ] SHELL-UI-008 Compartir selector de área
### [ ] SHELL-UI-009 Compartir aviso de rol simulado
### [ ] SHELL-UI-010 Evaluar AppShell compartido

### [ ] SHELL-UI-011 Compartir navegación orientada a tareas
### [ ] SHELL-UI-012 Compartir línea de estados de proceso
### [ ] SHELL-UI-013 Compartir panel de acción principal
### [ ] SHELL-UI-014 Compartir confirmaciones de acciones sensibles
### [ ] SHELL-UI-015 Compartir diagnóstico de contexto
### [ ] SHELL-UI-016 Compartir estados de error recuperable
### [ ] SHELL-UI-017 Compartir patrón para tablet
### [ ] SHELL-UI-018 Compartir patrón para kiosco
### [ ] SHELL-UI-019 Compartir patrón de proceso interrumpido
### [ ] SHELL-UI-020 Compartir patrón de traspaso entre aplicaciones

### [ ] SHELL-NATIVE-001 Crear tokens compatibles con ANIMA
### [ ] SHELL-NATIVE-002 Compartir contratos y validadores
### [ ] SHELL-NATIVE-003 Mantener UI React Native separada

No se debe empezar trasladando el AppShell completo. Primero deben compartirse contratos, códigos, tipos, eventos y helpers puros.

No deberán compartirse inicialmente:

páginas completas;
formularios específicos de dominio;
procesos empresariales completos;
consultas propias de una aplicación;
componentes que obliguen a todas las aplicaciones a tener la misma interfaz.
