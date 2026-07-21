import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';

const repoRoot = process.cwd();
const checkOnly = process.argv.includes('--check');
const baseDir = path.resolve(repoRoot, 'docs/plan-canonico/modular');
const manifestPath = path.join(baseDir, 'manifest.json');

if (!fs.existsSync(manifestPath)) {
  console.error(`ERROR: no existe ${path.relative(repoRoot, manifestPath)}.`);
  process.exit(1);
}

const manifest = JSON.parse(fs.readFileSync(manifestPath, 'utf8'));
if (!Array.isArray(manifest.files) || manifest.files.length === 0) {
  console.error('ERROR: manifest.json no contiene una lista válida de archivos.');
  process.exit(1);
}

const duplicatedPaths = manifest.files.filter((file, index, all) => all.indexOf(file) !== index);
if (duplicatedPaths.length > 0) {
  console.error(`ERROR: rutas duplicadas en manifest.json: ${[...new Set(duplicatedPaths)].join(', ')}`);
  process.exit(1);
}

let compiled = '';
for (const relativePath of manifest.files) {
  const fullPath = path.join(baseDir, relativePath);

  if (!fs.existsSync(fullPath) || !fs.statSync(fullPath).isFile()) {
    console.error(`ERROR: falta el fragmento ${relativePath}`);
    process.exit(1);
  }

  const fragment = fs.readFileSync(fullPath, 'utf8');

  if (!fragment.endsWith('\n')) {
    console.error(`ERROR: el fragmento ${relativePath} no termina en salto de línea.`);
    process.exit(1);
  }

  compiled += fragment;
}

const outputPath = path.resolve(repoRoot, manifest.compiled_output);
const sha256 = (content) => crypto.createHash('sha256').update(content).digest('hex');
const currentHash = sha256(Buffer.from(compiled, 'utf8'));

// Normaliza CRLF/CR únicamente para analizar el documento.
// El compilado original conserva exactamente los bytes de los fragmentos.
const validationText = compiled.replace(/\r\n?/g, '\n');

const taskRegex = /^###\s+(?:\[[ x~]\]\s+|[✅🟡❌]\s+)?([A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\d{3})\b.*$/gmu;
const allTaskMatches = [...validationText.matchAll(taskRegex)];
const allTaskIds = allTaskMatches.map((match) => match[1]);
const duplicatedTaskIds = allTaskIds.filter((task, index, all) => all.indexOf(task) !== index);

if (duplicatedTaskIds.length > 0) {
  console.error(`ERROR: tareas duplicadas: ${[...new Set(duplicatedTaskIds)].join(', ')}`);
  process.exit(1);
}

const authTaskIds = allTaskIds.filter((task) => task.startsWith('AUTH-'));

for (let i = 1; i <= 28; i += 1) {
  const id = `AUTH-RBAC-${String(i).padStart(3, '0')}`;
  const count = authTaskIds.filter((task) => task === id).length;

  if (count !== 1) {
    console.error(`ERROR: ${id} aparece ${count} veces; debe aparecer exactamente una.`);
    process.exit(1);
  }
}

