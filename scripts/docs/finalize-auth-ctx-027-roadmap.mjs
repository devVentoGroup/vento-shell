import fs from 'node:fs';
import path from 'node:path';
import { spawnSync } from 'node:child_process';

const ROOT = process.cwd();
const BASE = path.join(ROOT, 'docs/plan-canonico/modular');
const APPLY = process.argv.includes('--apply');
const p = (value) => path.join(ROOT, value);

const files = {
  manifest: p('docs/plan-canonico/modular/manifest.json'),
  header: p('docs/plan-canonico/modular/00_CABECERA_Y_ESTADO.md'),
  auth: p('docs/plan-canonico/modular/bloques/E_CONTEXTO_Y_DECISION/05_IMPLEMENTACION_Y_TRANSICION.md'),
  h: p('docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md'),
  r0: p('docs/plan-canonico/modular/bloques/R_SUPABASE/01_R0_PREPARACION_PRUEBAS_Y_CONTENCION_DE_RIESGOS.md'),
  r1: p('docs/plan-canonico/modular/bloques/R_SUPABASE/02_R1_FUNDACION_FISICA_CANONICA.md'),
  r2: p('docs/plan-canonico/modular/bloques/R_SUPABASE/03_R2_MIGRACION_PROGRESIVA_POR_DOMINIO.md'),
  order: p('docs/plan-canonico/modular/90_ORDEN_DE_IMPLEMENTACION.md'),
  finalNewline: p('scripts/docs/plan-continuity-final-newline.mjs'),
  build: p('scripts/docs/build-plan-canonico.mjs'),
};

const obsolete = [
  'scripts/docs/apply-auth-db-032-034-roadmap.mjs',
  'scripts/docs/apply-auth-db-032-034-roadmap-v2.mjs',
  'scripts/docs/repair-auth-ctx-027-block-h.mjs',
  'scripts/docs/plan-continuity-preserve-format.mjs',
].map(p);

const fail = (message) => { throw new Error(message); };
const exists = (file) => fs.existsSync(file) && fs.statSync(file).isFile();
const read = (file) => { if (!exists(file)) fail(`No existe ${path.relative(ROOT, file)}.`); return fs.readFileSync(file, 'utf8'); };
const norm = (text) => text.replace(/\r\n?/g, '\n');
const eol = (text) => text.includes('\r\n') ? '\r\n' : '\n';
const finish = (text, lineEnd = '\n') => {
  const value = `${norm(text).replace(/\n+$/u, '')}\n`;
  return lineEnd === '\n' ? value : value.replace(/\n/g, '\r\n');
};

function replaceOnce(text, from, to, label) {
  const count = text.split(from).length - 1;
  if (count !== 1) fail(`${label}: se esperó 1 aparición y se encontraron ${count}.`);
  return text.replace(from, to);
}

function section(text, start, end, replacement, label) {
  const a = text.indexOf(start);
  const b = text.indexOf(end, a + start.length);
  if (a < 0 || b <= a) fail(`${label}: no se encontró ${start} → ${end}.`);
  return `${text.slice(0, a)}${replacement.trimEnd()}\n\n${text.slice(b)}`;
}

const AUTH94 = `#### 94. Refinamiento contractual de tareas SHELL-AUTH y SHELL-CTX existentes

Se refinan contractualmente tareas no iniciadas que ya existían en BLOQUE H.
No se reutiliza ningún identificador y no se crean paquetes paralelos.

\`\`\`text
SHELL-AUTH-001..005
→ SDK, adapters, scope, gates y migración multi-repositorio

SHELL-CTX-001..005
→ módulo contextual, turno, check-in, territorio, readiness y razones seguras
\`\`\`

Todas permanecen dentro de \`@vento/os-context\`. Las responsabilidades
anteriores compatibles quedan absorbidas sin cambiar tareas aprobadas o ejecutadas.
`;

const AUTH101 = `#### 101. Dependencias físicas

\`\`\`text
SHELL-AUD-002 a SHELL-AUD-005
        ↓
SHELL-PKG-001 a SHELL-PKG-008
        ↓
SHELL-CON-001 a SHELL-CON-008
        ↓
SHELL-AUTH-001 + SHELL-CTX-001
        ↓
AUTH-DB-033 → AUTH-DB-034 → AUTH-DB-032
        ↓
SHELL-CTX-002 a SHELL-CTX-005
        ↓
SHELL-AUTH-002 → SHELL-AUTH-003 → SHELL-AUTH-004
        ↓
AUTH-DB-020
        ↓
AUTH-DB-006 a AUTH-DB-010 + AUTH-DB-021
        ↓
SHELL-AUTH-005
        ↓
AUTH-DB-030 → AUTH-DB-031
\`\`\`

\`AUTH-DB-027\` acompaña cada paquete físico y \`AUTH-DB-029\` conserva la
puerta de rollback antes de cada adopción por dominio.
`;

