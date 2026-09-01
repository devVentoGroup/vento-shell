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
  const current = registry?.package_execution?.current ?? null;
  if (current?.next_action.type !== 'AUTHORIZE_PHYSICAL_IMPLEMENTATION') return null;
  return registry?.implementation_ready_queue?.find(
    ({ package_id: packageId }) => packageId === current.package_id,
  ) ?? null;
}

function queueLines(registry) {
  const execution = registry?.package_execution ?? null;
  const current = execution?.current ?? null;
  if (!current) return '- NONE';
  return `- ${current.position}/${execution.sequence.length}: ${current.package_id} -> ${current.next_action.type} -> ${current.next_action.target}`;
}

function packageGateLifecycleBlock(readiness) {
  const packages = readiness?.registry?.packages ?? [];
  const execution = readiness?.registry?.package_execution ?? null;
  const current = execution?.current ?? null;
  const focused = current
    ? packages.find(({ package_id: packageId }) => packageId === current.package_id) ?? null
    : null;
  const packageId = current?.package_id ?? 'NONE';
  const gate = focused?.package_gate ?? null;
  const file = gate?.relative_path ?? (packageId === 'NONE'
    ? 'NONE'
    : `docs/plan-canonico/modular/package-gate-instances/${packageId}.json`);
  const next = current?.next_action.command ?? 'NONE';
  return `PACKAGE GATE LIFECYCLE — VALIDACIÓN OBLIGATORIA

Cada package canónico usa un expediente autogenerado y versionado. No cree el JSON manualmente.
Los gates EVIDENCE_023, PHYSICAL_IDENTITY, IMPLEMENTATION_UNIT y FINAL_DECISION_025 solo pasan cuando el expediente está completo y contiene APROBADO humano explícito.
La aprobación del expediente habilita únicamente la candidatura SHELL-CI-020; no crea ni autoriza una instancia física.
La posición se deriva automáticamente de dependencias, capa y package_id. Un bloqueo conserva el turno.

- Modo: ${execution?.mode ?? 'NOT_EVALUATED'}
- Selección humana de package: FALSE
- Estado lineal: ${execution?.state ?? 'NOT_EVALUATED'}
- Package actual: ${packageId}
- Posición: ${current ? `${current.position}/${execution.sequence.length}` : 'NONE'}
- Acción exacta: ${current?.next_action.type ?? 'NONE'}
- Objetivo exacto: ${current?.next_action.target ?? 'NONE'}
- Expediente exacto: ${file}
- Estado del expediente: ${gate?.status ?? 'NOT_PREPARED'}
- Siguiente comando: ${next}

Comprobaciones obligatorias:
- npm run docs:package:gate:check
- npm run docs:package:execution:check
- npm run docs:plan:build
- npm run docs:plan:check
- npm run docs:plan:test

Nunca ejecute docs:package:gate:approve por inferencia. La aprobación del gate exige APROBADO explícito, dueño competente y evidencia trazable; el package actual no se elige manualmente.`;
}

export function stableReadinessStarterProjection(block) {
  return String(block ?? '')
    .replace(/^TRIGGER: .*$/mu, 'TRIGGER: STARTER_PROJECTION');
}

