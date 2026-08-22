import crypto from 'node:crypto';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import {
  deriveImplementationControl,
  instanceRecordRelativePath,
} from './implementation-control.mjs';
import { resolveTaskWorkTopology } from './task-work-topology.mjs';

const TEMPLATE_PATH = 'docs/plan-canonico/modular/chatgpt-work-starter-template.txt';
const OUTPUT_PATH = 'INICIADOR_VENTO_ACTUAL.txt';
const SLOT = '{{CURRENT_WORK}}';

function sha256(source) {
  return crypto.createHash('sha256').update(source).digest('hex');
}

function list(values, fallback = 'Ninguno.') {
  return values.length > 0 ? values.map((value) => `- ${value}`).join('\n') : `- ${fallback}`;
}

function metadata(block, label) {
  const escaped = label.replace(/[.*+?^${}()|[\]\\]/gu, '\\$&');
  return block.match(new RegExp(`^\\*\\*${escaped}:\\*\\*\\s*(.+)$`, 'imu'))?.[1]?.trim() ?? 'No declarado.';
}

function taskState(task) {
  if (task.marker === '[ ]') return 'NO INICIADA';
  if (task.marker === '[~]' || task.marker === '🟡') return 'PROPUESTA PARA APROBACIÓN';
  if (task.marker === '❌') return 'RECHAZADA';
  return 'APROBADA';
}

