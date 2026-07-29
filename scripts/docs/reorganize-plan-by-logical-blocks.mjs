import fs from 'node:fs';
import path from 'node:path';

const ROOT = process.cwd();
const BASE_DIR = path.resolve(ROOT, 'docs/plan-canonico/modular');
const MANIFEST_PATH = path.join(BASE_DIR, 'manifest.json');
const APPLY = process.argv.includes('--apply');

const TASK_HEADING_REGEX =
  /^###\s+(?:\[[ x~]\]|[✅🟡❌])\s+([A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\d{3})\b/gmu;
const GENERATED_META_REGEX =
  /(?:^###\s+(?:MINI-BLOQUE|SECCIÓN|Organización documental del bloque|Propósito y organización)[^\n]*\n\n)?<!-- PLAN-SECTION-META:START -->[\s\S]*?<!-- PLAN-SECTION-META:END -->\n*/gmu;

function partition(source, introPath, groups) {
  return {
    source,
    fragments: [
      { path: introPath },
      ...groups.map(([fragmentPath, startTask]) => ({
        path: fragmentPath,
        startTask,
      })),
    ],
  };
}

/**
 * Las particiones son explícitas a propósito: el nombre físico representa una
 * responsabilidad documental, no una cantidad arbitraria de tareas.
 *
 * Para agregar otro archivo divisible:
 * 1. declarar su source;
 * 2. declarar cada fragmento en orden;
 * 3. usar startTask para el primer fragmento que comienza en una tarea;
 * 4. ejecutar primero sin --apply y revisar el inventario.
 */
const PARTITIONS = [
  {
    source: 'bloques/I_NAVEGACION_Y_PANTALLAS/00_BLOQUE_I.md',
    fragments: [
      {
        path: 'bloques/I_NAVEGACION_Y_PANTALLAS/00_INTRO_Y_REGLAS.md',
      },
      {
        path: 'bloques/I_NAVEGACION_Y_PANTALLAS/01_INVENTARIO_COMPLETO_DE_SUPERFICIES.md',
        startTask: 'AUTH-UI-001',
      },
      {
        path: 'bloques/I_NAVEGACION_Y_PANTALLAS/02_VINCULACION_CON_PROCESOS_Y_APLICACIONES.md',
        startTask: 'AUTH-UI-011',
      },
      {
        path: 'bloques/I_NAVEGACION_Y_PANTALLAS/03_CLASIFICACION_FUNCIONAL_Y_CONTEXTO_DE_USO.md',
        startTask: 'AUTH-UI-015',
      },
      {
        path: 'bloques/I_NAVEGACION_Y_PANTALLAS/04_DEPURACION_DE_VISTAS_Y_RUTAS_TECNICAS.md',
        startTask: 'AUTH-UI-026',
      },
      {
        path: 'bloques/I_NAVEGACION_Y_PANTALLAS/05_AUTORIZACION_DE_VISTAS_Y_ACCIONES.md',
        startTask: 'AUTH-UI-030',
      },
      {
        path: 'bloques/I_NAVEGACION_Y_PANTALLAS/06_EXPERIENCIA_USABILIDAD_Y_APROBACION.md',
        startTask: 'AUTH-UI-046',
      },
    ],
  },
  partition(
    'bloques/E1_DESCUBRIMIENTO_OPERATIVO/02_AUDITORIA_DE_OPERACION_REAL.md',
    'bloques/E1_DESCUBRIMIENTO_OPERATIVO/02_00_INTRO_AUDITORIA_OPERATIVA.md',
    [
      ['bloques/E1_DESCUBRIMIENTO_OPERATIVO/02_01_CONTEXTO_ACTORES_Y_TRABAJO_REAL.md', 'OPS-AUD-001'],
      ['bloques/E1_DESCUBRIMIENTO_OPERATIVO/02_02_PROCESOS_MANUALES_HERRAMIENTAS_Y_DOCUMENTOS.md', 'OPS-AUD-004'],
      ['bloques/E1_DESCUBRIMIENTO_OPERATIVO/02_03_FLUJOS_EXCEPCIONES_CONTROLES_Y_METRICAS.md', 'OPS-AUD-007'],
      ['bloques/E1_DESCUBRIMIENTO_OPERATIVO/02_04_DEPENDENCIAS_TRAZABILIDAD_CONTINGENCIA_Y_VALIDACION.md', 'OPS-AUD-011'],
    ],
  ),
  partition(
    'bloques/E1_DESCUBRIMIENTO_OPERATIVO/03_MAPA_CANONICO_DE_CAPACIDADES_EMPRESARIALES.md',
    'bloques/E1_DESCUBRIMIENTO_OPERATIVO/03_00_INTRO_MAPA_DE_CAPACIDADES.md',
    [
      ['bloques/E1_DESCUBRIMIENTO_OPERATIVO/03_01_TAXONOMIA_RESULTADOS_Y_ALCANCE.md', 'CAP-MAP-001'],
      ['bloques/E1_DESCUBRIMIENTO_OPERATIVO/03_02_PROPIEDAD_CONSUMIDORES_Y_ACTORES.md', 'CAP-MAP-004'],
      ['bloques/E1_DESCUBRIMIENTO_OPERATIVO/03_03_INFORMACION_EVENTOS_CONTROLES_Y_SUPERFICIES.md', 'CAP-MAP-007'],
      ['bloques/E1_DESCUBRIMIENTO_OPERATIVO/03_04_CLASIFICACION_BRECHAS_Y_APROBACION.md', 'CAP-MAP-012'],
    ],
  ),
  partition(
    'bloques/E1_DESCUBRIMIENTO_OPERATIVO/04_AUDITORIA_DE_IMPLEMENTACION_ACTUAL.md',
    'bloques/E1_DESCUBRIMIENTO_OPERATIVO/04_00_INTRO_AUDITORIA_DE_IMPLEMENTACION.md',
    [
      ['bloques/E1_DESCUBRIMIENTO_OPERATIVO/04_01_INVENTARIO_DE_CODIGO_DATOS_Y_PRUEBAS.md', 'CODE-AUD-001'],
      ['bloques/E1_DESCUBRIMIENTO_OPERATIVO/04_02_GOBIERNO_DE_PRUEBAS_STUBS_Y_SUPERFICIES_INCOMPLETAS.md', 'QA-GOV-001'],
      ['bloques/E1_DESCUBRIMIENTO_OPERATIVO/04_03_PROCESOS_PARCIALES_LEGACY_DUPLICADOS_Y_SIN_CONSUMIDOR.md', 'CODE-AUD-011'],
      ['bloques/E1_DESCUBRIMIENTO_OPERATIVO/04_04_VALIDACION_TECNICA_SEGURIDAD_RESILIENCIA_Y_BACKLOG.md', 'CODE-AUD-016'],
    ],
  ),
  partition(
    'bloques/E1_DESCUBRIMIENTO_OPERATIVO/05_COBERTURA_EMPRESARIAL_OBLIGATORIA.md',
    'bloques/E1_DESCUBRIMIENTO_OPERATIVO/05_00_INTRO_COBERTURA_EMPRESARIAL.md',
    [
      ['bloques/E1_DESCUBRIMIENTO_OPERATIVO/05_01_GOBIERNO_PERSONAS_Y_SEGURIDAD_LABORAL.md', 'CAP-SCOPE-001'],
      ['bloques/E1_DESCUBRIMIENTO_OPERATIVO/05_02_PRODUCTOS_ABASTECIMIENTO_INVENTARIO_ACTIVOS_Y_PRODUCCION.md', 'CAP-SCOPE-004'],
      ['bloques/E1_DESCUBRIMIENTO_OPERATIVO/05_03_COMERCIAL_CLIENTES_LOGISTICA_FINANZAS_E_INSTALACIONES.md', 'CAP-SCOPE-009'],
      ['bloques/E1_DESCUBRIMIENTO_OPERATIVO/05_04_TECNOLOGIA_CUMPLIMIENTO_DATOS_CONTINUIDAD_Y_APROBACION.md', 'CAP-SCOPE-015'],
    ],
  ),
  partition(
    'bloques/E1_DESCUBRIMIENTO_OPERATIVO/06_MATRIZ_DE_COBERTURA.md',
    'bloques/E1_DESCUBRIMIENTO_OPERATIVO/06_00_INTRO_MATRIZ_DE_COBERTURA.md',
    [
      ['bloques/E1_DESCUBRIMIENTO_OPERATIVO/06_01_CRITERIOS_Y_COBERTURA_FUNCIONAL.md', 'CAP-COVER-001'],
      ['bloques/E1_DESCUBRIMIENTO_OPERATIVO/06_02_DATOS_AUTORIZACION_AUDITORIA_PRUEBAS_E_INTEGRACION.md', 'CAP-COVER-005'],
      ['bloques/E1_DESCUBRIMIENTO_OPERATIVO/06_03_DEPENDENCIAS_PRIORIZACION_Y_APROBACION.md', 'CAP-COVER-010'],
    ],
  ),
  partition(
    'bloques/E2_PROCESOS_Y_EXPERIENCIA/01_CATALOGO_DE_PROCESOS.md',
    'bloques/E2_PROCESOS_Y_EXPERIENCIA/01_00_INTRO_CATALOGO_DE_PROCESOS.md',
    [
      ['bloques/E2_PROCESOS_Y_EXPERIENCIA/01_01_BASE_DISENO_E_IDENTIDAD_DE_PROCESOS.md', 'PROC-CAT-001'],
      ['bloques/E2_PROCESOS_Y_EXPERIENCIA/01_02_PROPOSITO_PROPIEDAD_CONSUMIDORES_Y_ACTORES.md', 'PROC-CAT-004'],
      ['bloques/E2_PROCESOS_Y_EXPERIENCIA/01_03_ESTADOS_TRANSICIONES_EXCEPCIONES_Y_REVERSAS.md', 'PROC-CAT-009'],
      ['bloques/E2_PROCESOS_Y_EXPERIENCIA/01_04_INFORMACION_EVENTOS_AUDITORIA_METRICAS_Y_DUPLICADOS.md', 'PROC-CAT-015'],
    ],
  ),
  partition(
    'bloques/E2_PROCESOS_Y_EXPERIENCIA/02_MAPA_DE_ACTORES.md',
    'bloques/E2_PROCESOS_Y_EXPERIENCIA/02_00_INTRO_MAPA_DE_ACTORES.md',
    [
      ['bloques/E2_PROCESOS_Y_EXPERIENCIA/02_01_ROLES_Y_RESPONSABILIDADES_POR_PROCESO.md', 'PROC-ACTOR-001'],
      ['bloques/E2_PROCESOS_Y_EXPERIENCIA/02_02_TIPOS_DE_ACTOR_Y_REGLA_DE_AUTORIZACION.md', 'PROC-ACTOR-004'],
    ],
  ),
  partition(
    'bloques/E2_PROCESOS_Y_EXPERIENCIA/03_ESTACIONES_OPERATIVAS_COMPARTIDAS.md',
    'bloques/E2_PROCESOS_Y_EXPERIENCIA/03_00_INTRO_ESTACIONES_COMPARTIDAS.md',
    [
      ['bloques/E2_PROCESOS_Y_EXPERIENCIA/03_01_INVENTARIO_INTERACCION_Y_PERFILES_DE_ESTACION.md', 'UX-STATION-001'],
      ['bloques/E2_PROCESOS_Y_EXPERIENCIA/03_02_IDENTIDAD_SUPERFICIE_PERIFERICOS_Y_CONTINGENCIA.md', 'UX-STATION-004'],
      ['bloques/E2_PROCESOS_Y_EXPERIENCIA/03_03_PROTOTIPOS_MATRIZ_GRAMATICA_Y_COMPONENTES.md', 'UX-STATION-008'],
    ],
  ),
  partition(
    'bloques/E2_PROCESOS_Y_EXPERIENCIA/05_CONTRATO_DE_PANTALLAS.md',
    'bloques/E2_PROCESOS_Y_EXPERIENCIA/05_00_INTRO_CONTRATO_DE_PANTALLAS.md',
    [
      ['bloques/E2_PROCESOS_Y_EXPERIENCIA/05_01_IDENTIDAD_APLICACION_PROCESO_Y_PASO.md', 'PROC-SCREEN-001'],
      ['bloques/E2_PROCESOS_Y_EXPERIENCIA/05_02_CLASIFICACION_FUNCIONAL_DE_PANTALLAS.md', 'PROC-SCREEN-005'],
      ['bloques/E2_PROCESOS_Y_EXPERIENCIA/05_03_ACTORES_DISPOSITIVOS_ACCIONES_Y_CONDICIONES.md', 'PROC-SCREEN-012'],
      ['bloques/E2_PROCESOS_Y_EXPERIENCIA/05_04_ESTADOS_Y_RECUPERACION_DE_ERRORES.md', 'PROC-SCREEN-018'],
      ['bloques/E2_PROCESOS_Y_EXPERIENCIA/05_05_SENSIBILIDAD_PERMISOS_Y_PROTECCION_DE_SERVIDOR.md', 'PROC-SCREEN-022'],
      ['bloques/E2_PROCESOS_Y_EXPERIENCIA/05_06_CICLO_DE_VIDA_USABILIDAD_Y_ACEPTACION.md', 'PROC-SCREEN-026'],
    ],
  ),
  partition(
    'bloques/E2_PROCESOS_Y_EXPERIENCIA/06_COBERTURA_DE_PROCESOS.md',
    'bloques/E2_PROCESOS_Y_EXPERIENCIA/06_00_INTRO_COBERTURA_DE_PROCESOS.md',
    [
      ['bloques/E2_PROCESOS_Y_EXPERIENCIA/06_01_VINCULOS_Y_CLASIFICACION_DE_COBERTURA.md', 'PROC-COVER-001'],
      ['bloques/E2_PROCESOS_Y_EXPERIENCIA/06_02_DEPENDENCIAS_ALCANCE_Y_COMPLETITUD.md', 'PROC-COVER-005'],
      ['bloques/E2_PROCESOS_Y_EXPERIENCIA/06_03_MATRIZ_ASIS_TOBE_Y_RETORNO_DE_BRECHAS.md', 'PROC-COVER-008'],
    ],
  ),
  partition(
    'bloques/E2_PROCESOS_Y_EXPERIENCIA/07_REQUISITOS_NO_FUNCIONALES.md',
    'bloques/E2_PROCESOS_Y_EXPERIENCIA/07_00_INTRO_REQUISITOS_NO_FUNCIONALES.md',
    [
      ['bloques/E2_PROCESOS_Y_EXPERIENCIA/07_01_DISPONIBILIDAD_ESCALA_RENDIMIENTO_Y_OFFLINE.md', 'NFR-REQ-001'],
      ['bloques/E2_PROCESOS_Y_EXPERIENCIA/07_02_PRIVACIDAD_TRAZABILIDAD_Y_ACCESIBILIDAD.md', 'NFR-REQ-005'],
      ['bloques/E2_PROCESOS_Y_EXPERIENCIA/07_03_HARDWARE_OBSERVABILIDAD_RECUPERACION_Y_APROBACION.md', 'NFR-REQ-008'],
    ],
  ),
  partition(
    'bloques/E2_PROCESOS_Y_EXPERIENCIA/08_PRINCIPIOS_DE_EXPERIENCIA.md',
    'bloques/E2_PROCESOS_Y_EXPERIENCIA/08_00_INTRO_PRINCIPIOS_DE_EXPERIENCIA.md',
    [
      ['bloques/E2_PROCESOS_Y_EXPERIENCIA/08_01_ACTOR_TAREA_NAVEGACION_Y_CONTEXTO.md', 'UX-BASE-001'],
      ['bloques/E2_PROCESOS_Y_EXPERIENCIA/08_02_MENSAJES_SIMPLICIDAD_EXCEPCIONES_Y_PROGRESIVIDAD.md', 'UX-BASE-006'],
      ['bloques/E2_PROCESOS_Y_EXPERIENCIA/08_03_DISPOSITIVOS_ADMINISTRACION_CONECTIVIDAD_Y_VALIDACION.md', 'UX-BASE-011'],
    ],
  ),
  partition(
    'bloques/E2_PROCESOS_Y_EXPERIENCIA/09_TALENTO_Y_VINCULACION.md',
    'bloques/E2_PROCESOS_Y_EXPERIENCIA/09_00_INTRO_TALENTO_Y_VINCULACION.md',
    [
      ['bloques/E2_PROCESOS_Y_EXPERIENCIA/09_01_ALCANCE_VACANTES_Y_EXPEDIENTE.md', 'CAP-TAL-001'],
      ['bloques/E2_PROCESOS_Y_EXPERIENCIA/09_02_EVALUACION_TRASPASO_Y_PERIODO_DE_PRUEBA.md', 'CAP-TAL-004'],
    ],
  ),
  partition(
    'bloques/F_ANIMA/00_BLOQUE_F.md',
    'bloques/F_ANIMA/00_INTRO_Y_ALCANCE.md',
    [
      ['bloques/F_ANIMA/01_AUTORIZACION_Y_CONTEXTO_OPERATIVO.md', 'ANIMA-AUTH-001'],
      ['bloques/F_ANIMA/02_EXPERIENCIA_DEL_TRABAJADOR_Y_ADMINISTRACION.md', 'ANIMA-UX-001'],
    ],
  ),
  partition(
    'bloques/G_VISO/00_BLOQUE_G.md',
    'bloques/G_VISO/00_INTRO_Y_ALCANCE.md',
    [
      ['bloques/G_VISO/01_GOBIERNO_DE_ACCESO_Y_SEGURIDAD.md', 'VISO-AUTH-001'],
      ['bloques/G_VISO/02_NUCLEO_MINIMO_PARA_OPERACION.md', 'VISO-CORE-001'],
      ['bloques/G_VISO/03_EXPERIENCIA_ADMINISTRATIVA.md', 'VISO-UX-001'],
    ],
  ),
  partition(
    'bloques/H_FUNDACION_COMPARTIDA/00_INTRO.md',
    'bloques/H_FUNDACION_COMPARTIDA/00_BLOQUE_H_Y_REGLAS.md',
    [
      ['bloques/H_FUNDACION_COMPARTIDA/01_AUDITORIA_DE_COMPONENTES_COMPARTIDOS.md', 'SHELL-AUD-001'],
      ['bloques/H_FUNDACION_COMPARTIDA/02_DISTRIBUCION_Y_PAQUETES_COMPARTIDOS.md', 'SHELL-PKG-001'],
      ['bloques/H_FUNDACION_COMPARTIDA/03_CONTRATOS_COMPARTIDOS.md', 'SHELL-CON-001'],
    ],
  ),
  partition(
    'bloques/H_FUNDACION_COMPARTIDA/02_NORMALIZACION_COMPARTIDA_DE_DATOS.md',
    'bloques/H_FUNDACION_COMPARTIDA/04_INTRO_NORMALIZACION_Y_COMPONENTES.md',
    [
      ['bloques/H_FUNDACION_COMPARTIDA/05_NORMALIZACION_COMPARTIDA.md', 'SHELL-NORM-001'],
      ['bloques/H_FUNDACION_COMPARTIDA/06_ACCESO_COMPARTIDO_A_DATOS.md', 'SHELL-DB-001'],
      ['bloques/H_FUNDACION_COMPARTIDA/07_COMPONENTES_WEB_COMPARTIDOS.md', 'SHELL-UI-001'],
      ['bloques/H_FUNDACION_COMPARTIDA/08_COMPONENTES_NATIVOS_COMPARTIDOS.md', 'SHELL-NATIVE-001'],
    ],
  ),
  partition(
    'bloques/H2_SHELL_APP/00_BLOQUE_H2.md',
    'bloques/H2_SHELL_APP/00_INTRO_Y_ALCANCE.md',
    [
      ['bloques/H2_SHELL_APP/01_INVENTARIO_Y_VISIBILIDAD_DE_APLICACIONES.md', 'SHELL-APP-001'],
      ['bloques/H2_SHELL_APP/02_CONTEXTO_Y_TRABAJO_PENDIENTE.md', 'SHELL-APP-004'],
      ['bloques/H2_SHELL_APP/03_INICIO_NAVEGACION_Y_LIMITES_DEL_HUB.md', 'SHELL-APP-009'],
      ['bloques/H2_SHELL_APP/04_DISPOSITIVOS_Y_PRUEBAS_DE_NAVEGACION.md', 'SHELL-APP-017'],
    ],
  ),
  partition(
    'bloques/J_ACCIONES_DE_SERVIDOR/00_BLOQUE_J.md',
    'bloques/J_ACCIONES_DE_SERVIDOR/00_INTRO_Y_REGLAS.md',
    [
      ['bloques/J_ACCIONES_DE_SERVIDOR/01_INVENTARIO_DE_SUPERFICIES_DE_SERVIDOR.md', 'AUTH-SRV-001'],
      ['bloques/J_ACCIONES_DE_SERVIDOR/02_VALIDACION_AUTORIZACION_Y_TERRITORIO.md', 'AUTH-SRV-004'],
      ['bloques/J_ACCIONES_DE_SERVIDOR/03_AUDITORIA_ERRORES_Y_HELPERS_COMPARTIDOS.md', 'AUTH-SRV-014'],
    ],
  ),
  partition(
    'bloques/K_NEXO/01_EXTENSION_DE_DOMINIO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md',
    'bloques/K_NEXO/01_INTRO_LPN_CONTENEDORES_ACTIVOS_Y_REUTILIZABLES.md',
    [
      ['bloques/K_NEXO/02_DOMINIO_DE_INVENTARIO_LOGISTICA_Y_ACTIVOS.md', 'NEXO-DOM-001'],
      ['bloques/K_NEXO/03_AUTORIZACION_DE_INVENTARIO_LOGISTICA_Y_ACTIVOS.md', 'NEXO-AUTH-021'],
      ['bloques/K_NEXO/04_EXPERIENCIA_DE_INVENTARIO_LOGISTICA_Y_ACTIVOS.md', 'NEXO-UX-001'],
    ],
  ),
  partition(
    'bloques/L_FOGO/00_BLOQUE_L.md',
    'bloques/L_FOGO/00_INTRO_Y_ALCANCE.md',
    [
      ['bloques/L_FOGO/01_AUTORIZACION_DE_PRODUCCION.md', 'FOGO-AUTH-001'],
      ['bloques/L_FOGO/02_EXPERIENCIA_DE_PRODUCCION.md', 'FOGO-UX-001'],
    ],
  ),
  partition(
    'bloques/M_ORIGO/00_BLOQUE_M.md',
    'bloques/M_ORIGO/00_INTRO_Y_ALCANCE.md',
    [
      ['bloques/M_ORIGO/01_AUTORIZACION_DE_COMPRAS.md', 'ORIGO-AUTH-001'],
      ['bloques/M_ORIGO/02_EXPERIENCIA_DE_COMPRAS.md', 'ORIGO-UX-001'],
    ],
  ),
  partition(
    'bloques/N_PULSO/00_BLOQUE_N.md',
    'bloques/N_PULSO/00_INTRO_Y_ALCANCE.md',
    [
      ['bloques/N_PULSO/01_AUTORIZACION_DE_VENTA_Y_CAJA.md', 'PULSO-AUTH-001'],
      ['bloques/N_PULSO/02_EXPERIENCIA_POS_Y_OPERACION_COMERCIAL.md', 'PULSO-UX-001'],
    ],
  ),
  partition(
    'bloques/O_NUMERA/02_MAPA_DE_ALCANCE_FINANCIERO.md',
    'bloques/O_NUMERA/02_INTRO_ALCANCE_FINANCIERO.md',
    [
      ['bloques/O_NUMERA/03_DOMINIO_Y_MODELO_FINANCIERO.md', 'NUMERA-DOM-001'],
      ['bloques/O_NUMERA/04_AUTORIZACION_FINANCIERA.md', 'NUMERA-AUTH-001'],
      ['bloques/O_NUMERA/05_EXPERIENCIA_FINANCIERA_Y_ANALITICA.md', 'NUMERA-UX-001'],
    ],
  ),
  partition(
    'bloques/P_DISPOSITIVOS_COMPARTIDOS/00_BLOQUE_P.md',
    'bloques/P_DISPOSITIVOS_COMPARTIDOS/00_INTRO_Y_REGLAS.md',
    [
      ['bloques/P_DISPOSITIVOS_COMPARTIDOS/01_IDENTIDAD_ALCANCE_Y_LIMITES_DEL_DISPOSITIVO.md', 'AUTH-DEV-001'],
      ['bloques/P_DISPOSITIVOS_COMPARTIDOS/02_IDENTIFICACION_DEL_TRABAJADOR_Y_AUDITORIA.md', 'AUTH-DEV-007'],
      ['bloques/P_DISPOSITIVOS_COMPARTIDOS/03_SESION_REVOCACION_Y_PRUEBAS.md', 'AUTH-DEV-011'],
    ],
  ),
  partition(
    'bloques/Q_SIMULACION/00_BLOQUE_Q.md',
    'bloques/Q_SIMULACION/00_INTRO_Y_REGLAS.md',
    [
      ['bloques/Q_SIMULACION/01_CONTEXTO_Y_ALCANCE_SIMULADO.md', 'AUTH-SIM-001'],
      ['bloques/Q_SIMULACION/02_VISIBILIDAD_AUDITORIA_Y_RESTRICCIONES.md', 'AUTH-SIM-007'],
      ['bloques/Q_SIMULACION/03_VALIDACION_INTEGRAL_DE_SIMULACION.md', 'AUTH-SIM-012'],
    ],
  ),
  partition(
    'bloques/S_MENSAJES_BLOQUEO/00_BLOQUE_S.md',
    'bloques/S_MENSAJES_BLOQUEO/00_INTRO_Y_CONTRATO.md',
    [
      ['bloques/S_MENSAJES_BLOQUEO/01_IDENTIDAD_APLICACION_Y_TERRITORIO.md', 'AUTH-ERR-001'],
      ['bloques/S_MENSAJES_BLOQUEO/02_TURNO_ROL_DISPOSITIVO_Y_SIMULACION.md', 'AUTH-ERR-009'],
      ['bloques/S_MENSAJES_BLOQUEO/03_CONFIGURACION_ERRORES_Y_DISTRIBUCION.md', 'AUTH-ERR-017'],
    ],
  ),
  partition(
    'bloques/T_CALIDAD_Y_DESPLIEGUE/00_BLOQUE_T.md',
    'bloques/T_CALIDAD_Y_DESPLIEGUE/00_INTRO_Y_REGLAS.md',
    [
      ['bloques/T_CALIDAD_Y_DESPLIEGUE/01_PAQUETES_RELEASES_Y_COMPATIBILIDAD.md', 'SHELL-CI-001'],
      ['bloques/T_CALIDAD_Y_DESPLIEGUE/02_PRUEBAS_DE_CONSUMIDORES_Y_ROLLBACK.md', 'SHELL-CI-007'],
      ['bloques/T_CALIDAD_Y_DESPLIEGUE/03_AUTOMATIZACION_EVIDENCIA_Y_GATES.md', 'SHELL-CI-016'],
      ['bloques/T_CALIDAD_Y_DESPLIEGUE/04_DESPLIEGUE_PILOTO_Y_ESTABILIZACION.md', 'SHELL-CI-020'],
    ],
  ),
  partition(
    'bloques/U_PRUEBAS_INTEGRALES/00_BLOQUE_U.md',
    'bloques/U_PRUEBAS_INTEGRALES/00_INTRO_Y_ESTRATEGIA.md',
    [
      ['bloques/U_PRUEBAS_INTEGRALES/01_PRUEBAS_INTEGRALES_DE_AUTORIZACION.md', 'AUTH-QA-001'],
      ['bloques/U_PRUEBAS_INTEGRALES/02_PRUEBAS_INTEGRALES_DE_EXPERIENCIA.md', 'UX-QA-001'],
    ],
  ),
  partition(
    'bloques/V_PASS/00_BLOQUE_V.md',
    'bloques/V_PASS/00_INTRO_Y_ALCANCE.md',
    [
      ['bloques/V_PASS/01_EXPERIENCIA_DEL_CLIENTE.md', 'PASS-UX-001'],
      ['bloques/V_PASS/02_INTEGRACIONES_DE_FIDELIZACION.md', 'PASS-INT-001'],
      ['bloques/V_PASS/03_PRUEBAS_DE_ACUMULACION_Y_REDENCION.md', 'PASS-QA-001'],
    ],
  ),
  partition(
    'bloques/W_AURA/00_BLOQUE_W.md',
    'bloques/W_AURA/00_INTRO_Y_CONDICION_DE_ENTRADA.md',
    [
      ['bloques/W_AURA/01_AUDITORIA_Y_DECISION_DE_CONTINUIDAD.md', 'AURA-AUD-001'],
      ['bloques/W_AURA/02_DOMINIO_DE_MARKETING_Y_CREACION.md', 'AURA-DOM-001'],
      ['bloques/W_AURA/03_AUTORIZACION_DE_MARKETING_Y_CANALES.md', 'AURA-AUTH-001'],
      ['bloques/W_AURA/04_EXPERIENCIA_CREATIVA_Y_COMERCIAL.md', 'AURA-UX-001'],
      ['bloques/W_AURA/05_INTEGRACIONES_DE_CANALES_Y_DATOS.md', 'AURA-INT-001'],
    ],
  ),
  partition(
    'bloques/X_INTEGRACIONES/00_BLOQUE_X.md',
    'bloques/X_INTEGRACIONES/00_INTRO_Y_PRINCIPIOS.md',
    [
      ['bloques/X_INTEGRACIONES/01_EVENTOS_ENTRE_APLICACIONES.md', 'INT-APP-001'],
      ['bloques/X_INTEGRACIONES/02_INTEGRACIONES_EXTERNAS_Y_CREDENCIALES.md', 'INT-EXT-001'],
      ['bloques/X_INTEGRACIONES/03_CONTEXTO_LABORAL.md', 'INT-WORK-001'],
      ['bloques/X_INTEGRACIONES/04_COMPRAS_RECEPCION_E_INVENTARIO.md', 'INT-PROC-001'],
      ['bloques/X_INTEGRACIONES/05_PRODUCCION_E_INVENTARIO.md', 'INT-PROD-001'],
      ['bloques/X_INTEGRACIONES/06_TRANSICION_DEL_POS_EXTERNO.md', 'INT-POS-001'],
      ['bloques/X_INTEGRACIONES/07_VENTAS_INVENTARIO_FINANZAS_Y_FIDELIZACION.md', 'INT-SALES-001'],
      ['bloques/X_INTEGRACIONES/08_MARKETING_BENEFICIOS_Y_VALIDACION_COMERCIAL.md', 'INT-MKT-001'],
    ],
  ),
  partition(
    'bloques/Z_TECNOLOGIA_Y_SOPORTE/00_BLOQUE_Z.md',
    'bloques/Z_TECNOLOGIA_Y_SOPORTE/00_INTRO_Y_ALCANCE.md',
    [
      ['bloques/Z_TECNOLOGIA_Y_SOPORTE/01_DOMINIO_DE_TECNOLOGIA_Y_SOPORTE.md', 'TI-DOM-001'],
      ['bloques/Z_TECNOLOGIA_Y_SOPORTE/02_AUTORIZACION_Y_ACCESO_PRIVILEGIADO.md', 'TI-AUTH-001'],
      ['bloques/Z_TECNOLOGIA_Y_SOPORTE/03_EXPERIENCIA_DE_SOPORTE_Y_OPERACION_TI.md', 'TI-UX-001'],
      ['bloques/Z_TECNOLOGIA_Y_SOPORTE/04_INTEGRACIONES_Y_TELEMETRIA.md', 'TI-INT-001'],
    ],
  ),
  partition(
    'bloques/AA_GOBIERNO_DE_INFORMACION/00_BLOQUE_AA.md',
    'bloques/AA_GOBIERNO_DE_INFORMACION/00_INTRO_Y_ALCANCE.md',
    [
      ['bloques/AA_GOBIERNO_DE_INFORMACION/01_DOMINIO_DOCUMENTAL_PRIVACIDAD_Y_CUMPLIMIENTO.md', 'INFO-DOM-001'],
      ['bloques/AA_GOBIERNO_DE_INFORMACION/02_AUTORIZACION_Y_PROTECCION_DE_INFORMACION.md', 'INFO-AUTH-001'],
      ['bloques/AA_GOBIERNO_DE_INFORMACION/03_EXPERIENCIA_DOCUMENTAL_Y_PRIVACIDAD.md', 'INFO-UX-001'],
      ['bloques/AA_GOBIERNO_DE_INFORMACION/04_INTEGRACIONES_DOCUMENTALES_Y_EXTERNAS.md', 'INFO-INT-001'],
    ],
  ),
  partition(
    'bloques/AB_ANALITICA_INDICADORES_Y_DATOS_MAESTROS/00_BLOQUE_AB.md',
    'bloques/AB_ANALITICA_INDICADORES_Y_DATOS_MAESTROS/00_INTRO_Y_ALCANCE.md',
    [
      ['bloques/AB_ANALITICA_INDICADORES_Y_DATOS_MAESTROS/01_DOMINIO_DE_DATOS_MAESTROS_Y_ANALITICA.md', 'DATA-DOM-001'],
      ['bloques/AB_ANALITICA_INDICADORES_Y_DATOS_MAESTROS/02_AUTORIZACION_DE_DATOS_Y_METRICAS.md', 'DATA-AUTH-001'],
      ['bloques/AB_ANALITICA_INDICADORES_Y_DATOS_MAESTROS/03_EXPERIENCIA_ANALITICA_Y_DE_DECISION.md', 'DATA-UX-001'],
      ['bloques/AB_ANALITICA_INDICADORES_Y_DATOS_MAESTROS/04_INTEGRACIONES_ANALITICAS_Y_SEMANTICAS.md', 'DATA-INT-001'],
    ],
  ),
  partition(
    'bloques/AC_CONTINUIDAD_OPERATIVA_Y_RECUPERACION/00_BLOQUE_AC.md',
    'bloques/AC_CONTINUIDAD_OPERATIVA_Y_RECUPERACION/00_INTRO_Y_ALCANCE.md',
    [
      ['bloques/AC_CONTINUIDAD_OPERATIVA_Y_RECUPERACION/01_DOMINIO_DE_CONTINUIDAD_Y_RECUPERACION.md', 'CONT-DOM-001'],
      ['bloques/AC_CONTINUIDAD_OPERATIVA_Y_RECUPERACION/02_AUTORIZACION_DE_EMERGENCIA_Y_RECUPERACION.md', 'CONT-AUTH-001'],
      ['bloques/AC_CONTINUIDAD_OPERATIVA_Y_RECUPERACION/03_EXPERIENCIA_DE_CONTINGENCIA_Y_MANDO.md', 'CONT-UX-001'],
      ['bloques/AC_CONTINUIDAD_OPERATIVA_Y_RECUPERACION/04_INTEGRACIONES_DE_CONTINUIDAD_Y_REINCORPORACION.md', 'CONT-INT-001'],
    ],
  ),
];

function fail(message) {
  throw new Error(message);
}

function read(relativePath) {
  const fullPath = path.join(BASE_DIR, relativePath);
  if (!fs.existsSync(fullPath)) fail(`No existe ${relativePath}.`);
  return fs.readFileSync(fullPath, 'utf8');
}

function extractTaskIds(text) {
  return [...text.matchAll(TASK_HEADING_REGEX)].map((match) => match[1]);
}

function taskStart(text, taskId) {
  for (const match of text.matchAll(TASK_HEADING_REGEX)) {
    if (match[1] === taskId) return match.index;
  }
  fail(`No se encontró el marcador inicial ${taskId}.`);
}

function normalizedWords(value) {
  return new Set(value
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/gu, '')
    .toUpperCase()
    .replace(/[^A-Z0-9]+/gu, ' ')
    .trim()
    .split(/\s+/u)
    .filter((word) => word.length > 2)
    .filter((word) => !['DEL', 'LAS', 'LOS', 'PARA', 'POR', 'CON', 'INTRO', 'SECCION', 'MINI', 'BLOQUE'].includes(word)));
}

