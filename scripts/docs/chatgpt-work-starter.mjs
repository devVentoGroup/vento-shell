import crypto from 'node:crypto';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import { deriveImplementationControl } from './implementation-control.mjs';
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
  const common = [
    'La primera respuesta de la acción y la entrega final deben comenzar con FORMATO_ENTREGA_VENTO_V1 y conservar exactamente sus ocho secciones; no agregues una novena sección.',
    'Las respuestas intermedias después de HECHO no son entregas finales: usa únicamente PASO N DE M, OPERACIÓN Y RUTA, CONTENIDO O COMANDO EXACTO, COMPROBACIÓN y RESPONDE HECHO. Así se evita repetir contexto y consumir mensajes innecesarios.',
    'No te limites a informar qué sigue. Indica exactamente qué debe hacer el usuario, sin asumir que conoce comandos, archivos, estados o convenciones del repositorio.',
    'El operador es el usuario humano. Tu función predeterminada es auditar en solo lectura, diseñar el mapa y entregar exactamente un paso ejecutable por respuesta.',
    'No escribas archivos, no uses herramientas de edición, no ejecutes validaciones, no instales dependencias y no hagas commit, push, PR, despliegues ni mutaciones mediante conectores locales o remotos.',
    'AUTHORIZED habilita el trabajo físico, pero no te autoriza a ejecutarlo. Tampoco “haz la acción principal”, APROBADO, HECHO ni una solicitud general de implementación conceden permisos de escritura.',
    'Solo la frase exacta AUTORIZO EJECUCION ASISTIDA DEL PASO N, con el número real ya definido, autoriza a ejecutar ese único paso. Al terminarlo vuelve automáticamente el modo humano manual.',
    'Dentro de la sección 8 incluye PASOS EXACTOS PARA EL USUARIO. Entrega un único PASO ACTUAL, termina pidiendo HECHO y no reveles ni inicies el paso siguiente hasta recibir esa confirmación y verificar la evidencia aportada.',
    'No uses placeholders sin resolver. Cada JSON, ruta, identificador, fecha, hash, estado y texto que el usuario deba copiar debe quedar completo y válido.',
  ];

  if (type === 'AUTORIZAR_IMPLEMENTACION') {
    return [
      ...common,
      `Para ${target}, la sección 4 debe contener la propiedad JSON completa y válida, desde "instances": [ hasta su corchete final ], que reemplazará exclusivamente la línea "instances": [] en docs/plan-canonico/modular/implementation-control.json si el usuario decide aprobar. No entregues únicamente el objeto interior.`,
      'Ese objeto debe incluir instance_id, task_id, status AUTHORIZED, target_repositories, authorized_changes, validation_commands, authorization y evidence: [].',
      'authorization debe incluir decision: APPROVED, approved_by, approved_at, timezone, approval_statement y source_contract_sha256.',
      'Si no puedes verificar el nombre civil del usuario, usa approved_by: VENTO_OWNER; usa una fecha ISO concreta y timezone: America/Bogota, nunca marcadores como <FECHA> o <USUARIO>.',
      `source_contract_sha256 debe ser exactamente ${sourceContractHash}. No pidas al usuario calcular, corregir o conciliar hashes manualmente; la autorización se demuestra con su declaración explícita y su commit.`,
      'approval_statement debe aprobar exclusivamente los repositorios, cambios y validaciones enumerados, y negar expresamente cualquier ampliación inferida.',
      'Aclara que el bloque listo para copiar sigue siendo una propuesta hasta que el usuario lo pegue, guarde y confirme mediante su propio commit; tú no debes modificar implementation-control.json ni autorizarte a ti mismo.',
      'Distingue la evidencia de autorización de la evidencia de implementación: evidence debe permanecer [] mientras el estado sea AUTHORIZED.',
      'En PASOS EXACTOS PARA EL USUARIO indica, sin comandos de terminal: abrir implementation-control.json, reemplazar solo instances: [], guardar, esperar el watcher, comprobar el cambio a INICIAR_IMPLEMENTACION, revisar el diff, crear el commit desde el control de código fuente de VS Code, sincronizar y cargar el INICIADOR_VENTO_ACTUAL.txt recién regenerado.',
      'Incluye el texto exacto que debería mostrar el watcher después de guardar y el mensaje de commit recomendado.',
    ].join('\n');
  }

  if (type === 'INICIAR_IMPLEMENTACION') {
    return [
      ...common,
      `Para ${target}, primero entrega un MAPA COMPLETO DE IMPLEMENTACIÓN: todos los pasos numerados, operación, ruta, propósito, dependencias y validación, pero sin incluir todavía el contenido de pasos futuros.`,
      'El PASO ACTUAL 0 debe ser la transición manual de status AUTHORIZED a IN_PROGRESS en docs/plan-canonico/modular/implementation-control.json. Entrega la ruta, el fragmento actual exacto, el reemplazo exacto, el resultado esperado del watcher y pide HECHO.',
      'No entregues todavía código de implementación ni ejecutes preflight. Después de HECHO y de comprobar CONTINUAR_IMPLEMENTACION, comienza el primer paso físico.',
    ].join('\n');
  }

  if (type === 'CONTINUAR_IMPLEMENTACION') {
    return [
      ...common,
      `Para ${target}, conserva un MAPA COMPLETO DE IMPLEMENTACIÓN numerado y entrega únicamente el siguiente paso pendiente.`,
      'Si la operación es CREAR: indica repositorio, ruta absoluta y relativa, codificación, nombre exacto y contenido completo sin elipsis. Para archivos .mjs entrega además un .txt descargable con el mismo contenido.',
      'Si la operación es MODIFICAR: entrega el archivo completo listo para reemplazar. Solo si es materialmente enorme permite un bloque anterior literal y único más su reemplazo completo; nunca uses fragmentos ambiguos, resúmenes ni “resto sin cambios”.',
      'Si la operación es EJECUTAR: indica directorio exacto, un solo comando copiable, qué modifica, resultado esperado y qué salida debe pegar el usuario. No lo ejecutes tú.',
      'Después de cada HECHO verifica la evidencia aportada, actualiza el progreso visible N/M y entrega solo el paso siguiente. No declares PASS por la afirmación del usuario si falta contenido o salida verificable.',
      'No cambies el estado a IMPLEMENTED hasta cerrar todos los pasos físicos y reunir evidencia real; entonces entrega como último paso el JSON completo y exacto para esa transición.',
    ].join('\n');
  }

  if (type === 'VALIDAR_IMPLEMENTACION') {
    return [
      ...common,
      `Para ${target}, entrega las validaciones autorizadas una por una para que el usuario las ejecute; nunca ejecutes la batería completa por tu cuenta.`,
      'Cada paso debe contener directorio, comando único, efecto, duración estimada, resultado esperado y salida que el usuario debe pegar. Clasifica la evidencia como local, remota, operativa o física.',
      'Solo después de verificar todas las salidas entrega el reemplazo JSON completo para VERIFIED. Si algo falla, entrega un único paso de diagnóstico o corrección y conserva el estado actual.',
    ].join('\n');
  }

  if (type === 'RESOLVER_BLOQUEO') {
    return [
      ...common,
      `Para ${target}, identifica la causa raíz en solo lectura y entrega al usuario un único paso de resolución dentro del alcance.`,
      'Espera HECHO y evidencia antes de comprobar la condición de salida o entregar otro paso. No resuelvas el bloqueo mediante escrituras automáticas.',
    ].join('\n');
  }

  return [
    ...common,
    `Para ${target}, entrega el artefacto documental completo listo para revisión y reemplazo, sin aprobarlo por inferencia.`,
    'En PASOS EXACTOS PARA EL USUARIO indica el archivo propietario exacto, qué bloque reemplazar, cómo revisar el cambio, qué palabra debe usar para aprobar y qué ocurrirá automáticamente después; no le pidas deducir la continuidad.',
  ].join('\n');
}