export function actionResponseContract(control, sourceContractHash) {
  const { type, target } = control.primaryAction;
  const instanceRecordPath = target.includes('::') ? instanceRecordRelativePath(target) : null;
  const activeStatus = control.physical?.active?.status ?? null;
  const recordedInstances = control.physical?.recordedInstances ?? [];
  const previousInstances = recordedInstances.filter((entry) => entry.instance_id !== target);
  const recordedSummary = previousInstances.length > 0
    ? previousInstances.map((entry) => `${entry.instance_id}=${entry.status}`).join(', ')
    : 'NINGUNA';
  const common = [
    'La primera respuesta de la acción y la entrega final deben comenzar con FORMATO_ENTREGA_VENTO_V1 y conservar exactamente sus ocho secciones; no agregues una novena sección.',
    'Las respuestas intermedias solo existen cuando hay un bloqueo real. En ese caso usa únicamente PROGRESO N/M, LOTE ACTUAL, PASOS CONSECUTIVOS, GATE DE EVIDENCIA y QUÉ DEBE RESPONDER EL USUARIO.',
    'No te limites a informar qué sigue. Indica exactamente qué debe hacer el usuario, sin asumir que conoce comandos, archivos, estados o convenciones del repositorio.',
    'El operador es el usuario humano. Tu función predeterminada es auditar en solo lectura, diseñar el mapa y entregar en una sola respuesta todos los artefactos y pasos consecutivos que puedan determinarse con la evidencia disponible.',
    'No escribas archivos, no uses herramientas de edición, no ejecutes validaciones, no instales dependencias y no hagas commit, push, PR, despliegues ni mutaciones mediante conectores locales o remotos.',
    'AUTHORIZED habilita el trabajo físico, pero no te autoriza a ejecutarlo. Tampoco “haz la acción principal”, APROBADO, RESULTADO DEL PASO ni una solicitud general de implementación conceden permisos de escritura.',
    'Solo la frase exacta AUTORIZO EJECUCION ASISTIDA DEL PASO N, con el número real ya definido, autoriza a ejecutar ese único paso. Al terminarlo vuelve automáticamente el modo humano manual.',
    'Dentro de la sección 8 incluye PASOS EXACTOS PARA EL USUARIO y no conviertas transiciones administrativas en rondas de chat independientes.',
    'No pauses por rutina ni por cambio de archivo. Pausa únicamente si el siguiente paso no puede determinarse sin una salida nueva, una decisión humana, un permiso o una credencial.',
    'Cuando exista un bloqueo real, termina pidiendo RESULTADO DEL PASO N y especifica exactamente qué salida o decisión debe aportar el usuario.',
    'Cuando una batería, conjunto de validaciones o comando necesite devolver evidencia al chat, el mismo comando, script o lote ejecutable debe imprimir al final un bloque delimitado por === RESULTADO PARA CHATGPT === y === FIN RESULTADO PARA CHATGPT === con únicamente la evidencia específica necesaria. No pidas al usuario buscar, recortar ni copiar manualmente tramos extensos de la salida anterior; por defecto debe devolver solo ese bloque final.',
    'El bloque RESULTADO PARA CHATGPT debe indicar PASS/FAIL, la comprobación o comando fallido cuando aplique, los códigos de salida relevantes y los identificadores, hashes, rutas, valores o métricas solicitadas. Debe generarse tanto en PASS como, siempre que sea técnicamente posible, en FAIL, y nunca debe ocultar ni convertir un código de salida no cero en PASS.',
    'Si un fallo impide producir el bloque RESULTADO PARA CHATGPT o el resumen final es insuficiente para diagnosticarlo, solo entonces pide la salida adicional estrictamente necesaria.',
    'Todo bloque de comandos que entregues para uso manual en una terminal interactiva debe dejar la sesión abierta. No incluyas `exit` como comando, ni al final ni dentro de ramas de PASS, FAIL, error o limpieza; tampoco uses equivalentes que cierren o maten la terminal actual. Un FAIL debe detener solo la secuencia lógica, imprimir el bloque RESULTADO PARA CHATGPT y devolver el control al usuario con la terminal abierta.',
    'La prohibición de `exit` aplica a comandos manuales entregados al usuario; no prohíbe mecanismos internos como process.exit(...) dentro del código fuente normal de herramientas del repositorio.',
    'Toda salida operativa destinada a terminal debe usar ASCII seguro en sus etiquetas y mensajes de control: sin tildes, emojis, flechas Unicode ni símbolos decorativos. Usa formas como [PLAN CANONICO], ->, PASS, FAIL, WAIT, RETRY y OK. Los archivos y la documentación siguen usando UTF-8 completo; esta restricción aplica solo a la salida de consola.',
    'Antes de entregar archivos o comandos, consulta el remoto y el repositorio vigente y revisa package.json, generadores, validadores y gates que realmente consumen el cambio; el Iniciador no sustituye esa comprobación.',
    'Si un validador falla, revisa todas sus aserciones restantes y los validadores posteriores afectados antes de entregar otra corrección; no corrijas únicamente el primer error visible.',
    'No repitas pasos ya demostrados como PASS, commits ya creados, transiciones ya realizadas ni lifecycles ya abiertos; continúa desde la última evidencia observada y el estado real del repositorio.',
    'Todo PowerShell manual debe ser parser-safe. Si una variable interpolada queda seguida por dos puntos, usa llaves o formato: `"ANCHOR_COUNT:${Path}:$count"` es válido y `"ANCHOR_COUNT:$Path:$count"` está prohibido.',
    'En PowerShell usa comillas ASCII, guion ASCII en flags y espacios ASCII normales; no uses comillas tipográficas, guiones Unicode, espacios no separables ni sintaxis Bash.',
    'Para cambios grandes prefiere archivos completos o un patch verificado con `git apply --check` antes que bloques PowerShell ad hoc de reemplazos múltiples.',
    'Ante `Generated artifact is stale`, comprueba primero EOL y BOM antes de modificar lógica contractual.',
    'No uses placeholders sin resolver. Cada JSON, ruta, identificador, fecha, hash, estado y texto que el usuario deba copiar debe quedar completo y válido.',
    'El carril documental y el carril físico pueden avanzar en paralelo cuando ambos estén disponibles. Cada carril conserva una sola unidad activa y debe usar un checkout independiente; la acción física prioritaria nunca pausa por sí sola la continuidad documental.',
    'Los cierres de ambos carriles se serializan. El segundo carril en cerrar debe reconciliar el main ya actualizado por el primero y repetir sus validaciones finales sobre esa base antes de mergear.',
  ];
  const physicalCommon = [
    'Durante una implementación física el watcher del checkout físico debe permanecer apagado desde antes de docs:implementation:start hasta después de docs:implementation:finish y de confirmar worktree limpio y remoto sincronizado. El watcher de un checkout documental independiente puede continuar según su propio lifecycle.',
    `La apertura física se ejecuta exclusivamente con npm run docs:implementation:start -- --instance-id ${target}. No indiques cambiar manualmente AUTHORIZED a IN_PROGRESS, no indiques crear la rama manualmente y no indiques ejecutar manualmente el preflight inicial ni docs:plan:build de apertura.`,
    'Una instancia física puede ejecutarse mucho después de su aprobación documental. La continuidad documental actual, el formato histórico del marcador propietario y active-sequence pendiente de regeneración se tratan como avisos documentales dentro del lifecycle físico; no obligan a reabrir ni reformatear tareas históricas. Los bloqueos físicos reales, la autorización, el contrato, el worktree y la divergencia sí permanecen fail-closed.',
    'docs:implementation:start realiza readiness mientras la instancia sigue AUTHORIZED; tras PRE_BRANCH_READINESS: PASS crea o recupera la rama, cambia a IN_PROGRESS, ejecuta una sola vez el preflight físico estricto y después ejecuta docs:plan:build una vez seguido de docs:plan:check para reconciliar cabecera, control, Iniciador y derivados versionados antes de READY_TO_IMPLEMENT: SI.',
    'Después de READY_TO_IMPLEMENT: SI no solicites git status, Source Control, capturas, hashes sueltos, diff, build, lint ni tests como gates intermedios. Materializa primero todos los cambios deterministas y ejecuta después una sola batería final de validación.',
    'La batería física final debe ser fail-fast y contener exclusivamente las validation_commands autorizadas en su orden contractual. El docs:plan:build de apertura y el docs:plan:build de cierre pertenecen al lifecycle y no forman parte de esa batería. Si toda la evidencia exigida es local y las validation_commands terminan con código 0, consolida la evidencia y cambia a VERIFIED. Si alguna validación exige evidencia remota sobre código publicado, la misma transacción final se divide en tramo local y tramo remoto: el tramo local debe pasar mientras la instancia permanece IMPLEMENTED; después se permite el commit/push mínimo de materialización necesario para obtener un SHA remoto real; el tramo remoto valida exactamente ese SHA; solo con PASS remoto se consolida evidence y se cambia a VERIFIED.',
    'Si la batería final falla en el tramo local o remoto, conserva IMPLEMENTED, corrige únicamente la causa dentro del alcance y vuelve a ejecutar la misma batería final completa sobre el estado corregido. Si la corrección cambia el SHA publicado, realiza un nuevo commit/push de materialización antes del tramo remoto. Ese fallo sí es un gate de evidencia.',
    `Después de VERIFIED ejecuta exclusivamente npm run docs:implementation:finish -- --instance-id ${target}. No indiques docs:plan:build, docs:plan:check, stage, commit, push, PR o merge manuales de cierre: el lifecycle ejecuta una vez el build final, valida, publica, espera CI, mergea, vuelve a main, sincroniza derivados locales y limpia la rama.`,
    'Solo después de READY_TO_RESTART_WATCHER: SI vuelve a encender el watcher. Su arranque sincroniza derivados locales ignorados antes de comprobar el estado canónico.',
    'Si GitHub Push Protection bloquea un push, clasifica primero el hallazgo. Solo puede usarse un bypass de prueba o falso positivo cuando el valor esté verificado como fixture sintético; un secreto real debe retirarse y rotarse, nunca exceptuarse.',
  ];

  if (type === 'AUTORIZAR_IMPLEMENTACION') {
    return [
      ...common,
      ...physicalCommon,
      `El archivo ${instanceRecordPath} debe existir en PENDING_AUTHORIZATION antes de autorizar ${target}. La sección 4 debe entregar el contenido completo que reemplaza ese archivo y lo lleva a AUTHORIZED. No entregues una propiedad instances ni modifiques docs/plan-canonico/modular/implementation-control.json.`,
      `El historial anterior contiene ${previousInstances.length} instancia(s): ${recordedSummary}. Se conserva completo; nunca borres, reemplaces, reordenes ni reescribas archivos de instancias anteriores para autorizar la siguiente.`,
      'El reemplazo completo debe incluir instance_id, task_id, status AUTHORIZED, target_repositories, authorized_changes, validation_commands, authorization y evidence: [].',
      'authorization debe incluir decision: APPROVED, approved_by, approved_at, timezone, approval_statement y source_contract_sha256.',
      'Si no puedes verificar el nombre civil del usuario, usa approved_by: VENTO_OWNER; usa una fecha ISO concreta y timezone: America/Bogota, nunca marcadores como <FECHA> o <USUARIO>.',
      `source_contract_sha256 debe ser exactamente ${sourceContractHash}. No pidas al usuario calcular, corregir o conciliar hashes manualmente; la autorización se demuestra con su decisión de guardar ese registro.`,
      'approval_statement debe aprobar exclusivamente los repositorios, cambios y validaciones enumerados, y negar expresamente cualquier ampliación inferida.',
      'Distingue la evidencia de autorización de la evidencia de implementación: evidence debe permanecer [] mientras el estado sea AUTHORIZED.',
      'En la misma respuesta, después de la autorización, entrega también todos los archivos y cambios físicos deterministas que requerirá la instancia. Para .mjs entrega siempre el contenido como .txt descargable e indica el archivo .mjs real que debe crearse o reemplazarse.',
      'No obligues a regenerar el Iniciador, crear un commit exclusivo de autorización ni volver al chat entre AUTHORIZED e IN_PROGRESS.',
      `En PASOS EXACTOS PARA EL USUARIO indica una única secuencia: detener primero el watcher si está activo; con el watcher ya apagado confirmar main limpio, actualizado y sincronizado 0/0 en todos los target_repositories; guardar después el registro AUTHORIZED; ejecutar npm run docs:implementation:start -- --instance-id ${target}; si produce PRE_BRANCH_READINESS: PASS, PREFLIGHT: PASS, START_DOCS_PLAN_BUILD: PASS_ONCE, START_DOCS_PLAN_CHECK: PASS y READY_TO_IMPLEMENT: SI, aplicar todos los archivos sin volver al chat; registrar IMPLEMENTED; ejecutar una sola batería final formada exclusivamente por validation_commands; si toda la evidencia exigida es local y PASS, registrar VERIFIED y ejecutar npm run docs:implementation:finish -- --instance-id ${target}; si la batería exige evidencia remota, completar primero el tramo local, hacer el commit/push mínimo de materialización mientras la instancia permanece IMPLEMENTED, ejecutar el tramo remoto contra ese SHA, registrar VERIFIED solo con PASS remoto y entonces ejecutar docs:implementation:finish. El usuario no ejecuta manualmente los builds documentales de apertura o cierre.`,
      'Si el archivo exacto no existe o no está PENDING_AUTHORIZATION, no propongas crear ni sobrescribir nada por inferencia: ese sí es un bloqueo real.',
    ].join('\n');
  }

  if (type === 'EJECUTAR_IMPLEMENTACION') {
    const phaseInstruction = activeStatus === 'AUTHORIZED'
      ? `El lote comienza ejecutando npm run docs:implementation:start -- --instance-id ${target}; el lifecycle realiza AUTHORIZED -> IN_PROGRESS, preflight y reconciliación documental de apertura.`
      : activeStatus === 'IN_PROGRESS'
        ? `La instancia ya está IN_PROGRESS. Si existe evidencia vigente de READY_TO_IMPLEMENT: SI, continúa con la materialización sin repetir preflight ni build; si el lifecycle de apertura falló antes de READY_TO_IMPLEMENT, diagnostica ese fallo exacto y no inventes pasos manuales equivalentes.`
        : `La instancia ya está IMPLEMENTED. No repitas preflight ni rematerialices cambios correctos; ejecuta la batería final completa y finaliza solo si pasa.`;
    return [
      ...common,
      ...physicalCommon,
      `Para ${target}, entrega una TRANSACCIÓN COMPLETA DE IMPLEMENTACIÓN desde el estado ${activeStatus ?? 'DESCONOCIDO'} hasta el cierre final posterior a VERIFIED. No la dividas artificialmente en INICIAR, CONTINUAR y VALIDAR.`,
      phaseInstruction,
      'Entrega desde el inicio todos los cambios físicos deterministas necesarios. El hecho de entregarlos antes del lifecycle de apertura no autoriza aplicarlos: los pasos del usuario deben aplicar el código únicamente después de READY_TO_IMPLEMENT: SI.',
      'Si la operación es CREAR: indica repositorio, ruta absoluta y relativa, codificación, nombre exacto y contenido completo sin elipsis. Para archivos .mjs entrega además un .txt descargable con el mismo contenido.',
      'Si la operación es MODIFICAR: entrega el archivo completo listo para reemplazar. Solo si es materialmente enorme permite un bloque anterior literal y único más su reemplazo completo; nunca uses fragmentos ambiguos, resúmenes ni “resto sin cambios”.',
      'No ejecutes validaciones entre archivos ni pidas comprobaciones de Source Control, git status, diff o hashes como gates intermedios.',
      `Cuando todos los cambios físicos estén materializados, lleva ${instanceRecordPath} a IMPLEMENTED con evidencia disponible y ejecuta una sola transacción final fail-fast con las validation_commands autorizadas, sin inyectar validadores documentales globales por rutina. Si toda la evidencia exigida es local, puede continuar directamente a VERIFIED tras PASS. Si alguna validación necesita evidencia remota sobre código publicado, completa primero el tramo local, realiza el commit/push mínimo de materialización mientras ${instanceRecordPath} permanece IMPLEMENTED y ejecuta después el tramo remoto contra ese SHA antes de VERIFIED.`,
      `La transacción debe detenerse en el primer fallo real. Si todo pasa, registra VERIFIED y ejecuta npm run docs:implementation:finish -- --instance-id ${target}. No vuelvas a ejecutar la batería después de PASS completo y no repitas el preflight después de READY_TO_IMPLEMENT salvo cambio material del checkout.`,
    ].join('\n');
  }

  if (type === 'RESOLVER_BLOQUEO') {
    return [
      ...common,
      `Para ${target}, identifica la causa raíz en solo lectura y entrega al usuario todos los pasos deterministas de resolución dentro del alcance.`,
      'Mantén el watcher apagado si la instancia está en fase física o si todavía no terminó docs:implementation:finish.',
      'Pausa únicamente cuando la condición de salida necesite evidencia nueva y pide RESULTADO DEL PASO N. No resuelvas el bloqueo mediante escrituras automáticas.',
    ].join('\n');
  }

  return [
    ...common,
    `Para ${target}, entrega el artefacto documental completo listo para revisión y reemplazo, sin aprobarlo por inferencia.`,
    'En PASOS EXACTOS PARA EL USUARIO indica el archivo propietario exacto, qué bloque reemplazar, cómo revisar el cambio, qué palabra debe usar para aprobar y qué ocurrirá después; no le pidas deducir la continuidad.',
    'Las reglas del lifecycle físico aplican a la futura instancia autorizada y no obligan a modificar tareas documentales históricas para implementarlas después.',
  ].join('\n');
}

