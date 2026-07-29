import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import { syncPlanContinuity } from './plan-continuity-final-newline.mjs';
import { validateCanonicalTreqRegistry } from './validate-treq-registry.mjs';
import { validateScreenCatalog } from './validate-screen-catalog.mjs';
import { validateProcessApplicationIntegrity } from './validate-process-application-integrity.mjs';
import { validateScreenProcessBindings } from './validate-screen-process-bindings.mjs';
import {
  validateScreenClassifications,
  validateScreenStepBindings,
} from './validate-screen-contract-matrices.mjs';
import { validateBlockISurfaceMatrices } from './validate-block-i-surface-matrices.mjs';
import { validatePriorityDeliveryLanes } from './validate-priority-delivery-lanes.mjs';

const root = process.cwd();
const checkOnly = process.argv.includes('--check');
const baseDir = path.resolve(root, 'docs/plan-canonico/modular');
const manifestPath = path.join(baseDir, 'manifest.json');
const fail = (message) => { console.error(`ERROR: ${message}`); process.exit(1); };

function maskFencedCode(source) {
  let insideFence = false;
  return source.split('\n').map((line) => {
    if (/^\s*```/.test(line)) {
      insideFence = !insideFence;
      return '';
    }
    return insideFence ? '' : line;
  }).join('\n');
}

function listMarkdownFiles(directory) {
  const files = [];
  for (const entry of fs.readdirSync(directory, { withFileTypes: true })) {
    const fullPath = path.join(directory, entry.name);
    if (entry.isDirectory()) {
      files.push(...listMarkdownFiles(fullPath));
    } else if (entry.isFile() && entry.name.endsWith('.md') && entry.name !== 'README.md') {
      files.push(fullPath);
    }
  }
  return files;
}

function findUnregisteredBlockFragments(manifestFiles, auxiliaryFiles = []) {
  const blocksDir = path.join(baseDir, 'bloques');
  if (!fs.existsSync(blocksDir)) return [];

  const registered = new Set(
    [...manifestFiles, ...auxiliaryFiles]
      .filter((relativePath) => relativePath.startsWith('bloques/'))
      .map((relativePath) => relativePath.replaceAll('\\', '/')),
  );

  return listMarkdownFiles(blocksDir)
    .map((fullPath) => path.relative(baseDir, fullPath).replaceAll('\\', '/'))
    .filter((relativePath) => !registered.has(relativePath))
    .sort();
}

try {
  syncPlanContinuity({ root, checkOnly });
} catch (error) {
  fail(error instanceof Error ? error.message : String(error));
}

if (!fs.existsSync(manifestPath)) fail(`no existe ${path.relative(root, manifestPath)}.`);
const manifest = JSON.parse(fs.readFileSync(manifestPath, 'utf8'));
if (!Array.isArray(manifest.files) || manifest.files.length === 0) fail('manifest.json no contiene una lista válida de archivos.');
if (manifest.auxiliary_files !== undefined && !Array.isArray(manifest.auxiliary_files)) {
  fail('manifest.json contiene auxiliary_files con formato inválido.');
}

const duplicatePaths = manifest.files.filter((file, index, all) => all.indexOf(file) !== index);
if (duplicatePaths.length) fail(`rutas duplicadas en manifest.json: ${[...new Set(duplicatePaths)].join(', ')}`);

const unregisteredFragments = findUnregisteredBlockFragments(
  manifest.files,
  manifest.auxiliary_files ?? [],
);
if (unregisteredFragments.length) {
  fail(`fragmentos Markdown fuera de manifest.json: ${unregisteredFragments.join(', ')}`);
}

try {
  const treqStats = validateCanonicalTreqRegistry({ root });
  console.log(
    `OK: registro TREQ; ${treqStats.requirements} requisitos; ${treqStats.domains} dominios; `
    + `última tarea ${treqStats.latestTask}.`
  );
} catch (error) {
  fail(error instanceof Error ? error.message : String(error));
}

try {
  const screenStats = validateScreenCatalog({ root });
  console.log(
    `OK: catálogo de pantallas; ${screenStats.screens} pantallas; `
    + `${screenStats.activeApplications} aplicaciones habilitadas; `
    + `${screenStats.processes} procesos cubiertos; última ${screenStats.lastScreenId}.`
  );
} catch (error) {
  fail(error instanceof Error ? error.message : String(error));
}

try {
  const processAppStats = validateProcessApplicationIntegrity({ root });
  console.log(
    `OK: integridad proceso-aplicación; ${processAppStats.processes} procesos; `
    + `${processAppStats.applications} aplicaciones canónicas; `
    + `${processAppStats.directRelationships} consumos directos; `
    + `${processAppStats.conditionalRelationships} condicionales.`
  );
} catch (error) {
  fail(error instanceof Error ? error.message : String(error));
}

try {
  const screenProcessStats = validateScreenProcessBindings({ root });
  console.log(
    `OK: vínculos pantalla-proceso; ${screenProcessStats.screens} pantallas; `
    + `${screenProcessStats.primaryBindings} primarios; `
    + `${screenProcessStats.relatedBindings} relacionados; `
    + `${screenProcessStats.coveredProcesses} procesos activos; `
    + `${screenProcessStats.deferredProcesses} diferidos.`
  );
} catch (error) {
  fail(error instanceof Error ? error.message : String(error));
}

try {
  const stepStats = validateScreenStepBindings({ root });
  const classificationStats = validateScreenClassifications({ root });
  console.log(
    `OK: matrices de pantalla; ${stepStats.screens} pasos; ${stepStats.anchors} anclas; `
    + `${classificationStats.matrices} clasificaciones de ${classificationStats.screens} pantallas.`
  );
} catch (error) {
  fail(`Matrices de pantalla inválidas:\n- ${error instanceof Error ? error.message : String(error)}`);
}

try {
  const blockIStats = validateBlockISurfaceMatrices({ root });
  console.log(
    `OK: BLOQUE I; ${blockIStats.rows} filas AS-IS; ${blockIStats.renderedViews} vistas renderizadas; `
    + `${blockIStats.aliases} aliases; ${blockIStats.redirects} redirects; `
    + `${blockIStats.passSurfaces} superficies PASS.`
  );
} catch (error) {
  fail(`Matrices BLOQUE I inválidas:\n- ${error instanceof Error ? error.message : String(error)}`);
}

try {
  const laneStats = validatePriorityDeliveryLanes({ root });
  console.log(
    `OK: carriles prioritarios; ${laneStats.lanes} registrado(s); `
    + `${laneStats.designated} designado(s) no listo(s); `
    + `${laneStats.referencedTasks} tareas referenciadas.`
  );
} catch (error) {
  fail(`Carriles prioritarios inválidos:\n- ${error instanceof Error ? error.message : String(error)}`);
}

let compiled = '';
for (const relativePath of manifest.files) {
  const fullPath = path.join(baseDir, relativePath);
  if (!fs.existsSync(fullPath) || !fs.statSync(fullPath).isFile()) fail(`falta el fragmento ${relativePath}`);
  const fragment = fs.readFileSync(fullPath, 'utf8');
  if (!fragment.endsWith('\n')) fail(`el fragmento ${relativePath} no termina en salto de línea.`);
  compiled += fragment;
}

const outputPath = path.resolve(root, manifest.compiled_output);
const hash = crypto.createHash('sha256').update(compiled).digest('hex');
const text = compiled.replace(/\r\n?/g, '\n');
const taskRegex = /^###\s+(?:\[[ x~]\]\s+|[✅🟡❌]\s+)([A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\d{3})\b.*$/gmu;
const taskSource = maskFencedCode(text);
const taskMatches = [...taskSource.matchAll(taskRegex)];
const taskIds = taskMatches.map((match) => match[1]);
const authIds = taskIds.filter((id) => id.startsWith('AUTH-'));
const duplicateTasks = taskIds.filter((id, index, all) => all.indexOf(id) !== index);
if (duplicateTasks.length) fail(`tareas duplicadas: ${[...new Set(duplicateTasks)].join(', ')}`);

for (let i = 1; i <= 28; i += 1) {
  const id = `AUTH-RBAC-${String(i).padStart(3, '0')}`;
  const count = authIds.filter((task) => task === id).length;
  if (count !== 1) fail(`${id} aparece ${count} veces; debe aparecer exactamente una.`);
}

const fenceCount = [...text.matchAll(/^\s*```/gm)].length;
if (fenceCount % 2 !== 0) fail(`existe una cerca Markdown sin cerrar. Cercas encontradas: ${fenceCount}.`);

const requiredMarkers = ['## BLOQUE E', '## BLOQUE E1', '## BLOQUE E2', '## BLOQUE E3', '## BLOQUE E4', '## BLOQUE E5', '## BLOQUE F'];
let previousIndex = -1;
for (const marker of requiredMarkers) {
  const escaped = marker.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
  const index = text.match(new RegExp(`^${escaped}$`, 'm'))?.index ?? -1;
  if (index < 0) fail(`no se encontró el marcador obligatorio ${marker}.`);
  if (index <= previousIndex) fail(`el marcador ${marker} está fuera de orden.`);
  previousIndex = index;
}

const fragmentCount = text.match(/^\|\s*Fragmentos canónicos\s*\|\s*\*\*(\d+)\*\*\s*\|$/m)?.[1];
if (!fragmentCount) fail('no se pudo validar el número de fragmentos declarado en la cabecera.');
if (Number(fragmentCount) !== manifest.files.length) fail(`la cabecera declara ${fragmentCount} fragmentos, pero manifest.json contiene ${manifest.files.length}.`);

const taskCount = text.match(/^\|\s*Tareas canónicas con marcador\s*\|\s*\*\*(\d+)\*\*\s*\|$/m)?.[1];
if (!taskCount) fail('no se pudo validar el número total de tareas declarado en la cabecera.');
if (Number(taskCount) !== taskIds.length) fail(`la cabecera declara ${taskCount} tareas, pero el compilado contiene ${taskIds.length} marcadores reales fuera de bloques de código.`);

const authCount = text.match(/^\|\s*Tareas `AUTH` únicas\s*\|\s*\*\*(\d+)\*\*\s*\|$/m)?.[1];
if (!authCount) fail('no se pudo validar el número de tareas AUTH declarado en la cabecera.');
if (Number(authCount) !== authIds.length) fail(`la cabecera declara ${authCount} tareas AUTH, pero el compilado contiene ${authIds.length}.`);

for (const token of ['a partirde', 'middlewares,caché', 'responderinequívocamente', 'funcionales ehíbridos', 'permisoOPERATIONAL_ONLY', 'BASE_AND_OPERATIONALautorice', 'anivel global', 'se clasificacomo', 'actor yla modalidad', 'laevidencia', 'deAUTH-']) {
  if (text.includes(token)) fail(`se detectó texto concatenado o mal formado: "${token}".`);
}

if (checkOnly) {
  if (!fs.existsSync(outputPath)) fail('todavía no existe el documento compilado. Ejecuta primero sin --check.');
  if (fs.readFileSync(outputPath, 'utf8') !== compiled) fail('el compilado está desactualizado frente a los fragmentos.');
  console.log(`OK: compilado vigente; ${manifest.files.length} fragmentos; ${taskIds.length} tareas canónicas reales; ${authIds.length} tareas AUTH únicas.`);
  console.log(`SHA-256: ${hash}`);
  process.exit(0);
}

fs.mkdirSync(path.dirname(outputPath), { recursive: true });
fs.writeFileSync(outputPath, compiled, 'utf8');
console.log(`OK: ${path.relative(root, outputPath)}`);
console.log(`Fragmentos: ${manifest.files.length}`);
console.log(`Tareas canónicas reales: ${taskIds.length}`);
console.log(`Tareas AUTH únicas: ${authIds.length}`);
console.log(`SHA-256: ${hash}`);
