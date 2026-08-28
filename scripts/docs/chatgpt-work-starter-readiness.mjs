import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import { scanPackageReadiness } from './package-readiness-scanner.mjs';
import { coordinateImplementationStatus } from './implementation-readiness-coordinator.mjs';
import { buildChatgptWorkStarter as buildBaseChatgptWorkStarter } from './chatgpt-work-starter.mjs';

const TEMPLATE_PATH = 'docs/plan-canonico/modular/chatgpt-work-starter-template.txt';
const SLOT = '{{CURRENT_WORK}}';

export const CHATGPT_STARTER_PATHS = Object.freeze({
  selector: 'INICIADOR_VENTO_ACTUAL.txt',
  documentation: '.delivery/INICIADOR_VENTO_DOCUMENTACION.txt',
  implementation: '.delivery/INICIADOR_VENTO_IMPLEMENTACION.txt',
});

function firstReady(registry) {
  return registry?.implementation_ready_queue?.[0] ?? null;
}

function queueLines(registry) {
  const queue = registry?.implementation_ready_queue ?? [];
  return queue.length > 0
    ? queue.map((entry) => `- ${entry.package_id} -> ${entry.next_execution}`).join('\n')
    : '- NONE';
}

export function stableReadinessStarterProjection(block) {
  return String(block ?? '')
    .replace(/^TRIGGER: .*$/mu, 'TRIGGER: STARTER_PROJECTION');
}

export function renderReadinessStarterBlock({ readiness, lane, coordinated = null }) {
  const candidate = firstReady(readiness.registry);
  const laneRule = lane === 'DOCUMENTATION'
    ? 'Si aparece un package IMPLEMENTATION_READY, registrarlo, avisarlo y conservar esta conversación en DOCUMENTATION. NO cambiar de carril.'
    : lane === 'PHYSICAL_IMPLEMENTATION'
      ? 'IMPLEMENTATION_READY solo crea un candidato para autorización. No equivale a AUTHORIZED y no permite tocar repositorios.'
      : 'Nunca declarar que no existe trabajo de implementación pendiente sin evaluar IMPLEMENTATION_READY_QUEUE.';
  const candidateBlock = candidate
    ? `\nPACKAGE IMPLEMENTABLE DETECTED\n- Package: ${candidate.package_id}\n- Gate: ${candidate.gate_id} = PASS\n- Blockers: 0\n- Next execution candidate: ${candidate.next_execution}\n- Physical authorization required: TRUE`
    : '';
  const coordinatedBlock = coordinated?.readinessCandidate
    ? `\nCOORDINATED PHYSICAL CANDIDATE\n- Status: READY_FOR_AUTHORIZATION\n- Instance: ${coordinated.readinessCandidate.instanceId}\n- Source: IMPLEMENTATION_READY_QUEUE\n- Authorization required: TRUE\n- No implementation instance is authorized by this projection.`
    : '';
  const readinessProjection = stableReadinessStarterProjection(readiness.block);
  return `PACKAGE READINESS SCANNER — OBLIGATORIO\n\nAntes de seleccionar la siguiente tarea y después del cierre de cada tarea, el estado debe haber pasado por PACKAGE READINESS SCAN.\nToda condición PASS exige evidencia trazable. Si la evidencia no puede demostrarse, el estado es UNKNOWN y readiness queda bloqueado.\nDELIV-PKG-001..025 y E5-GATE-008 son contratos globales reutilizables; no se reejecutan cronológicamente como tareas globales por cada package.\nIMPLEMENTATION_READY requiere: package_id, dossier DELIV-PKG completo, E5-GATE-008::<package_id> PASS, cero bloqueadores y dependencias físicas disponibles.\n${laneRule}\n\nIMPLEMENTATION_READY_QUEUE:\n${queueLines(readiness.registry)}${candidateBlock}${coordinatedBlock}\n\n${readinessProjection}`;
}

export function injectReadinessIntoSources({ baseResult, readiness, coordinated }) {
  const selectorBlock = renderReadinessStarterBlock({ readiness, lane: 'SELECTOR', coordinated });
  const documentationBlock = renderReadinessStarterBlock({ readiness, lane: 'DOCUMENTATION', coordinated });
  const implementationBlock = renderReadinessStarterBlock({ readiness, lane: 'PHYSICAL_IMPLEMENTATION', coordinated });
  const append = (source, block) => `${source.replace(/\n*$/u, '')}\n\n${block}\n`;
  const afterLaneLock = (source, block) => {
    const marker = 'DO_NOT_SWITCH_LANES: TRUE';
    const index = source.indexOf(marker);
    if (index < 0) return append(source, block);
    const insertion = index + marker.length;
    return `${source.slice(0, insertion)}\n\n${block}${source.slice(insertion)}`.replace(/\n*$/u, '\n');
  };
  const source = append(baseResult.source, selectorBlock);
  const documentationSource = afterLaneLock(baseResult.documentationSource, documentationBlock);
  const implementationSource = afterLaneLock(baseResult.implementationSource, implementationBlock);
  return {
    ...baseResult,
    source,
    documentationSource,
    implementationSource,
    readiness,
    coordinated,
    outputs: Object.freeze([
      { key: 'selector', relativePath: CHATGPT_STARTER_PATHS.selector, source },
      { key: 'documentation', relativePath: CHATGPT_STARTER_PATHS.documentation, source: documentationSource },
      { key: 'implementation', relativePath: CHATGPT_STARTER_PATHS.implementation, source: implementationSource },
    ]),
  };
}