function humanTitle(relativePath) {
  let title = path.posix.basename(relativePath, '.md')
    .replace(/^(?:\d+[A-Z]?_)+/u, '')
    .replaceAll('_', ' ');
  const accents = new Map([
    ['APLICACION', 'APLICACIÓN'],
    ['APLICACIONES', 'APLICACIONES'],
    ['AUTORIZACION', 'AUTORIZACIÓN'],
    ['APROBACION', 'APROBACIÓN'],
    ['AUDITORIA', 'AUDITORÍA'],
    ['CLASIFICACION', 'CLASIFICACIÓN'],
    ['DECISION', 'DECISIÓN'],
    ['DEPURACION', 'DEPURACIÓN'],
    ['DISENO', 'DISEÑO'],
    ['INTEGRACION', 'INTEGRACIÓN'],
    ['INTEGRACIONES', 'INTEGRACIONES'],
    ['NAVEGACION', 'NAVEGACIÓN'],
    ['NORMALIZACION', 'NORMALIZACIÓN'],
    ['PROPOSITO', 'PROPÓSITO'],
    ['PROTECCION', 'PROTECCIÓN'],
    ['SIMULACION', 'SIMULACIÓN'],
    ['TECNICAS', 'TÉCNICAS'],
    ['TECNICO', 'TÉCNICO'],
    ['TECNICOS', 'TÉCNICOS'],
    ['TECNOLOGIA', 'TECNOLOGÍA'],
    ['TRANSICION', 'TRANSICIÓN'],
    ['VALIDACION', 'VALIDACIÓN'],
    ['VINCULACION', 'VINCULACIÓN'],
  ]);
  title = title
    .split(' ')
    .map((word) => accents.get(word) ?? word)
    .join(' ');
  return title;
}