const AUTH104 = `#### 104. Responsabilidades sin pendiente narrativo

| Brecha | Responsable |
| --- | --- |
| SDK incompatible | \`SHELL-AUTH-001\` |
| Contexto fragmentado | \`SHELL-CTX-001\` a \`SHELL-CTX-005\` |
| Adapters y proyecciones | \`SHELL-AUTH-002\` |
| Resolución duplicada | \`SHELL-AUTH-003\` |
| Nuevos usos legacy | \`SHELL-AUTH-004\` |
| Migración multi-repo | \`SHELL-AUTH-005\` |
| Resolver, evaluador y persistencia | \`AUTH-DB-033\`, \`AUTH-DB-034\`, \`AUTH-DB-032\` |
| Migración de objetos, RPC y RLS | \`AUTH-DB-020\`, \`AUTH-DB-006\` a \`AUTH-DB-010\`, \`AUTH-DB-021\` |
| Guards y pantallas | \`AUTH-UI-040\` a \`AUTH-UI-051\` |
| Retiro y certificación | \`AUTH-DB-030\`, \`AUTH-DB-031\` |
`;

const ORDER_START = '<!-- SHELL-AUTH-CANONICAL:START -->';
const ORDER_END = '<!-- SHELL-AUTH-CANONICAL:END -->';
const ORDER = `${ORDER_START}
### Secuencia canónica de autorización compartida

\`\`\`text
FUNDACIÓN COMPARTIDA
SHELL-AUD-002..005
→ SHELL-PKG-001..008
→ SHELL-CON-001..008
→ SHELL-AUTH-001 + SHELL-CTX-001

PREPARACIÓN Y NÚCLEO FÍSICO
AUTH-DB-015 + AUTH-DB-027..029 + AUTH-DB-001..005
→ AUTH-DB-019
→ AUTH-DB-033
→ AUTH-DB-034
→ AUTH-DB-032

CONVERGENCIA Y ADOPCIÓN
SHELL-CTX-002..005
→ SHELL-AUTH-002
→ SHELL-AUTH-003
→ SHELL-AUTH-004
→ AUTH-DB-020
→ AUTH-DB-006..010 + AUTH-DB-021
→ SHELL-AUTH-005
→ AUTH-DB-030
→ AUTH-DB-031
\`\`\`

\`AUTH-DB-027\` acompaña cada paquete físico. La migración multi-repositorio
no puede completarse antes de resolver contexto, evaluar, persistir, adaptar
RPC y RLS, demostrar rollback y bloquear nuevos consumos legacy.
${ORDER_END}`;

function updateAuth(text) {
  let value = norm(text);
  if (!value.includes('### ✅ AUTH-CTX-027')) fail('AUTH-CTX-027 no está aprobada.');
  value = value.replace(
    /^\| \*\*Tareas existentes refinadas\*\*.*$/m,
    '| **Tareas de autorización refinadas** | `SHELL-AUTH-001` a `SHELL-AUTH-005`; se conservan sin reutilizar IDs |\n| **Tareas contextuales refinadas** | `SHELL-CTX-001` a `SHELL-CTX-005`; se consolidan dentro de `@vento/os-context` |',
  );
  value = section(value, '#### 94.', '#### 95.', AUTH94, 'sección 94');
  value = section(value, '#### 101.', '#### 102.', AUTH101, 'sección 101');
  value = section(value, '#### 104.', '#### 105.', AUTH104, 'sección 104');
  value = replaceOnce(value, '121. las tareas se materializan en BLOQUE H;', '121. SHELL-AUTH-001..005 y SHELL-CTX-001..005 se materializan en BLOQUE H;', 'criterio 121');
  value = replaceOnce(value, '127. las tareas existentes conservan sus responsabilidades;', '127. SHELL-CTX-001..005 se refinan sin reutilizar IDs y conservan responsabilidades contextuales;', 'criterio 127');
  return finish(value, eol(text));
}

function updateHeader(text) {
  let value = norm(text);
  const links = [
    ['E1_DESCUBRIMIENTO_OPERATIVO/00_BLOQUE_E1.md', 'E1_DESCUBRIMIENTO_OPERATIVO/00_INTRO.md'],
    ['E3_SUPABASE/00_BLOQUE_E3.md', 'E3_SUPABASE/00_INTRO.md'],
    ['E4_SERVICIOS_TRANSVERSALES/00_BLOQUE_E4.md', 'E4_SERVICIOS_TRANSVERSALES/00_INTRO.md'],
    ['E5_PLANIFICACION_DE_IMPLEMENTACION/00_BLOQUE_E5.md', 'E5_PLANIFICACION_DE_IMPLEMENTACION/00_INTRO.md'],
  ];
  for (const [from, to] of links) value = value.replaceAll(from, to);
  return finish(value, eol(text));
}

