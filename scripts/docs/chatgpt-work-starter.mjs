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
    'La respuesta debe comenzar con FORMATO_ENTREGA_VENTO_V1 y conservar exactamente sus ocho secciones; no agregues una novena sección.',
    'No te limites a informar qué sigue. Indica exactamente qué debe hacer el usuario, sin asumir que conoce comandos, archivos, estados o convenciones del repositorio.',
    'Dentro de la sección 8 incluye el bloque PASOS EXACTOS PARA EL USUARIO con una lista numerada, rutas exactas, fragmento actual que se reemplaza, contenido completo de reemplazo, resultado esperado del watcher, revisión visual en VS Code y acción de commit/sincronización cuando corresponda.',
    'Si el usuario no debe hacer nada, escríbelo expresamente y explica cuál acción ya ejecutaste tú.',
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

  if (type === 'INICIAR_IMPLEMENTACION' || type === 'CONTINUAR_IMPLEMENTACION') {
    return [
      ...common,
      `Para ${target}, ejecuta la implementación autorizada antes de redactar la respuesta.`,
      'La sección 4 debe enumerar cada archivo creado o modificado, su cambio observable y todo límite respetado.',
      'La sección 6 debe separar comandos ejecutados y resultados reales de validaciones pendientes o no aplicables.',
      'En PASOS EXACTOS PARA EL USUARIO explica cómo inspeccionar los cambios en VS Code, qué comportamiento comprobar manualmente, qué estado físico sigue y si debe esperar, aprobar, corregir o validar; no le delegues comandos que puedas ejecutar tú.',
    ].join('\n');
  }

  if (type === 'VALIDAR_IMPLEMENTACION') {
    return [
      ...common,
      `Para ${target}, ejecuta todas las validaciones autorizadas que estén disponibles y no conviertas resultados pendientes en PASS.`,
      'La sección 6 debe contener comando, resultado, evidencia concreta y clasificación local, remota, operativa o física.',
      'En PASOS EXACTOS PARA EL USUARIO entrega el reemplazo JSON completo para la transición de estado que realmente corresponda, incluido evidence con referencias concretas; si no puede avanzar a VERIFIED, entrega en su lugar el bloqueo exacto y cómo resolverlo.',
    ].join('\n');
  }

  if (type === 'RESOLVER_BLOQUEO') {
    return [
      ...common,
      `Para ${target}, identifica la causa raíz, resuelve solo el bloqueo autorizado y demuestra su condición de salida.`,
      'En PASOS EXACTOS PARA EL USUARIO indica el estado resultante, el JSON exacto que corresponde y cualquier comprobación manual que solo el usuario pueda realizar.',
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
  if (type === 'INICIAR_IMPLEMENTACION' || type === 'CONTINUAR_IMPLEMENTACION') {
    return [
      `Implementa ${target} únicamente dentro de los repositorios y cambios autorizados enumerados abajo.`,
      'Muestra el progreso mediante diffs pequeños, ejecuta las validaciones proporcionales y registra evidencia real; no amplíes alcance ni avances otra instancia.',
    ].join(' ');
  }
  if (type === 'VALIDAR_IMPLEMENTACION') {
    return `Valida ${target} con los comandos autorizados, registra resultados reales y no la marques VERIFIED si falta evidencia remota, operativa o física exigible.`;
  }
  if (type === 'RESOLVER_BLOQUEO') {
    return `Resuelve únicamente el bloqueo declarado de ${target}; conserva el alcance y no avances mientras la condición de salida no esté demostrada.`;
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

Este iniciador ya contiene la instrucción de trabajo: comienza directamente con el preflight y el desarrollo aplicable. Solo detén escrituras si encuentras una contradicción real, un permiso externo faltante o una operación destructiva no autorizada.

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