function headingCandidate(line) {
  const clean = line.trim();
  if (!clean || clean.includes('=') || /^###\s+(?:\[[ x~]\]|[✅🟡❌])/u.test(clean)) return false;
  if (/^#{1,6}\s+\S/u.test(clean)) return true;
  return clean.length <= 140
    && /^[A-ZÁÉÍÓÚÑ0-9][A-ZÁÉÍÓÚÑ0-9 _/.,:+→`—()-]+$/u.test(clean);
}

function semanticBoundary(text, taskIndex, fragmentPath) {
  const prefix = text.slice(0, taskIndex);
  const match = prefix.match(/(?:^|\n)([^\n]*\S)[ \t]*\n(?:[ \t]*\n)*$/u);
  if (!match || !headingCandidate(match[1])) return taskIndex;

  const candidateWords = normalizedWords(match[1].replace(/^#{1,6}\s+/u, ''));
  const titleWords = normalizedWords(humanTitle(fragmentPath));
  const overlap = [...candidateWords].filter((word) => titleWords.has(word)).length;
  const requiredOverlap = /^#{1,6}\s+/u.test(match[1].trim())
    ? Math.min(2, candidateWords.size)
    : 1;
  const related = overlap >= requiredOverlap;
  if (!related) return taskIndex;

  const lineStart = prefix.lastIndexOf(match[1]);
  return lineStart > 0 ? lineStart : taskIndex;
}

function stripLeadingSectionLabel(content) {
  const normalized = content.replace(/\r\n?/gu, '\n').replace(/^\s+/u, '');
  const [firstLine, ...remaining] = normalized.split('\n');
  if (headingCandidate(firstLine)) {
    return remaining.join('\n').replace(/^\s+/u, '');
  }
  return normalized;
}

function trailingSectionLabel(line, previousLine = '') {
  const clean = line.trim();
  const previous = previousLine.trim();
  if (!clean || previous === '+') return false;
  if (/^(?:APROBAD[AO]|RECHAZAD[AO]|NO INICIADA|EN PROPUESTA)$/u.test(clean)) return false;
  if (/^[A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\d{3}\b/u.test(clean)) return false;
  if (/^SUBBLOQUE\b/iu.test(clean)) return true;
  return headingCandidate(clean);
}

function stripTrailingSectionLabels(content) {
  const lines = content.replace(/\r\n?/gu, '\n').trimEnd().split('\n');
  while (lines.length) {
    const lastIndex = lines.findLastIndex((line) => line.trim());
    if (lastIndex < 0) return '';
    const previousIndex = lines
      .slice(0, lastIndex)
      .findLastIndex((line) => line.trim());
    const previousLine = previousIndex < 0 ? '' : lines[previousIndex];
    if (!trailingSectionLabel(lines[lastIndex], previousLine)) break;
    lines.splice(lastIndex);
  }
  return lines.join('\n').trimEnd();
}

function withFinalBlankLine(content) {
  return `${content.replace(/\r\n?/gu, '\n').trimEnd()}\n`;
}

function taskSummaries(content) {
  return [...content.matchAll(
    /^###\s+(?:\[[ x~]\]|[✅🟡❌])\s+([A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\d{3})\s+—\s+(.+)$/gmu,
  )].map((match) => ({ id: match[1], title: match[2].trim() }));
}

function metadataBlock(body) {
  const [heading, ...details] = body.trim().split('\n');
  return `${heading}\n\n<!-- PLAN-SECTION-META:START -->\n${details.join('\n').trim()}\n<!-- PLAN-SECTION-META:END -->`;
}

function miniBlockMetadata(partition, fragment, content) {
  const tasks = taskSummaries(content);
  if (!tasks.length) {
    fail(`${fragment.path} no contiene tareas para describir su mini-bloque.`);
  }
  const title = humanTitle(fragment.path);
  const block = humanTitle(path.posix.dirname(partition.source));
  const first = tasks[0];
  const last = tasks.at(-1);
  const range = first.id === last.id
    ? `\`${first.id}\``
    : `\`${first.id}\` a \`${last.id}\``;
  const bullets = tasks.length <= 6
    ? `\n\n**Contenido funcional:**\n\n${tasks.map((task) => `- \`${task.id}\`: ${task.title}`).join('\n')}`
    : `\n\n**Límites funcionales:** comienza con “${first.title}” y concluye con “${last.title}”.`;

  return metadataBlock(
    `### MINI-BLOQUE — ${title}\n\n`
    + `Esta sección organiza **${title.toLocaleLowerCase('es')}** dentro de **${block}**. `
    + 'Agrupa tareas que producen un resultado funcional común y deben mantenerse juntas para conservar contexto, trazabilidad y orden de ejecución.\n\n'
    + `**Cobertura canónica:** ${range} — ${tasks.length} ${tasks.length === 1 ? 'tarea' : 'tareas'}.\n\n`
    + '**Resultado esperado:** al cerrar este mini-bloque, su resultado debe quedar definido, verificable y coherente con las secciones anterior y siguiente antes de avanzar.'
    + bullets,
  );
}