export function renderReadinessStarterBlock({ readiness, lane, coordinated = null }) {
  const candidate = firstReady(readiness.registry);
  const laneRule = lane === 'DOCUMENTATION'
    ? 'Conservar esta conversación en DOCUMENTATION. Informar el package actual y su acción exacta; NO cambiar de carril.'
    : lane === 'PHYSICAL_IMPLEMENTATION'
      ? 'Solo el package actual puede avanzar. IMPLEMENTATION_READY exige autorización humana y no equivale a AUTHORIZED.'
      : 'Nunca elegir entre packages: consumir el package actual derivado por PACKAGE_EXECUTION_LINEAR.';
  const candidateBlock = candidate
    ? `\nPACKAGE IMPLEMENTABLE DETECTED\n- Package: ${candidate.package_id}\n- Gate: ${candidate.gate_id} = PASS\n- Blockers: 0\n- Next execution: ${candidate.next_execution}\n- Physical authorization required: TRUE`
    : '';
  const coordinatedBlock = coordinated?.readinessCandidate
    ? `\nCOORDINATED PHYSICAL CANDIDATE\n- Status: READY_FOR_AUTHORIZATION\n- Instance: ${coordinated.readinessCandidate.instanceId}\n- Source: PACKAGE_EXECUTION_LINEAR\n- Authorization required: TRUE\n- No implementation instance is authorized by this projection.`
    : '';
  const readinessProjection = stableReadinessStarterProjection(readiness.block);
  return `PACKAGE READINESS SCANNER — OBLIGATORIO\n\nAntes de determinar la siguiente acción y después del cierre de cada tarea, el estado debe haber pasado por PACKAGE READINESS SCAN.\nToda condición PASS exige evidencia trazable. Si la evidencia no puede demostrarse, el estado es UNKNOWN y el package actual conserva el turno bloqueado.\nDELIV-PKG-001..025 y E5-GATE-008 son contratos globales reutilizables; no se reejecutan cronológicamente como tareas globales por cada package.\nIMPLEMENTATION_READY requiere: package_id, dossier DELIV-PKG completo, E5-GATE-008::<package_id> PASS, cero bloqueadores y dependencias físicas disponibles.\n${laneRule}\n\n${packageGateLifecycleBlock(readiness)}\n\nPACKAGE_EXECUTION_LINEAR — TURNO ÚNICO:\n${queueLines(readiness.registry)}${candidateBlock}${coordinatedBlock}\n\n${readinessProjection}`;
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
  const execution = readiness.registry?.package_execution ?? null;
  const current = execution?.current ?? null;
  const candidate = firstReady(readiness.registry);
  if (!current) throw new Error('No existe continuidad documental ni package actual para construir un iniciador terminal.');
  const template = fs.readFileSync(path.join(root, ...TEMPLATE_PATH.split('/')), 'utf8').replace(/\r\n?/gu, '\n');
  if (template.split(SLOT).length !== 2) throw new Error(`${TEMPLATE_PATH} debe contener exactamente una ranura ${SLOT}.`);
  const selector = `VENTO OS — SELECTOR DE INICIADOR POR INTENCIÓN\n\nDOCUMENTATION_QUEUE: EMPTY\nPACKAGE_EXECUTION_CURRENT: ${current.package_id}\nPACKAGE_EXECUTION_ACTION: ${current.next_action.type}\nNEXT: ${current.next_action.target}\nHUMAN_PACKAGE_SELECTION: FALSE\n`;
  const documentationCurrent = `INTENT_LOCK: DOCUMENTATION\nCONVERSATION_LANE: DOCUMENTARY\nDO_NOT_SWITCH_LANES: TRUE\n\nDOCUMENTATION_QUEUE = EMPTY\n\nNo inventes una tarea documental ni elijas otro package. ${current.package_id} conserva el turno y exige ${current.next_action.type} sobre ${current.next_action.target}.\n\n${renderReadinessStarterBlock({ readiness, lane: 'DOCUMENTATION' })}`;
  const implementationCurrent = `INTENT_LOCK: PHYSICAL_IMPLEMENTATION\nCONVERSATION_LANE: PHYSICAL\nDO_NOT_SWITCH_LANES: TRUE\n\nPACKAGE EXECUTION CURRENT\n- Package: ${current.package_id}\n- Position: ${current.position}/${execution.sequence.length}\n- Action: ${current.next_action.type}\n- Target: ${current.next_action.target}\n- Command: ${current.next_action.command}\n- Status: ${candidate ? 'READY_FOR_AUTHORIZATION' : 'BLOCKED_ON_CURRENT'}\n- PHYSICAL_AUTHORIZATION_REQUIRED: ${candidate ? 'TRUE' : 'NOT_YET_APPLICABLE'}\n\n${candidate ? 'No ejecutes docs:implementation:start ni crees AUTHORIZED hasta que el usuario apruebe el alcance físico exacto.' : 'No saltes a otro package. Resuelve la acción exacta del package actual antes de iniciar implementación física.'}\n\n${renderReadinessStarterBlock({ readiness, lane: 'PHYSICAL_IMPLEMENTATION' })}`;
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
      if (!readiness.registry?.package_execution?.current) throw error;
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