const fenceCount = [...validationText.matchAll(/^\s*```/gm)].length;
if (fenceCount % 2 !== 0) {
  console.error(`ERROR: existe una cerca Markdown sin cerrar. Cercas encontradas: ${fenceCount}.`);
  process.exit(1);
}

const requiredMarkers = [
  '## BLOQUE E',
  '## BLOQUE E1',
  '## BLOQUE E2',
  '## BLOQUE E3',
  '## BLOQUE E4',
  '## BLOQUE E5',
  '## BLOQUE F',
];

let previousIndex = -1;
for (const marker of requiredMarkers) {
  const escapedMarker = marker.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
  const match = validationText.match(new RegExp(`^${escapedMarker}$`, 'm'));
  const index = match?.index ?? -1;

  if (index < 0) {
    console.error(`ERROR: no se encontró el marcador obligatorio ${marker}.`);
    process.exit(1);
  }

  if (index <= previousIndex) {
    console.error(`ERROR: el marcador ${marker} está fuera de orden.`);
    process.exit(1);
  }

  previousIndex = index;
}

const fragmentHeader = validationText.match(
  /^\|\s*Fragmentos canónicos\s*\|\s*\*\*(\d+)\*\*\s*\|$/m,
);

if (!fragmentHeader) {
  console.error('ERROR: no se pudo validar el número de fragmentos declarado en la cabecera.');
  process.exit(1);
}

if (Number(fragmentHeader[1]) !== manifest.files.length) {
  console.error(
    `ERROR: la cabecera declara ${fragmentHeader[1]} fragmentos, pero manifest.json contiene ${manifest.files.length}.`,
  );
  process.exit(1);
}

const authHeader = validationText.match(
  /^\|\s*Tareas `AUTH` únicas\s*\|\s*\*\*(\d+)\*\*\s*\|$/m,
);

if (!authHeader) {
  console.error('ERROR: no se pudo validar el número de tareas AUTH declarado en la cabecera.');
  process.exit(1);
}

if (Number(authHeader[1]) !== authTaskIds.length) {
  console.error(
    `ERROR: la cabecera declara ${authHeader[1]} tareas AUTH, pero el compilado contiene ${authTaskIds.length}.`,
  );
  process.exit(1);
}

// Validación editorial mínima para el bloque AUTH-CTX modular.
for (let index = 0; index < allTaskMatches.length; index += 1) {
  const match = allTaskMatches[index];
  const taskId = match[1];
  if (!taskId.startsWith('AUTH-CTX-')) continue;

  const heading = match[0];
  const start = match.index ?? 0;
  const end = allTaskMatches[index + 1]?.index ?? validationText.length;
  const section = validationText.slice(start, end);
  const state = section.match(/^\*\*Estado:\*\*\s*([^\n]+)|^Estado:\s*([^\n]+)/m);
  const normalizedState = (state?.[1] ?? state?.[2] ?? '').trim().replace(/\s{2,}/g, ' ');

  if (heading.includes('✅') && normalizedState !== 'APROBADA') {
    console.error(`ERROR: ${taskId} usa ✅ pero su estado es "${normalizedState || 'NO DECLARADO'}".`);
    process.exit(1);
  }

  if (heading.includes('🟡') && normalizedState === 'APROBADA') {
    console.error(`ERROR: ${taskId} usa 🟡 pero está declarada como APROBADA.`);
    process.exit(1);
  }

  const plainNumberedHeading = section.match(/^\d+\.\s+[^\n]+$/m);
  if (plainNumberedHeading) {
    console.error(
      `ERROR: ${taskId} contiene un apartado numerado sin encabezado Markdown: "${plainNumberedHeading[0]}".`,
    );
    process.exit(1);
  }
}

const malformedTokens = [
  'a partirde',
  'middlewares,caché',
  'responderinequívocamente',
  'funcionales ehíbridos',
  'permisoOPERATIONAL_ONLY',
  'BASE_AND_OPERATIONALautorice',
  'anivel global',
  'se clasificacomo',
  'actor yla modalidad',
  'laevidencia',
  'deAUTH-',
];

for (const token of malformedTokens) {
  if (validationText.includes(token)) {
    console.error(`ERROR: se detectó texto concatenado o mal formado: "${token}".`);
    process.exit(1);
  }
}

const headerLastApproved = validationText.match(
  /^\|\s*Última tarea aprobada\s*\|\s*\*\*(AUTH-[A-Z0-9-]+-\d{3})\b/m,
)?.[1];
const headerCurrentTask = validationText.match(
  /^\|\s*Tarea actual\s*\|\s*\*\*(AUTH-[A-Z0-9-]+-\d{3})\b/m,
)?.[1];
const headerNextTask = validationText.match(
  /^\|\s*Siguiente tarea\s*\|\s*\*\*(AUTH-[A-Z0-9-]+-\d{3})\b/m,
)?.[1];

for (const [label, taskId] of [
  ['Última tarea aprobada', headerLastApproved],
  ['Tarea actual', headerCurrentTask],
  ['Siguiente tarea', headerNextTask],
]) {
  if (!taskId || !authTaskIds.includes(taskId)) {
    console.error(`ERROR: ${label} no referencia una tarea AUTH existente en el compilado.`);
    process.exit(1);
  }
}

const approvedHeadingPattern = new RegExp(`^###\\s+✅\\s+${headerLastApproved}\\b`, 'm');
if (!approvedHeadingPattern.test(validationText)) {
  console.error(`ERROR: la cabecera declara ${headerLastApproved} como última aprobada, pero su encabezado no usa ✅.`);
  process.exit(1);
}

const currentHeadingPattern = new RegExp(`^###\\s+(?:\\[ \\]|🟡)\\s+${headerCurrentTask}\\b`, 'm');
if (!currentHeadingPattern.test(validationText)) {
  console.error(`ERROR: la tarea actual ${headerCurrentTask} no está marcada como no iniciada o propuesta.`);
  process.exit(1);
}

if (headerCurrentTask === headerNextTask || headerLastApproved === headerCurrentTask) {
  console.error('ERROR: la continuidad canónica repite la misma tarea en posiciones incompatibles.');
  process.exit(1);
}

if (checkOnly) {
  if (!fs.existsSync(outputPath)) {
    console.error('ERROR: todavía no existe el documento compilado. Ejecuta primero sin --check.');
    process.exit(1);
  }

  const existing = fs.readFileSync(outputPath, 'utf8');
  if (existing !== compiled) {
    console.error('ERROR: el compilado está desactualizado frente a los fragmentos.');
    process.exit(1);
  }

  console.log(
    `OK: compilado vigente; ${manifest.files.length} fragmentos; ${allTaskIds.length} tareas canónicas; ${authTaskIds.length} tareas AUTH únicas.`,
  );
  console.log(`SHA-256: ${currentHash}`);
  process.exit(0);
}

fs.mkdirSync(path.dirname(outputPath), { recursive: true });
fs.writeFileSync(outputPath, compiled, 'utf8');

console.log(`OK: ${path.relative(repoRoot, outputPath)}`);
console.log(`Fragmentos: ${manifest.files.length}`);
console.log(`Tareas canónicas: ${allTaskIds.length}`);
console.log(`Tareas AUTH únicas: ${authTaskIds.length}`);
console.log(`SHA-256: ${currentHash}`);