function introMetadata(partition, rawChunks) {
  const rows = partition.fragments.slice(1).map((fragment, offset) => {
    const tasks = taskSummaries(rawChunks[offset + 1]);
    if (!tasks.length) fail(`${fragment.path} no contiene tareas para el índice del bloque.`);
    const first = tasks[0].id;
    const last = tasks.at(-1).id;
    const range = first === last ? `\`${first}\`` : `\`${first}\`–\`${last}\``;
    return `| ${offset + 1} | ${humanTitle(fragment.path)} | ${range} | ${tasks.length} |`;
  });

  return metadataBlock(
    '### Organización documental del bloque\n\n'
    + 'El bloque se divide en mini-bloques funcionales. Cada archivo conserva juntas las tareas que comparten propósito y resultado, evitando tanto el archivo monolítico como la fragmentación de una tarea por archivo.\n\n'
    + '| Orden | Mini-bloque | Cobertura | Tareas |\n'
    + '|---:|---|---|---:|\n'
    + rows.join('\n'),
  );
}

function normalizeFragment(partition, fragment, index, content, rawChunks) {
  if (index === 0) {
    const normalized = content.replace(/\r\n?/gu, '\n').replace(/^\uFEFF/u, '').trimStart();
    const organization = introMetadata(partition, rawChunks);
    if (/^#{1,6}\s+(?!\[[ x~]\]|[✅🟡❌])/u.test(normalized)) {
      return withFinalBlankLine(`${normalized.trimEnd()}\n\n${organization}`);
    }
    return withFinalBlankLine(
      `### SECCIÓN — ${humanTitle(fragment.path)}\n\n${normalized.trimEnd()}\n\n${organization}`,
    );
  }

  const body = stripTrailingSectionLabels(stripLeadingSectionLabel(content));
  return withFinalBlankLine(`${miniBlockMetadata(partition, fragment, body)}\n\n${body}`);
}

