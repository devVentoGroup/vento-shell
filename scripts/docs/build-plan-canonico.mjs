import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';

const root = process.cwd();
const checkOnly = process.argv.includes('--check');
const baseDir = path.resolve(root, 'docs/plan-canonico/modular');
const manifestPath = path.join(baseDir, 'manifest.json');
const fail = (message) => { console.error(`ERROR: ${message}`); process.exit(1); };

if (!fs.existsSync(manifestPath)) fail(`no existe ${path.relative(root, manifestPath)}.`);
const manifest = JSON.parse(fs.readFileSync(manifestPath, 'utf8'));
if (!Array.isArray(manifest.files) || manifest.files.length === 0) fail('manifest.json no contiene una lista válida de archivos.');

const duplicatePaths = manifest.files.filter((file, index, all) => all.indexOf(file) !== index);
if (duplicatePaths.length) fail(`rutas duplicadas en manifest.json: ${[...new Set(duplicatePaths)].join(', ')}`);

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
const taskRegex = /^###\s+(?:\[[ x~]\]\s+|[✅🟡❌]\s+)?([A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\d{3})\b.*$/gmu;
const taskMatches = [...text.matchAll(taskRegex)];
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

const authCount = text.match(/^\|\s*Tareas `AUTH` únicas\s*\|\s*\*\*(\d+)\*\*\s*\|$/m)?.[1];
if (!authCount) fail('no se pudo validar el número de tareas AUTH declarado en la cabecera.');
if (Number(authCount) !== authIds.length) fail(`la cabecera declara ${authCount} tareas AUTH, pero el compilado contiene ${authIds.length}.`);

for (let index = 0; index < taskMatches.length; index += 1) {
  const match = taskMatches[index];
  const taskId = match[1];
  if (!taskId.startsWith('AUTH-CTX-')) continue;
  const section = text.slice(match.index ?? 0, taskMatches[index + 1]?.index ?? text.length);
  const stateMatch = section.match(/^\*\*Estado:\*\*\s*([^\n]+)|^Estado:\s*([^\n]+)/m);
  const state = (stateMatch?.[1] ?? stateMatch?.[2] ?? '').trim().replace(/\s{2,}/g, ' ');
  if (match[0].includes('✅') && state !== 'APROBADA') fail(`${taskId} usa ✅ pero su estado es "${state || 'NO DECLARADO'}".`);
  if (match[0].includes('🟡') && state === 'APROBADA') fail(`${taskId} usa 🟡 pero está declarada como APROBADA.`);
  const plainHeading = section.match(/^\d+\.\s+(?:Objetivo|Base normativa|Forma contractual|Aplicabilidad|Estado final|Cierre y continuidad)\b[^\n]*$/m);
  if (plainHeading) fail(`${taskId} contiene un apartado numerado sin encabezado Markdown: "${plainHeading[0]}".`);
}

for (const token of ['a partirde', 'middlewares,caché', 'responderinequívocamente', 'funcionales ehíbridos', 'permisoOPERATIONAL_ONLY', 'BASE_AND_OPERATIONALautorice', 'anivel global', 'se clasificacomo', 'actor yla modalidad', 'laevidencia', 'deAUTH-']) {
  if (text.includes(token)) fail(`se detectó texto concatenado o mal formado: "${token}".`);
}

const lastApproved = text.match(/^\|\s*Última tarea aprobada\s*\|\s*\*\*(AUTH-[A-Z0-9-]+-\d{3})\b/m)?.[1];
const currentTask = text.match(/^\|\s*Tarea actual\s*\|\s*\*\*(AUTH-[A-Z0-9-]+-\d{3})\b/m)?.[1];
const nextTask = text.match(/^\|\s*Siguiente tarea\s*\|\s*\*\*(AUTH-[A-Z0-9-]+-\d{3})\b/m)?.[1];
for (const [label, id] of [['Última tarea aprobada', lastApproved], ['Tarea actual', currentTask], ['Siguiente tarea', nextTask]]) {
  if (!id || !authIds.includes(id)) fail(`${label} no referencia una tarea AUTH existente en el compilado.`);
}
if (!new RegExp(`^###\\s+✅\\s+${lastApproved}\\b`, 'm').test(text)) fail(`la cabecera declara ${lastApproved} como última aprobada, pero su encabezado no usa ✅.`);
if (!new RegExp(`^###\\s+(?:\\[ \\]|🟡)\\s+${currentTask}\\b`, 'm').test(text)) fail(`la tarea actual ${currentTask} no está marcada como no iniciada o propuesta.`);
if (currentTask === nextTask || lastApproved === currentTask) fail('la continuidad canónica repite la misma tarea en posiciones incompatibles.');

if (checkOnly) {
  if (!fs.existsSync(outputPath)) fail('todavía no existe el documento compilado. Ejecuta primero sin --check.');
  if (fs.readFileSync(outputPath, 'utf8') !== compiled) fail('el compilado está desactualizado frente a los fragmentos.');
  console.log(`OK: compilado vigente; ${manifest.files.length} fragmentos; ${taskIds.length} tareas canónicas; ${authIds.length} tareas AUTH únicas.`);
  console.log(`SHA-256: ${hash}`);
  process.exit(0);
}

fs.mkdirSync(path.dirname(outputPath), { recursive: true });
fs.writeFileSync(outputPath, compiled, 'utf8');
console.log(`OK: ${path.relative(root, outputPath)}`);
console.log(`Fragmentos: ${manifest.files.length}`);
console.log(`Tareas canónicas: ${taskIds.length}`);
console.log(`Tareas AUTH únicas: ${authIds.length}`);
console.log(`SHA-256: ${hash}`);
