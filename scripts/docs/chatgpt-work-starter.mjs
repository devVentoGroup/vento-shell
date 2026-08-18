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
    'No uses placeholders sin resolver. Cada JSON, ruta, identificador, fecha, hash, estado y texto que el usuario deba copiar debe quedar completo y válido.',
  ];
  const physicalCommon = [
    'Durante una implementación física el watcher del plan debe permanecer apagado desde antes de cambiar la instancia a IN_PROGRESS hasta después de dejarla VERIFIED. No uses el watcher como gate de implementación ni permitas que un cambio de estado dispare compilaciones globales repetidas.',
    `Para una instancia física usa el preflight exacto npm run docs:task:preflight -- --instance-id ${target} --json --strict. Debe ejecutarse una sola vez después de IN_PROGRESS y antes de aplicar código.`,
    'El lote local debe comprobar el código de salida del preflight. Si es 0, continúa sin volver al chat. Si es distinto de 0, detén todo antes de modificar código y pide RESULTADO DEL PASO con la salida completa.',
    'Después del preflight PASS no solicites git status, Source Control, capturas, hashes sueltos, diff, build, lint ni tests como gates intermedios. Materializa primero todos los cambios deterministas y ejecuta después una sola batería final de validación.',
    'La batería final debe ser fail-fast y contener las validation_commands autorizadas en su orden contractual. Si todas terminan con código 0, consolida la evidencia, cambia a VERIFIED y continúa con la regeneración ligera sin volver al chat.',
    'Si la batería final falla, conserva IMPLEMENTED, corrige únicamente la causa dentro del alcance y vuelve a ejecutar la misma batería final completa. Ese fallo sí es un gate de evidencia.',
    'Después de VERIFIED regenera el estado y el Iniciador con npm run docs:implementation:status y npm run docs:chatgpt:starter. No ejecutes otro docs:plan:build solo para refrescar la acción.',
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
      `En PASOS EXACTOS PARA EL USUARIO indica una única secuencia: guardar primero el registro AUTHORIZED; detener el watcher; cambiar únicamente ese registro a IN_PROGRESS; ejecutar el preflight estricto de ${target}; si PASS continuar localmente; aplicar todos los archivos; registrar IMPLEMENTED; ejecutar una sola batería final; si PASS registrar VERIFIED; ejecutar npm run docs:implementation:status y npm run docs:chatgpt:starter; y finalmente hacer un único commit/sync del lote completo.`,
      'Si el archivo exacto no existe o no está PENDING_AUTHORIZATION, no propongas crear ni sobrescribir nada por inferencia: ese sí es un bloqueo real.',
      'Incluye el mensaje de commit recomendado para el lote completo, no para la autorización aislada.',
    ].join('\n');
  }

  if (type === 'EJECUTAR_IMPLEMENTACION') {
    const phaseInstruction = activeStatus === 'AUTHORIZED'
      ? `El lote comienza cambiando únicamente ${instanceRecordPath} de AUTHORIZED a IN_PROGRESS y ejecutando inmediatamente el preflight estricto de ${target}.`
      : activeStatus === 'IN_PROGRESS'
        ? `La instancia ya está IN_PROGRESS. Si la evidencia vigente confirma que el preflight estricto de ${target} ya pasó y el checkout no cambió materialmente, no lo repitas; de lo contrario ejecútalo una sola vez antes de aplicar código.`
        : `La instancia ya está IMPLEMENTED. No repitas preflight ni rematerialices cambios correctos; ejecuta la batería final completa y finaliza solo si pasa.`;
    return [
      ...common,
      ...physicalCommon,
      `Para ${target}, entrega una TRANSACCIÓN COMPLETA DE IMPLEMENTACIÓN desde el estado ${activeStatus ?? 'DESCONOCIDO'} hasta VERIFIED. No la dividas artificialmente en INICIAR, CONTINUAR y VALIDAR.`,
      phaseInstruction,
      'Entrega desde el inicio todos los cambios físicos deterministas necesarios. El hecho de entregarlos antes de ejecutar el preflight no autoriza aplicarlos: los pasos del usuario deben aplicar el código únicamente después de que el preflight estricto haya terminado con código 0.',
      'Si la operación es CREAR: indica repositorio, ruta absoluta y relativa, codificación, nombre exacto y contenido completo sin elipsis. Para archivos .mjs entrega además un .txt descargable con el mismo contenido.',
      'Si la operación es MODIFICAR: entrega el archivo completo listo para reemplazar. Solo si es materialmente enorme permite un bloque anterior literal y único más su reemplazo completo; nunca uses fragmentos ambiguos, resúmenes ni “resto sin cambios”.',
      'No ejecutes validaciones entre archivos ni pidas comprobaciones de Source Control, git status, diff o hashes como gates intermedios.',
      `Cuando todos los cambios físicos estén materializados, lleva ${instanceRecordPath} a IMPLEMENTED con evidencia disponible y ejecuta inmediatamente una sola batería final con las validation_commands autorizadas en orden fail-fast.`,
      'El bloque local debe detenerse en el primer fallo. Si falla, el usuario responde una sola vez con ese fallo; si todo pasa, el mismo bloque continúa hasta VERIFIED, regeneración ligera y commit/sync sin requerir una ronda adicional.',
      'No vuelvas a ejecutar la batería después de PASS completo. No vuelvas a ejecutar el preflight después de PASS salvo cambio material del checkout.',
    ].join('\n');
  }

  if (type === 'RESOLVER_BLOQUEO') {
    return [
      ...common,
      `Para ${target}, identifica la causa raíz en solo lectura y entrega al usuario todos los pasos deterministas de resolución dentro del alcance.`,
      'Mantén el watcher apagado si la instancia está en fase física.',
      'Pausa únicamente cuando la condición de salida necesite evidencia nueva y pide RESULTADO DEL PASO N. No resuelvas el bloqueo mediante escrituras automáticas.',
    ].join('\n');
  }

  return [
    ...common,
    `Para ${target}, entrega el artefacto documental completo listo para revisión y reemplazo, sin aprobarlo por inferencia.`,
    'En PASOS EXACTOS PARA EL USUARIO indica el archivo propietario exacto, qué bloque reemplazar, cómo revisar el cambio, qué palabra debe usar para aprobar y qué ocurrirá después; no le pidas deducir la continuidad.',
    'La regla de watcher apagado, preflight estricto y batería final única aplica a la futura instancia física, no obliga a modificar el watcher durante una tarea documental.',
  ].join('\n');
}