function actionInstruction(control) {
  const { type, target } = control.primaryAction;
  if (type === 'AUTORIZAR_IMPLEMENTACION') {
    return [
      `Prepara el alcance físico exacto y verificable de ${target}.`,
      'Audita primero el repositorio y los consumidores necesarios; identifica archivos, símbolos, comportamiento actual, cambios permitidos, pruebas, evidencia y rollback.',
      'Entrega en la misma respuesta la autorización completa y, cuando el cambio sea determinista, el paquete físico entero condicionado a que el usuario guarde primero la autorización y supere docs:implementation:start.',
    ].join(' ');
  }
  if (type === 'EJECUTAR_IMPLEMENTACION') {
    return [
      `Guía al usuario en una sola transacción humana continua de ${target} hasta el cierre final posterior a VERIFIED; no la ejecutes por él.`,
      'La apertura se realiza con docs:implementation:start, la batería física final contiene solo validation_commands y el cierre se realiza con docs:implementation:finish; PASS continúa automáticamente dentro del lote y solo FAIL o un bloqueo real vuelven al chat.',
    ].join(' ');
  }
  if (type === 'RESOLVER_BLOQUEO') {
    return `Audita el bloqueo de ${target} en solo lectura y guía al usuario con todos los pasos deterministas; pausa solo cuando necesites evidencia nueva.`;
  }
  return `Desarrolla completa y exclusivamente la tarea documental ${target}; entrega el artefacto material listo para revisión, sin aprobarlo ni iniciar su instancia física por inferencia.`;
}

