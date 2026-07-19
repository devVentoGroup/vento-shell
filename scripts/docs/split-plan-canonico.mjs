import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';

const args = process.argv.slice(2);
const sourceArg = args.find((arg) => !arg.startsWith('--'));
const force = args.includes('--force');

if (!sourceArg) {
  console.error('Uso: node scripts/docs/split-plan-canonico.mjs <ruta-documento-canonico.md> [--force]');
  process.exit(1);
}

const repoRoot = process.cwd();
const sourcePath = path.resolve(repoRoot, sourceArg);
const baseDir = path.resolve(repoRoot, 'docs/plan-canonico/modular');
const backupDir = path.join(baseDir, 'respaldo');
const generatedDir = path.join(baseDir, '.generated');
const manifestPath = path.join(baseDir, 'manifest.json');
const compiledPath = path.join(generatedDir, 'PLAN_IMPLEMENTACION_VENTO_OS_CANONICO_COMPILADO.md');

if (!fs.existsSync(sourcePath) || !fs.statSync(sourcePath).isFile()) {
  console.error(`ERROR: no existe el documento fuente: ${sourcePath}`);
  process.exit(1);
}

const source = fs.readFileSync(sourcePath, 'utf8');
if (!source.includes('## BLOQUE A') || !source.includes('AUTH-RBAC-008')) {
  console.error('ERROR: el archivo no parece ser el documento canónico esperado.');
  process.exit(1);
}

function lineStartIndex(regex, label) {
  const match = source.match(regex);
  if (!match || match.index === undefined) {
    throw new Error(`No se encontró el marcador: ${label}`);
  }
  return match.index;
}