function actionInstruction(control) {
  const { type, target } = control.primaryAction;
  if (type === 'AUTORIZAR_IMPLEMENTACION') {
    return [
      `Prepara el alcance físico exacto y verificable de ${target}.`,
      'Audita primero el repositorio y los consumidores necesarios; identifica archivos, símbolos, comportamiento actual, cambios permitidos, pruebas, evidencia y rollback.',
      'Entrega en la misma respuesta la autorización completa y, cuando el cambio sea determinista, el paquete físico entero condicionado a que el usuario guarde primero la autorización y supere el preflight estricto.',
    ].join(' ');
  }
  if (type === 'EJECUTAR_IMPLEMENTACION') {
    return [
      `Guía al usuario en una sola transacción humana continua de ${target} hasta VERIFIED; no la ejecutes por él.`,
      'El preflight estricto y la batería final son fail-fast locales: PASS continúa automáticamente dentro del lote; solo FAIL o un bloqueo real vuelven al chat.',
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
- Watcher durante implementación física: APAGADO desde antes de IN_PROGRESS hasta después de VERIFIED
- Preflight físico: UNA VEZ, con --instance-id y --strict, antes de aplicar código
- Gates intermedios rutinarios: PROHIBIDOS
- Preflight PASS: CONTINUAR LOCALMENTE SIN VOLVER AL CHAT
- Batería final PASS: CONTINUAR LOCALMENTE HASTA VERIFIED SIN VOLVER AL CHAT
- Pausa obligatoria: solo FAIL, contradicción real, decisión humana, permiso o credencial no resuelta
- Respuesta del usuario ante una pausa real: RESULTADO DEL PASO N
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

- Carril documental: ${control.documentary.state}
- Tarea documental actual: ${control.documentary.taskId} — ${control.documentary.taskTitle}
- Carril físico: ${physical ? `${physical.status} — ${physical.instanceId}` : 'SIN INSTANCIA ACTIVA'}
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

El flujo canónico conserva un archivo por instancia. El watcher puede crear el PENDING_AUTHORIZATION durante el carril documental, pero debe detenerse antes de entrar a la implementación física. Desde IN_PROGRESS hasta VERIFIED los cambios de estado y código se realizan con el watcher apagado; el preflight estricto que pasa no obliga a volver al chat y la batería final ejecuta las validaciones globales una sola vez. Los registros anteriores nunca se reemplazan.

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

No desarrolles la tarea documental ${control.documentary.taskId} mientras su carril figure ${control.documentary.state}, salvo que esa misma tarea sea el objetivo exacto de la acción principal. No ejecutes otra instancia, no interpretes la aprobación documental como autorización física y no sustituyas el resultado material por recomendaciones genéricas.

Este iniciador ya contiene la instrucción de trabajo. En implementación física entrega los artefactos de una vez, usa preflight estricto único, watcher apagado, cambios deterministas en lote y una sola batería final. PASS continúa localmente; solo un bloqueo real debe producir una ronda intermedia de chat. No hagas ninguna escritura mientras no exista autorización asistida explícita para el número exacto del paso.

TRAZABILIDAD DEL INICIADOR

- Plantilla SHA-256: ${templateHash}
- Contrato propietario SHA-256: ${sourceContractHash}
- Fuente de control: docs/plan-canonico/modular/implementation-control.json
- Directiva local equivalente: .delivery/current-work-directive.md
- Regeneración ligera de control: npm run docs:implementation:status
- Regeneración ligera del Iniciador: npm run docs:chatgpt:starter
- Compilación global: npm run docs:plan:build solo cuando una tarea documental o la batería final autorizada lo requiera

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