function updateOrder(text) {
  const value = norm(text);
  const a = value.indexOf(ORDER_START);
  const b = value.indexOf(ORDER_END);
  if (a < 0 || b <= a) fail('No se encontró el bloque SHELL-AUTH-CANONICAL.');
  return finish(`${value.slice(0, a)}${ORDER}${value.slice(b + ORDER_END.length)}`, eol(text));
}

function updateContinuityWrapper(text) {
  let value = norm(text);
  value = replaceOnce(value, "import { syncPlanContinuity as syncPreservingFormat } from './plan-continuity-preserve-format.mjs';", "import { syncPlanContinuity as syncCanonicalContinuity } from './plan-continuity-global.mjs';", 'import de continuidad');
  value = replaceOnce(value, 'const result = syncPreservingFormat({ root, checkOnly });', 'const result = syncCanonicalContinuity({ root, checkOnly });', 'llamada de continuidad');
  return finish(value, eol(text));
}

function validate(manifest, planned) {
  const regex = /^###\s+(?:\[[ x~]\]|[✅🟡❌])\s+([A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\d{3})\b/gmu;
  const found = new Map();
  for (const relative of manifest.files) {
    const file = path.join(BASE, relative);
    const source = norm(planned.get(file) ?? read(file));
    for (const match of source.matchAll(regex)) {
      const list = found.get(match[1]) ?? [];
      list.push(relative);
      found.set(match[1], list);
    }
  }
  const duplicates = [...found].filter(([, list]) => list.length > 1);
  if (duplicates.length) fail(`IDs duplicados: ${duplicates.map(([id, list]) => `${id} (${list.join(', ')})`).join('; ')}`);
  for (const id of ['AUTH-DB-006','AUTH-DB-007','AUTH-DB-008','AUTH-DB-009','AUTH-DB-010']) {
    if (found.get(id)?.[0] !== 'bloques/R_SUPABASE/03_R2_MIGRACION_PROGRESIVA_POR_DOMINIO.md') fail(`${id} no está en R2.`);
  }
  for (const id of ['SHELL-AUTH-001','SHELL-AUTH-005','SHELL-CTX-001','SHELL-CTX-005']) {
    if (found.get(id)?.[0] !== 'bloques/H_FUNDACION_COMPARTIDA/03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md') fail(`${id} no está en BLOQUE H autorización.`);
  }
}

function run(args) {
  const result = spawnSync(process.execPath, args, { cwd: ROOT, stdio: 'inherit', shell: false });
  if (result.status !== 0) fail(`${args.join(' ')} terminó con código ${result.status}.`);
}

function main() {
  Object.values(files).forEach(read);
  const manifest = JSON.parse(read(files.manifest));
  const planned = new Map([
    [files.header, updateHeader(read(files.header))],
    [files.auth, updateAuth(read(files.auth))],
    [files.order, updateOrder(read(files.order))],
    [files.finalNewline, updateContinuityWrapper(read(files.finalNewline))],
  ]);
  validate(manifest, planned);

  for (const [file, value] of planned) console.log(`${read(file) === value ? 'OK' : 'CAMBIO'}: ${path.relative(ROOT, file)}`);
  for (const file of obsolete) console.log(`${exists(file) ? 'ELIMINAR' : 'AUSENTE'}: ${path.relative(ROOT, file)}`);
  console.log('OK: estructura, IDs y ubicaciones validados antes de escritura.');

  if (!APPLY) return console.log('\nDRY RUN completado. No se escribieron archivos.');

  const backups = new Map();
  for (const [file] of planned) backups.set(file, read(file));
  for (const file of obsolete) backups.set(file, exists(file) ? read(file) : null);

  try {
    for (const [file, value] of planned) fs.writeFileSync(file, value, 'utf8');
    for (const file of obsolete) if (exists(file)) fs.rmSync(file);
    run(['scripts/docs/build-plan-canonico.mjs']);
    run(['scripts/docs/build-plan-canonico.mjs', '--check']);
  } catch (error) {
    for (const [file, value] of backups) {
      if (value === null) { if (exists(file)) fs.rmSync(file); }
      else fs.writeFileSync(file, value, 'utf8');
    }
    throw new Error(`Se revirtieron todos los cambios. ${error.message}`);
  }
  console.log('\nOK: coherencia posterior a AUTH-CTX-027 aplicada y verificada.');
}

try { main(); } catch (error) { console.error(`ERROR: ${error.message}`); process.exitCode = 1; }
