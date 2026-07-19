## BLOQUE G

**VISO como administrador del modelo**

### [ ] VISO-AUTH-001 Crear catálogo administrativo de roles base
### [ ] VISO-AUTH-002 Crear catálogo administrativo de roles operativos
### [ ] VISO-AUTH-003 Administrar permisos por rol base
### [ ] VISO-AUTH-004 Administrar permisos por rol operativo
### [ ] VISO-AUTH-005 Administrar roles permitidos por sede
### [ ] VISO-AUTH-006 Administrar roles permitidos por área
### [ ] VISO-AUTH-007 Administrar perfiles operativos por trabajador
### [ ] VISO-AUTH-008 Administrar sedes asignadas
### [ ] VISO-AUTH-009 Administrar áreas asignadas
### [ ] VISO-AUTH-010 Asignar rol operativo al turno
### [ ] VISO-AUTH-011 Validar turnos sin rol operativo
### [ ] VISO-AUTH-012 Validar turnos con área incompatible
### [ ] VISO-AUTH-013 Crear vista previa trabajador × sede × área × turno
### [ ] VISO-AUTH-014 Crear simulador de permisos efectivos
### [ ] VISO-AUTH-015 Mostrar origen de cada permiso
### [ ] VISO-AUTH-016 Mostrar conflictos de configuración
### [ ] VISO-AUTH-017 Administrar excepciones individuales
### [ ] VISO-AUTH-018 Auditar cambios de seguridad
### [ ] VISO-AUTH-019 Restringir quién administra seguridad
### [ ] VISO-AUTH-020 Crear exporte de matriz de acceso

SUBBLOQUE G2 — VISO Core

VISO Core deberá implementarse antes o en paralelo con las aplicaciones
operativas porque administra el modelo que estas consumen.

VISO Core no crea un segundo catálogo de funciones administrativas.

Su alcance funcional está compuesto por las tareas:

VISO-AUTH-001 a VISO-AUTH-020

Estas tareas cubren:

trabajadores;
roles base;
roles operativos;
sedes;
áreas;
perfiles operativos;
turnos;
permisos;
excepciones;
simulación;
conflictos;
auditoría.

Las tareas VISO-CORE controlan únicamente el corte mínimo,
la priorización y la aprobación del habilitador.

### [ ] VISO-CORE-001 Definir el alcance mínimo necesario para habilitar las aplicaciones operativas
### [ ] VISO-CORE-002 Priorizar las tareas VISO-AUTH necesarias para el primer piloto
### [ ] VISO-CORE-003 Implementar las dependencias administrativas mínimas
### [ ] VISO-CORE-004 Validar que NEXO, FOGO, ORIGO y PULSO puedan configurarse desde VISO
### [ ] VISO-CORE-005 Validar simulación, conflictos y auditoría del alcance mínimo
### [ ] VISO-CORE-006 Aprobar VISO Core antes del primer piloto operativo

SUBBLOQUE G3 — Experiencia administrativa de VISO

### [ ] VISO-UX-001 Reorganizar navegación por dominios administrativos
### [ ] VISO-UX-002 Crear sección Personal
### [ ] VISO-UX-003 Crear sección Programación
### [ ] VISO-UX-004 Crear sección Acceso y seguridad
### [ ] VISO-UX-005 Crear sección Organización
### [ ] VISO-UX-006 Crear sección Operación
### [ ] VISO-UX-007 Crear sección Auditoría
### [ ] VISO-UX-008 Definir inicio para propietario
### [ ] VISO-UX-009 Definir inicio para gerente general
### [ ] VISO-UX-010 Definir inicio para gerente de sede
### [ ] VISO-UX-011 Definir inicio para auxiliar administrativa
### [ ] VISO-UX-012 Definir inicio para contador
### [ ] VISO-UX-013 Limitar información según alcance territorial
### [ ] VISO-UX-014 Mostrar origen de permisos de forma comprensible
### [ ] VISO-UX-015 Mostrar conflictos antes de guardar
### [ ] VISO-UX-016 Permitir vista previa exacta de cada trabajador
### [ ] VISO-UX-017 Evitar duplicar configuración propia de otras aplicaciones
### [ ] VISO-UX-018 Enlazar a la aplicación propietaria cuando corresponda
### [ ] VISO-UX-019 Aplicar divulgación progresiva a seguridad avanzada
### [ ] VISO-UX-020 Ejecutar pruebas con administradores reales

Regla:

VISO
→ administra personas, acceso y configuración transversal

VISO
≠
duplicación de todos los formularios de NEXO, FOGO,
ORIGO, PULSO, NUMERA, PASS o AURA