function normalizeStandalone(relativePath, content) {
  const normalized = stripTrailingSectionLabels(content
    .replace(/\r\n?/gu, '\n')
    .replace(GENERATED_META_REGEX, '')
    .replace(/^\uFEFF/u, '')
    .trimStart());
  const tasks = taskSummaries(normalized);
  if (/^#{1,6}\s+(?!\[[ x~]\]|[✅🟡❌])/u.test(normalized)) {
    const nonEmptyLines = normalized.split('\n').filter((line) => line.trim()).length;
    if (nonEmptyLines <= 5) {
      const directoryTitle = humanTitle(path.posix.dirname(relativePath));
      const purpose = metadataBlock(
        '### Propósito y organización\n\n'
        + `Esta introducción delimita **${directoryTitle}** dentro del plan canónico. `
        + 'Funciona como punto de entrada de la sección, conserva su intención y prepara la lectura ordenada de los archivos funcionales que la desarrollan.\n\n'
        + '**Resultado esperado:** el alcance del bloque debe comprenderse antes de ejecutar o modificar las tareas de sus secciones dependientes.',
      );
      return withFinalBlankLine(`${normalized.trimEnd()}\n\n${purpose}`);
    }
    return withFinalBlankLine(normalized);
  }
  const first = tasks[0];
  const last = tasks.at(-1);
  const coverage = tasks.length
    ? `\n\n**Cobertura canónica:** \`${first.id}\`${first.id === last.id ? '' : ` a \`${last.id}\``} — ${tasks.length} ${tasks.length === 1 ? 'tarea' : 'tareas'}.`
    : '';
  const meta = metadataBlock(
    `### SECCIÓN — ${humanTitle(relativePath)}\n\n`
    + 'Esta sección reúne contenido canónico con una responsabilidad documental única dentro del plan. '
    + 'Debe conservarse cohesionada y actualizarse junto con sus referencias y validaciones dependientes.'
    + coverage,
  );
  return withFinalBlankLine(`${meta}\n\n${normalized}`);
}

