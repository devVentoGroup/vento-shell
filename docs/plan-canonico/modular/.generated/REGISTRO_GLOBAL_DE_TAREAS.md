# REGISTRO GLOBAL DE TAREAS — VENTO OS

> Archivo derivado. No editar manualmente.
>
> La fuente de verdad del estado es exclusivamente el marcador del encabezado.

## Resumen global

| Métrica | Cantidad |
| --- | ---: |
| Tareas con marcador | **732** |
| Tareas `AUTH` | **315** |
| Aprobadas | **119** |
| En propuesta | **0** |
| No iniciadas | **613** |
| Rechazadas | **0** |

## Continuidad activa

| Relación | Tarea | Estado |
| --- | --- | --- |
| Última aprobada | `AUTH-CTX-027` — Definir consumo centralizado del contexto por las aplicaciones | ✅ APROBADA |
| Tarea actual | `AUTH-MOD-021` — Definir rol base mínimo no privilegiado para trabajadores puramente operativos | ⬜ NO INICIADA |
| Siguiente | `AUTH-CTX-028` — Definir compatibilidad temporal con get_operational_context | ⬜ NO INICIADA |

## Registro completo

| Estado | Identificador | Título | Fragmento fuente |
| --- | --- | --- | --- |
| ✅ APROBADA | `AUTH-AUD-001` | Inventariar todos los roles base existentes | `bloques/A_AUDITORIA/01_ROLES_APPS_Y_PERMISOS.md` |
| ✅ APROBADA | `AUTH-AUD-002` | Inventariar todos los roles operativos existentes | `bloques/A_AUDITORIA/01_ROLES_APPS_Y_PERMISOS.md` |
| ✅ APROBADA | `AUTH-AUD-003` | Inventariar aplicaciones registradas en Supabase | `bloques/A_AUDITORIA/01_ROLES_APPS_Y_PERMISOS.md` |
| ✅ APROBADA | `AUTH-AUD-004` | Inventariar todos los permisos por aplicación | `bloques/A_AUDITORIA/01_ROLES_APPS_Y_PERMISOS.md` |
| ✅ APROBADA | `AUTH-AUD-005` | Inventariar role_permissions | `bloques/A_AUDITORIA/02_MATRICES_Y_ASIGNACIONES.md` |
| ✅ APROBADA | `AUTH-AUD-006` | Inventariar operational_role_permissions | `bloques/A_AUDITORIA/02_MATRICES_Y_ASIGNACIONES.md` |
| ✅ APROBADA | `AUTH-AUD-007` | Inventariar employee_permissions y excepciones individuales | `bloques/A_AUDITORIA/02_MATRICES_Y_ASIGNACIONES.md` |
| ✅ APROBADA | `AUTH-AUD-008` | Inventariar employee_sites y employee_areas | `bloques/A_AUDITORIA/02_MATRICES_Y_ASIGNACIONES.md` |
| ✅ APROBADA | `AUTH-AUD-009` | Inventariar perfiles operativos por trabajador y sede | `bloques/A_AUDITORIA/02_MATRICES_Y_ASIGNACIONES.md` |
| ✅ APROBADA | `AUTH-AUD-010` | Inventariar turnos, check-ins y sesiones operativas | `bloques/A_AUDITORIA/03_CONTEXTO_DISPOSITIVOS_Y_SEGURIDAD.md` |
| ✅ APROBADA | `AUTH-AUD-011` | Inventariar dispositivos compartidos | `bloques/A_AUDITORIA/03_CONTEXTO_DISPOSITIVOS_Y_SEGURIDAD.md` |
| ✅ APROBADA | `AUTH-AUD-012` | Auditar funciones has_permission y has_operational_permission | `bloques/A_AUDITORIA/03_CONTEXTO_DISPOSITIVOS_Y_SEGURIDAD.md` |
| ✅ APROBADA | `AUTH-AUD-013` | Auditar get_operational_context | `bloques/A_AUDITORIA/03_CONTEXTO_DISPOSITIVOS_Y_SEGURIDAD.md` |
| ✅ APROBADA | `AUTH-AUD-014` | Auditar RLS, RPC, triggers y SECURITY DEFINER | `bloques/A_AUDITORIA/03_CONTEXTO_DISPOSITIVOS_Y_SEGURIDAD.md` |
| ✅ APROBADA | `AUTH-AUD-015` | Buscar permisos existentes sin asignación | `bloques/A_AUDITORIA/04_BRECHAS_CODIGO_Y_RIESGOS.md` |
| ✅ APROBADA | `AUTH-AUD-016` | Buscar permisos asignados que ninguna aplicación utiliza | `bloques/A_AUDITORIA/04_BRECHAS_CODIGO_Y_RIESGOS.md` |
| ✅ APROBADA | `AUTH-AUD-017` | Buscar nombres inconsistentes o duplicados | `bloques/A_AUDITORIA/04_BRECHAS_CODIGO_Y_RIESGOS.md` |
| ✅ APROBADA | `AUTH-AUD-018` | Buscar decisiones hardcodeadas por rol | `bloques/A_AUDITORIA/04_BRECHAS_CODIGO_Y_RIESGOS.md` |
| ✅ APROBADA | `AUTH-AUD-019` | Buscar vistas protegidas solo desde la interfaz | `bloques/A_AUDITORIA/04_BRECHAS_CODIGO_Y_RIESGOS.md` |
| ✅ APROBADA | `AUTH-AUD-020` | Crear informe de riesgos y brechas | `bloques/A_AUDITORIA/04_BRECHAS_CODIGO_Y_RIESGOS.md` |
| ✅ APROBADA | `AUTH-MOD-001` | Definir identidad laboral del usuario | `bloques/B_MODELO_AUTORIZACION/01_IDENTIDAD_Y_ROLES.md` |
| ✅ APROBADA | `AUTH-MOD-002` | Separar rol base de rol operativo | `bloques/B_MODELO_AUTORIZACION/01_IDENTIDAD_Y_ROLES.md` |
| ✅ APROBADA | `AUTH-MOD-003` | Definir roles administrativos globales | `bloques/B_MODELO_AUTORIZACION/01_IDENTIDAD_Y_ROLES.md` |
| ✅ APROBADA | `AUTH-MOD-004` | Definir roles administrativos por sede | `bloques/B_MODELO_AUTORIZACION/01_IDENTIDAD_Y_ROLES.md` |
| ✅ APROBADA | `AUTH-MOD-005` | Definir roles operativos | `bloques/B_MODELO_AUTORIZACION/01_IDENTIDAD_Y_ROLES.md` |
| ✅ APROBADA | `AUTH-MOD-006` | Definir casos híbridos administrativo-operativos | `bloques/B_MODELO_AUTORIZACION/01_IDENTIDAD_Y_ROLES.md` |
| ✅ APROBADA | `AUTH-MOD-007` | Definir sede asignada y sede activa | `bloques/B_MODELO_AUTORIZACION/02_CONTEXTO_TERRITORIAL_Y_LABORAL.md` |
| ✅ APROBADA | `AUTH-MOD-008` | Definir área asignada y área activa | `bloques/B_MODELO_AUTORIZACION/02_CONTEXTO_TERRITORIAL_Y_LABORAL.md` |
| ✅ APROBADA | `AUTH-MOD-009` | Definir turno publicado | `bloques/B_MODELO_AUTORIZACION/02_CONTEXTO_TERRITORIAL_Y_LABORAL.md` |
| ✅ APROBADA | `AUTH-MOD-010` | Definir check-in activo | `bloques/B_MODELO_AUTORIZACION/02_CONTEXTO_TERRITORIAL_Y_LABORAL.md` |
| ✅ APROBADA | `AUTH-MOD-011` | Definir dispositivo compartido | `bloques/B_MODELO_AUTORIZACION/02_CONTEXTO_TERRITORIAL_Y_LABORAL.md` |
| ✅ APROBADA | `AUTH-MOD-012` | Definir simulación de rol | `bloques/B_MODELO_AUTORIZACION/02_CONTEXTO_TERRITORIAL_Y_LABORAL.md` |
| ✅ APROBADA | `AUTH-MOD-013` | Definir permisos globales | `bloques/B_MODELO_AUTORIZACION/03_ALCANCES.md` |
| ✅ APROBADA | `AUTH-MOD-014` | Definir permisos por sede | `bloques/B_MODELO_AUTORIZACION/03_ALCANCES.md` |
| ✅ APROBADA | `AUTH-MOD-015` | Definir permisos por tipo de sede | `bloques/B_MODELO_AUTORIZACION/03_ALCANCES.md` |
| ✅ APROBADA | `AUTH-MOD-016` | Definir permisos por área | `bloques/B_MODELO_AUTORIZACION/03_ALCANCES.md` |
| ✅ APROBADA | `AUTH-MOD-017` | Definir permisos por tipo de área | `bloques/B_MODELO_AUTORIZACION/03_ALCANCES.md` |
| ✅ APROBADA | `AUTH-MOD-018` | Definir precedencia entre permisos base y operativos | `bloques/B_MODELO_AUTORIZACION/04_PRECEDENCIA.md` |
| ✅ APROBADA | `AUTH-MOD-019` | Definir reglas de denegación explícita | `bloques/B_MODELO_AUTORIZACION/05_DENEGACIONES.md` |
| ✅ APROBADA | `AUTH-MOD-020` | Documentar el modelo mediante ADR | `bloques/B_MODELO_AUTORIZACION/06_ADR_AUTH_001.md` |
| ⬜ NO INICIADA | `AUTH-MOD-021` | Definir rol base mínimo no privilegiado para trabajadores puramente operativos | `bloques/B_MODELO_AUTORIZACION/06_ADR_AUTH_001.md` |
| ✅ APROBADA | `AUTH-CAT-001` | Normalizar el catálogo y los códigos de aplicaciones | `bloques/C_CATALOGO/01_APLICACIONES_Y_CONVENCION.md` |
| ✅ APROBADA | `AUTH-CAT-002` | Definir convención app.modulo.recurso.accion | `bloques/C_CATALOGO/01_APLICACIONES_Y_CONVENCION.md` |
| ✅ APROBADA | `AUTH-CAT-003` | Normalizar códigos de permisos con la convención aprobada | `bloques/C_CATALOGO/02_NORMALIZACION_Y_DESCRIPCIONES.md` |
| ✅ APROBADA | `AUTH-CAT-004` | Eliminar permisos duplicados semánticamente | `bloques/C_CATALOGO/02_NORMALIZACION_Y_DESCRIPCIONES.md` |
| ✅ APROBADA | `AUTH-CAT-005` | Crear descripciones humanas de cada permiso | `bloques/C_CATALOGO/02_NORMALIZACION_Y_DESCRIPCIONES.md` |
| ✅ APROBADA | `AUTH-CAT-006` | Definir authorization_requirement de cada permiso | `bloques/C_CATALOGO/03_MODALIDAD_Y_CLASIFICACIONES.md` |
| ✅ APROBADA | `AUTH-CAT-007` | Clasificar permisos operativos | `bloques/C_CATALOGO/03_MODALIDAD_Y_CLASIFICACIONES.md` |
| ✅ APROBADA | `AUTH-CAT-008` | Clasificar permisos de solo lectura | `bloques/C_CATALOGO/03_MODALIDAD_Y_CLASIFICACIONES.md` |
| ✅ APROBADA | `AUTH-CAT-009` | Clasificar permisos de configuración | `bloques/C_CATALOGO/03_MODALIDAD_Y_CLASIFICACIONES.md` |
| ✅ APROBADA | `AUTH-CAT-010` | Clasificar permisos sensibles | `bloques/C_CATALOGO/03_MODALIDAD_Y_CLASIFICACIONES.md` |
| ✅ APROBADA | `AUTH-CAT-011` | Definir alcance permitido de cada permiso | `bloques/C_CATALOGO/04_ALCANCE_DE_PERMISOS.md` |
| ✅ APROBADA | `AUTH-CAT-012` | Definir prerrequisitos de turno y check-in de cada permiso | `bloques/C_CATALOGO/05_PRERREQUISITOS_Y_CONTEXTO.md` |
| ✅ APROBADA | `AUTH-CAT-013` | Definir permisos que exigen área activa | `bloques/C_CATALOGO/05_PRERREQUISITOS_Y_CONTEXTO.md` |
| ✅ APROBADA | `AUTH-CAT-014` | Definir permisos que admiten dispositivo compartido | `bloques/C_CATALOGO/05_PRERREQUISITOS_Y_CONTEXTO.md` |
| ✅ APROBADA | `AUTH-CAT-015` | Definir permisos que admiten simulación | `bloques/C_CATALOGO/05_PRERREQUISITOS_Y_CONTEXTO.md` |
| ✅ APROBADA | `AUTH-CAT-016` | Definir contrato de recurso y resolución territorial de cada permiso | `bloques/C_CATALOGO/06_CONTRATO_DE_RECURSO.md` |
| ✅ APROBADA | `AUTH-CAT-017` | Crear catálogo versionado en `vento-shell` | `bloques/C_CATALOGO/07_VERSIONADO_Y_CONSUMO.md` |
| ✅ APROBADA | `AUTH-CAT-018` | Crear tipos TypeScript derivados del catálogo | `bloques/C_CATALOGO/07_VERSIONADO_Y_CONSUMO.md` |
| ✅ APROBADA | `AUTH-CAT-019` | Evitar cadenas de permisos escritas manualmente | `bloques/C_CATALOGO/07_VERSIONADO_Y_CONSUMO.md` |
| ✅ APROBADA | `AUTH-RBAC-001` | Crear matriz de propietario | `bloques/D_MATRICES/01_PROPIETARIO_Y_GERENCIAS.md` |
| ✅ APROBADA | `AUTH-RBAC-002` | Crear matriz de gerente_general | `bloques/D_MATRICES/01_PROPIETARIO_Y_GERENCIAS.md` |
| ✅ APROBADA | `AUTH-RBAC-003` | Crear matriz de gerente | `bloques/D_MATRICES/01_PROPIETARIO_Y_GERENCIAS.md` |
| ✅ APROBADA | `AUTH-RBAC-004` | Crear matriz de supervisor | `bloques/D_MATRICES/01_PROPIETARIO_Y_GERENCIAS.md` |
| ✅ APROBADA | `AUTH-RBAC-005` | Crear matriz de auxiliar_administrativa | `bloques/D_MATRICES/02_ROLES_FUNCIONALES.md` |
| ✅ APROBADA | `AUTH-RBAC-006` | Crear matriz de contador | `bloques/D_MATRICES/02_ROLES_FUNCIONALES.md` |
| ✅ APROBADA | `AUTH-RBAC-007` | Crear matriz de marketing | `bloques/D_MATRICES/02_ROLES_FUNCIONALES.md` |
| ✅ APROBADA | `AUTH-RBAC-008` | Crear matriz de cajero_satelite | `bloques/D_MATRICES/03_OPERATIVOS_CAJA_BARRA_COCINA.md` |
| ✅ APROBADA | `AUTH-RBAC-009` | Crear matriz de barista_satelite | `bloques/D_MATRICES/03_OPERATIVOS_CAJA_BARRA_COCINA.md` |
| ✅ APROBADA | `AUTH-RBAC-010` | Crear matriz de cocinero_satelite | `bloques/D_MATRICES/03_OPERATIVOS_CAJA_BARRA_COCINA.md` |
| ✅ APROBADA | `AUTH-RBAC-011` | Crear matriz de servicio_salon | `bloques/D_MATRICES/04_OPERATIVOS_SERVICIO_MOSTRADOR_INTEGRAL.md` |
| ✅ APROBADA | `AUTH-RBAC-012` | Crear matriz de mostrador_satelite | `bloques/D_MATRICES/04_OPERATIVOS_SERVICIO_MOSTRADOR_INTEGRAL.md` |
| ✅ APROBADA | `AUTH-RBAC-013` | Crear matriz de operador_integral_satelite | `bloques/D_MATRICES/04_OPERATIVOS_SERVICIO_MOSTRADOR_INTEGRAL.md` |
| ✅ APROBADA | `AUTH-RBAC-014` | Crear matriz de produccion_cocina | `bloques/D_MATRICES/05_OPERATIVOS_PRODUCCION.md` |
| ✅ APROBADA | `AUTH-RBAC-015` | Crear matriz de produccion_panaderia | `bloques/D_MATRICES/05_OPERATIVOS_PRODUCCION.md` |
| ✅ APROBADA | `AUTH-RBAC-016` | Crear matriz de produccion_reposteria | `bloques/D_MATRICES/05_OPERATIVOS_PRODUCCION.md` |
| ✅ APROBADA | `AUTH-RBAC-017` | Crear matriz de bodeguero | `bloques/D_MATRICES/06_OPERATIVOS_LOGISTICA_Y_GERENCIA.md` |
| ✅ APROBADA | `AUTH-RBAC-018` | Crear matriz de conductor_logistica | `bloques/D_MATRICES/06_OPERATIVOS_LOGISTICA_Y_GERENCIA.md` |
| ✅ APROBADA | `AUTH-RBAC-019` | Crear matriz de gerencia_operativa | `bloques/D_MATRICES/06_OPERATIVOS_LOGISTICA_Y_GERENCIA.md` |
| ✅ APROBADA | `AUTH-RBAC-020` | Definir concesiones individuales base | `bloques/D_MATRICES/07_EXCEPCIONES_Y_DISPOSITIVOS.md` |
| ✅ APROBADA | `AUTH-RBAC-021` | Definir concesiones individuales operativas | `bloques/D_MATRICES/07_EXCEPCIONES_Y_DISPOSITIVOS.md` |
| ✅ APROBADA | `AUTH-RBAC-022` | Definir denegaciones individuales y transversales | `bloques/D_MATRICES/07_EXCEPCIONES_Y_DISPOSITIVOS.md` |
| ✅ APROBADA | `AUTH-RBAC-023` | Definir capacidades permitidas por dispositivo compartido | `bloques/D_MATRICES/07_EXCEPCIONES_Y_DISPOSITIVOS.md` |
| ✅ APROBADA | `AUTH-CAT-020` | Consolidar brechas contractuales detectadas por las matrices | `bloques/D_MATRICES/08_REVISION_CONTRACTUAL_PREVIA_DATASETS.md` |
| ✅ APROBADA | `AUTH-CAT-021` | Clasificar brechas listas para catálogo y brechas diferidas a roadmaps funcionales | `bloques/D_MATRICES/08_REVISION_CONTRACTUAL_PREVIA_DATASETS.md` |
| ✅ APROBADA | `AUTH-CAT-022` | Descomponer permisos legacy maduros y definir nuevas claves atómicas | `bloques/D_MATRICES/08_REVISION_CONTRACTUAL_PREVIA_DATASETS.md` |
| ✅ APROBADA | `AUTH-CAT-023` | Actualizar matrices, excepciones, denegaciones y paquetes de dispositivo afectados por el diff contractual | `bloques/D_MATRICES/08_REVISION_CONTRACTUAL_PREVIA_DATASETS.md` |
| ✅ APROBADA | `AUTH-CAT-024` | Validar, publicar y congelar la versión canónica que alimentará los datasets | `bloques/D_MATRICES/08_REVISION_CONTRACTUAL_PREVIA_DATASETS.md` |
| ✅ APROBADA | `AUTH-RBAC-024` | Definir dataset canónico de matriz base | `bloques/D_MATRICES/09_DATASETS.md` |
| ✅ APROBADA | `AUTH-RBAC-025` | Definir dataset canónico de matriz operativa | `bloques/D_MATRICES/09_DATASETS.md` |
| ✅ APROBADA | `AUTH-RBAC-026` | Definir dataset canónico de excepciones y denegaciones | `bloques/D_MATRICES/09_DATASETS.md` |
| ✅ APROBADA | `AUTH-RBAC-027` | Validar que no exista acceso operativo global accidental | `bloques/D_MATRICES/10_VALIDACIONES.md` |
| ✅ APROBADA | `AUTH-RBAC-028` | Validar que la administración no dependa del check-in | `bloques/D_MATRICES/10_VALIDACIONES.md` |
| ✅ APROBADA | `AUTH-CTX-001` | Diseñar AccessContext canónico | `bloques/E_CONTEXTO_Y_DECISION/01_CONTRATOS_BASE.md` |
| ✅ APROBADA | `AUTH-CTX-002` | Diseñar AuthorizationDecision canónica | `bloques/E_CONTEXTO_Y_DECISION/01_CONTRATOS_BASE.md` |
| ✅ APROBADA | `AUTH-CTX-003` | Diseñar SimulationContext separado | `bloques/E_CONTEXTO_Y_DECISION/01_CONTRATOS_BASE.md` |
| ✅ APROBADA | `AUTH-CTX-004` | Versionar los contratos de respuesta | `bloques/E_CONTEXTO_Y_DECISION/01_CONTRATOS_BASE.md` |
| ✅ APROBADA | `AUTH-CTX-005` | Incluir principal autenticado | `bloques/E_CONTEXTO_Y_DECISION/02_IDENTIDAD_Y_ACTOR.md` |
| ✅ APROBADA | `AUTH-CTX-006` | Incluir actor efectivo | `bloques/E_CONTEXTO_Y_DECISION/02_IDENTIDAD_Y_ACTOR.md` |
| ✅ APROBADA | `AUTH-CTX-007` | Incluir identidad laboral o de dominio | `bloques/E_CONTEXTO_Y_DECISION/02_IDENTIDAD_Y_ACTOR.md` |
| ✅ APROBADA | `AUTH-CTX-008` | Incluir rol base vigente | `bloques/E_CONTEXTO_Y_DECISION/02_IDENTIDAD_Y_ACTOR.md` |
| ✅ APROBADA | `AUTH-CTX-009` | Incluir cobertura administrativa por sede y área | `bloques/E_CONTEXTO_Y_DECISION/03_CONTEXTO_LABORAL_Y_DISPOSITIVO.md` |
| ✅ APROBADA | `AUTH-CTX-010` | Incluir turno publicado y vigente | `bloques/E_CONTEXTO_Y_DECISION/03_CONTEXTO_LABORAL_Y_DISPOSITIVO.md` |
| ✅ APROBADA | `AUTH-CTX-011` | Incluir sesión de check-in activa | `bloques/E_CONTEXTO_Y_DECISION/03_CONTEXTO_LABORAL_Y_DISPOSITIVO.md` |
| ✅ APROBADA | `AUTH-CTX-012` | Incluir rol operativo efectivo | `bloques/E_CONTEXTO_Y_DECISION/03_CONTEXTO_LABORAL_Y_DISPOSITIVO.md` |
| ✅ APROBADA | `AUTH-CTX-013` | Incluir sede y área operativas | `bloques/E_CONTEXTO_Y_DECISION/03_CONTEXTO_LABORAL_Y_DISPOSITIVO.md` |
| ✅ APROBADA | `AUTH-CTX-014` | Incluir contexto de dispositivo compartido | `bloques/E_CONTEXTO_Y_DECISION/03_CONTEXTO_LABORAL_Y_DISPOSITIVO.md` |
| ✅ APROBADA | `AUTH-CTX-015` | Incluir razones estructuradas de invalidez | `bloques/E_CONTEXTO_Y_DECISION/03_CONTEXTO_LABORAL_Y_DISPOSITIVO.md` |
| ✅ APROBADA | `AUTH-CTX-016` | Incluir aplicación y permiso solicitado | `bloques/E_CONTEXTO_Y_DECISION/04_DECISION_DE_AUTORIZACION.md` |
| ✅ APROBADA | `AUTH-CTX-017` | Incluir `authorization_requirement` | `bloques/E_CONTEXTO_Y_DECISION/04_DECISION_DE_AUTORIZACION.md` |
| ✅ APROBADA | `AUTH-CTX-018` | Incluir recurso y territorio resueltos | `bloques/E_CONTEXTO_Y_DECISION/04_DECISION_DE_AUTORIZACION.md` |
| ✅ APROBADA | `AUTH-CTX-019` | Incluir decisión del carril base | `bloques/E_CONTEXTO_Y_DECISION/04_DECISION_DE_AUTORIZACION.md` |
| ✅ APROBADA | `AUTH-CTX-020` | Incluir decisión del carril operativo | `bloques/E_CONTEXTO_Y_DECISION/04_DECISION_DE_AUTORIZACION.md` |
| ✅ APROBADA | `AUTH-CTX-021` | Incluir allows coincidentes | `bloques/E_CONTEXTO_Y_DECISION/04_DECISION_DE_AUTORIZACION.md` |
| ✅ APROBADA | `AUTH-CTX-022` | Incluir denegaciones coincidentes | `bloques/E_CONTEXTO_Y_DECISION/04_DECISION_DE_AUTORIZACION.md` |
| ✅ APROBADA | `AUTH-CTX-023` | Incluir decisión final y razones | `bloques/E_CONTEXTO_Y_DECISION/04_DECISION_DE_AUTORIZACION.md` |
| ✅ APROBADA | `AUTH-CTX-024` | Incluir datos de auditoría | `bloques/E_CONTEXTO_Y_DECISION/04_DECISION_DE_AUTORIZACION.md` |
| ✅ APROBADA | `AUTH-CTX-025` | Diseñar contrato SQL de get_access_context | `bloques/E_CONTEXTO_Y_DECISION/05_IMPLEMENTACION_Y_TRANSICION.md` |
| ✅ APROBADA | `AUTH-CTX-026` | Diseñar contrato canónico de evaluate_authorization | `bloques/E_CONTEXTO_Y_DECISION/05_IMPLEMENTACION_Y_TRANSICION.md` |
| ✅ APROBADA | `AUTH-CTX-027` | Definir consumo centralizado del contexto por las aplicaciones | `bloques/E_CONTEXTO_Y_DECISION/05_IMPLEMENTACION_Y_TRANSICION.md` |
| ⬜ NO INICIADA | `AUTH-CTX-028` | Definir compatibilidad temporal con get_operational_context | `bloques/E_CONTEXTO_Y_DECISION/05_IMPLEMENTACION_Y_TRANSICION.md` |
| ⬜ NO INICIADA | `AUTH-CTX-029` | Definir estrategia de invalidación y caché | `bloques/E_CONTEXTO_Y_DECISION/05_IMPLEMENTACION_Y_TRANSICION.md` |
| ⬜ NO INICIADA | `AUTH-CTX-030` | Definir plan de pruebas contractuales del contexto y la decisión | `bloques/E_CONTEXTO_Y_DECISION/05_IMPLEMENTACION_Y_TRANSICION.md` |
| ⬜ NO INICIADA | `OPS-AUD-001` | Inventariar todas las empresas, sedes, áreas, canales y puntos operativos | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/02_AUDITORIA_DE_OPERACION_REAL.md` |
| ⬜ NO INICIADA | `OPS-AUD-002` | Identificar familias de actores y responsables reales por proceso | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/02_AUDITORIA_DE_OPERACION_REAL.md` |
| ⬜ NO INICIADA | `OPS-AUD-003` | Observar el trabajo real de cada área en operación ordinaria | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/02_AUDITORIA_DE_OPERACION_REAL.md` |
| ⬜ NO INICIADA | `OPS-AUD-004` | Inventariar procesos ejecutados en papel | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/02_AUDITORIA_DE_OPERACION_REAL.md` |
| ⬜ NO INICIADA | `OPS-AUD-005` | Inventariar procesos ejecutados por WhatsApp, correo, Excel u otras herramientas | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/02_AUDITORIA_DE_OPERACION_REAL.md` |
| ⬜ NO INICIADA | `OPS-AUD-006` | Inventariar formularios, remisiones, órdenes, etiquetas, comprobantes y reportes | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/02_AUDITORIA_DE_OPERACION_REAL.md` |
| ⬜ NO INICIADA | `OPS-AUD-007` | Documentar flujo ordinario de cada proceso | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/02_AUDITORIA_DE_OPERACION_REAL.md` |
| ⬜ NO INICIADA | `OPS-AUD-008` | Documentar excepciones, correcciones, anulaciones, devoluciones y reversión | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/02_AUDITORIA_DE_OPERACION_REAL.md` |
| ⬜ NO INICIADA | `OPS-AUD-009` | Documentar aprobaciones, segregación de funciones y controles manuales | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/02_AUDITORIA_DE_OPERACION_REAL.md` |
| ⬜ NO INICIADA | `OPS-AUD-010` | Medir frecuencia, volumen, criticidad, tiempos y estacionalidad | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/02_AUDITORIA_DE_OPERACION_REAL.md` |
| ⬜ NO INICIADA | `OPS-AUD-011` | Identificar dependencias entre áreas, sedes, aplicaciones y terceros | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/02_AUDITORIA_DE_OPERACION_REAL.md` |
| ⬜ NO INICIADA | `OPS-AUD-012` | Identificar puntos de doble digitación y conciliación manual | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/02_AUDITORIA_DE_OPERACION_REAL.md` |
| ⬜ NO INICIADA | `OPS-AUD-013` | Identificar pérdidas de trazabilidad, información y responsabilidad | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/02_AUDITORIA_DE_OPERACION_REAL.md` |
| ⬜ NO INICIADA | `OPS-AUD-014` | Identificar contingencias por caída de red, energía, dispositivo o proveedor | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/02_AUDITORIA_DE_OPERACION_REAL.md` |
| ⬜ NO INICIADA | `OPS-AUD-015` | Validar hallazgos con trabajadores, supervisores y responsables del proceso | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/02_AUDITORIA_DE_OPERACION_REAL.md` |
| ⬜ NO INICIADA | `CAP-MAP-001` | Crear taxonomía jerárquica de capacidades de Vento Group | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/03_MAPA_CANONICO_DE_CAPACIDADES_EMPRESARIALES.md` |
| ⬜ NO INICIADA | `CAP-MAP-002` | Definir capacidad, subcapacidad y resultado empresarial esperado | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/03_MAPA_CANONICO_DE_CAPACIDADES_EMPRESARIALES.md` |
| ⬜ NO INICIADA | `CAP-MAP-003` | Vincular cada capacidad con empresa, sede, área y canal aplicables | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/03_MAPA_CANONICO_DE_CAPACIDADES_EMPRESARIALES.md` |
| ⬜ NO INICIADA | `CAP-MAP-004` | Definir dominio y aplicación propietaria candidata | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/03_MAPA_CANONICO_DE_CAPACIDADES_EMPRESARIALES.md` |
| ⬜ NO INICIADA | `CAP-MAP-005` | Definir aplicaciones y sistemas consumidores | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/03_MAPA_CANONICO_DE_CAPACIDADES_EMPRESARIALES.md` |
| ⬜ NO INICIADA | `CAP-MAP-006` | Identificar actor iniciador, ejecutor, supervisor y aprobador | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/03_MAPA_CANONICO_DE_CAPACIDADES_EMPRESARIALES.md` |
| ⬜ NO INICIADA | `CAP-MAP-007` | Identificar información de entrada y resultado producido | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/03_MAPA_CANONICO_DE_CAPACIDADES_EMPRESARIALES.md` |
| ⬜ NO INICIADA | `CAP-MAP-008` | Identificar fuente de verdad actual y fuente de verdad objetivo | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/03_MAPA_CANONICO_DE_CAPACIDADES_EMPRESARIALES.md` |
| ⬜ NO INICIADA | `CAP-MAP-009` | Identificar eventos e integraciones requeridos | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/03_MAPA_CANONICO_DE_CAPACIDADES_EMPRESARIALES.md` |
| ⬜ NO INICIADA | `CAP-MAP-010` | Identificar permisos y controles de autorización requeridos | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/03_MAPA_CANONICO_DE_CAPACIDADES_EMPRESARIALES.md` |
| ⬜ NO INICIADA | `CAP-MAP-011` | Identificar pantallas, dispositivos, documentos y evidencia requeridos | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/03_MAPA_CANONICO_DE_CAPACIDADES_EMPRESARIALES.md` |
| ⬜ NO INICIADA | `CAP-MAP-012` | Clasificar capacidad núcleo, soporte, transversal, futura o fuera de alcance | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/03_MAPA_CANONICO_DE_CAPACIDADES_EMPRESARIALES.md` |
| ⬜ NO INICIADA | `CAP-MAP-013` | Detectar capacidades duplicadas o con propiedad competidora | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/03_MAPA_CANONICO_DE_CAPACIDADES_EMPRESARIALES.md` |
| ⬜ NO INICIADA | `CAP-MAP-014` | Detectar capacidades necesarias que no aparecen en código ni datos actuales | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/03_MAPA_CANONICO_DE_CAPACIDADES_EMPRESARIALES.md` |
| ⬜ NO INICIADA | `CAP-MAP-015` | Aprobar la línea base de capacidades actuales, necesarias y candidatas de Vento Group | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/03_MAPA_CANONICO_DE_CAPACIDADES_EMPRESARIALES.md` |
| ⬜ NO INICIADA | `CODE-AUD-001` | Inventariar todos los repositorios y superficies desplegadas | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/04_AUDITORIA_DE_IMPLEMENTACION_ACTUAL.md` |
| ⬜ NO INICIADA | `CODE-AUD-002` | Inventariar rutas, layouts, pantallas, componentes y formularios | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/04_AUDITORIA_DE_IMPLEMENTACION_ACTUAL.md` |
| ⬜ NO INICIADA | `CODE-AUD-003` | Inventariar acciones de usuario y comportamiento efectivo | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/04_AUDITORIA_DE_IMPLEMENTACION_ACTUAL.md` |
| ⬜ NO INICIADA | `CODE-AUD-004` | Inventariar hooks, servicios, adaptadores, consultas y estado local | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/04_AUDITORIA_DE_IMPLEMENTACION_ACTUAL.md` |
| ⬜ NO INICIADA | `CODE-AUD-005` | Inventariar Server Actions, API routes, RPC, Edge Functions y jobs | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/04_AUDITORIA_DE_IMPLEMENTACION_ACTUAL.md` |
| ⬜ NO INICIADA | `CODE-AUD-006` | Vincular código con tablas, vistas, Storage, Realtime y eventos | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/04_AUDITORIA_DE_IMPLEMENTACION_ACTUAL.md` |
| ⬜ NO INICIADA | `CODE-AUD-007` | Inventariar pruebas, fixtures, mocks y datos de demostración | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/04_AUDITORIA_DE_IMPLEMENTACION_ACTUAL.md` |
| ⬜ NO INICIADA | `CODE-AUD-008` | Detectar `TODO`, `FIXME`, stubs y funciones no terminadas | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/04_AUDITORIA_DE_IMPLEMENTACION_ACTUAL.md` |
| ⬜ NO INICIADA | `CODE-AUD-009` | Detectar valores hardcodeados y decisiones técnicas temporales | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/04_AUDITORIA_DE_IMPLEMENTACION_ACTUAL.md` |
| ⬜ NO INICIADA | `CODE-AUD-010` | Detectar pantallas con interfaz pero sin lógica completa | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/04_AUDITORIA_DE_IMPLEMENTACION_ACTUAL.md` |
| ⬜ NO INICIADA | `CODE-AUD-011` | Detectar infraestructura sin proceso funcional utilizable | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/04_AUDITORIA_DE_IMPLEMENTACION_ACTUAL.md` |
| ⬜ NO INICIADA | `CODE-AUD-012` | Detectar procesos implementados solo parcialmente | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/04_AUDITORIA_DE_IMPLEMENTACION_ACTUAL.md` |
| ⬜ NO INICIADA | `CODE-AUD-013` | Detectar código legacy todavía activo | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/04_AUDITORIA_DE_IMPLEMENTACION_ACTUAL.md` |
| ⬜ NO INICIADA | `CODE-AUD-014` | Detectar código duplicado y fuentes de verdad competidoras | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/04_AUDITORIA_DE_IMPLEMENTACION_ACTUAL.md` |
| ⬜ NO INICIADA | `CODE-AUD-015` | Detectar rutas, componentes, funciones y tablas sin consumidores | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/04_AUDITORIA_DE_IMPLEMENTACION_ACTUAL.md` |
| ⬜ NO INICIADA | `CODE-AUD-016` | Ejecutar build, lint, tipos y pruebas disponibles por repositorio | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/04_AUDITORIA_DE_IMPLEMENTACION_ACTUAL.md` |
| ⬜ NO INICIADA | `CODE-AUD-017` | Auditar autorización, validación de servidor y exposición de datos | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/04_AUDITORIA_DE_IMPLEMENTACION_ACTUAL.md` |
| ⬜ NO INICIADA | `CODE-AUD-018` | Auditar operación offline, reintentos, concurrencia e idempotencia | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/04_AUDITORIA_DE_IMPLEMENTACION_ACTUAL.md` |
| ⬜ NO INICIADA | `CODE-AUD-019` | Vincular cada capacidad con su implementación actual verificable | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/04_AUDITORIA_DE_IMPLEMENTACION_ACTUAL.md` |
| ⬜ NO INICIADA | `CODE-AUD-020` | Crear backlog técnico y funcional trazable por repositorio | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/04_AUDITORIA_DE_IMPLEMENTACION_ACTUAL.md` |
| ⬜ NO INICIADA | `CAP-SCOPE-001` | Evaluar gobierno, empresas, sedes y organización | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/05_COBERTURA_EMPRESARIAL_OBLIGATORIA.md` |
| ⬜ NO INICIADA | `CAP-SCOPE-002` | Evaluar personal, contratación, turnos, asistencia, capacitación y retiro | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/05_COBERTURA_EMPRESARIAL_OBLIGATORIA.md` |
| ⬜ NO INICIADA | `CAP-SCOPE-003` | Evaluar seguridad y salud en el trabajo | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/05_COBERTURA_EMPRESARIAL_OBLIGATORIA.md` |
| ⬜ NO INICIADA | `CAP-SCOPE-004` | Evaluar catálogo, productos, presentaciones, unidades, menús y recetas | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/05_COBERTURA_EMPRESARIAL_OBLIGATORIA.md` |
| ⬜ NO INICIADA | `CAP-SCOPE-005` | Evaluar compras, proveedores, contratos, precios y abastecimiento | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/05_COBERTURA_EMPRESARIAL_OBLIGATORIA.md` |
| ⬜ NO INICIADA | `CAP-SCOPE-006` | Evaluar inventario, lotes, vencimientos, LOC y LPN | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/05_COBERTURA_EMPRESARIAL_OBLIGATORIA.md` |
| ⬜ NO INICIADA | `CAP-SCOPE-007` | Evaluar activos, vajilla, decoración, herramientas, repuestos y mantenimiento | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/05_COBERTURA_EMPRESARIAL_OBLIGATORIA.md` |
| ⬜ NO INICIADA | `CAP-SCOPE-008` | Evaluar producción, planificación, rendimiento, calidad e inocuidad | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/05_COBERTURA_EMPRESARIAL_OBLIGATORIA.md` |
| ⬜ NO INICIADA | `CAP-SCOPE-009` | Evaluar ventas, pedidos, mesas, comandas, caja y pagos | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/05_COBERTURA_EMPRESARIAL_OBLIGATORIA.md` |
| ⬜ NO INICIADA | `CAP-SCOPE-010` | Evaluar clientes, fidelización, reclamos y servicio | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/05_COBERTURA_EMPRESARIAL_OBLIGATORIA.md` |
| ⬜ NO INICIADA | `CAP-SCOPE-011` | Evaluar logística, rutas, vehículos, combustible y entregas | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/05_COBERTURA_EMPRESARIAL_OBLIGATORIA.md` |
| ⬜ NO INICIADA | `CAP-SCOPE-012` | Evaluar costos, gastos, presupuestos, tesorería, contabilidad e impuestos | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/05_COBERTURA_EMPRESARIAL_OBLIGATORIA.md` |
| ⬜ NO INICIADA | `CAP-SCOPE-013` | Evaluar instalaciones, mantenimiento, limpieza, inspecciones y calibración | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/05_COBERTURA_EMPRESARIAL_OBLIGATORIA.md` |
| ⬜ NO INICIADA | `CAP-SCOPE-014` | Evaluar marketing, campañas y contenido | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/05_COBERTURA_EMPRESARIAL_OBLIGATORIA.md` |
| ⬜ NO INICIADA | `CAP-SCOPE-015` | Evaluar TI, dispositivos, redes, impresión, soporte y seguridad | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/05_COBERTURA_EMPRESARIAL_OBLIGATORIA.md` |
| ⬜ NO INICIADA | `CAP-SCOPE-016` | Evaluar privacidad, cumplimiento, documentos, conservación y auditoría | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/05_COBERTURA_EMPRESARIAL_OBLIGATORIA.md` |
| ⬜ NO INICIADA | `CAP-SCOPE-017` | Evaluar analítica, indicadores y datos maestros | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/05_COBERTURA_EMPRESARIAL_OBLIGATORIA.md` |
| ⬜ NO INICIADA | `CAP-SCOPE-018` | Evaluar continuidad operativa, respaldo y recuperación | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/05_COBERTURA_EMPRESARIAL_OBLIGATORIA.md` |
| ⬜ NO INICIADA | `CAP-SCOPE-019` | Aprobar clasificación y propietario de cada dominio evaluado | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/05_COBERTURA_EMPRESARIAL_OBLIGATORIA.md` |
| ⬜ NO INICIADA | `CAP-COVER-001` | Definir criterios verificables de cada estado de cobertura | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/06_MATRIZ_DE_COBERTURA.md` |
| ⬜ NO INICIADA | `CAP-COVER-002` | Clasificar cobertura funcional | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/06_MATRIZ_DE_COBERTURA.md` |
| ⬜ NO INICIADA | `CAP-COVER-003` | Clasificar cobertura de interfaz | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/06_MATRIZ_DE_COBERTURA.md` |
| ⬜ NO INICIADA | `CAP-COVER-004` | Clasificar cobertura de servidor | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/06_MATRIZ_DE_COBERTURA.md` |
| ⬜ NO INICIADA | `CAP-COVER-005` | Clasificar cobertura de datos | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/06_MATRIZ_DE_COBERTURA.md` |
| ⬜ NO INICIADA | `CAP-COVER-006` | Clasificar cobertura de autorización | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/06_MATRIZ_DE_COBERTURA.md` |
| ⬜ NO INICIADA | `CAP-COVER-007` | Clasificar cobertura de auditoría | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/06_MATRIZ_DE_COBERTURA.md` |
| ⬜ NO INICIADA | `CAP-COVER-008` | Clasificar cobertura de pruebas | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/06_MATRIZ_DE_COBERTURA.md` |
| ⬜ NO INICIADA | `CAP-COVER-009` | Clasificar cobertura de integración | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/06_MATRIZ_DE_COBERTURA.md` |
| ⬜ NO INICIADA | `CAP-COVER-010` | Registrar dependencias y bloqueos | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/06_MATRIZ_DE_COBERTURA.md` |
| ⬜ NO INICIADA | `CAP-COVER-011` | Priorizar por criticidad, frecuencia, riesgo y valor operativo | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/06_MATRIZ_DE_COBERTURA.md` |
| ⬜ NO INICIADA | `CAP-COVER-012` | Aprobar matriz capacidad × proceso × aplicación × implementación | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/06_MATRIZ_DE_COBERTURA.md` |
| ⬜ NO INICIADA | `GAP-CTRL-001` | Consolidar brechas de auditoría, AUTH-CAT-021, operación y código | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/07_REGISTRO_CANONICO_DE_BRECHAS.md` |
| ⬜ NO INICIADA | `GAP-CTRL-002` | Deduplicar brechas equivalentes | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/07_REGISTRO_CANONICO_DE_BRECHAS.md` |
| ⬜ NO INICIADA | `GAP-CTRL-003` | Clasificar brecha funcional, contractual, técnica, de datos, seguridad u operación | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/07_REGISTRO_CANONICO_DE_BRECHAS.md` |
| ⬜ NO INICIADA | `GAP-CTRL-004` | Asignar propietario y fecha de decisión | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/07_REGISTRO_CANONICO_DE_BRECHAS.md` |
| ⬜ NO INICIADA | `GAP-CTRL-005` | Vincular cada brecha con capacidad y proceso | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/07_REGISTRO_CANONICO_DE_BRECHAS.md` |
| ⬜ NO INICIADA | `GAP-CTRL-006` | Vincular cada brecha con tarea y paquete de implementación | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/07_REGISTRO_CANONICO_DE_BRECHAS.md` |
| ⬜ NO INICIADA | `GAP-CTRL-007` | Definir criterio y evidencia de cierre | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/07_REGISTRO_CANONICO_DE_BRECHAS.md` |
| ⬜ NO INICIADA | `GAP-CTRL-008` | Impedir cerrar una fase con brechas críticas sin propietario | `bloques/E1_DESCUBRIMIENTO_OPERATIVO/07_REGISTRO_CANONICO_DE_BRECHAS.md` |
| ⬜ NO INICIADA | `NFR-REQ-001` | Definir criticidad y disponibilidad por proceso | `bloques/E2_PROCESOS_Y_EXPERIENCIA/00_BLOQUE_E2.md` |
| ⬜ NO INICIADA | `NFR-REQ-002` | Definir volumen, concurrencia y crecimiento esperado | `bloques/E2_PROCESOS_Y_EXPERIENCIA/00_BLOQUE_E2.md` |
| ⬜ NO INICIADA | `NFR-REQ-003` | Definir tiempos máximos de respuesta | `bloques/E2_PROCESOS_Y_EXPERIENCIA/00_BLOQUE_E2.md` |
| ⬜ NO INICIADA | `NFR-REQ-004` | Definir comportamiento offline y sincronización | `bloques/E2_PROCESOS_Y_EXPERIENCIA/00_BLOQUE_E2.md` |
| ⬜ NO INICIADA | `NFR-REQ-005` | Definir privacidad y sensibilidad | `bloques/E2_PROCESOS_Y_EXPERIENCIA/00_BLOQUE_E2.md` |
| ⬜ NO INICIADA | `NFR-REQ-006` | Definir trazabilidad y retención | `bloques/E2_PROCESOS_Y_EXPERIENCIA/00_BLOQUE_E2.md` |
| ⬜ NO INICIADA | `NFR-REQ-007` | Definir accesibilidad y ergonomía | `bloques/E2_PROCESOS_Y_EXPERIENCIA/00_BLOQUE_E2.md` |
| ⬜ NO INICIADA | `NFR-REQ-008` | Definir hardware, red y periféricos requeridos | `bloques/E2_PROCESOS_Y_EXPERIENCIA/00_BLOQUE_E2.md` |
| ⬜ NO INICIADA | `NFR-REQ-009` | Definir observabilidad, soporte y alertas | `bloques/E2_PROCESOS_Y_EXPERIENCIA/00_BLOQUE_E2.md` |
| ⬜ NO INICIADA | `NFR-REQ-010` | Definir respaldo, RTO y RPO | `bloques/E2_PROCESOS_Y_EXPERIENCIA/00_BLOQUE_E2.md` |
| ⬜ NO INICIADA | `NFR-REQ-011` | Definir compatibilidad mínima por dispositivo | `bloques/E2_PROCESOS_Y_EXPERIENCIA/00_BLOQUE_E2.md` |
| ⬜ NO INICIADA | `NFR-REQ-012` | Aprobar requisitos no funcionales antes de E5 | `bloques/E2_PROCESOS_Y_EXPERIENCIA/00_BLOQUE_E2.md` |
| ⬜ NO INICIADA | `SUPA-AUD-001` | Inventariar todos los esquemas existentes | `bloques/E3_SUPABASE/02_AUDITORIA_INTEGRAL_DE_SUPABASE.md` |
| ⬜ NO INICIADA | `SUPA-AUD-002` | Clasificar esquemas administrados por Supabase y esquemas de Vento | `bloques/E3_SUPABASE/02_AUDITORIA_INTEGRAL_DE_SUPABASE.md` |
| ⬜ NO INICIADA | `SUPA-AUD-003` | Identificar esquemas expuestos mediante Data API | `bloques/E3_SUPABASE/02_AUDITORIA_INTEGRAL_DE_SUPABASE.md` |
| ⬜ NO INICIADA | `SUPA-AUD-004` | Inventariar tablas, particiones, vistas y vistas materializadas | `bloques/E3_SUPABASE/02_AUDITORIA_INTEGRAL_DE_SUPABASE.md` |
| ⬜ NO INICIADA | `SUPA-AUD-005` | Inventariar claves primarias, foráneas, constraints, enums y secuencias | `bloques/E3_SUPABASE/02_AUDITORIA_INTEGRAL_DE_SUPABASE.md` |
| ⬜ NO INICIADA | `SUPA-AUD-006` | Inventariar funciones, RPC, procedimientos y firmas públicas | `bloques/E3_SUPABASE/02_AUDITORIA_INTEGRAL_DE_SUPABASE.md` |
| ⬜ NO INICIADA | `SUPA-AUD-007` | Inventariar funciones `SECURITY DEFINER` y `SECURITY INVOKER` | `bloques/E3_SUPABASE/02_AUDITORIA_INTEGRAL_DE_SUPABASE.md` |
| ⬜ NO INICIADA | `SUPA-AUD-008` | Inventariar triggers y funciones ejecutadas por triggers | `bloques/E3_SUPABASE/02_AUDITORIA_INTEGRAL_DE_SUPABASE.md` |
| ⬜ NO INICIADA | `SUPA-AUD-009` | Inventariar políticas RLS, grants y privilegios por rol | `bloques/E3_SUPABASE/02_AUDITORIA_INTEGRAL_DE_SUPABASE.md` |
| ⬜ NO INICIADA | `SUPA-AUD-010` | Auditar Auth, usuarios, identidades, sesiones y vínculos empresariales | `bloques/E3_SUPABASE/02_AUDITORIA_INTEGRAL_DE_SUPABASE.md` |
| ⬜ NO INICIADA | `SUPA-AUD-011` | Auditar identidades de trabajadores, clientes, dispositivos y actores de sistema | `bloques/E3_SUPABASE/02_AUDITORIA_INTEGRAL_DE_SUPABASE.md` |
| ⬜ NO INICIADA | `SUPA-AUD-012` | Auditar buckets, rutas, políticas y ciclos de vida de Storage | `bloques/E3_SUPABASE/02_AUDITORIA_INTEGRAL_DE_SUPABASE.md` |
| ⬜ NO INICIADA | `SUPA-AUD-013` | Auditar publicaciones, canales y consumidores de Realtime | `bloques/E3_SUPABASE/02_AUDITORIA_INTEGRAL_DE_SUPABASE.md` |
| ⬜ NO INICIADA | `SUPA-AUD-014` | Auditar Edge Functions, webhooks, cron, colas y automatizaciones | `bloques/E3_SUPABASE/02_AUDITORIA_INTEGRAL_DE_SUPABASE.md` |
| ⬜ NO INICIADA | `SUPA-AUD-015` | Auditar extensiones, secretos, variables y configuración del proyecto | `bloques/E3_SUPABASE/02_AUDITORIA_INTEGRAL_DE_SUPABASE.md` |
| ⬜ NO INICIADA | `SUPA-AUD-016` | Comparar Supabase remoto con migraciones y configuración de `vento-shell` | `bloques/E3_SUPABASE/02_AUDITORIA_INTEGRAL_DE_SUPABASE.md` |
| ⬜ NO INICIADA | `SUPA-AUD-017` | Detectar drift, cambios manuales y objetos sin migración | `bloques/E3_SUPABASE/02_AUDITORIA_INTEGRAL_DE_SUPABASE.md` |
| ⬜ NO INICIADA | `SUPA-AUD-018` | Identificar tablas, columnas, funciones y políticas legacy | `bloques/E3_SUPABASE/02_AUDITORIA_INTEGRAL_DE_SUPABASE.md` |
| ⬜ NO INICIADA | `SUPA-AUD-019` | Detectar duplicidades, datos huérfanos y fuentes de verdad competidoras | `bloques/E3_SUPABASE/02_AUDITORIA_INTEGRAL_DE_SUPABASE.md` |
| ⬜ NO INICIADA | `SUPA-AUD-020` | Auditar índices, consultas, planes, crecimiento y retención | `bloques/E3_SUPABASE/02_AUDITORIA_INTEGRAL_DE_SUPABASE.md` |
| ⬜ NO INICIADA | `SUPA-AUD-021` | Auditar generación y consumo de tipos de base de datos | `bloques/E3_SUPABASE/02_AUDITORIA_INTEGRAL_DE_SUPABASE.md` |
| ⬜ NO INICIADA | `SUPA-AUD-022` | Crear mapa objeto → capacidad empresarial preliminar → propietario actual → consumidores actuales | `bloques/E3_SUPABASE/02_AUDITORIA_INTEGRAL_DE_SUPABASE.md` |
| ⬜ NO INICIADA | `SUPA-AUD-023` | Crear mapa proceso → datos → RPC → eventos → aplicaciones | `bloques/E3_SUPABASE/02_AUDITORIA_INTEGRAL_DE_SUPABASE.md` |
| ⬜ NO INICIADA | `SUPA-AUD-024` | Clasificar riesgos críticos, altos, medios y deuda técnica | `bloques/E3_SUPABASE/02_AUDITORIA_INTEGRAL_DE_SUPABASE.md` |
| ⬜ NO INICIADA | `DATA-NORM-AUD-001` | Inventariar campos textuales y reglas actuales de normalización | `bloques/E3_SUPABASE/03_AUDITORIA_DE_NORMALIZACION_Y_CALIDAD_DE_DATOS.md` |
| ⬜ NO INICIADA | `DATA-NORM-AUD-002` | Detectar inconsistencias de espacios, mayúsculas, Unicode, tildes, signos y conectores | `bloques/E3_SUPABASE/03_AUDITORIA_DE_NORMALIZACION_Y_CALIDAD_DE_DATOS.md` |
| ⬜ NO INICIADA | `DATA-NORM-AUD-003` | Identificar marcas, siglas, unidades, razones sociales y excepciones que no admiten transformación genérica | `bloques/E3_SUPABASE/03_AUDITORIA_DE_NORMALIZACION_Y_CALIDAD_DE_DATOS.md` |
| ⬜ NO INICIADA | `DATA-NORM-AUD-004` | Detectar duplicados semánticos mediante valores normalizados de comparación | `bloques/E3_SUPABASE/03_AUDITORIA_DE_NORMALIZACION_Y_CALIDAD_DE_DATOS.md` |
| ⬜ NO INICIADA | `DATA-NORM-AUD-005` | Clasificar transformaciones deterministas, correcciones por diccionario y casos ambiguos | `bloques/E3_SUPABASE/03_AUDITORIA_DE_NORMALIZACION_Y_CALIDAD_DE_DATOS.md` |
| ⬜ NO INICIADA | `DATA-NORM-AUD-006` | Inventariar triggers, funciones, código cliente y procesos externos que actualmente modifican texto | `bloques/E3_SUPABASE/03_AUDITORIA_DE_NORMALIZACION_Y_CALIDAD_DE_DATOS.md` |
| ⬜ NO INICIADA | `DATA-NORM-AUD-007` | Medir impacto de normalización sobre búsquedas, integraciones, relaciones y unicidad | `bloques/E3_SUPABASE/03_AUDITORIA_DE_NORMALIZACION_Y_CALIDAD_DE_DATOS.md` |
| ⬜ NO INICIADA | `SUPA-ARC-001` | Definir principios de separación entre esquemas administrados y empresariales | `bloques/E3_SUPABASE/04_ARQUITECTURA_CANONICA_OBJETIVO.md` |
| ⬜ NO INICIADA | `SUPA-ARC-002` | Definir dominios empresariales estables | `bloques/E3_SUPABASE/04_ARQUITECTURA_CANONICA_OBJETIVO.md` |
| ⬜ NO INICIADA | `SUPA-ARC-003` | Definir esquema propietario de cada fuente de verdad | `bloques/E3_SUPABASE/04_ARQUITECTURA_CANONICA_OBJETIVO.md` |
| ⬜ NO INICIADA | `SUPA-ARC-004` | Definir función futura de `public` | `bloques/E3_SUPABASE/04_ARQUITECTURA_CANONICA_OBJETIVO.md` |
| ⬜ NO INICIADA | `SUPA-ARC-005` | Definir capa expuesta de vistas y RPC | `bloques/E3_SUPABASE/04_ARQUITECTURA_CANONICA_OBJETIVO.md` |
| ⬜ NO INICIADA | `SUPA-ARC-006` | Definir capa privada de helpers y lógica interna | `bloques/E3_SUPABASE/04_ARQUITECTURA_CANONICA_OBJETIVO.md` |
| ⬜ NO INICIADA | `SUPA-ARC-007` | Definir esquema transversal de auditoría y eventos | `bloques/E3_SUPABASE/04_ARQUITECTURA_CANONICA_OBJETIVO.md` |
| ⬜ NO INICIADA | `SUPA-ARC-008` | Definir modelo canónico de Auth e identidad empresarial | `bloques/E3_SUPABASE/04_ARQUITECTURA_CANONICA_OBJETIVO.md` |
| ⬜ NO INICIADA | `SUPA-ARC-009` | Definir vínculo de `auth.users` con trabajador, cliente y dispositivo | `bloques/E3_SUPABASE/04_ARQUITECTURA_CANONICA_OBJETIVO.md` |
| ⬜ NO INICIADA | `SUPA-ARC-010` | Definir ciclo de sesión, revocación y desactivación | `bloques/E3_SUPABASE/04_ARQUITECTURA_CANONICA_OBJETIVO.md` |
| ⬜ NO INICIADA | `SUPA-ARC-011` | Definir convenciones de nombres para esquemas, tablas y columnas | `bloques/E3_SUPABASE/04_ARQUITECTURA_CANONICA_OBJETIVO.md` |
| ⬜ NO INICIADA | `SUPA-ARC-012` | Definir convenciones de claves, constraints, estados y timestamps | `bloques/E3_SUPABASE/04_ARQUITECTURA_CANONICA_OBJETIVO.md` |
| ⬜ NO INICIADA | `SUPA-ARC-013` | Definir convenciones para funciones, RPC y triggers | `bloques/E3_SUPABASE/04_ARQUITECTURA_CANONICA_OBJETIVO.md` |
| ⬜ NO INICIADA | `SUPA-ARC-014` | Definir política canónica de `SECURITY DEFINER` | `bloques/E3_SUPABASE/04_ARQUITECTURA_CANONICA_OBJETIVO.md` |
| ⬜ NO INICIADA | `SUPA-ARC-015` | Definir política canónica de exposición, grants y RLS | `bloques/E3_SUPABASE/04_ARQUITECTURA_CANONICA_OBJETIVO.md` |
| ⬜ NO INICIADA | `SUPA-ARC-016` | Definir contratos de lectura y mutación por dominio | `bloques/E3_SUPABASE/04_ARQUITECTURA_CANONICA_OBJETIVO.md` |
| ⬜ NO INICIADA | `SUPA-ARC-017` | Definir política de escrituras entre dominios | `bloques/E3_SUPABASE/04_ARQUITECTURA_CANONICA_OBJETIVO.md` |
| ⬜ NO INICIADA | `SUPA-ARC-018` | Definir arquitectura de Storage | `bloques/E3_SUPABASE/04_ARQUITECTURA_CANONICA_OBJETIVO.md` |
| ⬜ NO INICIADA | `SUPA-ARC-019` | Definir arquitectura de Realtime y eventos | `bloques/E3_SUPABASE/04_ARQUITECTURA_CANONICA_OBJETIVO.md` |
| ⬜ NO INICIADA | `SUPA-ARC-020` | Definir arquitectura de Edge Functions, webhooks y cron | `bloques/E3_SUPABASE/04_ARQUITECTURA_CANONICA_OBJETIVO.md` |
| ⬜ NO INICIADA | `SUPA-ARC-021` | Definir estrategia de índices, rendimiento y crecimiento | `bloques/E3_SUPABASE/04_ARQUITECTURA_CANONICA_OBJETIVO.md` |
| ⬜ NO INICIADA | `SUPA-ARC-022` | Definir retención, archivado, respaldo y recuperación | `bloques/E3_SUPABASE/04_ARQUITECTURA_CANONICA_OBJETIVO.md` |
| ⬜ NO INICIADA | `SUPA-ARC-023` | Definir generación canónica de tipos para consumidores | `bloques/E3_SUPABASE/04_ARQUITECTURA_CANONICA_OBJETIVO.md` |
| ⬜ NO INICIADA | `SUPA-ARC-024` | Definir entornos local, pruebas, staging y producción | `bloques/E3_SUPABASE/04_ARQUITECTURA_CANONICA_OBJETIVO.md` |
| ⬜ NO INICIADA | `DATA-NORM-ARC-001` | Definir política de normalización por dominio, entidad y campo | `bloques/E3_SUPABASE/05_GOBIERNO_CANONICO_DE_NORMALIZACION_Y_CALIDAD_DE_TEXTO.md` |
| ⬜ NO INICIADA | `DATA-NORM-ARC-002` | Definir clases de campo y tratamiento permitido | `bloques/E3_SUPABASE/05_GOBIERNO_CANONICO_DE_NORMALIZACION_Y_CALIDAD_DE_TEXTO.md` |
| ⬜ NO INICIADA | `DATA-NORM-ARC-003` | Definir reglas de capitalización para nombres empresariales | `bloques/E3_SUPABASE/05_GOBIERNO_CANONICO_DE_NORMALIZACION_Y_CALIDAD_DE_TEXTO.md` |
| ⬜ NO INICIADA | `DATA-NORM-ARC-004` | Definir conectores que permanecen en minúscula | `bloques/E3_SUPABASE/05_GOBIERNO_CANONICO_DE_NORMALIZACION_Y_CALIDAD_DE_TEXTO.md` |
| ⬜ NO INICIADA | `DATA-NORM-ARC-005` | Definir excepciones de marcas, siglas, unidades y nombres legales | `bloques/E3_SUPABASE/05_GOBIERNO_CANONICO_DE_NORMALIZACION_Y_CALIDAD_DE_TEXTO.md` |
| ⬜ NO INICIADA | `DATA-NORM-ARC-006` | Definir diccionario ortográfico canónico y su gobierno | `bloques/E3_SUPABASE/05_GOBIERNO_CANONICO_DE_NORMALIZACION_Y_CALIDAD_DE_TEXTO.md` |
| ⬜ NO INICIADA | `DATA-NORM-ARC-007` | Definir cola de revisión para correcciones ambiguas | `bloques/E3_SUPABASE/05_GOBIERNO_CANONICO_DE_NORMALIZACION_Y_CALIDAD_DE_TEXTO.md` |
| ⬜ NO INICIADA | `DATA-NORM-ARC-008` | Definir representación de búsqueda y comparación | `bloques/E3_SUPABASE/05_GOBIERNO_CANONICO_DE_NORMALIZACION_Y_CALIDAD_DE_TEXTO.md` |
| ⬜ NO INICIADA | `DATA-NORM-ARC-009` | Definir auditoría, versionado e idempotencia de reglas | `bloques/E3_SUPABASE/05_GOBIERNO_CANONICO_DE_NORMALIZACION_Y_CALIDAD_DE_TEXTO.md` |
| ⬜ NO INICIADA | `DATA-NORM-ARC-010` | Definir estrategia de unicidad y detección de duplicados normalizados | `bloques/E3_SUPABASE/05_GOBIERNO_CANONICO_DE_NORMALIZACION_Y_CALIDAD_DE_TEXTO.md` |
| ⬜ NO INICIADA | `DATA-NORM-ARC-011` | Definir capas de ejecución: aplicación, servicio de dominio, RPC y trigger defensivo | `bloques/E3_SUPABASE/05_GOBIERNO_CANONICO_DE_NORMALIZACION_Y_CALIDAD_DE_TEXTO.md` |
| ⬜ NO INICIADA | `DATA-NORM-ARC-012` | Definir tratamiento de datos recibidos desde integraciones externas | `bloques/E3_SUPABASE/05_GOBIERNO_CANONICO_DE_NORMALIZACION_Y_CALIDAD_DE_TEXTO.md` |
| ⬜ NO INICIADA | `SUPA-ARC-025` | Consolidar y aprobar ADR de arquitectura canónica de datos | `bloques/E3_SUPABASE/05_GOBIERNO_CANONICO_DE_NORMALIZACION_Y_CALIDAD_DE_TEXTO.md` |
| ⬜ NO INICIADA | `SUPA-TRANS-001` | Mapear cada objeto actual hacia la arquitectura objetivo | `bloques/E3_SUPABASE/06_PLAN_DE_TRANSICION.md` |
| ⬜ NO INICIADA | `SUPA-TRANS-002` | Clasificar cada objeto como conservar, mover, fusionar, dividir, renombrar o retirar | `bloques/E3_SUPABASE/06_PLAN_DE_TRANSICION.md` |
| ⬜ NO INICIADA | `SUPA-TRANS-003` | Identificar dependencias de aplicaciones, RPC, RLS, triggers y datos | `bloques/E3_SUPABASE/06_PLAN_DE_TRANSICION.md` |
| ⬜ NO INICIADA | `SUPA-TRANS-004` | Definir orden de migración por dominio | `bloques/E3_SUPABASE/06_PLAN_DE_TRANSICION.md` |
| ⬜ NO INICIADA | `SUPA-TRANS-005` | Definir backfills y correcciones de calidad de datos | `bloques/E3_SUPABASE/06_PLAN_DE_TRANSICION.md` |
| ⬜ NO INICIADA | `SUPA-TRANS-006` | Definir vistas, wrappers o aliases temporales de compatibilidad | `bloques/E3_SUPABASE/06_PLAN_DE_TRANSICION.md` |
| ⬜ NO INICIADA | `SUPA-TRANS-007` | Definir adaptación coordinada de consumidores | `bloques/E3_SUPABASE/06_PLAN_DE_TRANSICION.md` |
| ⬜ NO INICIADA | `SUPA-TRANS-008` | Definir estrategia ante escrituras durante la transición | `bloques/E3_SUPABASE/06_PLAN_DE_TRANSICION.md` |
| ⬜ NO INICIADA | `SUPA-TRANS-009` | Definir pruebas antes y después de cada migración | `bloques/E3_SUPABASE/06_PLAN_DE_TRANSICION.md` |
| ⬜ NO INICIADA | `SUPA-TRANS-010` | Definir mediciones de rendimiento y seguridad | `bloques/E3_SUPABASE/06_PLAN_DE_TRANSICION.md` |
| ⬜ NO INICIADA | `SUPA-TRANS-011` | Definir rollback por paquete de cambio | `bloques/E3_SUPABASE/06_PLAN_DE_TRANSICION.md` |
| ⬜ NO INICIADA | `SUPA-TRANS-012` | Definir retiro progresivo de objetos legacy | `bloques/E3_SUPABASE/06_PLAN_DE_TRANSICION.md` |
| ⬜ NO INICIADA | `SUPA-TRANS-013` | Definir verificación de paridad local, staging y producción | `bloques/E3_SUPABASE/06_PLAN_DE_TRANSICION.md` |
| ⬜ NO INICIADA | `SUPA-TRANS-014` | Definir actualización de tipos, contratos y documentación | `bloques/E3_SUPABASE/06_PLAN_DE_TRANSICION.md` |
| ⬜ NO INICIADA | `SUPA-TRANS-015` | Crear roadmap ejecutable de migraciones en `vento-shell` | `bloques/E3_SUPABASE/06_PLAN_DE_TRANSICION.md` |
| ⬜ NO INICIADA | `DATA-NORM-TRANS-001` | Crear baseline de valores actuales antes de transformar | `bloques/E3_SUPABASE/07_TRANSICION_DE_NORMALIZACION_Y_CALIDAD_DE_DATOS.md` |
| ⬜ NO INICIADA | `DATA-NORM-TRANS-002` | Ejecutar dry-run de cada regla de normalización | `bloques/E3_SUPABASE/07_TRANSICION_DE_NORMALIZACION_Y_CALIDAD_DE_DATOS.md` |
| ⬜ NO INICIADA | `DATA-NORM-TRANS-003` | Identificar colisiones producidas por valores normalizados | `bloques/E3_SUPABASE/07_TRANSICION_DE_NORMALIZACION_Y_CALIDAD_DE_DATOS.md` |
| ⬜ NO INICIADA | `DATA-NORM-TRANS-004` | Resolver duplicados antes de aplicar restricciones de unicidad | `bloques/E3_SUPABASE/07_TRANSICION_DE_NORMALIZACION_Y_CALIDAD_DE_DATOS.md` |
| ⬜ NO INICIADA | `DATA-NORM-TRANS-005` | Definir backfills por dominio y lotes reversibles | `bloques/E3_SUPABASE/07_TRANSICION_DE_NORMALIZACION_Y_CALIDAD_DE_DATOS.md` |
| ⬜ NO INICIADA | `DATA-NORM-TRANS-006` | Activar reglas sobre nuevas escrituras de forma progresiva | `bloques/E3_SUPABASE/07_TRANSICION_DE_NORMALIZACION_Y_CALIDAD_DE_DATOS.md` |
| ⬜ NO INICIADA | `DATA-NORM-TRANS-007` | Validar búsquedas, relaciones e integraciones después del backfill | `bloques/E3_SUPABASE/07_TRANSICION_DE_NORMALIZACION_Y_CALIDAD_DE_DATOS.md` |
| ⬜ NO INICIADA | `DATA-NORM-TRANS-008` | Definir rollback y recuperación del valor anterior | `bloques/E3_SUPABASE/07_TRANSICION_DE_NORMALIZACION_Y_CALIDAD_DE_DATOS.md` |
| ⬜ NO INICIADA | `DATA-NORM-TRANS-009` | Definir evidencia de aprobación por dominio | `bloques/E3_SUPABASE/07_TRANSICION_DE_NORMALIZACION_Y_CALIDAD_DE_DATOS.md` |
| ⬜ NO INICIADA | `SUPA-TRANS-016` | Aprobar transición antes de iniciar BLOQUE R | `bloques/E3_SUPABASE/07_TRANSICION_DE_NORMALIZACION_Y_CALIDAD_DE_DATOS.md` |
| ⬜ NO INICIADA | `TSVC-CAT-001` | Inventariar servicios transversales actuales y faltantes | `bloques/E4_SERVICIOS_TRANSVERSALES/02_CATALOGO_DE_SERVICIOS_TRANSVERSALES.md` |
| ⬜ NO INICIADA | `TSVC-CAT-002` | Definir propietario técnico y gobierno de cada servicio | `bloques/E4_SERVICIOS_TRANSVERSALES/02_CATALOGO_DE_SERVICIOS_TRANSVERSALES.md` |
| ⬜ NO INICIADA | `TSVC-CAT-003` | Definir aplicaciones productoras y consumidoras | `bloques/E4_SERVICIOS_TRANSVERSALES/02_CATALOGO_DE_SERVICIOS_TRANSVERSALES.md` |
| ⬜ NO INICIADA | `TSVC-CAT-004` | Definir contrato, versión y compatibilidad | `bloques/E4_SERVICIOS_TRANSVERSALES/02_CATALOGO_DE_SERVICIOS_TRANSVERSALES.md` |
| ⬜ NO INICIADA | `TSVC-CAT-005` | Definir identidad técnica y credenciales mínimas | `bloques/E4_SERVICIOS_TRANSVERSALES/02_CATALOGO_DE_SERVICIOS_TRANSVERSALES.md` |
| ⬜ NO INICIADA | `TSVC-CAT-006` | Definir idempotencia, reintentos y deduplicación | `bloques/E4_SERVICIOS_TRANSVERSALES/02_CATALOGO_DE_SERVICIOS_TRANSVERSALES.md` |
| ⬜ NO INICIADA | `TSVC-CAT-007` | Definir observabilidad, métricas, alertas y auditoría | `bloques/E4_SERVICIOS_TRANSVERSALES/02_CATALOGO_DE_SERVICIOS_TRANSVERSALES.md` |
| ⬜ NO INICIADA | `TSVC-CAT-008` | Definir contingencia y degradación controlada | `bloques/E4_SERVICIOS_TRANSVERSALES/02_CATALOGO_DE_SERVICIOS_TRANSVERSALES.md` |
| ⬜ NO INICIADA | `TSVC-CAT-009` | Definir retención, archivado y limpieza | `bloques/E4_SERVICIOS_TRANSVERSALES/02_CATALOGO_DE_SERVICIOS_TRANSVERSALES.md` |
| ⬜ NO INICIADA | `TSVC-CAT-010` | Definir adopción progresiva y retiro de soluciones legacy | `bloques/E4_SERVICIOS_TRANSVERSALES/02_CATALOGO_DE_SERVICIOS_TRANSVERSALES.md` |
| ⬜ NO INICIADA | `QUEUE-ARC-001` | Inventariar colas, cron, jobs y automatizaciones existentes | `bloques/E4_SERVICIOS_TRANSVERSALES/03_INFRAESTRUCTURA_CANONICA_DE_COLAS.md` |
| ⬜ NO INICIADA | `QUEUE-ARC-002` | Definir contrato canónico de trabajo asíncrono | `bloques/E4_SERVICIOS_TRANSVERSALES/03_INFRAESTRUCTURA_CANONICA_DE_COLAS.md` |
| ⬜ NO INICIADA | `QUEUE-ARC-003` | Definir clave de idempotencia por trabajo | `bloques/E4_SERVICIOS_TRANSVERSALES/03_INFRAESTRUCTURA_CANONICA_DE_COLAS.md` |
| ⬜ NO INICIADA | `QUEUE-ARC-004` | Definir prioridad, programación y vencimiento | `bloques/E4_SERVICIOS_TRANSVERSALES/03_INFRAESTRUCTURA_CANONICA_DE_COLAS.md` |
| ⬜ NO INICIADA | `QUEUE-ARC-005` | Definir asignación a trabajador, dispositivo o adaptador | `bloques/E4_SERVICIOS_TRANSVERSALES/03_INFRAESTRUCTURA_CANONICA_DE_COLAS.md` |
| ⬜ NO INICIADA | `QUEUE-ARC-006` | Definir reintentos, backoff y límite máximo | `bloques/E4_SERVICIOS_TRANSVERSALES/03_INFRAESTRUCTURA_CANONICA_DE_COLAS.md` |
| ⬜ NO INICIADA | `QUEUE-ARC-007` | Definir cancelación antes y durante ejecución | `bloques/E4_SERVICIOS_TRANSVERSALES/03_INFRAESTRUCTURA_CANONICA_DE_COLAS.md` |
| ⬜ NO INICIADA | `QUEUE-ARC-008` | Definir cola de fallos y recuperación manual | `bloques/E4_SERVICIOS_TRANSVERSALES/03_INFRAESTRUCTURA_CANONICA_DE_COLAS.md` |
| ⬜ NO INICIADA | `QUEUE-ARC-009` | Definir bloqueo de duplicados y concurrencia | `bloques/E4_SERVICIOS_TRANSVERSALES/03_INFRAESTRUCTURA_CANONICA_DE_COLAS.md` |
| ⬜ NO INICIADA | `QUEUE-ARC-010` | Definir estados y eventos canónicos | `bloques/E4_SERVICIOS_TRANSVERSALES/03_INFRAESTRUCTURA_CANONICA_DE_COLAS.md` |
| ⬜ NO INICIADA | `QUEUE-ARC-011` | Definir métricas de espera, ejecución y error | `bloques/E4_SERVICIOS_TRANSVERSALES/03_INFRAESTRUCTURA_CANONICA_DE_COLAS.md` |
| ⬜ NO INICIADA | `QUEUE-ARC-012` | Definir autorización para crear, cancelar y reintentar trabajos | `bloques/E4_SERVICIOS_TRANSVERSALES/03_INFRAESTRUCTURA_CANONICA_DE_COLAS.md` |
| ⬜ NO INICIADA | `PRINT-ARC-001` | Inventariar impresoras por empresa, sede, área y punto operativo | `bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md` |
| ⬜ NO INICIADA | `PRINT-ARC-002` | Inventariar conexión, protocolo, capacidades, papel y lenguaje de impresión | `bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md` |
| ⬜ NO INICIADA | `PRINT-ARC-003` | Inventariar documentos, etiquetas, comandas y comprobantes imprimibles | `bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md` |
| ⬜ NO INICIADA | `PRINT-ARC-004` | Definir aplicación propietaria de cada documento | `bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md` |
| ⬜ NO INICIADA | `PRINT-ARC-005` | Definir plantilla, versión, tamaño y datos requeridos | `bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md` |
| ⬜ NO INICIADA | `PRINT-ARC-006` | Definir contrato canónico de trabajo de impresión | `bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md` |
| ⬜ NO INICIADA | `PRINT-ARC-007` | Definir enrutamiento por sede, área, documento, canal y dispositivo | `bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md` |
| ⬜ NO INICIADA | `PRINT-ARC-008` | Definir impresora principal, alternativas y fallback | `bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md` |
| ⬜ NO INICIADA | `PRINT-ARC-009` | Definir estado de impresora y heartbeat | `bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md` |
| ⬜ NO INICIADA | `PRINT-ARC-010` | Definir idempotencia y prevención de impresiones duplicadas | `bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md` |
| ⬜ NO INICIADA | `PRINT-ARC-011` | Definir reintentos automáticos y cola de fallos | `bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md` |
| ⬜ NO INICIADA | `PRINT-ARC-012` | Definir confirmación de envío, impresión y entrega cuando sea verificable | `bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md` |
| ⬜ NO INICIADA | `PRINT-ARC-013` | Definir cancelación y expiración | `bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md` |
| ⬜ NO INICIADA | `PRINT-ARC-014` | Definir reimpresión como acción separada y auditable | `bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md` |
| ⬜ NO INICIADA | `PRINT-ARC-015` | Definir permisos de impresión, reimpresión y administración | `bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md` |
| ⬜ NO INICIADA | `PRINT-ARC-016` | Definir privacidad y ocultamiento de datos sensibles | `bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md` |
| ⬜ NO INICIADA | `PRINT-ARC-017` | Definir operación offline y contingencia manual | `bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md` |
| ⬜ NO INICIADA | `PRINT-ARC-018` | Definir adaptadores LAN, USB, Bluetooth o puente local | `bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md` |
| ⬜ NO INICIADA | `PRINT-ARC-019` | Definir monitoreo y diagnóstico por sede | `bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md` |
| ⬜ NO INICIADA | `PRINT-ARC-020` | Definir alcance, prerrequisitos, métricas y criterios de aceptación del piloto de impresión | `bloques/E4_SERVICIOS_TRANSVERSALES/04_SERVICIO_TRANSVERSAL_DE_IMPRESION.md` |
| ⬜ NO INICIADA | `NOTIFY-ARC-001` | Inventariar notificaciones actuales y canales | `bloques/E4_SERVICIOS_TRANSVERSALES/05_NOTIFICACIONES_Y_ALERTAS.md` |
| ⬜ NO INICIADA | `NOTIFY-ARC-002` | Definir evento empresarial que origina cada notificación | `bloques/E4_SERVICIOS_TRANSVERSALES/05_NOTIFICACIONES_Y_ALERTAS.md` |
| ⬜ NO INICIADA | `NOTIFY-ARC-003` | Definir destinatarios por responsabilidad y contexto | `bloques/E4_SERVICIOS_TRANSVERSALES/05_NOTIFICACIONES_Y_ALERTAS.md` |
| ⬜ NO INICIADA | `NOTIFY-ARC-004` | Definir prioridad, vigencia y deduplicación | `bloques/E4_SERVICIOS_TRANSVERSALES/05_NOTIFICACIONES_Y_ALERTAS.md` |
| ⬜ NO INICIADA | `NOTIFY-ARC-005` | Definir canales internos, correo, push o mensajería externa | `bloques/E4_SERVICIOS_TRANSVERSALES/05_NOTIFICACIONES_Y_ALERTAS.md` |
| ⬜ NO INICIADA | `NOTIFY-ARC-006` | Definir preferencias sin ocultar alertas obligatorias | `bloques/E4_SERVICIOS_TRANSVERSALES/05_NOTIFICACIONES_Y_ALERTAS.md` |
| ⬜ NO INICIADA | `NOTIFY-ARC-007` | Definir confirmación, lectura y escalamiento | `bloques/E4_SERVICIOS_TRANSVERSALES/05_NOTIFICACIONES_Y_ALERTAS.md` |
| ⬜ NO INICIADA | `NOTIFY-ARC-008` | Definir reintentos, fallos y contingencia | `bloques/E4_SERVICIOS_TRANSVERSALES/05_NOTIFICACIONES_Y_ALERTAS.md` |
| ⬜ NO INICIADA | `NOTIFY-ARC-009` | Definir privacidad y contenido sensible | `bloques/E4_SERVICIOS_TRANSVERSALES/05_NOTIFICACIONES_Y_ALERTAS.md` |
| ⬜ NO INICIADA | `NOTIFY-ARC-010` | Definir métricas y auditoría de entrega | `bloques/E4_SERVICIOS_TRANSVERSALES/05_NOTIFICACIONES_Y_ALERTAS.md` |
| ⬜ NO INICIADA | `EVID-ARC-001` | Inventariar archivos y evidencia por proceso | `bloques/E4_SERVICIOS_TRANSVERSALES/06_ARCHIVOS_DOCUMENTOS_Y_EVIDENCIA.md` |
| ⬜ NO INICIADA | `EVID-ARC-002` | Definir propietario funcional de cada tipo documental | `bloques/E4_SERVICIOS_TRANSVERSALES/06_ARCHIVOS_DOCUMENTOS_Y_EVIDENCIA.md` |
| ⬜ NO INICIADA | `EVID-ARC-003` | Definir clasificación de sensibilidad | `bloques/E4_SERVICIOS_TRANSVERSALES/06_ARCHIVOS_DOCUMENTOS_Y_EVIDENCIA.md` |
| ⬜ NO INICIADA | `EVID-ARC-004` | Definir metadatos, versión y vínculo con el recurso | `bloques/E4_SERVICIOS_TRANSVERSALES/06_ARCHIVOS_DOCUMENTOS_Y_EVIDENCIA.md` |
| ⬜ NO INICIADA | `EVID-ARC-005` | Definir carga, sustitución, anulación y retención | `bloques/E4_SERVICIOS_TRANSVERSALES/06_ARCHIVOS_DOCUMENTOS_Y_EVIDENCIA.md` |
| ⬜ NO INICIADA | `EVID-ARC-006` | Definir validación de tipo, tamaño, integridad y malware | `bloques/E4_SERVICIOS_TRANSVERSALES/06_ARCHIVOS_DOCUMENTOS_Y_EVIDENCIA.md` |
| ⬜ NO INICIADA | `EVID-ARC-007` | Definir acceso temporal y URLs firmadas | `bloques/E4_SERVICIOS_TRANSVERSALES/06_ARCHIVOS_DOCUMENTOS_Y_EVIDENCIA.md` |
| ⬜ NO INICIADA | `EVID-ARC-008` | Definir auditoría de consulta y modificación | `bloques/E4_SERVICIOS_TRANSVERSALES/06_ARCHIVOS_DOCUMENTOS_Y_EVIDENCIA.md` |
| ⬜ NO INICIADA | `EVID-ARC-009` | Definir conservación legal y eliminación | `bloques/E4_SERVICIOS_TRANSVERSALES/06_ARCHIVOS_DOCUMENTOS_Y_EVIDENCIA.md` |
| ⬜ NO INICIADA | `EVID-ARC-010` | Definir contingencia ante indisponibilidad de Storage | `bloques/E4_SERVICIOS_TRANSVERSALES/06_ARCHIVOS_DOCUMENTOS_Y_EVIDENCIA.md` |
| ⬜ NO INICIADA | `DELIV-PKG-001` | Crear identificador estable para cada paquete de implementación | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/02_PAQUETES_DE_IMPLEMENTACION.md` |
| ⬜ NO INICIADA | `DELIV-PKG-002` | Vincular el paquete con capability_id, process_id y gap_id | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/02_PAQUETES_DE_IMPLEMENTACION.md` |
| ⬜ NO INICIADA | `DELIV-PKG-003` | Definir aplicación, dominio y repositorio propietarios | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/02_PAQUETES_DE_IMPLEMENTACION.md` |
| ⬜ NO INICIADA | `DELIV-PKG-004` | Definir estado AS-IS y resultado TO-BE verificable | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/02_PAQUETES_DE_IMPLEMENTACION.md` |
| ⬜ NO INICIADA | `DELIV-PKG-005` | Definir alcance incluido, excluido y diferido | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/02_PAQUETES_DE_IMPLEMENTACION.md` |
| ⬜ NO INICIADA | `DELIV-PKG-006` | Definir pantallas, componentes y navegación que se crearán o modificarán | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/02_PAQUETES_DE_IMPLEMENTACION.md` |
| ⬜ NO INICIADA | `DELIV-PKG-007` | Definir lógica de dominio, Server Actions, API, RPC y Edge Functions | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/02_PAQUETES_DE_IMPLEMENTACION.md` |
| ⬜ NO INICIADA | `DELIV-PKG-008` | Definir tablas, vistas, funciones, políticas, Storage y Realtime afectados | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/02_PAQUETES_DE_IMPLEMENTACION.md` |
| ⬜ NO INICIADA | `DELIV-PKG-009` | Definir migraciones, backfills, compatibilidad y retiro legacy | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/02_PAQUETES_DE_IMPLEMENTACION.md` |
| ⬜ NO INICIADA | `DELIV-PKG-010` | Definir eventos emitidos, consumidos, colas y compensaciones | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/02_PAQUETES_DE_IMPLEMENTACION.md` |
| ⬜ NO INICIADA | `DELIV-PKG-011` | Definir impresión, notificaciones, documentos y evidencia requeridos | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/02_PAQUETES_DE_IMPLEMENTACION.md` |
| ⬜ NO INICIADA | `DELIV-PKG-012` | Definir permisos, modalidad, alcance, contexto y contrato de recurso | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/02_PAQUETES_DE_IMPLEMENTACION.md` |
| ⬜ NO INICIADA | `DELIV-PKG-013` | Definir requisitos no funcionales aplicables | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/02_PAQUETES_DE_IMPLEMENTACION.md` |
| ⬜ NO INICIADA | `DELIV-PKG-014` | Enumerar archivos exactos que se crearán, modificarán o retirarán | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/02_PAQUETES_DE_IMPLEMENTACION.md` |
| ⬜ NO INICIADA | `DELIV-PKG-015` | Definir dependencias, bloqueos y orden de aplicación | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/02_PAQUETES_DE_IMPLEMENTACION.md` |
| ⬜ NO INICIADA | `DELIV-PKG-016` | Definir pruebas unitarias, contractuales, integración, seguridad y E2E | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/02_PAQUETES_DE_IMPLEMENTACION.md` |
| ⬜ NO INICIADA | `DELIV-PKG-017` | Definir observabilidad, métricas, logs, alertas y auditoría | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/02_PAQUETES_DE_IMPLEMENTACION.md` |
| ⬜ NO INICIADA | `DELIV-PKG-018` | Definir feature flags, configuración y activación progresiva | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/02_PAQUETES_DE_IMPLEMENTACION.md` |
| ⬜ NO INICIADA | `DELIV-PKG-019` | Definir estrategia de despliegue y rollout | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/02_PAQUETES_DE_IMPLEMENTACION.md` |
| ⬜ NO INICIADA | `DELIV-PKG-020` | Definir rollback técnico, funcional y de datos | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/02_PAQUETES_DE_IMPLEMENTACION.md` |
| ⬜ NO INICIADA | `DELIV-PKG-021` | Definir documentación, procedimiento y capacitación | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/02_PAQUETES_DE_IMPLEMENTACION.md` |
| ⬜ NO INICIADA | `DELIV-PKG-022` | Definir alcance, actores, datos y duración del piloto | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/02_PAQUETES_DE_IMPLEMENTACION.md` |
| ⬜ NO INICIADA | `DELIV-PKG-023` | Definir criterios de aceptación y evidencia de cierre | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/02_PAQUETES_DE_IMPLEMENTACION.md` |
| ⬜ NO INICIADA | `DELIV-PKG-024` | Vincular el paquete con el registro canónico de brechas | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/02_PAQUETES_DE_IMPLEMENTACION.md` |
| ⬜ NO INICIADA | `DELIV-PKG-025` | Aprobar el paquete antes de iniciar implementación física | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/02_PAQUETES_DE_IMPLEMENTACION.md` |
| ⬜ NO INICIADA | `READY-GATE-001` | Confirmar código desplegado en el entorno objetivo | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/03_PUERTA_DE_READINESS_OPERATIVO.md` |
| ⬜ NO INICIADA | `READY-GATE-002` | Confirmar migraciones aplicadas y datos validados | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/03_PUERTA_DE_READINESS_OPERATIVO.md` |
| ⬜ NO INICIADA | `READY-GATE-003` | Confirmar permisos, matrices y dispositivos configurados | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/03_PUERTA_DE_READINESS_OPERATIVO.md` |
| ⬜ NO INICIADA | `READY-GATE-004` | Confirmar usuarios, roles, sedes, áreas y turnos requeridos | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/03_PUERTA_DE_READINESS_OPERATIVO.md` |
| ⬜ NO INICIADA | `READY-GATE-005` | Confirmar catálogos y datos maestros mínimos | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/03_PUERTA_DE_READINESS_OPERATIVO.md` |
| ⬜ NO INICIADA | `READY-GATE-006` | Confirmar integraciones y credenciales de prueba o producción | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/03_PUERTA_DE_READINESS_OPERATIVO.md` |
| ⬜ NO INICIADA | `READY-GATE-007` | Confirmar hardware, red, escáneres e impresoras | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/03_PUERTA_DE_READINESS_OPERATIVO.md` |
| ⬜ NO INICIADA | `READY-GATE-008` | Confirmar procedimientos operativos y contingencias | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/03_PUERTA_DE_READINESS_OPERATIVO.md` |
| ⬜ NO INICIADA | `READY-GATE-009` | Confirmar capacitación y material de apoyo | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/03_PUERTA_DE_READINESS_OPERATIVO.md` |
| ⬜ NO INICIADA | `READY-GATE-010` | Confirmar mesa de soporte, responsables y escalamiento | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/03_PUERTA_DE_READINESS_OPERATIVO.md` |
| ⬜ NO INICIADA | `READY-GATE-011` | Confirmar monitoreo, métricas y alertas | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/03_PUERTA_DE_READINESS_OPERATIVO.md` |
| ⬜ NO INICIADA | `READY-GATE-012` | Confirmar respaldo y rollback probados | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/03_PUERTA_DE_READINESS_OPERATIVO.md` |
| ⬜ NO INICIADA | `READY-GATE-013` | Capturar línea base previa al piloto | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/03_PUERTA_DE_READINESS_OPERATIVO.md` |
| ⬜ NO INICIADA | `READY-GATE-014` | Registrar riesgos aceptados y condiciones de suspensión | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/03_PUERTA_DE_READINESS_OPERATIVO.md` |
| ⬜ NO INICIADA | `READY-GATE-015` | Aprobar formalmente la entrada al piloto operativo | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/03_PUERTA_DE_READINESS_OPERATIVO.md` |
| ⬜ NO INICIADA | `CUTOVER-OPS-001` | Definir fecha, ventana y responsables del cutover | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/04_CUTOVER_Y_PILOTO.md` |
| ⬜ NO INICIADA | `CUTOVER-OPS-002` | Definir secuencia de activación por sede, área, rol o proceso | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/04_CUTOVER_Y_PILOTO.md` |
| ⬜ NO INICIADA | `CUTOVER-OPS-003` | Definir convivencia temporal con el proceso anterior | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/04_CUTOVER_Y_PILOTO.md` |
| ⬜ NO INICIADA | `CUTOVER-OPS-004` | Evitar doble registro y doble efecto durante la transición | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/04_CUTOVER_Y_PILOTO.md` |
| ⬜ NO INICIADA | `CUTOVER-OPS-005` | Definir conciliaciones durante el piloto | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/04_CUTOVER_Y_PILOTO.md` |
| ⬜ NO INICIADA | `CUTOVER-OPS-006` | Definir criterio de pausa, reversión o continuación | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/04_CUTOVER_Y_PILOTO.md` |
| ⬜ NO INICIADA | `CUTOVER-OPS-007` | Registrar incidentes, decisiones y cambios de alcance | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/04_CUTOVER_Y_PILOTO.md` |
| ⬜ NO INICIADA | `CUTOVER-OPS-008` | Medir tiempos, errores, adopción y resultado empresarial | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/04_CUTOVER_Y_PILOTO.md` |
| ⬜ NO INICIADA | `CUTOVER-OPS-009` | Aprobar salida del piloto o exigir correcciones | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/04_CUTOVER_Y_PILOTO.md` |
| ⬜ NO INICIADA | `CUTOVER-OPS-010` | Retirar el proceso anterior solo con evidencia suficiente | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/04_CUTOVER_Y_PILOTO.md` |
| ⬜ NO INICIADA | `HYPERCARE-OPS-001` | Definir periodo de acompañamiento intensivo | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/05_HYPERCARE_Y_ESTABILIZACION.md` |
| ⬜ NO INICIADA | `HYPERCARE-OPS-002` | Definir responsables funcionales y técnicos | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/05_HYPERCARE_Y_ESTABILIZACION.md` |
| ⬜ NO INICIADA | `HYPERCARE-OPS-003` | Monitorear errores, colas, integraciones y rendimiento | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/05_HYPERCARE_Y_ESTABILIZACION.md` |
| ⬜ NO INICIADA | `HYPERCARE-OPS-004` | Monitorear adopción, tiempos y desviaciones operativas | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/05_HYPERCARE_Y_ESTABILIZACION.md` |
| ⬜ NO INICIADA | `HYPERCARE-OPS-005` | Conciliar datos y efectos entre dominios | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/05_HYPERCARE_Y_ESTABILIZACION.md` |
| ⬜ NO INICIADA | `HYPERCARE-OPS-006` | Priorizar y corregir incidentes de estabilización | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/05_HYPERCARE_Y_ESTABILIZACION.md` |
| ⬜ NO INICIADA | `HYPERCARE-OPS-007` | Registrar deuda aceptada y tareas posteriores | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/05_HYPERCARE_Y_ESTABILIZACION.md` |
| ⬜ NO INICIADA | `HYPERCARE-OPS-008` | Confirmar soporte ordinario y documentación definitiva | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/05_HYPERCARE_Y_ESTABILIZACION.md` |
| ⬜ NO INICIADA | `HYPERCARE-OPS-009` | Confirmar retiro controlado de contingencias temporales | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/05_HYPERCARE_Y_ESTABILIZACION.md` |
| ⬜ NO INICIADA | `HYPERCARE-OPS-010` | Aprobar cierre con evidencia funcional, técnica y operativa | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/05_HYPERCARE_Y_ESTABILIZACION.md` |
| ⬜ NO INICIADA | `E5-GATE-001` | Confirmar que cada capacidad priorizada tiene paquete aprobado | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/06_PUERTA_DE_SALIDA_DE_E5.md` |
| ⬜ NO INICIADA | `E5-GATE-002` | Confirmar que cada brecha crítica tiene propietario y destino | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/06_PUERTA_DE_SALIDA_DE_E5.md` |
| ⬜ NO INICIADA | `E5-GATE-003` | Confirmar que los requisitos no funcionales están cubiertos | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/06_PUERTA_DE_SALIDA_DE_E5.md` |
| ⬜ NO INICIADA | `E5-GATE-004` | Confirmar que rollout, rollback y contingencia son ejecutables | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/06_PUERTA_DE_SALIDA_DE_E5.md` |
| ⬜ NO INICIADA | `E5-GATE-005` | Confirmar que el piloto tiene criterios medibles | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/06_PUERTA_DE_SALIDA_DE_E5.md` |
| ⬜ NO INICIADA | `E5-GATE-006` | Confirmar que capacitación y soporte están planificados | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/06_PUERTA_DE_SALIDA_DE_E5.md` |
| ⬜ NO INICIADA | `E5-GATE-007` | Confirmar trazabilidad hasta pruebas y evidencia de cierre | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/06_PUERTA_DE_SALIDA_DE_E5.md` |
| ⬜ NO INICIADA | `E5-GATE-008` | Aprobar entrada a implementación física por paquetes | `bloques/E5_PLANIFICACION_DE_IMPLEMENTACION/06_PUERTA_DE_SALIDA_DE_E5.md` |
| ⬜ NO INICIADA | `SHELL-AUTH-001` | Consolidar @vento/os-context como SDK canónico de contexto y autorización | `bloques/H_FUNDACION_COMPARTIDA/03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md` |
| ⬜ NO INICIADA | `SHELL-AUTH-002` | Implementar adapters de servidor, cliente y proyecciones seguras | `bloques/H_FUNDACION_COMPARTIDA/03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md` |
| ⬜ NO INICIADA | `SHELL-AUTH-003` | Implementar scope por solicitud y registro canónico de consumidores | `bloques/H_FUNDACION_COMPARTIDA/03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md` |
| ⬜ NO INICIADA | `SHELL-AUTH-004` | Implementar lint, métricas y gates contra consumidores legacy | `bloques/H_FUNDACION_COMPARTIDA/03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md` |
| ⬜ NO INICIADA | `SHELL-AUTH-005` | Migrar consumidores de autorización en todos los repositorios | `bloques/H_FUNDACION_COMPARTIDA/03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md` |
| ⬜ NO INICIADA | `SHELL-CTX-001` | Consolidar el módulo de contexto dentro de @vento/os-context | `bloques/H_FUNDACION_COMPARTIDA/03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md` |
| ⬜ NO INICIADA | `SHELL-CTX-002` | Implementar consumo canónico de turno y check-in | `bloques/H_FUNDACION_COMPARTIDA/03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md` |
| ⬜ NO INICIADA | `SHELL-CTX-003` | Implementar proyecciones seguras de sede y área efectivas | `bloques/H_FUNDACION_COMPARTIDA/03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md` |
| ⬜ NO INICIADA | `SHELL-CTX-004` | Implementar readiness operativo sin booleanos de autorización | `bloques/H_FUNDACION_COMPARTIDA/03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md` |
| ⬜ NO INICIADA | `SHELL-CTX-005` | Implementar razones seguras de bloqueo contextual | `bloques/H_FUNDACION_COMPARTIDA/03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md` |
| ⬜ NO INICIADA | `AUTH-UI-001` | Inventariar todas las rutas de NEXO | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-002` | Inventariar todas las rutas de FOGO | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-003` | Inventariar todas las rutas de ORIGO | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-004` | Inventariar todas las rutas de PULSO | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-005` | Inventariar todas las rutas de VISO | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-006` | Inventariar todas las rutas de NUMERA | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-007` | Inventariar todas las pantallas de ANIMA | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-008` | Inventariar todas las superficies de SHELL | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-009` | Inventariar superficies laborales relacionadas con PASS | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-010` | Auditar rutas y superficies actuales de AURA | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-011` | Asignar process_id a cada vista | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-012` | Asignar process_step a cada vista | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-013` | Definir aplicación propietaria | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-014` | Definir si la aplicación solo consume la capacidad | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-015` | Clasificar vista operativa | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-016` | Clasificar vista administrativa | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-017` | Clasificar vista de supervisión | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-018` | Clasificar vista de configuración | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-019` | Clasificar vista de auditoría | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-020` | Clasificar vista personal o de cliente | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-021` | Definir actores objetivo | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-022` | Definir dispositivo de uso | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-023` | Definir frecuencia de uso | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-024` | Definir acción principal | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-025` | Definir acciones secundarias | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-026` | Identificar vistas duplicadas | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-027` | Identificar vistas legacy | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-028` | Identificar vistas candidatas a retiro | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-029` | Identificar vistas técnicas que no deben ser permisos | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-030` | Asignar permiso de lectura a cada vista | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-031` | Asignar permiso exacto a cada acción | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-032` | Definir si requiere turno | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-033` | Definir si requiere check-in | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-034` | Definir si requiere sede | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-035` | Definir si requiere área | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-036` | Definir si admite dispositivo compartido | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-037` | Definir si admite simulación | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-038` | Definir campos sensibles visibles | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-039` | Definir masking según permiso | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-040` | Ocultar enlaces no autorizados | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-041` | Bloquear acceso directo por URL | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-042` | Bloquear acciones aunque el botón sea visible | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-043` | Vincular cada acción con protección de servidor | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-044` | Evitar permisos derivados de nombres de rutas | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-045` | Unificar navegación y autorización | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-046` | Mostrar contexto activo en cada aplicación | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-047` | Mostrar rol simulado claramente | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-048` | Estandarizar estados sin acceso | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-049` | Estandarizar estados de carga | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-050` | Estandarizar estados vacíos | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-051` | Estandarizar errores recuperables | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-052` | Diseñar página inicial según actor | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-053` | Diseñar navegación según tareas frecuentes | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-054` | Reducir opciones irrelevantes | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-055` | Crear prototipo por rol | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-056` | Validar prototipo antes de implementar | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-057` | Definir criterio de usabilidad por pantalla | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-058` | Probar con usuarios reales | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-059` | Registrar problemas encontrados | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-UI-060` | Aprobar la pantalla antes de retirarla del roadmap | `bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md` |
| ⬜ NO INICIADA | `AUTH-SRV-001` | Inventariar Server Actions de todos los repositorios | `bloques/J_ACCIONES_DE_SERVIDOR/00_BLOQUE_J.md` |
| ⬜ NO INICIADA | `AUTH-SRV-002` | Inventariar API routes | `bloques/J_ACCIONES_DE_SERVIDOR/00_BLOQUE_J.md` |
| ⬜ NO INICIADA | `AUTH-SRV-003` | Inventariar RPC utilizadas | `bloques/J_ACCIONES_DE_SERVIDOR/00_BLOQUE_J.md` |
| ⬜ NO INICIADA | `AUTH-SRV-004` | Eliminar confianza exclusiva en la interfaz | `bloques/J_ACCIONES_DE_SERVIDOR/00_BLOQUE_J.md` |
| ⬜ NO INICIADA | `AUTH-SRV-005` | Validar permiso en cada escritura | `bloques/J_ACCIONES_DE_SERVIDOR/00_BLOQUE_J.md` |
| ⬜ NO INICIADA | `AUTH-SRV-006` | Validar sede en cada escritura | `bloques/J_ACCIONES_DE_SERVIDOR/00_BLOQUE_J.md` |
| ⬜ NO INICIADA | `AUTH-SRV-007` | Validar área en cada escritura | `bloques/J_ACCIONES_DE_SERVIDOR/00_BLOQUE_J.md` |
| ⬜ NO INICIADA | `AUTH-SRV-008` | Validar turno cuando corresponda | `bloques/J_ACCIONES_DE_SERVIDOR/00_BLOQUE_J.md` |
| ⬜ NO INICIADA | `AUTH-SRV-009` | Validar rol operativo cuando corresponda | `bloques/J_ACCIONES_DE_SERVIDOR/00_BLOQUE_J.md` |
| ⬜ NO INICIADA | `AUTH-SRV-010` | Validar dispositivo compartido | `bloques/J_ACCIONES_DE_SERVIDOR/00_BLOQUE_J.md` |
| ⬜ NO INICIADA | `AUTH-SRV-011` | Validar estado actual de la entidad | `bloques/J_ACCIONES_DE_SERVIDOR/00_BLOQUE_J.md` |
| ⬜ NO INICIADA | `AUTH-SRV-012` | Evitar operaciones entre sedes no autorizadas | `bloques/J_ACCIONES_DE_SERVIDOR/00_BLOQUE_J.md` |
| ⬜ NO INICIADA | `AUTH-SRV-013` | Evitar operaciones entre áreas no autorizadas | `bloques/J_ACCIONES_DE_SERVIDOR/00_BLOQUE_J.md` |
| ⬜ NO INICIADA | `AUTH-SRV-014` | Registrar actor real y actor operativo | `bloques/J_ACCIONES_DE_SERVIDOR/00_BLOQUE_J.md` |
| ⬜ NO INICIADA | `AUTH-SRV-015` | Registrar rol simulado en auditoría | `bloques/J_ACCIONES_DE_SERVIDOR/00_BLOQUE_J.md` |
| ⬜ NO INICIADA | `AUTH-SRV-016` | Normalizar errores de autorización | `bloques/J_ACCIONES_DE_SERVIDOR/00_BLOQUE_J.md` |
| ⬜ NO INICIADA | `AUTH-SRV-017` | Crear helpers server compartidos | `bloques/J_ACCIONES_DE_SERVIDOR/00_BLOQUE_J.md` |
| ⬜ NO INICIADA | `AUTH-SRV-018` | Revisar acciones administrativas sin turno | `bloques/J_ACCIONES_DE_SERVIDOR/00_BLOQUE_J.md` |
| ⬜ NO INICIADA | `NEXO-DOM-001` | Clasificar consumibles, stock por cantidad, reutilizables, activos serializados, repuestos, kits y contenedores | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-DOM-002` | Definir propósito y tipos canónicos de LPN | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-DOM-003` | Definir ciclo de vida de LPN: crear, activar, cerrar, anular y reetiquetar | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-DOM-004` | Definir contenido, empaque y desempaque de LPN | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-DOM-005` | Definir división, unión y transferencia de contenido | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-DOM-006` | Definir LPN anidados y contenedores retornables | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-DOM-007` | Definir relación sede → LOC → LPN → contenido | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-DOM-008` | Definir custodia y responsable actual | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-DOM-009` | Separar activo individual y reutilizable controlado por cantidad | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-DOM-010` | Definir estado, condición, daño, pérdida y faltante | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-DOM-011` | Definir préstamo, devolución, transferencia y cambio de custodia | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-DOM-012` | Definir mantenimiento, reparación y disponibilidad | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-DOM-013` | Definir baja, descarte, venta o reemplazo | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-DOM-014` | Definir kits, conjuntos y validación de completitud | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-DOM-015` | Definir conteos de activos, reutilizables y contenedores | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-DOM-016` | Definir repuestos, compatibilidad y stock mínimo | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-DOM-017` | Definir auditoría, historial y evidencia | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-DOM-018` | Integrar etiquetas LOC, LPN, activos y documentos con BLOQUE E4 | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-DOM-019` | Separar identidad permanente del contenedor físico e identidad temporal o persistente del LPN | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-DOM-020` | Definir cuándo un contenedor conserva, cambia o cierra su LPN | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-DOM-021` | Prohibir doble contabilización entre existencia suelta en LOC y existencia contenida en LPN | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-DOM-022` | Definir que mover un LPN mueve atómicamente todo su contenido | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-DOM-023` | Definir trazabilidad de lote, serial, vencimiento y condición dentro del LPN | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-DOM-024` | Definir capacidad, peso, volumen y compatibilidad de contenido | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-DOM-025` | Vincular repuestos consumidos con mantenimiento y costo del activo | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-DOM-026` | Definir inspecciones, mantenimiento preventivo, garantía y calibración | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-DOM-027` | Resolver propiedad de vehículos, checklist, kilometraje, combustible y mantenimiento de flota | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-DOM-028` | Emitir eventos financieros por adquisición, reparación, pérdida y baja cuando corresponda | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-AUTH-021` | Auditar permisos actuales de LPN, activos y contenedores | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-AUTH-022` | Proteger creación, actualización, cierre, anulación y reetiquetado de LPN | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-AUTH-023` | Proteger empaque, desempaque, división, unión y transferencia | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-AUTH-024` | Proteger consulta y administración de activos y reutilizables | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-AUTH-025` | Proteger custodia, préstamo, devolución y transferencia | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-AUTH-026` | Proteger mantenimiento, daño, pérdida y baja | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-AUTH-027` | Separar captura de conteo y aprobación de diferencias | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-AUTH-028` | Proteger impresión y reimpresión mediante permisos atómicos | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-AUTH-029` | Eliminar dependencia de permisos amplios legacy | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NEXO-AUTH-030` | Ejecutar pruebas integrales del subdominio | `bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md` |
| ⬜ NO INICIADA | `NUMERA-AUD-001` | Inventariar rutas, pantallas, componentes y formularios actuales | `bloques/O_NUMERA/01_AUDITORIA_FUNCIONAL_Y_TECNICA_DE_NUMERA.md` |
| ⬜ NO INICIADA | `NUMERA-AUD-002` | Inventariar Server Actions, API, RPC, consultas y jobs utilizados | `bloques/O_NUMERA/01_AUDITORIA_FUNCIONAL_Y_TECNICA_DE_NUMERA.md` |
| ⬜ NO INICIADA | `NUMERA-AUD-003` | Inventariar tablas, vistas, eventos y sistemas fuente | `bloques/O_NUMERA/01_AUDITORIA_FUNCIONAL_Y_TECNICA_DE_NUMERA.md` |
| ⬜ NO INICIADA | `NUMERA-AUD-004` | Identificar módulos completos, parciales, prototipos y ausentes | `bloques/O_NUMERA/01_AUDITORIA_FUNCIONAL_Y_TECNICA_DE_NUMERA.md` |
| ⬜ NO INICIADA | `NUMERA-AUD-005` | Detectar datos simulados, hardcodes, TODO y lógica provisional | `bloques/O_NUMERA/01_AUDITORIA_FUNCIONAL_Y_TECNICA_DE_NUMERA.md` |
| ⬜ NO INICIADA | `NUMERA-AUD-006` | Detectar reportes sin conciliación o sin fuente de verdad aprobada | `bloques/O_NUMERA/01_AUDITORIA_FUNCIONAL_Y_TECNICA_DE_NUMERA.md` |
| ⬜ NO INICIADA | `NUMERA-AUD-007` | Detectar registros manuales duplicados frente a otros dominios | `bloques/O_NUMERA/01_AUDITORIA_FUNCIONAL_Y_TECNICA_DE_NUMERA.md` |
| ⬜ NO INICIADA | `NUMERA-AUD-008` | Auditar cálculos de costos, margen, rentabilidad y punto de equilibrio | `bloques/O_NUMERA/01_AUDITORIA_FUNCIONAL_Y_TECNICA_DE_NUMERA.md` |
| ⬜ NO INICIADA | `NUMERA-AUD-009` | Auditar gastos, centros de costo, cierres y aprobaciones | `bloques/O_NUMERA/01_AUDITORIA_FUNCIONAL_Y_TECNICA_DE_NUMERA.md` |
| ⬜ NO INICIADA | `NUMERA-AUD-010` | Auditar exportaciones, información sensible y trazabilidad | `bloques/O_NUMERA/01_AUDITORIA_FUNCIONAL_Y_TECNICA_DE_NUMERA.md` |
| ⬜ NO INICIADA | `NUMERA-AUD-011` | Ejecutar build, lint, tipos y pruebas existentes | `bloques/O_NUMERA/01_AUDITORIA_FUNCIONAL_Y_TECNICA_DE_NUMERA.md` |
| ⬜ NO INICIADA | `NUMERA-AUD-012` | Crear matriz capacidad financiera × implementación actual | `bloques/O_NUMERA/01_AUDITORIA_FUNCIONAL_Y_TECNICA_DE_NUMERA.md` |
| ⬜ NO INICIADA | `NUMERA-DOM-001` | Definir alcance ejecutivo, analítico y contable de NUMERA | `bloques/O_NUMERA/02_MAPA_DE_ALCANCE_FINANCIERO.md` |
| ⬜ NO INICIADA | `NUMERA-DOM-002` | Definir hechos económicos recibidos desde ventas | `bloques/O_NUMERA/02_MAPA_DE_ALCANCE_FINANCIERO.md` |
| ⬜ NO INICIADA | `NUMERA-DOM-003` | Definir hechos económicos recibidos desde compras y recepción | `bloques/O_NUMERA/02_MAPA_DE_ALCANCE_FINANCIERO.md` |
| ⬜ NO INICIADA | `NUMERA-DOM-004` | Definir hechos económicos recibidos desde producción e inventario | `bloques/O_NUMERA/02_MAPA_DE_ALCANCE_FINANCIERO.md` |
| ⬜ NO INICIADA | `NUMERA-DOM-005` | Definir gastos, soportes, aprobación, corrección y anulación | `bloques/O_NUMERA/02_MAPA_DE_ALCANCE_FINANCIERO.md` |
| ⬜ NO INICIADA | `NUMERA-DOM-006` | Definir centros de costo y propiedad de su catálogo | `bloques/O_NUMERA/02_MAPA_DE_ALCANCE_FINANCIERO.md` |
| ⬜ NO INICIADA | `NUMERA-DOM-007` | Definir costos, costo estándar, costo real y variaciones | `bloques/O_NUMERA/02_MAPA_DE_ALCANCE_FINANCIERO.md` |
| ⬜ NO INICIADA | `NUMERA-DOM-008` | Definir rentabilidad por empresa, sede, canal, producto y periodo | `bloques/O_NUMERA/02_MAPA_DE_ALCANCE_FINANCIERO.md` |
| ⬜ NO INICIADA | `NUMERA-DOM-009` | Definir caja, bancos y conciliaciones que pertenezcan al alcance aprobado | `bloques/O_NUMERA/02_MAPA_DE_ALCANCE_FINANCIERO.md` |
| ⬜ NO INICIADA | `NUMERA-DOM-010` | Definir cuentas por pagar y obligaciones si pertenecen a NUMERA | `bloques/O_NUMERA/02_MAPA_DE_ALCANCE_FINANCIERO.md` |
| ⬜ NO INICIADA | `NUMERA-DOM-011` | Definir cierres, periodos y reapertura controlada | `bloques/O_NUMERA/02_MAPA_DE_ALCANCE_FINANCIERO.md` |
| ⬜ NO INICIADA | `NUMERA-DOM-012` | Definir reportes, indicadores y exportaciones oficiales | `bloques/O_NUMERA/02_MAPA_DE_ALCANCE_FINANCIERO.md` |
| ⬜ NO INICIADA | `NUMERA-DOM-013` | Definir fronteras frente al sistema contable o fiscal externo | `bloques/O_NUMERA/02_MAPA_DE_ALCANCE_FINANCIERO.md` |
| ⬜ NO INICIADA | `NUMERA-DOM-014` | Definir conciliación y tratamiento de diferencias | `bloques/O_NUMERA/02_MAPA_DE_ALCANCE_FINANCIERO.md` |
| ⬜ NO INICIADA | `NUMERA-DOM-015` | Aprobar alcance objetivo y capacidades diferidas | `bloques/O_NUMERA/02_MAPA_DE_ALCANCE_FINANCIERO.md` |
| ⬜ NO INICIADA | `AUTH-DEV-001` | Inventariar dispositivos compartidos | `bloques/P_DISPOSITIVOS_COMPARTIDOS/00_BLOQUE_P.md` |
| ⬜ NO INICIADA | `AUTH-DEV-002` | Definir identidad del dispositivo | `bloques/P_DISPOSITIVOS_COMPARTIDOS/00_BLOQUE_P.md` |
| ⬜ NO INICIADA | `AUTH-DEV-003` | Asignar sede fija | `bloques/P_DISPOSITIVOS_COMPARTIDOS/00_BLOQUE_P.md` |
| ⬜ NO INICIADA | `AUTH-DEV-004` | Asignar área fija o permitida | `bloques/P_DISPOSITIVOS_COMPARTIDOS/00_BLOQUE_P.md` |
| ⬜ NO INICIADA | `AUTH-DEV-005` | Asignar aplicaciones permitidas | `bloques/P_DISPOSITIVOS_COMPARTIDOS/00_BLOQUE_P.md` |
| ⬜ NO INICIADA | `AUTH-DEV-006` | Asignar permisos máximos del dispositivo | `bloques/P_DISPOSITIVOS_COMPARTIDOS/00_BLOQUE_P.md` |
| ⬜ NO INICIADA | `AUTH-DEV-007` | Exigir firma o PIN del trabajador | `bloques/P_DISPOSITIVOS_COMPARTIDOS/00_BLOQUE_P.md` |
| ⬜ NO INICIADA | `AUTH-DEV-008` | Combinar límite del dispositivo y trabajador | `bloques/P_DISPOSITIVOS_COMPARTIDOS/00_BLOQUE_P.md` |
| ⬜ NO INICIADA | `AUTH-DEV-009` | Evitar heredar permisos administrativos | `bloques/P_DISPOSITIVOS_COMPARTIDOS/00_BLOQUE_P.md` |
| ⬜ NO INICIADA | `AUTH-DEV-010` | Registrar dispositivo y trabajador en auditoría | `bloques/P_DISPOSITIVOS_COMPARTIDOS/00_BLOQUE_P.md` |
| ⬜ NO INICIADA | `AUTH-DEV-011` | Permitir revocar un dispositivo | `bloques/P_DISPOSITIVOS_COMPARTIDOS/00_BLOQUE_P.md` |
| ⬜ NO INICIADA | `AUTH-DEV-012` | Manejar sesión expirada | `bloques/P_DISPOSITIVOS_COMPARTIDOS/00_BLOQUE_P.md` |
| ⬜ NO INICIADA | `AUTH-DEV-013` | Manejar cambio de trabajador | `bloques/P_DISPOSITIVOS_COMPARTIDOS/00_BLOQUE_P.md` |
| ⬜ NO INICIADA | `AUTH-DEV-014` | Probar tablets de NEXO | `bloques/P_DISPOSITIVOS_COMPARTIDOS/00_BLOQUE_P.md` |
| ⬜ NO INICIADA | `AUTH-DEV-015` | Probar terminales de PULSO | `bloques/P_DISPOSITIVOS_COMPARTIDOS/00_BLOQUE_P.md` |
| ⬜ NO INICIADA | `AUTH-DEV-016` | Probar pantallas de FOGO | `bloques/P_DISPOSITIVOS_COMPARTIDOS/00_BLOQUE_P.md` |
| ⬜ NO INICIADA | `AUTH-SIM-001` | Definir quién puede simular | `bloques/Q_SIMULACION/00_BLOQUE_Q.md` |
| ⬜ NO INICIADA | `AUTH-SIM-002` | Definir roles simulables | `bloques/Q_SIMULACION/00_BLOQUE_Q.md` |
| ⬜ NO INICIADA | `AUTH-SIM-003` | Definir sede simulada | `bloques/Q_SIMULACION/00_BLOQUE_Q.md` |
| ⬜ NO INICIADA | `AUTH-SIM-004` | Definir área simulada | `bloques/Q_SIMULACION/00_BLOQUE_Q.md` |
| ⬜ NO INICIADA | `AUTH-SIM-005` | Definir turno simulado | `bloques/Q_SIMULACION/00_BLOQUE_Q.md` |
| ⬜ NO INICIADA | `AUTH-SIM-006` | No mezclar permisos reales y simulados | `bloques/Q_SIMULACION/00_BLOQUE_Q.md` |
| ⬜ NO INICIADA | `AUTH-SIM-007` | Mostrar aviso persistente | `bloques/Q_SIMULACION/00_BLOQUE_Q.md` |
| ⬜ NO INICIADA | `AUTH-SIM-008` | Registrar inicio de simulación | `bloques/Q_SIMULACION/00_BLOQUE_Q.md` |
| ⬜ NO INICIADA | `AUTH-SIM-009` | Registrar salida de simulación | `bloques/Q_SIMULACION/00_BLOQUE_Q.md` |
| ⬜ NO INICIADA | `AUTH-SIM-010` | Bloquear acciones críticas durante simulación | `bloques/Q_SIMULACION/00_BLOQUE_Q.md` |
| ⬜ NO INICIADA | `AUTH-SIM-011` | Definir modo solo lectura | `bloques/Q_SIMULACION/00_BLOQUE_Q.md` |
| ⬜ NO INICIADA | `AUTH-SIM-012` | Validar navegación como rol simulado | `bloques/Q_SIMULACION/00_BLOQUE_Q.md` |
| ⬜ NO INICIADA | `AUTH-SIM-013` | Validar Server Actions como rol simulado | `bloques/Q_SIMULACION/00_BLOQUE_Q.md` |
| ⬜ NO INICIADA | `AUTH-SIM-014` | Probar en todas las aplicaciones | `bloques/Q_SIMULACION/00_BLOQUE_Q.md` |
| ⬜ NO INICIADA | `AUTH-DB-015` | Documentar y versionar todas las migraciones en vento-shell | `bloques/R_SUPABASE/01_R0_PREPARACION_PRUEBAS_Y_CONTENCION_DE_RIESGOS.md` |
| ⬜ NO INICIADA | `AUTH-DB-027` | Crear harness de pruebas de esquema, integridad, RLS, RPC y migraciones | `bloques/R_SUPABASE/01_R0_PREPARACION_PRUEBAS_Y_CONTENCION_DE_RIESGOS.md` |
| ⬜ NO INICIADA | `AUTH-DB-028` | Establecer baseline y control de drift entre local, staging y producción | `bloques/R_SUPABASE/01_R0_PREPARACION_PRUEBAS_Y_CONTENCION_DE_RIESGOS.md` |
| ⬜ NO INICIADA | `AUTH-DB-029` | Validar respaldo, restauración y rollback antes del primer paquete | `bloques/R_SUPABASE/01_R0_PREPARACION_PRUEBAS_Y_CONTENCION_DE_RIESGOS.md` |
| ⬜ NO INICIADA | `AUTH-DB-001` | Corregir tablas sin RLS identificadas en SUPA-AUD | `bloques/R_SUPABASE/01_R0_PREPARACION_PRUEBAS_Y_CONTENCION_DE_RIESGOS.md` |
| ⬜ NO INICIADA | `AUTH-DB-002` | Endurecer políticas RLS demasiado amplias aprobadas para corrección | `bloques/R_SUPABASE/01_R0_PREPARACION_PRUEBAS_Y_CONTENCION_DE_RIESGOS.md` |
| ⬜ NO INICIADA | `AUTH-DB-003` | Endurecer funciones SECURITY DEFINER aprobadas | `bloques/R_SUPABASE/01_R0_PREPARACION_PRUEBAS_Y_CONTENCION_DE_RIESGOS.md` |
| ⬜ NO INICIADA | `AUTH-DB-004` | Reducir grants innecesarios de authenticated | `bloques/R_SUPABASE/01_R0_PREPARACION_PRUEBAS_Y_CONTENCION_DE_RIESGOS.md` |
| ⬜ NO INICIADA | `AUTH-DB-005` | Revocar grants innecesarios de anon | `bloques/R_SUPABASE/01_R0_PREPARACION_PRUEBAS_Y_CONTENCION_DE_RIESGOS.md` |
| ⬜ NO INICIADA | `AUTH-DB-006` | Incorporar contexto canónico en RPC sensibles | `bloques/R_SUPABASE/01_R0_PREPARACION_PRUEBAS_Y_CONTENCION_DE_RIESGOS.md` |
| ⬜ NO INICIADA | `AUTH-DB-007` | Validar sede dentro de RPC sensibles | `bloques/R_SUPABASE/01_R0_PREPARACION_PRUEBAS_Y_CONTENCION_DE_RIESGOS.md` |
| ⬜ NO INICIADA | `AUTH-DB-008` | Validar área dentro de RPC sensibles | `bloques/R_SUPABASE/01_R0_PREPARACION_PRUEBAS_Y_CONTENCION_DE_RIESGOS.md` |
| ⬜ NO INICIADA | `AUTH-DB-009` | Validar permiso exacto dentro de RPC sensibles | `bloques/R_SUPABASE/01_R0_PREPARACION_PRUEBAS_Y_CONTENCION_DE_RIESGOS.md` |
| ⬜ NO INICIADA | `AUTH-DB-010` | Validar principal y actor efectivo dentro de RPC sensibles | `bloques/R_SUPABASE/01_R0_PREPARACION_PRUEBAS_Y_CONTENCION_DE_RIESGOS.md` |
| ⬜ NO INICIADA | `AUTH-DB-016` | Crear esquemas empresariales aprobados | `bloques/R_SUPABASE/02_R1_FUNDACION_FISICA_CANONICA.md` |
| ⬜ NO INICIADA | `AUTH-DB-018` | Separar vistas y RPC expuestas de helpers internos | `bloques/R_SUPABASE/02_R1_FUNDACION_FISICA_CANONICA.md` |
| ⬜ NO INICIADA | `AUTH-DB-017` | Configurar esquemas expuestos y privilegios de Data API | `bloques/R_SUPABASE/02_R1_FUNDACION_FISICA_CANONICA.md` |
| ⬜ NO INICIADA | `AUTH-DB-019` | Implementar vínculos canónicos entre Auth e identidades empresariales | `bloques/R_SUPABASE/02_R1_FUNDACION_FISICA_CANONICA.md` |
| ⬜ NO INICIADA | `AUTH-DB-033` | Implementar get_access_context canónico, sus resolvers privados y su proyección segura | `bloques/R_SUPABASE/02_R1_FUNDACION_FISICA_CANONICA.md` |
| ⬜ NO INICIADA | `AUTH-DB-034` | Implementar evaluate_authorization canónico, su núcleo de evaluación, resolvers de recurso y proyecciones seguras | `bloques/R_SUPABASE/02_R1_FUNDACION_FISICA_CANONICA.md` |
| ⬜ NO INICIADA | `AUTH-DB-032` | Implementar persistencia canónica y vinculación de decisiones de autorización | `bloques/R_SUPABASE/02_R1_FUNDACION_FISICA_CANONICA.md` |
| ⬜ NO INICIADA | `AUTH-DB-012` | Implementar auditoría de cambios de permisos | `bloques/R_SUPABASE/02_R1_FUNDACION_FISICA_CANONICA.md` |
| ⬜ NO INICIADA | `AUTH-DB-013` | Implementar auditoría de simulación | `bloques/R_SUPABASE/02_R1_FUNDACION_FISICA_CANONICA.md` |
| ⬜ NO INICIADA | `AUTH-DB-014` | Implementar auditoría de dispositivos | `bloques/R_SUPABASE/02_R1_FUNDACION_FISICA_CANONICA.md` |
| ⬜ NO INICIADA | `AUTH-DB-020` | Migrar objetos por dominio con compatibilidad temporal | `bloques/R_SUPABASE/03_R2_MIGRACION_PROGRESIVA_POR_DOMINIO.md` |
| ⬜ NO INICIADA | `AUTH-DB-011` | Aplicar constraints después de backfills y reconciliación | `bloques/R_SUPABASE/03_R2_MIGRACION_PROGRESIVA_POR_DOMINIO.md` |
| ⬜ NO INICIADA | `AUTH-DB-021` | Implementar políticas RLS y grants canónicos por esquema | `bloques/R_SUPABASE/03_R2_MIGRACION_PROGRESIVA_POR_DOMINIO.md` |
| ⬜ NO INICIADA | `AUTH-DB-022` | Implementar gobierno y políticas de Storage | `bloques/R_SUPABASE/03_R2_MIGRACION_PROGRESIVA_POR_DOMINIO.md` |
| ⬜ NO INICIADA | `AUTH-DB-023` | Implementar canales y contratos Realtime aprobados | `bloques/R_SUPABASE/03_R2_MIGRACION_PROGRESIVA_POR_DOMINIO.md` |
| ⬜ NO INICIADA | `AUTH-DB-024` | Versionar Edge Functions, webhooks, cron y automatizaciones | `bloques/R_SUPABASE/03_R2_MIGRACION_PROGRESIVA_POR_DOMINIO.md` |
| ⬜ NO INICIADA | `AUTH-DB-025` | Implementar índices, retención y controles de crecimiento | `bloques/R_SUPABASE/03_R2_MIGRACION_PROGRESIVA_POR_DOMINIO.md` |
| ⬜ NO INICIADA | `AUTH-DB-026` | Generar y publicar tipos después de cada paquete aprobado | `bloques/R_SUPABASE/03_R2_MIGRACION_PROGRESIVA_POR_DOMINIO.md` |
| ⬜ NO INICIADA | `DATA-NORM-DB-001` | Implementar almacenamiento de versiones de reglas y diccionarios | `bloques/R_SUPABASE/04_IMPLEMENTACION_FISICA_DE_NORMALIZACION.md` |
| ⬜ NO INICIADA | `DATA-NORM-DB-002` | Implementar funciones SQL deterministas cuando sean necesarias | `bloques/R_SUPABASE/04_IMPLEMENTACION_FISICA_DE_NORMALIZACION.md` |
| ⬜ NO INICIADA | `DATA-NORM-DB-003` | Implementar columnas o expresiones normalizadas de búsqueda | `bloques/R_SUPABASE/04_IMPLEMENTACION_FISICA_DE_NORMALIZACION.md` |
| ⬜ NO INICIADA | `DATA-NORM-DB-004` | Ejecutar dry-runs y reportes de colisiones | `bloques/R_SUPABASE/04_IMPLEMENTACION_FISICA_DE_NORMALIZACION.md` |
| ⬜ NO INICIADA | `DATA-NORM-DB-005` | Ejecutar backfills aprobados por dominio | `bloques/R_SUPABASE/04_IMPLEMENTACION_FISICA_DE_NORMALIZACION.md` |
| ⬜ NO INICIADA | `DATA-NORM-DB-006` | Implementar constraints después de reconciliar datos | `bloques/R_SUPABASE/04_IMPLEMENTACION_FISICA_DE_NORMALIZACION.md` |
| ⬜ NO INICIADA | `DATA-NORM-DB-007` | Implementar índices de búsqueda y unicidad normalizada | `bloques/R_SUPABASE/04_IMPLEMENTACION_FISICA_DE_NORMALIZACION.md` |
| ⬜ NO INICIADA | `DATA-NORM-DB-008` | Implementar triggers únicamente como barrera defensiva final | `bloques/R_SUPABASE/04_IMPLEMENTACION_FISICA_DE_NORMALIZACION.md` |
| ⬜ NO INICIADA | `DATA-NORM-DB-009` | Registrar valor previo, valor resultante y versión de regla | `bloques/R_SUPABASE/04_IMPLEMENTACION_FISICA_DE_NORMALIZACION.md` |
| ⬜ NO INICIADA | `DATA-NORM-DB-010` | Probar idempotencia, rollback y ausencia de cambios semánticos | `bloques/R_SUPABASE/04_IMPLEMENTACION_FISICA_DE_NORMALIZACION.md` |
| ⬜ NO INICIADA | `INT-DB-001` | Crear registro de sistemas e integraciones externas | `bloques/R_SUPABASE/05_INFRAESTRUCTURA_DE_INTEGRACIONES_EXTERNAS.md` |
| ⬜ NO INICIADA | `INT-DB-002` | Crear referencias de credenciales sin almacenar secretos en tablas expuestas | `bloques/R_SUPABASE/05_INFRAESTRUCTURA_DE_INTEGRACIONES_EXTERNAS.md` |
| ⬜ NO INICIADA | `INT-DB-003` | Crear staging inmutable de payloads externos | `bloques/R_SUPABASE/05_INFRAESTRUCTURA_DE_INTEGRACIONES_EXTERNAS.md` |
| ⬜ NO INICIADA | `INT-DB-004` | Crear mapeos de identificadores externos y canónicos | `bloques/R_SUPABASE/05_INFRAESTRUCTURA_DE_INTEGRACIONES_EXTERNAS.md` |
| ⬜ NO INICIADA | `INT-DB-005` | Crear restricciones e índices de idempotencia | `bloques/R_SUPABASE/05_INFRAESTRUCTURA_DE_INTEGRACIONES_EXTERNAS.md` |
| ⬜ NO INICIADA | `INT-DB-006` | Crear cuarentena y registro de errores no procesables | `bloques/R_SUPABASE/05_INFRAESTRUCTURA_DE_INTEGRACIONES_EXTERNAS.md` |
| ⬜ NO INICIADA | `INT-DB-007` | Crear auditoría de procesamiento, reintentos y compensaciones | `bloques/R_SUPABASE/05_INFRAESTRUCTURA_DE_INTEGRACIONES_EXTERNAS.md` |
| ⬜ NO INICIADA | `INT-DB-008` | Crear mecanismos de conciliación por integración | `bloques/R_SUPABASE/05_INFRAESTRUCTURA_DE_INTEGRACIONES_EXTERNAS.md` |
| ⬜ NO INICIADA | `AUTH-DB-030` | Retirar objetos legacy únicamente después de adopción comprobada | `bloques/R_SUPABASE/06_R3_RETIRO_Y_CERTIFICACION_FINAL.md` |
| ⬜ NO INICIADA | `AUTH-DB-031` | Certificar paridad entre documento, vento-shell, Supabase y aplicaciones | `bloques/R_SUPABASE/06_R3_RETIRO_Y_CERTIFICACION_FINAL.md` |
| ⬜ NO INICIADA | `AUTH-ERR-001` | Sin sesión | `bloques/S_MENSAJES_BLOQUEO/00_BLOQUE_S.md` |
| ⬜ NO INICIADA | `AUTH-ERR-002` | Usuario inactivo | `bloques/S_MENSAJES_BLOQUEO/00_BLOQUE_S.md` |
| ⬜ NO INICIADA | `AUTH-ERR-003` | Sin acceso a la aplicación | `bloques/S_MENSAJES_BLOQUEO/00_BLOQUE_S.md` |
| ⬜ NO INICIADA | `AUTH-ERR-004` | Sin permiso administrativo | `bloques/S_MENSAJES_BLOQUEO/00_BLOQUE_S.md` |
| ⬜ NO INICIADA | `AUTH-ERR-005` | Sin sede asignada | `bloques/S_MENSAJES_BLOQUEO/00_BLOQUE_S.md` |
| ⬜ NO INICIADA | `AUTH-ERR-006` | Sin sede activa | `bloques/S_MENSAJES_BLOQUEO/00_BLOQUE_S.md` |
| ⬜ NO INICIADA | `AUTH-ERR-007` | Sin área asignada | `bloques/S_MENSAJES_BLOQUEO/00_BLOQUE_S.md` |
| ⬜ NO INICIADA | `AUTH-ERR-008` | Sin área activa | `bloques/S_MENSAJES_BLOQUEO/00_BLOQUE_S.md` |
| ⬜ NO INICIADA | `AUTH-ERR-009` | Sin turno publicado | `bloques/S_MENSAJES_BLOQUEO/00_BLOQUE_S.md` |
| ⬜ NO INICIADA | `AUTH-ERR-010` | Fuera de turno | `bloques/S_MENSAJES_BLOQUEO/00_BLOQUE_S.md` |
| ⬜ NO INICIADA | `AUTH-ERR-011` | Check-in requerido | `bloques/S_MENSAJES_BLOQUEO/00_BLOQUE_S.md` |
| ⬜ NO INICIADA | `AUTH-ERR-012` | Rol operativo faltante | `bloques/S_MENSAJES_BLOQUEO/00_BLOQUE_S.md` |
| ⬜ NO INICIADA | `AUTH-ERR-013` | Rol operativo inválido para la sede | `bloques/S_MENSAJES_BLOQUEO/00_BLOQUE_S.md` |
| ⬜ NO INICIADA | `AUTH-ERR-014` | Rol operativo inválido para el área | `bloques/S_MENSAJES_BLOQUEO/00_BLOQUE_S.md` |
| ⬜ NO INICIADA | `AUTH-ERR-015` | Dispositivo no autorizado | `bloques/S_MENSAJES_BLOQUEO/00_BLOQUE_S.md` |
| ⬜ NO INICIADA | `AUTH-ERR-016` | Acción no permitida en simulación | `bloques/S_MENSAJES_BLOQUEO/00_BLOQUE_S.md` |
| ⬜ NO INICIADA | `AUTH-ERR-017` | Configuración administrativa inconsistente | `bloques/S_MENSAJES_BLOQUEO/00_BLOQUE_S.md` |
| ⬜ NO INICIADA | `AUTH-ERR-018` | Permiso no registrado | `bloques/S_MENSAJES_BLOQUEO/00_BLOQUE_S.md` |
| ⬜ NO INICIADA | `AUTH-ERR-019` | Diferenciar error técnico y denegación | `bloques/S_MENSAJES_BLOQUEO/00_BLOQUE_S.md` |
| ⬜ NO INICIADA | `AUTH-ERR-020` | Compartir mensajes desde vento-shell | `bloques/S_MENSAJES_BLOQUEO/00_BLOQUE_S.md` |
| ⬜ NO INICIADA | `AUTH-QA-001` | Propietario sin check-in entra a administración | `bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md` |
| ⬜ NO INICIADA | `AUTH-QA-002` | Gerente general sin check-in entra a administración | `bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md` |
| ⬜ NO INICIADA | `AUTH-QA-003` | Gerente de sede solo opera sus sedes | `bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md` |
| ⬜ NO INICIADA | `AUTH-QA-004` | Trabajador sin turno queda bloqueado | `bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md` |
| ⬜ NO INICIADA | `AUTH-QA-005` | Trabajador con turno sin check-in queda bloqueado | `bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md` |
| ⬜ NO INICIADA | `AUTH-QA-006` | Trabajador con turno y check-in obtiene su rol operativo | `bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md` |
| ⬜ NO INICIADA | `AUTH-QA-007` | Trabajador solo ve su sede | `bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md` |
| ⬜ NO INICIADA | `AUTH-QA-008` | Trabajador solo ve su área | `bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md` |
| ⬜ NO INICIADA | `AUTH-QA-009` | Trabajador rotado cambia de permisos por turno | `bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md` |
| ⬜ NO INICIADA | `AUTH-QA-010` | Bodeguero puede preparar pero no producir | `bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md` |
| ⬜ NO INICIADA | `AUTH-QA-011` | Producción puede producir pero no ajustar inventario global | `bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md` |
| ⬜ NO INICIADA | `AUTH-QA-012` | Cajero puede operar PULSO pero no configurar | `bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md` |
| ⬜ NO INICIADA | `AUTH-QA-013` | Conductor puede transitar sin área productiva | `bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md` |
| ⬜ NO INICIADA | `AUTH-QA-014` | Conductor no puede preparar ni recibir inventario general | `bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md` |
| ⬜ NO INICIADA | `AUTH-QA-015` | Compras puede crear órdenes según alcance | `bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md` |
| ⬜ NO INICIADA | `AUTH-QA-016` | Recepción puede recibir pero no aprobar compras | `bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md` |
| ⬜ NO INICIADA | `AUTH-QA-017` | Dispositivo compartido limita al administrador autenticado | `bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md` |
| ⬜ NO INICIADA | `AUTH-QA-018` | PIN identifica al trabajador real | `bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md` |
| ⬜ NO INICIADA | `AUTH-QA-019` | Rol simulado no hereda permisos reales | `bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md` |
| ⬜ NO INICIADA | `AUTH-QA-020` | Acceso directo por URL queda bloqueado | `bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md` |
| ⬜ NO INICIADA | `AUTH-QA-021` | Formulario manipulado queda bloqueado en servidor | `bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md` |
| ⬜ NO INICIADA | `AUTH-QA-022` | RPC manipulada queda bloqueada | `bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md` |
| ⬜ NO INICIADA | `AUTH-QA-023` | Cruce de sede queda bloqueado | `bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md` |
| ⬜ NO INICIADA | `AUTH-QA-024` | Cruce de área queda bloqueado | `bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md` |
| ⬜ NO INICIADA | `AUTH-QA-025` | Check-out retira permisos operativos | `bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md` |
| ⬜ NO INICIADA | `AUTH-QA-026` | Cola offline de ANIMA se revalida | `bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md` |
| ⬜ NO INICIADA | `AUTH-QA-027` | Actualización de paquete no rompe otros repositorios | `bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md` |
| ⬜ NO INICIADA | `AUTH-QA-028` | Rollback funciona por aplicación | `bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md` |
| ⬜ NO INICIADA | `AUTH-QA-029` | Auditoría conserva actor, turno, sede y área | `bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md` |
| ⬜ NO INICIADA | `AUTH-QA-030` | Ejecutar prueba de regresión completa | `bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md` |