function sourceContext(task, workTopology, includePrevious) {
  const blocks = [
    'CONTENIDO CANÓNICO DE LA TAREA OBJETIVO',
    '',
    task.block.trim(),
  ];
  if (!includePrevious) return blocks.join('\n');
  const index = workTopology.ordered.findIndex(({ id }) => id === task.id);
  const previous = index > 0 ? workTopology.ordered[index - 1] : null;
  if (!previous) return blocks.join('\n');
  blocks.push(
    '',
    'CONTEXTO CANÓNICO INMEDIATO — TAREA ANTERIOR APROBADA',
    '',
    previous.block.trim(),
  );
  return blocks.join('\n');
}

export function renderCurrentWork({ control, workTopology, templateHash, repositoryRoot }) {
  const physical = control.physical.active;
  const taskId = physical?.taskId ?? control.documentary.taskId;
  const task = workTopology.inventory.get(taskId);
  if (!task) throw new Error(`no se encontró ${taskId} en el inventario canónico.`);
  const lifecycle = workTopology.topology.get(taskId);
  const dependencies = workTopology.dependencies.get(taskId);
  if (!lifecycle || !dependencies) throw new Error(`no se resolvió la topología de ${taskId}.`);
  const targetRepositories = physical?.targetRepositories ?? [];
  const authorizedChanges = physical?.authorizedChanges ?? [];
  const validationCommands = physical?.validationCommands ?? [];
  const implementationAuthorized = control.physical.authorized.some(({ instanceId }) => (
    instanceId === control.primaryAction.target
  ));
  const recordedInstanceRows = control.physical.recordedInstances.map((entry) => (
    `${entry.instance_id} — ${entry.status} — ${instanceRecordRelativePath(entry.instance_id)}`
  ));
  const emptyDraft = task.block.match(/^####\s+/gmu) === null;
  const sourceContractHash = sha256(task.block.replace(/\r\n?/gu, '\n'));
  const activeRecordSource = physical?.record
    ? JSON.stringify(physical.record, null, 2)
    : 'No existe todavía un registro material para esta acción.';

  return `TRABAJO SOLICITADO ACTUAL

ACCIÓN PRINCIPAL OBLIGATORIA

- Acción: ${control.primaryAction.type}
- Objetivo exacto: ${control.primaryAction.target} — ${control.primaryAction.title}
- Instrucción derivada: ${control.primaryAction.instruction}
- Motivo: ${control.primaryAction.why}
- Alcance de esta prioridad: ${physical ? 'CARRIL FÍSICO SOLAMENTE; EL CARRIL DOCUMENTAL SIGUE ACTIVO' : 'CARRIL DOCUMENTAL'}
- Modo operativo: ${control.mode}
- Autorización física para este objetivo: ${implementationAuthorized ? 'SÍ' : 'NO'}
- Raíz local exacta del repositorio: ${repositoryRoot}

MODO DE EJECUCIÓN Y OPERADOR

- Operador que realiza los cambios: USUARIO HUMANO
- Interacción: TRANSACCIÓN CONTINUA + UNA SOLA BATERÍA FINAL
- Escrituras del asistente en archivos o repositorios: NO AUTORIZADAS
- Comandos y validaciones ejecutados por el asistente: NO AUTORIZADOS
- Commit, push, PR, despliegues y mutaciones remotas del asistente: NO AUTORIZADOS
- Auditoría de solo lectura por el asistente: AUTORIZADA
- Watcher durante implementación física: APAGADO EN EL CHECKOUT FÍSICO desde antes de docs:implementation:start hasta READY_TO_RESTART_WATCHER: SI; el checkout documental independiente conserva su propio watcher
- Apertura física: docs:implementation:start gestiona AUTHORIZED -> IN_PROGRESS, preflight y reconciliación documental
- Carril documental durante implementación física: ACTIVO_EN_PARALELO en un checkout independiente; dentro del preflight físico su continuidad adelantada, formato histórico y active-sequence pendiente siguen siendo ADVISORY_ONLY
- Preflight físico: UNA VEZ, automático dentro de docs:implementation:start, antes de aplicar código
- Reconciliación de apertura: docs:plan:build UNA VEZ + docs:plan:check dentro de docs:implementation:start
- Gates intermedios rutinarios: PROHIBIDOS
- READY_TO_IMPLEMENT: SI: CONTINUAR LOCALMENTE SIN VOLVER AL CHAT
- Batería física final: SOLO validation_commands AUTORIZADAS
- Batería final PASS: CONTINUAR EN LA MISMA TRANSACCIÓN; EVIDENCIA REMOTA, SI APLICA, ANTES DE VERIFIED
- Cierre físico: docs:implementation:finish ejecuta la reconciliación documental final, commit, push, PR, CI y merge
- Reactivación del watcher: SOLO DESPUÉS DE READY_TO_RESTART_WATCHER: SI
- Pausa obligatoria: solo FAIL, contradicción real, decisión humana, permiso o credencial no resuelta
- Respuesta del usuario ante una pausa real: RESULTADO DEL PASO N
- Evidencia de baterías solicitada al usuario: SOLO EL BLOQUE FINAL === RESULTADO PARA CHATGPT === GENERADO POR EL MISMO COMANDO
- Copia manual de salidas extensas: PROHIBIDA salvo que el bloque final no pueda generarse o sea insuficiente para diagnosticar un fallo
- Terminal interactiva: SIEMPRE DEBE QUEDAR ABIERTA; COMANDO exit: PROHIBIDO EN BLOQUES MANUALES
- Salida operativa de terminal: ASCII SEGURO; SIN TILDES, EMOJIS NI FLECHAS UNICODE EN MENSAJES DE CONSOLA
- Excepción limitada: AUTORIZO EJECUCION ASISTIDA DEL PASO N, usando el número real del paso ya presentado
- Alcance de la excepción: solo ese paso; al terminar vuelve automáticamente el modo manual

TAREA O CONTRATO PROPIETARIO

- ID: ${task.id}
- Título: ${task.title}
- Estado canónico: ${taskState(task)}
- Repositorio propietario: ${metadata(task.block, 'Repositorio propietario')}
- Archivo propietario: docs/plan-canonico/modular/${task.relativePath}
- Tipo de tarea: ${metadata(task.block, 'Tipo de tarea')}
- Estado físico declarado: ${metadata(task.block, 'Estado físico resultante')}
- Cambios físicos declarados: ${metadata(task.block, 'Cambios físicos autorizados')}
- Ciclo: ${lifecycle.label} (${lifecycle.mode})
- Identidad de instancia: ${physical?.instanceId ?? lifecycle.instancePattern ?? 'No aplica.'}
- Archivo exclusivo de la instancia: ${physical?.recordPath ?? 'No aplica todavía.'}

CARRILES Y CONTINUIDAD

- Coordinación: ${control.coordination.mode}
- Carril documental: ${control.documentary.state}
- Tarea documental actual: ${control.documentary.taskId} — ${control.documentary.taskTitle}
- Carril físico: ${physical ? `${physical.status} — ${physical.instanceId}` : 'SIN INSTANCIA ACTIVA'}
- Checkouts independientes: ${control.coordination.separateCheckoutsRequired ? 'OBLIGATORIOS MIENTRAS AMBOS CARRILES ESTÉN ACTIVOS' : 'NO NECESARIOS AHORA'}
- Cierre entre carriles: SERIALIZADO; el segundo incorpora el main resultante del primero y revalida antes de merge
- Contrato físico en vuelo: CONGELADO POR source_contract_sha256
- Regla de ejecución: ${lifecycle.executionRule}
- Dependencias para desarrollar: ${dependencies.developmentSource ?? 'Solo precedencia canónica vigente.'}
- Dependencias para ejecutar: ${dependencies.executionSource ?? lifecycle.executionDependencies}

HISTORIAL FÍSICO ACUMULATIVO

- Modo de almacenamiento: UN ARCHIVO POR INSTANCIA
- Política histórica: ${control.physical.historyMode}
- Instancias VERIFIED inmutables: ${control.physical.verifiedInstancesImmutable ? 'SÍ' : 'NO'}
- Directorio propietario: ${control.physical.recordDirectory}
- Registros existentes: ${control.physical.recordedInstances.length}

${list(recordedInstanceRows, 'Ninguno; la primera autorización creará el primer archivo.')}

El flujo canónico conserva un archivo por instancia. El watcher puede crear el PENDING_AUTHORIZATION durante el carril documental, pero debe detenerse antes de entrar a la implementación física y permanecer apagado hasta READY_TO_RESTART_WATCHER: SI. Guardar AUTHORIZED no exige reconciliar manualmente la documentación: docs:implementation:start abre la rama, cambia a IN_PROGRESS, ejecuta el preflight y reconcilia una vez los derivados de apertura. La batería física ejecuta exclusivamente validation_commands. Después de VERIFIED, docs:implementation:finish reconcilia una vez los derivados finales, publica y cierra Git. Los registros anteriores nunca se reemplazan.

CONTENIDO LOCAL EXACTO DEL REGISTRO ACTIVO

Ruta: ${physical?.recordPath ?? 'No aplica.'}

\`\`\`json
${activeRecordSource}
\`\`\`

ALCANCE FÍSICO AUTORIZADO

Repositorios:
${list(targetRepositories, 'Ninguno autorizado todavía.')}

Cambios:
${list(authorizedChanges, 'Ninguno autorizado todavía.')}

Validaciones:
${list(validationCommands, 'Deben definirse antes de autorizar implementación.')}

INSTRUCCIÓN FINAL PARA CHATGPT

${actionInstruction(control)}

CONTRATO OBLIGATORIO DE LA RESPUESTA Y DEL PASO MANUAL

${actionResponseContract(control, sourceContractHash)}

La tarea documental ${control.documentary.taskId} permanece ${control.documentary.state} y puede desarrollarse en paralelo con la instancia física cuando exista, siempre en otro checkout o clon independiente. La acción principal generada gobierna el carril físico cuando haya una instancia prioritaria, pero no suspende el carril documental. Una instancia física puede pertenecer a una tarea documental histórica: no la reabras, no la reformatees y no cambies la continuidad documental para ejecutarla. No ejecutes otra instancia, no interpretes la aprobación documental como autorización física y no sustituyas el resultado material por recomendaciones genéricas.

Este iniciador gobierna dos carriles independientes cuando ambos están disponibles. En implementación física entrega los artefactos de una vez. El usuario detiene primero el watcher únicamente en el checkout físico, confirma main limpio y sincronizado 0/0, guarda después AUTHORIZED y ejecuta docs:implementation:start; el lifecycle resuelve IN_PROGRESS, preflight y build/check de apertura. El checkout documental puede continuar con su propia rama y su propio watcher. READY_TO_IMPLEMENT: SI permite materializar todo el lote físico y ejecutar una sola batería física fail-fast formada exclusivamente por validation_commands. PASS continúa dentro del mismo lote; cuando el contrato exija evidencia remota sobre código publicado, la instancia permanece IMPLEMENTED durante el commit/push de materialización y la validación remota, y solo pasa a VERIFIED después del PASS remoto. Los cierres se serializan: el carril que cierre segundo debe reconciliar el main ya actualizado por el primero y repetir su validación final antes de mergear. Tras VERIFIED el usuario ejecuta docs:implementation:finish, que realiza el build/check final, commit, push, PR, CI, merge, sincronización y limpieza. Solo READY_TO_RESTART_WATCHER: SI permite reactivar el watcher del checkout físico. Solo un bloqueo real debe producir una ronda intermedia de chat. No hagas ninguna escritura mientras no exista autorización asistida explícita para el número exacto del paso.

TRAZABILIDAD DEL INICIADOR

- Plantilla SHA-256: ${templateHash}
- Contrato propietario SHA-256: ${sourceContractHash}
- Fuente de control: docs/plan-canonico/modular/implementation-control.json
- Directiva local equivalente: .delivery/current-work-directive.md
- Batería física: exclusivamente validation_commands de la instancia
- Apertura física: docs:implementation:start incluye preflight y docs:plan:build + docs:plan:check de IN_PROGRESS
- Cierre físico: docs:implementation:finish incluye docs:plan:build final, validadores, commit, push, PR, CI y merge
- Reactivación del watcher: solo tras READY_TO_RESTART_WATCHER: SI

${sourceContext(task, workTopology, emptyDraft)}
`;
}

export function buildChatgptWorkStarter({ root = process.cwd() } = {}) {
  const repositoryRoot = path.resolve(root);
  const templatePath = path.join(repositoryRoot, TEMPLATE_PATH);
  if (!fs.existsSync(templatePath)) throw new Error(`no existe ${TEMPLATE_PATH}.`);
  const template = fs.readFileSync(templatePath, 'utf8').replace(/\r\n?/gu, '\n');
  if (template.split(SLOT).length !== 2) {
    throw new Error(`${TEMPLATE_PATH} debe contener exactamente una ranura ${SLOT}.`);
  }
  const workTopology = resolveTaskWorkTopology({ root: repositoryRoot });
  const control = deriveImplementationControl({ root: repositoryRoot, workTopology });
  const currentWork = renderCurrentWork({
    control,
    workTopology,
    templateHash: sha256(template),
    repositoryRoot,
  });
  return {
    control,
    outputPath: path.join(repositoryRoot, OUTPUT_PATH),
    source: template.replace(SLOT, currentWork).replace(/\n*$/u, '\n'),
  };
}

export function writeChatgptWorkStarter({ root = process.cwd(), check = false } = {}) {
  const result = buildChatgptWorkStarter({ root });
  const current = fs.existsSync(result.outputPath) ? fs.readFileSync(result.outputPath, 'utf8') : '';
  const changed = current !== result.source;
  if (check && changed && fs.existsSync(result.outputPath)) {
    throw new Error(`${OUTPUT_PATH} está desactualizado; ejecute npm run docs:chatgpt:starter.`);
  }
  if (!check && changed) {
    fs.mkdirSync(path.dirname(result.outputPath), { recursive: true });
    fs.writeFileSync(result.outputPath, result.source, 'utf8');
  }
  return { ...result, changed };
}

function main() {
  const unknown = process.argv.slice(2).filter((argument) => argument !== '--check');
  if (unknown.length > 0) throw new Error(`argumentos desconocidos: ${unknown.join(', ')}.`);
  const result = writeChatgptWorkStarter({ check: process.argv.includes('--check') });
  console.log(
    `OK: iniciador ChatGPT ${result.changed ? 'actualizado' : 'vigente'}; `
    + `${result.control.primaryAction.type} ${result.control.primaryAction.target}; ${OUTPUT_PATH}.`,
  );
}

const isCli = process.argv[1]
  && path.resolve(process.argv[1]) === path.resolve(fileURLToPath(import.meta.url));

if (isCli) {
  try {
    main();
  } catch (error) {
    console.error(`ERROR: ${error instanceof Error ? error.message : String(error)}`);
    process.exit(1);
  }
}