function renderFromTemplate(template, currentWork, intent) {
  const documentationOnlyPattern = /<!-- DOCUMENTATION_ONLY:START -->([\s\S]*?)<!-- DOCUMENTATION_ONLY:END -->/u;
  const scopedTemplate = intent === 'DOCUMENTATION'
    ? template.replace(documentationOnlyPattern, '$1')
    : template.replace(documentationOnlyPattern, '');
  return scopedTemplate.replace(SLOT, currentWork).replace(/\n*$/u, '\n');
}

function terminalFallback({ root, readiness }) {
  const candidate = firstReady(readiness.registry);
  if (!candidate) throw new Error('No existe continuidad documental ni package listo para construir un iniciador terminal.');
  const template = fs.readFileSync(path.join(root, ...TEMPLATE_PATH.split('/')), 'utf8').replace(/\r\n?/gu, '\n');
  if (template.split(SLOT).length !== 2) throw new Error(`${TEMPLATE_PATH} debe contener exactamente una ranura ${SLOT}.`);
  const selector = `VENTO OS — SELECTOR DE INICIADOR POR INTENCIÓN\n\nDOCUMENTATION_QUEUE: EMPTY\nIMPLEMENTATION_READY_QUEUE: NON_EMPTY\nNEXT: ${candidate.next_execution}\nPHYSICAL_AUTHORIZATION_REQUIRED: TRUE\n`;
  const documentationCurrent = `INTENT_LOCK: DOCUMENTATION\nCONVERSATION_LANE: DOCUMENTARY\nDO_NOT_SWITCH_LANES: TRUE\n\nDOCUMENTATION_QUEUE = EMPTY\n\nNo inventes una tarea documental. El trabajo documental terminó para la continuidad visible.\nExiste ${candidate.package_id} en IMPLEMENTATION_READY_QUEUE. Regístralo y usa el iniciador físico para preparar su autorización; esta conversación no autoriza ni ejecuta el package.\n\n${renderReadinessStarterBlock({ readiness, lane: 'DOCUMENTATION' })}`;
  const implementationCurrent = `INTENT_LOCK: PHYSICAL_IMPLEMENTATION\nCONVERSATION_LANE: PHYSICAL\nDO_NOT_SWITCH_LANES: TRUE\n\nPACKAGE READY CANDIDATE\n- Package: ${candidate.package_id}\n- Instance candidate: ${candidate.next_execution}\n- Gate: ${candidate.gate_id} = PASS\n- Status: READY_FOR_AUTHORIZATION\n- PHYSICAL_AUTHORIZATION_REQUIRED: TRUE\n\nNo ejecutes docs:implementation:start ni crees AUTHORIZED hasta que el usuario apruebe el alcance físico exacto.\n\n${renderReadinessStarterBlock({ readiness, lane: 'PHYSICAL_IMPLEMENTATION' })}`;
  return {
    control: null,
    source: selector,
    documentationSource: renderFromTemplate(template, documentationCurrent, 'DOCUMENTATION'),
    implementationSource: renderFromTemplate(template, implementationCurrent, 'PHYSICAL_IMPLEMENTATION'),
  };
}

export function buildReadinessChatgptWorkStarter({
  root = process.cwd(),
  readinessResult = null,
  baseResult = null,
  baseControl = null,
} = {}) {
  const repositoryRoot = path.resolve(root);
  const readiness = readinessResult ?? scanPackageReadiness({
    root: repositoryRoot,
    check: true,
    trigger: 'chatgpt-starter',
  });

  let resolvedBase = baseResult;
  if (!resolvedBase) {
    try {
      resolvedBase = buildBaseChatgptWorkStarter({ root: repositoryRoot });
    } catch (error) {
      if (!firstReady(readiness.registry)) throw error;
      resolvedBase = terminalFallback({ root: repositoryRoot, readiness });
    }
  }

  const control = baseControl ?? resolvedBase.control ?? {
    primaryAction: { type: 'DOCUMENTAR_TAREA', target: 'NONE', title: 'Sin tarea documental', instruction: '', why: '' },
    physical: { active: null },
  };
  const coordinated = coordinateImplementationStatus({ baseControl: control, registry: readiness.registry });
  return injectReadinessIntoSources({ baseResult: resolvedBase, readiness, coordinated });
}

export function writeReadinessChatgptWorkStarter({ root = process.cwd(), check = false, readinessResult = null } = {}) {
  const repositoryRoot = path.resolve(root);
  const result = buildReadinessChatgptWorkStarter({ root: repositoryRoot, readinessResult });
  const changes = [];
  for (const output of result.outputs) {
    const outputPath = path.join(repositoryRoot, ...output.relativePath.split('/'));
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
  return { ...result, changed: changes.some((entry) => entry.changed), changes };
}

function main() {
  const unknown = process.argv.slice(2).filter((argument) => argument !== '--check');
  if (unknown.length > 0) throw new Error(`argumentos desconocidos: ${unknown.join(', ')}.`);
  const result = writeReadinessChatgptWorkStarter({ check: process.argv.includes('--check') });
  console.log(`OK: iniciadores ChatGPT + package readiness ${result.changed ? 'actualizados' : 'vigentes'}.`);
  console.log(`DOCUMENTATION: ${CHATGPT_STARTER_PATHS.documentation}`);
  console.log(`PHYSICAL_IMPLEMENTATION: ${CHATGPT_STARTER_PATHS.implementation}`);
  console.log(`SELECTOR_LEGACY: ${CHATGPT_STARTER_PATHS.selector}`);
}

const isCli = process.argv[1]
  && path.resolve(process.argv[1]) === path.resolve(fileURLToPath(import.meta.url));

if (isCli) {
  try {
    main();
  } catch (error) {
    console.error(`ERROR: ${error instanceof Error ? error.message : String(error)}`);
    process.exitCode = 1;
  }
}