const markers = {
  protocol: lineStartIndex(/^## Protocolo obligatorio de continuidad\s*$/m, 'Protocolo obligatorio'),
  roadmap: lineStartIndex(/^## ROADMAP MAESTRO\s*$/m, 'ROADMAP MAESTRO'),
  A: lineStartIndex(/^## BLOQUE A\s*$/m, 'BLOQUE A'),
  B: lineStartIndex(/^## BLOQUE B\s*$/m, 'BLOQUE B'),
  C: lineStartIndex(/^## BLOQUE C\s*$/m, 'BLOQUE C'),
  D: lineStartIndex(/^## BLOQUE D\s*$/m, 'BLOQUE D'),
  E: lineStartIndex(/^## BLOQUE E\s*$/m, 'BLOQUE E'),
  E2: lineStartIndex(/^## BLOQUE E2\s*$/m, 'BLOQUE E2'),
  E3: lineStartIndex(/^## BLOQUE E3\s*$/m, 'BLOQUE E3'),
  F: lineStartIndex(/^## BLOQUE F\s*$/m, 'BLOQUE F'),
  G: lineStartIndex(/^## BLOQUE G\s*$/m, 'BLOQUE G'),
  H: lineStartIndex(/^## BLOQUE H\s*$/m, 'BLOQUE H'),
  H2: lineStartIndex(/^## BLOQUE H2\s*$/m, 'BLOQUE H2'),
  I: lineStartIndex(/^## BLOQUE I\s*$/m, 'BLOQUE I'),
  J: lineStartIndex(/^## BLOQUE J\s*$/m, 'BLOQUE J'),
  K: lineStartIndex(/^## BLOQUE K\s*$/m, 'BLOQUE K'),
  L: lineStartIndex(/^## BLOQUE L\s*$/m, 'BLOQUE L'),
  M: lineStartIndex(/^## BLOQUE M\s*$/m, 'BLOQUE M'),
  N: lineStartIndex(/^## BLOQUE N\s*$/m, 'BLOQUE N'),
  O: lineStartIndex(/^## BLOQUE O\s*$/m, 'BLOQUE O'),
  P: lineStartIndex(/^## BLOQUE P\s*$/m, 'BLOQUE P'),
  Q: lineStartIndex(/^## BLOQUE Q\s*$/m, 'BLOQUE Q'),
  R: lineStartIndex(/^## BLOQUE R\s*$/m, 'BLOQUE R'),
  S: lineStartIndex(/^## BLOQUE S\s*$/m, 'BLOQUE S'),
  T: lineStartIndex(/^## BLOQUE T\s*$/m, 'BLOQUE T'),
  U: lineStartIndex(/^## BLOQUE U\s*$/m, 'BLOQUE U'),
  V: lineStartIndex(/^## BLOQUE V\s*$/m, 'BLOQUE V'),
  W: lineStartIndex(/^## BLOQUE W\s*$/m, 'BLOQUE W'),
  X: lineStartIndex(/^## BLOQUE X\s*$/m, 'BLOQUE X'),
  order: lineStartIndex(/^## Orden de implementación recomendado\s*$/m, 'Orden de implementación'),
  initial: lineStartIndex(/^## Estado inicial conocido\s*$/m, 'Estado inicial conocido'),
};

function taskIndex(id) {
  return lineStartIndex(new RegExp(`^### .*${id.replaceAll('-', '\\-')}\\b.*$`, 'm'), id);
}

const t = {};
for (let i = 1; i <= 20; i += 1) t[`AUD${i}`] = taskIndex(`AUTH-AUD-${String(i).padStart(3, '0')}`);
for (let i = 1; i <= 20; i += 1) t[`MOD${i}`] = taskIndex(`AUTH-MOD-${String(i).padStart(3, '0')}`);
for (let i = 1; i <= 19; i += 1) t[`CAT${i}`] = taskIndex(`AUTH-CAT-${String(i).padStart(3, '0')}`);
for (let i = 1; i <= 28; i += 1) t[`RBAC${i}`] = taskIndex(`AUTH-RBAC-${String(i).padStart(3, '0')}`);

const segments = [
  ['00_CABECERA_Y_ESTADO.md', 0, markers.protocol],
  ['01_PROTOCOLO.md', markers.protocol, markers.roadmap],
  ['02_ROADMAP_MAESTRO.md', markers.roadmap, markers.A],

  ['bloques/A_AUDITORIA/00_INTRO.md', markers.A, t.AUD1],
  ['bloques/A_AUDITORIA/01_ROLES_APPS_Y_PERMISOS.md', t.AUD1, t.AUD5],
  ['bloques/A_AUDITORIA/02_MATRICES_Y_ASIGNACIONES.md', t.AUD5, t.AUD10],
  ['bloques/A_AUDITORIA/03_CONTEXTO_DISPOSITIVOS_Y_SEGURIDAD.md', t.AUD10, t.AUD15],
  ['bloques/A_AUDITORIA/04_BRECHAS_CODIGO_Y_RIESGOS.md', t.AUD15, markers.B],

  ['bloques/B_MODELO_AUTORIZACION/00_INTRO.md', markers.B, t.MOD1],
  ['bloques/B_MODELO_AUTORIZACION/01_IDENTIDAD_Y_ROLES.md', t.MOD1, t.MOD7],
  ['bloques/B_MODELO_AUTORIZACION/02_CONTEXTO_TERRITORIAL_Y_LABORAL.md', t.MOD7, t.MOD13],
  ['bloques/B_MODELO_AUTORIZACION/03_ALCANCES.md', t.MOD13, t.MOD18],
  ['bloques/B_MODELO_AUTORIZACION/04_PRECEDENCIA.md', t.MOD18, t.MOD19],
  ['bloques/B_MODELO_AUTORIZACION/05_DENEGACIONES.md', t.MOD19, t.MOD20],
  ['bloques/B_MODELO_AUTORIZACION/06_ADR_AUTH_001.md', t.MOD20, markers.C],

  ['bloques/C_CATALOGO/00_INTRO.md', markers.C, t.CAT1],
  ['bloques/C_CATALOGO/01_APLICACIONES_Y_CONVENCION.md', t.CAT1, t.CAT3],
  ['bloques/C_CATALOGO/02_NORMALIZACION_Y_DESCRIPCIONES.md', t.CAT3, t.CAT6],
  ['bloques/C_CATALOGO/03_MODALIDAD_Y_CLASIFICACIONES.md', t.CAT6, t.CAT11],
  ['bloques/C_CATALOGO/04_ALCANCE_DE_PERMISOS.md', t.CAT11, t.CAT12],
  ['bloques/C_CATALOGO/05_PRERREQUISITOS_Y_CONTEXTO.md', t.CAT12, t.CAT16],
  ['bloques/C_CATALOGO/06_CONTRATO_DE_RECURSO.md', t.CAT16, t.CAT17],
  ['bloques/C_CATALOGO/07_VERSIONADO_Y_CONSUMO.md', t.CAT17, markers.D],

  ['bloques/D_MATRICES/00_INTRO.md', markers.D, t.RBAC1],
  ['bloques/D_MATRICES/01_PROPIETARIO_Y_GERENCIAS.md', t.RBAC1, t.RBAC5],
  ['bloques/D_MATRICES/02_ROLES_FUNCIONALES.md', t.RBAC5, t.RBAC8],
  ['bloques/D_MATRICES/03_OPERATIVOS_CAJA_BARRA_COCINA.md', t.RBAC8, t.RBAC11],
  ['bloques/D_MATRICES/04_OPERATIVOS_SERVICIO_MOSTRADOR_INTEGRAL.md', t.RBAC11, t.RBAC14],
  ['bloques/D_MATRICES/05_OPERATIVOS_PRODUCCION.md', t.RBAC14, t.RBAC17],
  ['bloques/D_MATRICES/06_OPERATIVOS_LOGISTICA_Y_GERENCIA.md', t.RBAC17, t.RBAC20],
  ['bloques/D_MATRICES/07_EXCEPCIONES_Y_DISPOSITIVOS.md', t.RBAC20, t.RBAC24],
  ['bloques/D_MATRICES/08_DATASETS.md', t.RBAC24, t.RBAC27],
  ['bloques/D_MATRICES/09_VALIDACIONES.md', t.RBAC27, markers.E],

  ['bloques/E_CONTEXTO_Y_DECISION/00_BLOQUE_E.md', markers.E, markers.E2],
  ['bloques/E2_PROCESOS_Y_EXPERIENCIA/00_BLOQUE_E2.md', markers.E2, markers.E3],
  ['bloques/E3_SUPABASE/00_BLOQUE_E3.md', markers.E3, markers.F],
  ['bloques/F_IMPLEMENTACION/00_BLOQUE_F.md', markers.F, markers.G],
  ['bloques/G_IDENTIDAD_Y_DATOS_LABORALES/00_BLOQUE_G.md', markers.G, markers.H],
  ['bloques/H_FUNDACION_COMPARTIDA/00_BLOQUE_H.md', markers.H, markers.H2],
  ['bloques/H2_GOBIERNO_DE_PERMISOS/00_BLOQUE_H2.md', markers.H2, markers.I],
  ['bloques/I_RLS_Y_RPC/00_BLOQUE_I.md', markers.I, markers.J],
  ['bloques/J_ACCIONES_DE_SERVIDOR/00_BLOQUE_J.md', markers.J, markers.K],
  ['bloques/K_SHELL/00_BLOQUE_K.md', markers.K, markers.L],
  ['bloques/L_VISO/00_BLOQUE_L.md', markers.L, markers.M],
  ['bloques/M_ANIMA/00_BLOQUE_M.md', markers.M, markers.N],
  ['bloques/N_NEXO/00_BLOQUE_N.md', markers.N, markers.O],
  ['bloques/O_FOGO/00_BLOQUE_O.md', markers.O, markers.P],
  ['bloques/P_ORIGO/00_BLOQUE_P.md', markers.P, markers.Q],
  ['bloques/Q_PULSO/00_BLOQUE_Q.md', markers.Q, markers.R],
  ['bloques/R_SUPABASE/00_BLOQUE_R.md', markers.R, markers.S],
  ['bloques/S_NUMERA/00_BLOQUE_S.md', markers.S, markers.T],
  ['bloques/T_CALIDAD_Y_DESPLIEGUE/00_BLOQUE_T.md', markers.T, markers.U],
  ['bloques/U_PASS/00_BLOQUE_U.md', markers.U, markers.V],
  ['bloques/V_AURA/00_BLOQUE_V.md', markers.V, markers.W],
  ['bloques/W_CIERRE/00_BLOQUE_W.md', markers.W, markers.X],
  ['bloques/X_INTEGRACIONES/00_BLOQUE_X.md', markers.X, markers.order],

  ['90_ORDEN_DE_IMPLEMENTACION.md', markers.order, markers.initial],
  ['99_ESTADO_INICIAL_CONOCIDO.md', markers.initial, source.length],
];

for (let i = 0; i < segments.length; i += 1) {
  const [file, start, end] = segments[i];
  if (!(Number.isInteger(start) && Number.isInteger(end) && start < end)) {
    throw new Error(`Segmento inválido: ${file}`);
  }
  if (i > 0 && start !== segments[i - 1][2]) {
    throw new Error(`Hueco o superposición antes de ${file}`);
  }
}
if (segments.at(-1)[2] !== source.length) throw new Error('La segmentación no alcanza el final del documento.');

fs.mkdirSync(baseDir, { recursive: true });
fs.mkdirSync(backupDir, { recursive: true });
fs.mkdirSync(generatedDir, { recursive: true });

const backupPath = path.join(backupDir, 'PLAN_IMPLEMENTACION_VENTO_OS_CANONICO_ORIGINAL.md');
if (fs.existsSync(backupPath) && !force) {
  console.error(`ERROR: ya existe el respaldo ${backupPath}. Usa --force solo si verificaste que deseas reemplazarlo.`);
  process.exit(1);
}
fs.copyFileSync(sourcePath, backupPath);

const files = [];
for (const [relativePath, start, end] of segments) {
  const target = path.join(baseDir, relativePath);
  fs.mkdirSync(path.dirname(target), { recursive: true });
  fs.writeFileSync(target, source.slice(start, end), 'utf8');
  files.push(relativePath.replaceAll('\\', '/'));
}

const sha256 = (content) => crypto.createHash('sha256').update(content).digest('hex');
const manifest = {
  schema_version: 1,
  canonical_source_model: 'modular',
  generated_at: new Date().toISOString(),
  original_source: path.relative(repoRoot, sourcePath).replaceAll('\\', '/'),
  backup_source: path.relative(repoRoot, backupPath).replaceAll('\\', '/'),
  original_sha256: sha256(Buffer.from(source, 'utf8')),
  compiled_output: path.relative(repoRoot, compiledPath).replaceAll('\\', '/'),
  files,
};
fs.writeFileSync(manifestPath, `${JSON.stringify(manifest, null, 2)}\n`, 'utf8');

const compiled = files.map((file) => fs.readFileSync(path.join(baseDir, file), 'utf8')).join('');
fs.writeFileSync(compiledPath, compiled, 'utf8');

if (Buffer.compare(Buffer.from(source, 'utf8'), Buffer.from(compiled, 'utf8')) !== 0) {
  console.error('ERROR: el documento recompilado no coincide exactamente con el original.');
  process.exit(1);
}

console.log('OK: migración documental creada sin modificar el archivo fuente.');
console.log(`Fuente: ${path.relative(repoRoot, sourcePath)}`);
console.log(`Respaldo: ${path.relative(repoRoot, backupPath)}`);
console.log(`Fragmentos: ${files.length}`);
console.log(`SHA-256: ${manifest.original_sha256}`);
console.log(`Compilado: ${path.relative(repoRoot, compiledPath)}`);
console.log('VALIDACIÓN: original y compilado son idénticos byte por byte.');