function splitPartition(partition, sourceText) {
  const starts = partition.fragments.map((fragment, index) => {
    if (index === 0 && !fragment.startTask) return 0;
    if (!fragment.startTask) {
      fail(`${fragment.path} debe declarar startTask porque no es el primer fragmento.`);
    }
    const start = taskStart(sourceText, fragment.startTask);
    return semanticBoundary(sourceText, start, fragment.path);
  });

  if (new Set(starts).size !== starts.length) {
    fail(`${partition.source} contiene límites de partición repetidos: ${starts.join(', ')}.`);
  }
  if (starts.some((start, index) => index > 0 && start <= starts[index - 1])) {
    fail(`${partition.source} contiene límites fuera de orden.`);
  }

  const rawChunks = partition.fragments.map((fragment, index) => ({
    path: fragment.path,
    content: sourceText.slice(starts[index], starts[index + 1] ?? sourceText.length),
  }));
  for (let index = 1; index < rawChunks.length; index += 1) {
    const previous = rawChunks[index - 1];
    const match = previous.content.match(/(?:^|\n)([^\n]*\S)[ \t]*\n(?:[ \t]*\n)*$/u);
    if (!match || !headingCandidate(match[1])) continue;
    const candidateWords = normalizedWords(match[1].replace(/^#{1,6}\s+/u, ''));
    const titleWords = normalizedWords(humanTitle(rawChunks[index].path));
    const overlap = [...candidateWords].filter((word) => titleWords.has(word)).length;
    const requiredOverlap = /^#{1,6}\s+/u.test(match[1].trim())
      ? Math.min(2, candidateWords.size)
      : 1;
    if (overlap < requiredOverlap) continue;

    const labelStart = previous.content.lastIndexOf(match[1]);
    if (labelStart < 0) continue;
    previous.content = previous.content.slice(0, labelStart);
    rawChunks[index].content = `${match[1]}\n\n${rawChunks[index].content}`;
  }
  const chunks = rawChunks.map((chunk, index) => ({
    path: chunk.path,
    content: normalizeFragment(
      partition,
      partition.fragments[index],
      index,
      chunk.content,
      rawChunks.map((item) => item.content),
    ),
  }));

  for (const chunk of chunks) {
    if (!chunk.content.endsWith('\n')) {
      fail(`${chunk.path} no terminaría en salto de línea.`);
    }
    const fenceCount = [...chunk.content.matchAll(/^\s*```/gmu)].length;
    if (fenceCount % 2 !== 0) {
      fail(`${chunk.path} contiene una cerca Markdown sin cerrar.`);
    }
  }
  return chunks;
}

function assertTaskSequence(beforeText, afterTexts, source) {
  const before = extractTaskIds(beforeText);
  const after = afterTexts.flatMap((text) => extractTaskIds(text));
  if (before.join('\n') !== after.join('\n')) {
    fail(`${source} alteraría el inventario o el orden de tareas.`);
  }
}

function replaceManifestEntry(files, source, fragments) {
  const sourceIndex = files.indexOf(source);
  const fragmentPaths = fragments.map((fragment) => fragment.path);
  const registeredFragments = fragmentPaths.filter((item) => files.includes(item));

  if (sourceIndex >= 0 && registeredFragments.length) {
    fail(`${source} y sus fragmentos aparecen simultáneamente en manifest.json.`);
  }
  if (sourceIndex < 0) {
    if (registeredFragments.length !== fragmentPaths.length) {
      fail(`${source} no está registrado y su partición está incompleta en manifest.json.`);
    }
    return files;
  }

  return [
    ...files.slice(0, sourceIndex),
    ...fragmentPaths,
    ...files.slice(sourceIndex + 1),
  ];
}

function write(relativePath, content) {
  const fullPath = path.join(BASE_DIR, relativePath);
  fs.mkdirSync(path.dirname(fullPath), { recursive: true });
  fs.writeFileSync(fullPath, content, 'utf8');
}

function main() {
  if (!fs.existsSync(MANIFEST_PATH)) fail('No existe manifest.json.');
  const manifest = JSON.parse(fs.readFileSync(MANIFEST_PATH, 'utf8'));
  if (!Array.isArray(manifest.files)) fail('manifest.json no contiene files[].');

  let nextFiles = [...manifest.files];
  const stagedWrites = [];
  const stagedDeletes = [];
  const partitionFragmentPaths = new Set(
    PARTITIONS.flatMap((partitionItem) =>
      partitionItem.fragments.map((fragment) => fragment.path)),
  );

  for (const partition of PARTITIONS) {
    const sourceFullPath = path.join(BASE_DIR, partition.source);
    const sourceExists = fs.existsSync(sourceFullPath);
    const chunksExist = partition.fragments.every((fragment) =>
      fs.existsSync(path.join(BASE_DIR, fragment.path)));

    nextFiles = replaceManifestEntry(nextFiles, partition.source, partition.fragments);

    if (!sourceExists && !chunksExist) {
      fail(`${partition.source} no existe y faltan fragmentos de su partición.`);
    }

    const currentContents = sourceExists
      ? []
      : partition.fragments.map((fragment) => read(fragment.path));
    const sourceText = sourceExists
      ? read(partition.source)
      : currentContents
        .map((content) => content.replace(GENERATED_META_REGEX, ''))
        .join('');
    const chunks = splitPartition(partition, sourceText);
    assertTaskSequence(
      sourceText,
      chunks.map((chunk) => chunk.content),
      partition.source,
    );
    chunks.forEach((chunk, index) => {
      if (sourceExists || chunk.content !== currentContents[index]) stagedWrites.push(chunk);
    });
    if (sourceExists) stagedDeletes.push(partition.source);
  }

  for (const relativePath of nextFiles) {
    if (partitionFragmentPaths.has(relativePath)) continue;
    const current = read(relativePath);
    const normalized = normalizeStandalone(relativePath, current);
    if (normalized !== current) stagedWrites.push({ path: relativePath, content: normalized });
  }

  const duplicates = nextFiles.filter((item, index) => nextFiles.indexOf(item) !== index);
  if (duplicates.length) {
    fail(`El manifiesto resultante contiene rutas duplicadas: ${[...new Set(duplicates)].join(', ')}.`);
  }

  console.log(JSON.stringify({
    mode: APPLY ? 'APPLY' : 'DRY_RUN',
    partitions: PARTITIONS.length,
    files_before: manifest.files.length,
    files_after: nextFiles.length,
    writes: stagedWrites.length,
    deletes: stagedDeletes.length,
  }, null, 2));

  for (const chunk of stagedWrites) console.log(`+ ${chunk.path}`);
  for (const relativePath of stagedDeletes) console.log(`- ${relativePath}`);

  if (!APPLY) {
    console.log('DRY RUN: no se modificó ningún archivo.');
    return;
  }

  for (const chunk of stagedWrites) write(chunk.path, chunk.content);
  fs.writeFileSync(MANIFEST_PATH, `${JSON.stringify({ ...manifest, files: nextFiles }, null, 2)}\n`);
  for (const relativePath of stagedDeletes) {
    fs.rmSync(path.join(BASE_DIR, relativePath));
  }

  console.log('OK: reorganización aplicada sin alterar contenido ni orden de tareas.');
}

main();