function actionInstruction(control) {
  const { type, target } = control.primaryAction;
  if (type === 'AUTORIZAR_IMPLEMENTACION') {
    return [
      `Prepara el alcance físico exacto y verificable de ${target}.`,
      'Audita primero el repositorio y los consumidores necesarios; identifica archivos, símbolos, comportamiento actual, cambios permitidos, pruebas, evidencia y rollback.',
      'Entrega una propuesta completa de autorización por instancia, pero no cambies código ni declares la instancia autorizada por inferencia.',
    ].join(' ');
  }
  if (type === 'INICIAR_IMPLEMENTACION') {
    return [
      `Inicia la guía humana paso a paso de ${target}; no modifiques repositorios ni ejecutes comandos.`,
      'Entrega el mapa completo y únicamente el paso manual para pasar la instancia a IN_PROGRESS; espera HECHO.',
    ].join(' ');
  }
  if (type === 'CONTINUAR_IMPLEMENTACION') {
    return [
      `Guía al usuario en el siguiente paso pendiente de ${target}; no lo ejecutes por él.`,
      'Entrega una sola creación, modificación o validación con ruta y contenido exactos, y espera HECHO con evidencia antes de avanzar.',
    ].join(' ');
  }
  if (type === 'VALIDAR_IMPLEMENTACION') {
    return `Entrega al usuario una validación exacta de ${target} por vez; no la ejecutes ni marques VERIFIED sin la salida real aportada por él.`;
  }
  if (type === 'RESOLVER_BLOQUEO') {
    return `Audita el bloqueo de ${target} en solo lectura y guía al usuario en un único paso de resolución; espera HECHO antes de avanzar.`;
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

export function renderCurrentWork({ control, workTopology, templateHash }) {
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
  const emptyDraft = task.block.match(/^####\s+/gmu) === null;
  const sourceContractHash = sha256(task.block.replace(/\r\n?/gu, '\n'));

  return `TRABAJO SOLICITADO ACTUAL

ACCIÓN PRINCIPAL OBLIGATORIA

- Acción: ${control.primaryAction.type}
- Objetivo exacto: ${control.primaryAction.target} — ${control.primaryAction.title}
- Instrucción derivada: ${control.primaryAction.instruction}
- Motivo: ${control.primaryAction.why}
- Modo operativo: ${control.mode}
- Autorización física para este objetivo: ${implementationAuthorized ? 'SÍ' : 'NO'}

MODO DE EJECUCIÓN Y OPERADOR

- Operador que realiza los cambios: USUARIO HUMANO
- Interacción: UN PASO POR VEZ
- Escrituras del asistente en archivos o repositorios: NO AUTORIZADAS
- Comandos y validaciones ejecutados por el asistente: NO AUTORIZADOS
- Commit, push, PR, despliegues y mutaciones remotas del asistente: NO AUTORIZADOS
- Auditoría de solo lectura por el asistente: AUTORIZADA
- Confirmación para recibir el paso siguiente: HECHO
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

CARRILES Y CONTINUIDAD

- Carril documental: ${control.documentary.state}
- Tarea documental actual: ${control.documentary.taskId} — ${control.documentary.taskTitle}
- Carril físico: ${physical ? `${physical.status} — ${physical.instanceId}` : 'SIN INSTANCIA ACTIVA'}
- Regla de ejecución: ${lifecycle.executionRule}
- Dependencias para desarrollar: ${dependencies.developmentSource ?? 'Solo precedencia canónica vigente.'}
- Dependencias para ejecutar: ${dependencies.executionSource ?? lifecycle.executionDependencies}

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

Este iniciador ya contiene la instrucción de trabajo: comienza con auditoría de solo lectura, presenta el mapa y entrega únicamente el paso manual vigente. No hagas ninguna escritura mientras no exista autorización asistida explícita para el número exacto del paso.

TRAZABILIDAD DEL INICIADOR

- Plantilla SHA-256: ${templateHash}
- Contrato propietario SHA-256: ${sourceContractHash}
- Fuente de control: docs/plan-canonico/modular/implementation-control.json
- Directiva local equivalente: .delivery/current-work-directive.md
- Generación automática: npm run docs:plan:build y watcher del plan canónico

${sourceContext(task, workTopology, emptyDraft)}
`;
}

export function buildChatgptWorkStarter({ root = process.cwd() } = {}) {
  const templatePath = path.join(root, TEMPLATE_PATH);
  if (!fs.existsSync(templatePath)) throw new Error(`no existe ${TEMPLATE_PATH}.`);
  const template = fs.readFileSync(templatePath, 'utf8').replace(/\r\n?/gu, '\n');
  if (template.split(SLOT).length !== 2) {
    throw new Error(`${TEMPLATE_PATH} debe contener exactamente una ranura ${SLOT}.`);
  }
  const workTopology = resolveTaskWorkTopology({ root });
  const control = deriveImplementationControl({ root, workTopology });
  const currentWork = renderCurrentWork({
    control,
    workTopology,
    templateHash: sha256(template),
  });
  return {
    control,
    outputPath: path.join(root, OUTPUT_PATH),
    source: template.replace(SLOT, currentWork).replace(/\n*$/u, '\n'),
  };
}

export function writeChatgptWorkStarter({ root = process.cwd(), check = false } = {}) {
  const result = buildChatgptWorkStarter({ root });
  const current = fs.existsSync(result.outputPath) ? fs.readFileSync(result.outputPath, 'utf8') : '';
  const changed = current !== result.source;
  if (check && changed && fs.existsSync(result.outputPath)) {
    throw new Error(`${OUTPUT_PATH} está desactualizado; ejecute docs:plan:build.`);
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
