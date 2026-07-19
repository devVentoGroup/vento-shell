## BLOQUE H

**VENTO-SHELL como núcleo compartido**

### [ ] SHELL-AUD-001 Buscar código duplicado entre repositorios
### [ ] SHELL-AUD-002 Comparar guards de autenticación
### [ ] SHELL-AUD-003 Comparar helpers de permisos
### [ ] SHELL-AUD-004 Comparar contexto operativo
### [ ] SHELL-AUD-005 Comparar role override
### [ ] SHELL-AUD-006 Comparar AppShell y navegación
### [ ] SHELL-AUD-007 Comparar componentes UI base
### [ ] SHELL-AUD-008 Comparar clientes Supabase
### [ ] SHELL-AUD-009 Comparar tipos y contratos
### [ ] SHELL-AUD-010 Clasificar compartir / generar / mantener local
Arquitectura de paquetes
### [ ] SHELL-PKG-001 Elegir mecanismo de distribución
### [ ] SHELL-PKG-002 Definir versionado semántico
### [ ] SHELL-PKG-003 Definir tags y releases
### [ ] SHELL-PKG-004 Definir política de compatibilidad
### [ ] SHELL-PKG-005 Definir política de deprecación
### [ ] SHELL-PKG-006 Definir rollback por aplicación
### [ ] SHELL-PKG-007 Definir actualizaciones mediante PR
### [ ] SHELL-PKG-008 Evitar actualizaciones automáticas sin pruebas
Paquetes candidatos
### [ ] SHELL-CON-001 Crear @vento/contracts
### [ ] SHELL-CON-002 Centralizar códigos de aplicaciones
### [ ] SHELL-CON-003 Centralizar códigos de permisos
### [ ] SHELL-CON-004 Centralizar roles base
### [ ] SHELL-CON-005 Centralizar roles operativos
### [ ] SHELL-CON-006 Centralizar scopes
### [ ] SHELL-CON-007 Centralizar tipos de contexto
### [ ] SHELL-CON-008 Centralizar códigos de error

### [ ] SHELL-CON-009 Centralizar identificadores de procesos
### [ ] SHELL-CON-010 Centralizar estados de procesos
### [ ] SHELL-CON-011 Centralizar identificadores de pantallas
### [ ] SHELL-CON-012 Crear contrato de acciones funcionales
### [ ] SHELL-CON-013 Crear contrato de eventos empresariales
### [ ] SHELL-CON-014 Crear contrato de traspasos entre aplicaciones
### [ ] SHELL-CON-015 Crear contrato de tareas pendientes
### [ ] SHELL-CON-016 Crear contrato de propiedad funcional

### CONTRATOS DE INTEGRACIONES EXTERNAS

### [ ] SHELL-CON-017 Crear contrato de principal técnico de integración
### [ ] SHELL-CON-018 Crear contrato de referencia de credencial externa sin incluir el secreto
### [ ] SHELL-CON-019 Crear contrato de evento externo recibido
### [ ] SHELL-CON-020 Crear contrato canónico de venta
### [ ] SHELL-CON-021 Crear contrato canónico de línea de venta
### [ ] SHELL-CON-022 Crear contrato de mapeo de identificadores externos
### [ ] SHELL-CON-023 Crear contrato de idempotencia y conciliación
### [ ] SHELL-CON-024 Crear contrato de cuarentena, rechazo y compensación

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

### [ ] SHELL-AUTH-001 Crear @vento/auth
### [ ] SHELL-AUTH-002 Compartir guards administrativos
### [ ] SHELL-AUTH-003 Compartir resolución de rol efectivo
### [ ] SHELL-AUTH-004 Compartir simulación estricta
### [ ] SHELL-AUTH-005 Compartir validación de permisos

### [ ] SHELL-CTX-001 Crear @vento/operational-context
### [ ] SHELL-CTX-002 Compartir resolución del turno
### [ ] SHELL-CTX-003 Compartir sede y área efectivas
### [ ] SHELL-CTX-004 Compartir permisos operativos
### [ ] SHELL-CTX-005 Compartir razones de bloqueo

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

