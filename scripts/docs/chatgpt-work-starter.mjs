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
const LEGACY_OUTPUT_PATH = 'INICIADOR_VENTO_ACTUAL.txt';
const DOCUMENTATION_OUTPUT_PATH = '.delivery/INICIADOR_VENTO_DOCUMENTACION.txt';
const IMPLEMENTATION_OUTPUT_PATH = '.delivery/INICIADOR_VENTO_IMPLEMENTACION.txt';
const SLOT = '{{CURRENT_WORK}}';

export const CHATGPT_STARTER_PATHS = Object.freeze({
  selector: LEGACY_OUTPUT_PATH,
  documentation: DOCUMENTATION_OUTPUT_PATH,
  implementation: IMPLEMENTATION_OUTPUT_PATH,
});

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

function countByStatus(rows, status) {
  return rows.filter((entry) => entry.status === status).length;
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

function renderSelector(control) {
  const physical = control.physical.active;
  return `VENTO OS — SELECTOR DE INICIADOR POR INTENCIÓN

ESTE ARCHIVO YA NO CONTIENE EL PAYLOAD COMPLETO DE TRABAJO.
NO LO USES COMO SUSTITUTO DE LOS INICIADORES ESPECÍFICOS.

CARRIL DOCUMENTAL

- Archivo: ${DOCUMENTATION_OUTPUT_PATH}
- Tarea actual: ${control.documentary.taskId} — ${control.documentary.taskTitle}
- Estado: ${control.documentary.state}
- Úsalo para: desarrollar, documentar, revisar o corregir la tarea documental actual.

CARRIL FÍSICO

- Archivo: ${IMPLEMENTATION_OUTPUT_PATH}
- Instancia activa: ${physical ? `${physical.instanceId} — ${physical.status}` : 'SIN INSTANCIA ACTIVA'}
- Úsalo para: autorizar, implementar, continuar o resolver una instancia física.

REGLA

Carga solamente uno de los dos iniciadores según la intención de la conversación. Nunca cargues ambos en la misma conversación.
`;
}

function renderDocumentationWork({ control, workTopology, templateHash, repositoryRoot }) {
  const task = workTopology.inventory.get(control.documentary.taskId);
  if (!task) throw new Error(`no se encontró ${control.documentary.taskId} en el inventario canónico.`);
  const lifecycle = workTopology.topology.get(task.id);
  const dependencies = workTopology.dependencies.get(task.id);
  if (!lifecycle || !dependencies) throw new Error(`no se resolvió la topología de ${task.id}.`);

  const physical = control.physical.active;
  const emptyDraft = task.block.match(/^####\s+/gmu) === null;
  const sourceContractHash = sha256(task.block.replace(/\r\n?/gu, '\n'));

  return `INTENT_LOCK: DOCUMENTATION
CONVERSATION_LANE: DOCUMENTARY
DO_NOT_SWITCH_LANES: TRUE

REGLA CRÍTICA DE ESTA CONVERSACIÓN

Esta conversación trabaja EXCLUSIVAMENTE el carril documental y la tarea ${task.id}.

- Una instancia física pendiente, autorizada, en progreso, implementada o bloqueada NO cambia la tarea documental de esta conversación.
- NO autorices implementaciones desde este iniciador.
- NO ejecutes implementaciones desde este iniciador.
- NO cambies al carril físico por prioridad de implementation-control.
- Si el usuario solicita después una acción física, debe abrir otra conversación con ${IMPLEMENTATION_OUTPUT_PATH}.

TRABAJO DOCUMENTAL ACTUAL

- ID: ${task.id}
- Título: ${task.title}
- Estado canónico: ${taskState(task)}
- Carril documental: ${control.documentary.state}
- Repositorio propietario: ${metadata(task.block, 'Repositorio propietario')}
- Archivo propietario: docs/plan-canonico/modular/${task.relativePath}
- Tipo de tarea: ${metadata(task.block, 'Tipo de tarea')}
- Ciclo físico declarado para el contrato: ${lifecycle.label} (${lifecycle.mode})
- Raíz local exacta del repositorio: ${repositoryRoot}

CONTINUIDAD DOCUMENTAL

- Tarea actual: ${control.documentary.taskId} — ${control.documentary.taskTitle}
- Dependencias para desarrollar: ${dependencies.developmentSource ?? 'Solo precedencia canónica vigente.'}
- Dependencias para ejecutar físicamente: INFORMATIVAS EN ESTE INICIADOR; NO EJECUTAR.

METODOLOGÍA DOCUMENTAL VIGENTE

- El usuario humano realiza los reemplazos y comandos locales.
- Antes de desarrollar, verifica 01_PROTOCOLO.md, delivery-contract.json, manifest.json, continuidad, topología, políticas de formato/desarrollo, archivo propietario, dependencias, 04A cuando aplique, package.json y validadores reales.
- Si docs:task:start -- --task-id ${task.id} ya produjo PASS y READY_TO_WORK: SI, no lo repitas.
- El artefacto de tarea se entrega completo, listo para reemplazar el marcador exacto, pero no se vuelve canónico hasta que el usuario responda APROBADO.
- APROBADO no autoriza implementación física ni avance automático a la siguiente tarea.
- El cierre documental conserva npm run docs:task:finish -- --task-id ${task.id} y no se sustituye por commits manuales.
- No pegues en el chat el contenido completo de la tarea ni de 04A cuando existan archivos descargables preparados para reemplazo.
- Distingue VALIDACIÓN ESTRUCTURAL DEL ARTEFACTO de VALIDACIÓN REAL DEL REPOSITORIO.

CARRIL FÍSICO — SOLO ESTADO INFORMATIVO

- Instancia activa: ${physical ? physical.instanceId : 'NINGUNA'}
- Estado físico: ${physical ? physical.status : 'SIN INSTANCIA ACTIVA'}
- Contrato físico: ${physical ? `${physical.taskId} — ${physical.taskTitle}` : 'No aplica.'}
- Acción física prioritaria global: ${physical ? `${control.primaryAction.type} ${control.primaryAction.target}` : 'NINGUNA'}
- Alcance dentro de esta conversación: FUERA DE ALCANCE. NO DESARROLLAR, NO AUTORIZAR, NO EJECUTAR.

TRAZABILIDAD DEL INICIADOR

- Intención: DOCUMENTATION
- Plantilla SHA-256: ${templateHash}
- Contrato documental SHA-256: ${sourceContractHash}
- Fuente de continuidad: task-work-topology + preflight documental
- Fuente de control físico resumido: docs/plan-canonico/modular/implementation-control.json

${sourceContext(task, workTopology, emptyDraft)}
`;
}

export function actionResponseContract(control, sourceContractHash) {
  const physical = control.physical?.active ?? null;
  if (!physical) {
    return [
      'No existe una instancia física activa.',
      'No infieras una instancia desde la tarea documental ni autorices trabajo físico por continuidad.',
    ].join('\n');
  }

  const target = physical.instanceId;
  const recordPath = physical.recordPath ?? instanceRecordRelativePath(target);
  const common = [
    'La primera respuesta material y la entrega final deben comenzar con FORMATO_ENTREGA_VENTO_V1 y conservar exactamente sus ocho secciones.',
    'El operador predeterminado es el usuario humano; el asistente audita y prepara artefactos en solo lectura.',
    'No escribas archivos, no ejecutes validaciones, no hagas commit, push, PR, merge, despliegues ni mutaciones remotas.',
    'Solo AUTORIZO EJECUCION ASISTIDA DEL PASO N autoriza ese único paso numerado.',
    'No uses micro-gates ni pauses por rutina; pausa solo ante FAIL, contradicción real, decisión humana, permiso o credencial no resuelta.',
    'Cuando necesites evidencia, el comando debe imprimir un bloque === RESULTADO PARA CHATGPT === ... === FIN RESULTADO PARA CHATGPT === y el usuario devuelve únicamente ese bloque salvo insuficiencia diagnóstica.',
    'Todo bloque manual debe dejar la terminal abierta, usar PowerShell parser-safe y salida operativa ASCII segura.',
    'No repitas lifecycles, validaciones o pasos ya demostrados como PASS.',
    'Durante el carril físico el watcher del checkout físico permanece apagado desde antes de docs:implementation:start hasta READY_TO_RESTART_WATCHER: SI.',
    `La apertura física se realiza exclusivamente con npm run docs:implementation:start -- --instance-id ${target}.`,
    'Después de READY_TO_IMPLEMENT: SI materializa todos los cambios deterministas antes de validar.',
    'Ejecuta exactamente una vez npm run quality:repair antes de registrar IMPLEMENTED.',
    'Solo con quality:repair PASS y READY_FOR_VALIDATION: SI registra IMPLEMENTED.',
    'La batería final contiene exclusivamente validation_commands autorizadas, en su orden contractual, y es fail-fast.',
    'Si existe evidencia remota obligatoria, conserva IMPLEMENTED durante commit/push mínimo de materialización y valida el SHA remoto antes de VERIFIED.',
    `Después de VERIFIED ejecuta exclusivamente npm run docs:implementation:finish -- --instance-id ${target}.`,
  ];

  if (control.primaryAction.type === 'AUTORIZAR_IMPLEMENTACION') {
    return [
      ...common,
      `El registro ${recordPath} debe permanecer PENDING_AUTHORIZATION hasta que el usuario apruebe el alcance exacto.`,
      'La autorización debe declarar instance_id, task_id, status AUTHORIZED, target_repositories, authorized_changes, validation_commands, authorization y evidence: [].',
      'authorization debe declarar decision: APPROVED, approved_by, approved_at, timezone, approval_statement y source_contract_sha256.',
      `source_contract_sha256 debe ser exactamente ${sourceContractHash}.`,
      'evidence permanece [] mientras el estado sea AUTHORIZED.',
      'La misma entrega puede preparar el lote físico completo, condicionado a guardar primero AUTHORIZED y superar docs:implementation:start.',
    ].join('\n');
  }

  if (control.primaryAction.type === 'RESOLVER_BLOQUEO') {
    return [
      ...common,
      `Identifica en solo lectura la causa raíz del bloqueo de ${target}.`,
      'Entrega todos los pasos deterministas dentro del alcance y detente únicamente cuando la condición de salida requiera evidencia nueva.',
    ].join('\n');
  }

  return [
    ...common,
    `Continúa ${target} desde su estado real ${physical.status}; no reinicies automáticamente desde AUTHORIZED si ya existe evidencia de una fase posterior.`,
    'Si la instancia ya está IMPLEMENTED, entra directamente a la batería final; no repitas preflight ni materialización demostrada.',
  ].join('\n');
}

function renderImplementationWork({ control, workTopology, templateHash, repositoryRoot }) {
  const physical = control.physical.active;
  if (!physical) {
    return `INTENT_LOCK: PHYSICAL_IMPLEMENTATION
CONVERSATION_LANE: PHYSICAL
DO_NOT_SWITCH_LANES: TRUE

ESTADO

NO EXISTE UNA INSTANCIA FÍSICA ACTIVA.

- Tarea documental actual: ${control.documentary.taskId} — ${control.documentary.taskTitle}
- Esa tarea es solo informativa en este iniciador.
- No derives, autorices ni ejecutes una instancia física por inferencia.
- Para desarrollar documentación usa ${DOCUMENTATION_OUTPUT_PATH}.

TRAZABILIDAD DEL INICIADOR

- Intención: PHYSICAL_IMPLEMENTATION
- Plantilla SHA-256: ${templateHash}
- Fuente de control: docs/plan-canonico/modular/implementation-control.json
`;
  }

  const task = workTopology.inventory.get(physical.taskId);
  if (!task) throw new Error(`no se encontró ${physical.taskId} en el inventario canónico.`);
  const lifecycle = workTopology.topology.get(task.id);
  const dependencies = workTopology.dependencies.get(task.id);
  if (!lifecycle || !dependencies) throw new Error(`no se resolvió la topología de ${task.id}.`);

  const sourceContractHash = sha256(task.block.replace(/\r\n?/gu, '\n'));
  const recordPath = physical.recordPath ?? instanceRecordRelativePath(physical.instanceId);
  const activeRecordSource = physical.record
    ? JSON.stringify(physical.record, null, 2)
    : 'No existe todavía un registro material para esta instancia.';
  const recorded = control.physical.recordedInstances ?? [];

  return `INTENT_LOCK: PHYSICAL_IMPLEMENTATION
CONVERSATION_LANE: PHYSICAL
DO_NOT_SWITCH_LANES: TRUE

REGLA CRÍTICA DE ESTA CONVERSACIÓN

Esta conversación trabaja EXCLUSIVAMENTE la instancia física ${physical.instanceId}.

- La tarea documental actual puede avanzar en otro checkout, pero NO pertenece a esta conversación.
- NO desarrolles la tarea documental actual desde este iniciador.
- NO cambies de instancia física por continuidad documental.
- Si el usuario solicita documentación, debe abrir otra conversación con ${DOCUMENTATION_OUTPUT_PATH}.

ACCIÓN FÍSICA ACTUAL

- Acción: ${control.primaryAction.type}
- Objetivo exacto: ${control.primaryAction.target} — ${control.primaryAction.title}
- Motivo: ${control.primaryAction.why}
- Estado actual: ${physical.status}
- Instancia: ${physical.instanceId}
- Archivo exclusivo: ${recordPath}
- Raíz local exacta del repositorio: ${repositoryRoot}

CONTRATO PROPIETARIO DE LA INSTANCIA

- ID de tarea: ${task.id}
- Título: ${task.title}
- Estado documental del contrato: ${taskState(task)}
- Repositorio propietario: ${metadata(task.block, 'Repositorio propietario')}
- Archivo propietario: docs/plan-canonico/modular/${task.relativePath}
- Ciclo: ${lifecycle.label} (${lifecycle.mode})
- Regla de ejecución: ${lifecycle.executionRule}
- Dependencias para ejecutar: ${dependencies.executionSource ?? lifecycle.executionDependencies}

OPERADOR Y LIFECYCLE FÍSICO

${actionResponseContract(control, sourceContractHash)}

REGISTRO ACTIVO EXACTO

Ruta: ${recordPath}

\`\`\`json
${activeRecordSource}
\`\`\`

ALCANCE FÍSICO DE LA INSTANCIA

Repositorios:
${list(physical.targetRepositories ?? [], 'Ninguno autorizado todavía.')}

Cambios:
${list(physical.authorizedChanges ?? [], 'Ninguno autorizado todavía.')}

Validaciones:
${list(physical.validationCommands ?? [], 'Deben definirse antes de autorizar implementación.')}

HISTORIAL FÍSICO RESUMIDO

- Registros existentes: ${recorded.length}
- VERIFIED: ${countByStatus(recorded, 'VERIFIED')}
- DEFERRED: ${countByStatus(recorded, 'DEFERRED')}
- Instancia activa: ${physical.instanceId} — ${physical.status}
- Política: registros anteriores VERIFIED son inmutables y no se reescriben.

CARRIL DOCUMENTAL — SOLO ESTADO INFORMATIVO

- Tarea actual: ${control.documentary.taskId} — ${control.documentary.taskTitle}
- Estado: ${control.documentary.state}
- Alcance dentro de esta conversación: FUERA DE ALCANCE. NO DESARROLLAR NI REFORMATEAR.

TRAZABILIDAD DEL INICIADOR

- Intención: PHYSICAL_IMPLEMENTATION
- Plantilla SHA-256: ${templateHash}
- Contrato propietario SHA-256: ${sourceContractHash}
- Fuente de control: docs/plan-canonico/modular/implementation-control.json
- Batería física: exclusivamente validation_commands de la instancia
- Apertura: docs:implementation:start
- Reparación previa: quality:repair una vez
- Cierre: docs:implementation:finish después de VERIFIED

${sourceContext(task, workTopology, false)}
`;
}

function readTemplate(repositoryRoot) {
  const templatePath = path.join(repositoryRoot, TEMPLATE_PATH);
  if (!fs.existsSync(templatePath)) throw new Error(`no existe ${TEMPLATE_PATH}.`);
  const template = fs.readFileSync(templatePath, 'utf8').replace(/\r\n?/gu, '\n');
  if (template.split(SLOT).length !== 2) {
    throw new Error(`${TEMPLATE_PATH} debe contener exactamente una ranura ${SLOT}.`);
  }
  return template;
}

function renderFromTemplate(template, currentWork) {
  return template.replace(SLOT, currentWork).replace(/\n*$/u, '\n');
}

export function buildChatgptWorkStarter({ root = process.cwd() } = {}) {
  const repositoryRoot = path.resolve(root);
  const template = readTemplate(repositoryRoot);
  const workTopology = resolveTaskWorkTopology({ root: repositoryRoot });
  const control = deriveImplementationControl({ root: repositoryRoot, workTopology });
  const templateHash = sha256(template);

  const selectorSource = renderSelector(control).replace(/\n*$/u, '\n');
  const documentationSource = renderFromTemplate(
    template,
    renderDocumentationWork({ control, workTopology, templateHash, repositoryRoot }),
  );
  const implementationSource = renderFromTemplate(
    template,
    renderImplementationWork({ control, workTopology, templateHash, repositoryRoot }),
  );

  return {
    control,
    outputPath: path.join(repositoryRoot, LEGACY_OUTPUT_PATH),
    source: selectorSource,
    documentationOutputPath: path.join(repositoryRoot, DOCUMENTATION_OUTPUT_PATH),
    documentationSource,
    implementationOutputPath: path.join(repositoryRoot, IMPLEMENTATION_OUTPUT_PATH),
    implementationSource,
    outputs: Object.freeze([
      { key: 'selector', relativePath: LEGACY_OUTPUT_PATH, source: selectorSource },
      { key: 'documentation', relativePath: DOCUMENTATION_OUTPUT_PATH, source: documentationSource },
      { key: 'implementation', relativePath: IMPLEMENTATION_OUTPUT_PATH, source: implementationSource },
    ]),
  };
}

export function writeChatgptWorkStarter({ root = process.cwd(), check = false } = {}) {
  const result = buildChatgptWorkStarter({ root });
  const changes = [];

  for (const output of result.outputs) {
    const outputPath = path.join(path.resolve(root), ...output.relativePath.split('/'));
    const current = fs.existsSync(outputPath) ? fs.readFileSync(outputPath, 'utf8') : '';
    const changed = current !== output.source;
    changes.push({ ...output, outputPath, changed });

    if (check && changed && fs.existsSync(outputPath)) {
      throw new Error(`${output.relativePath} está desactualizado; ejecute npm run docs:chatgpt:starter.`);
    }
    if (!check && changed) {
      fs.mkdirSync(path.dirname(outputPath), { recursive: true });
      fs.writeFileSync(outputPath, output.source, 'utf8');
    }
  }

  return {
    ...result,
    changed: changes.some((entry) => entry.changed),
    changes,
  };
}

function main() {
  const unknown = process.argv.slice(2).filter((argument) => argument !== '--check');
  if (unknown.length > 0) throw new Error(`argumentos desconocidos: ${unknown.join(', ')}.`);
  const result = writeChatgptWorkStarter({ check: process.argv.includes('--check') });
  console.log(`OK: iniciadores ChatGPT ${result.changed ? 'actualizados' : 'vigentes'}.`);
  console.log(`DOCUMENTATION: ${DOCUMENTATION_OUTPUT_PATH}`);
  console.log(`PHYSICAL_IMPLEMENTATION: ${IMPLEMENTATION_OUTPUT_PATH}`);
  console.log(`SELECTOR_LEGACY: ${LEGACY_OUTPUT_PATH}`);
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