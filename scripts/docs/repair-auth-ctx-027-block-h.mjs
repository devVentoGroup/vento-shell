import fs from 'node:fs';
import path from 'node:path';
import { spawnSync } from 'node:child_process';

const ROOT = process.cwd();
const BASE = path.resolve(ROOT, 'docs/plan-canonico/modular');
const APPLY = process.argv.includes('--apply');

const REL = {
  manifest: 'manifest.json',
  protocol: '01_PROTOCOLO.md',
  order: '90_ORDEN_DE_IMPLEMENTACION.md',
  catalogApps: 'bloques/C_CATALOGO/01_APLICACIONES_Y_CONVENCION.md',
  ctxImplementation: 'bloques/E_CONTEXTO_Y_DECISION/05_IMPLEMENTACION_Y_TRANSICION.md',
  hData: 'bloques/H_FUNDACION_COMPARTIDA/02_NORMALIZACION_COMPARTIDA_DE_DATOS.md',
  hAuthorization: 'bloques/H_FUNDACION_COMPARTIDA/03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md',
};

const FILES = Object.fromEntries(
  Object.entries(REL).map(([key, value]) => [key, path.join(BASE, value)]),
);

const AUTH_TASKS = [
  '### [ ] SHELL-AUTH-001 — Consolidar @vento/os-context como SDK canónico de contexto y autorización',
  '### [ ] SHELL-AUTH-002 — Implementar adapters de servidor, cliente y proyecciones seguras',
  '### [ ] SHELL-AUTH-003 — Implementar scope por solicitud y registro canónico de consumidores',
  '### [ ] SHELL-AUTH-004 — Implementar lint, métricas y gates contra consumidores legacy',
  '### [ ] SHELL-AUTH-005 — Migrar consumidores de autorización en todos los repositorios',
];

const CONTEXT_TASKS = [
  '### [ ] SHELL-CTX-001 — Consolidar el módulo de contexto dentro de @vento/os-context',
  '### [ ] SHELL-CTX-002 — Implementar consumo canónico de turno y check-in',
  '### [ ] SHELL-CTX-003 — Implementar proyecciones seguras de sede y área efectivas',
  '### [ ] SHELL-CTX-004 — Implementar readiness operativo sin booleanos de autorización',
  '### [ ] SHELL-CTX-005 — Implementar razones seguras de bloqueo contextual',
];

const MANAGED_IDS = [
  ...AUTH_TASKS.map((line) => line.match(/SHELL-AUTH-\d{3}/u)[0]),
  ...CONTEXT_TASKS.map((line) => line.match(/SHELL-CTX-\d{3}/u)[0]),
];

const TARGET_CONTENT = `## AUTORIZACIÓN Y CONTEXTO COMPARTIDOS

Este archivo materializa la frontera compartida aprobada por
\`AUTH-CTX-027\` y consolida las tareas que anteriormente estaban mezcladas
con normalización de datos.

Arquitectura obligatoria:

\`\`\`text
@vento/contracts/authorization
→ contratos, catálogos, schemas y códigos

@vento/os-context
→ adapters, scopes por solicitud, proyecciones seguras,
  compatibilidad temporal y utilidades de prueba

Supabase
→ get_access_context, evaluate_authorization,
  resolvers privados, datasets y persistencia
\`\`\`

No se crearán paquetes paralelos \`@vento/auth\` ni
\`@vento/operational-context\`.

### Fundación del SDK de autorización

${AUTH_TASKS.join('\n')}

### Módulos internos de contexto

${CONTEXT_TASKS.join('\n')}

### Orden contractual interno

\`\`\`text
SHELL-CON-001 a SHELL-CON-008
        ↓
SHELL-AUTH-001
+
SHELL-CTX-001 a SHELL-CTX-005
        ↓
SHELL-AUTH-002
        ↓
SHELL-AUTH-003
        ↓
SHELL-AUTH-004
        ↓
AUTH-DB-033
        ↓
AUTH-DB-034
        ↓
AUTH-DB-032
        ↓
SHELL-AUTH-005
\`\`\`

Reglas:

- \`SHELL-AUTH-001\` define la estructura y exports del único SDK compartido;
- \`SHELL-CTX-001..005\` implementan piezas contextuales dentro del mismo paquete;
- \`SHELL-AUTH-002\` depende de los contratos y módulos contextuales;
- \`SHELL-AUTH-003\` crea scope por solicitud y registro de consumidores;
- \`SHELL-AUTH-004\` impide nuevos consumos legacy antes de la migración;
- \`AUTH-DB-033\` y \`AUTH-DB-034\` implementan las fuentes autoritativas;
- \`AUTH-DB-032\` agrega persistencia durable y vínculo con ejecución;
- \`SHELL-AUTH-005\` migra consumidores solo después de disponer del backend,
  adapters, gates, pruebas y rollback.
`;

const ORDER_START = '<!-- SHELL-AUTH-CANONICAL:START -->';
const ORDER_END = '<!-- SHELL-AUTH-CANONICAL:END -->';
const ORDER_BLOCK = `${ORDER_START}
### Secuencia canónica de autorización compartida

\`\`\`text
SHELL-CON-001 a SHELL-CON-008
        ↓
SHELL-AUTH-001
+
SHELL-CTX-001 a SHELL-CTX-005
        ↓
SHELL-AUTH-002 a SHELL-AUTH-004
        ↓
AUTH-DB-033
        ↓
AUTH-DB-034
        ↓
AUTH-DB-032
        ↓
SHELL-AUTH-005
        ↓
AUTH-DB-006 a AUTH-DB-010
        ↓
AUTH-DB-030
        ↓
AUTH-DB-031
\`\`\`

\`AUTH-DB-027\` acompaña cada paquete físico. La migración multi-repositorio
no puede comenzar antes de que existan contratos, SDK, contexto compartido,
gates, resolver, evaluador, persistencia y pruebas.
${ORDER_END}`;

const PROTOCOL_START = '<!-- TASK-ID-UNIQUENESS:START -->';
const PROTOCOL_END = '<!-- TASK-ID-UNIQUENESS:END -->';
const PROTOCOL_BLOCK = `${PROTOCOL_START}
## Regla canónica de unicidad y evolución de identificadores

Antes de proponer o materializar una tarea nueva se deberá buscar su
identificador exacto en todos los archivos de \`manifest.json\`.

- un identificador existente no podrá reutilizarse con otro significado;
- cuando una decisión posterior refine una tarea no iniciada, deberá conservar
  el identificador y declarar expresamente la sustitución de responsabilidad;
- una tarea aprobada o ejecutada no podrá cambiar de significado; deberá
  crearse un identificador nuevo y registrar la relación;
- el compilador deberá rechazar identificadores duplicados;
- la materialización deberá validar también coherencia de bloque, dependencias
  y orden de implementación, no solo existencia física.
${PROTOCOL_END}`;

function fail(message) {
  throw new Error(message);
}

function exists(file) {
  return fs.existsSync(file) && fs.statSync(file).isFile();
}

function read(file) {
  if (!exists(file)) fail(`No existe ${path.relative(ROOT, file)}.`);
  return fs.readFileSync(file, 'utf8');
}

function normalize(text) {
  return text.replace(/\r\n?/g, '\n');
}

function eolOf(text) {
  return text.includes('\r\n') ? '\r\n' : '\n';
}

function finish(text, eol = '\n') {
  const value = `${normalize(text).replace(/\n+$/u, '')}\n`;
  return eol === '\n' ? value : value.replace(/\n/g, '\r\n');
}

function replaceAllChecked(text, replacements, label) {
  let result = text;
  for (const [from, to] of replacements) {
    if (!result.includes(from)) fail(`${label}: no se encontró el texto esperado: ${from}`);
    result = result.replaceAll(from, to);
  }
  return result;
}

function removeTaskHeadings(text, ids) {
  let result = normalize(text);
  for (const id of ids) {
    const regex = new RegExp(
      `^###\\s+(?:\\[[ x~]\\]|[✅🟡❌])\\s+${id}\\b[^\\n]*(?:\\n|$)`,
      'gmu',
    );
    result = result.replace(regex, '');
  }
  return result.replace(/\n{3,}/g, '\n\n');
}

function replaceManagedBlock(text, start, end, block, anchor) {
  const value = normalize(text);
  const startIndex = value.indexOf(start);
  const endIndex = value.indexOf(end);

  if ((startIndex >= 0) !== (endIndex >= 0)) fail(`Bloque incompleto: ${start}`);
  if (startIndex >= 0) {
    if (endIndex < startIndex) fail(`Bloque invertido: ${start}`);
    return `${value.slice(0, startIndex).trimEnd()}\n\n${block}\n\n${value
      .slice(endIndex + end.length)
      .trimStart()}`;
  }

  const anchorIndex = value.indexOf(anchor);
  if (anchorIndex < 0) fail(`No se encontró el ancla: ${anchor}`);
  return `${value.slice(0, anchorIndex).trimEnd()}\n\n${block}\n\n${value
    .slice(anchorIndex)
    .trimStart()}`;
}

function updateManifest(manifest) {
  const files = manifest.files.filter((item) => item !== REL.hAuthorization);
  const anchor = files.indexOf(REL.hData);
  if (anchor < 0) fail(`manifest.json no contiene ${REL.hData}.`);
  files.splice(anchor + 1, 0, REL.hAuthorization);
  return { ...manifest, files };
}

function taskOccurrences(manifest, overrides) {
  const regex = /^###\s+(?:\[[ x~]\]|[✅🟡❌])\s+([A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\d{3})\b/gmu;
  const found = new Map();

  for (const relative of manifest.files) {
    const file = path.join(BASE, relative);
    const text = normalize(overrides.has(file) ? overrides.get(file) : read(file));
    for (const match of text.matchAll(regex)) {
      const list = found.get(match[1]) ?? [];
      list.push(relative);
      found.set(match[1], list);
    }
  }
  return found;
}

function validateInventory(manifest, overrides) {
  const found = taskOccurrences(manifest, overrides);
  const duplicates = [...found.entries()].filter(([, files]) => files.length > 1);
  if (duplicates.length) {
    fail(`IDs duplicados: ${duplicates.map(([id, files]) => `${id} (${files.join(', ')})`).join('; ')}`);
  }
  for (const id of MANAGED_IDS) {
    const files = found.get(id) ?? [];
    if (files.length !== 1 || files[0] !== REL.hAuthorization) {
      fail(`${id} debe existir exactamente una vez en ${REL.hAuthorization}.`);
    }
  }
}

function run(args) {
  const result = spawnSync(process.execPath, args, {
    cwd: ROOT,
    stdio: 'inherit',
    shell: false,
  });
  if (result.status !== 0) fail(`${args.join(' ')} terminó con código ${result.status}.`);
}

function main() {
  const required = [
    FILES.manifest,
    FILES.protocol,
    FILES.order,
    FILES.catalogApps,
    FILES.ctxImplementation,
    FILES.hData,
  ];
  required.forEach((file) => read(file));

  const manifestOriginalText = read(FILES.manifest);
  const manifestOriginal = JSON.parse(manifestOriginalText);
  if (!Array.isArray(manifestOriginal.files)) fail('manifest.json no contiene files[].');

  const originals = new Map();
  for (const file of required) originals.set(file, read(file));
  if (exists(FILES.hAuthorization)) originals.set(FILES.hAuthorization, read(FILES.hAuthorization));

  const next = new Map();

  const hDataOriginal = read(FILES.hData);
  next.set(
    FILES.hData,
    finish(removeTaskHeadings(hDataOriginal, MANAGED_IDS), eolOf(hDataOriginal)),
  );
  next.set(FILES.hAuthorization, finish(TARGET_CONTENT));

  const ctxOriginal = read(FILES.ctxImplementation);
  let ctxNext = replaceAllChecked(
    normalize(ctxOriginal),
    [
      ['| **Nuevas tareas requeridas**     | `SHELL-AUTH-001` a `SHELL-AUTH-005`', '| **Tareas existentes refinadas**   | `SHELL-AUTH-001` a `SHELL-AUTH-005`; se conservan y amplían sin reutilizar IDs'],
      ['#### 94. Nuevas tareas SHELL-AUTH', '#### 94. Refinamiento contractual de tareas SHELL-AUTH existentes'],
      ['Se crean explícitamente:', 'Se refinan contractualmente las tareas no iniciadas ya existentes:'],
      ['#### 95. Ubicación de SHELL-AUTH', '#### 95. Ubicación canónica de SHELL-AUTH y SHELL-CTX'],
      ['docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/00_INTRO.md', 'docs/plan-canonico/modular/bloques/H_FUNDACION_COMPARTIDA/03_AUTORIZACION_Y_CONTEXTO_COMPARTIDOS.md'],
      ['Después de `SHELL-CON-008` y antes de identificadores de procesos.', 'Después de contratos y normalización compartida, antes de la adopción física y de la migración multi-repositorio.'],
      ['116. se crea SHELL-AUTH-001;', '116. se refina SHELL-AUTH-001 sin cambiar su identificador;'],
      ['117. se crea SHELL-AUTH-002;', '117. se refina SHELL-AUTH-002 sin cambiar su identificador;'],
      ['118. se crea SHELL-AUTH-003;', '118. se refina SHELL-AUTH-003 sin cambiar su identificador;'],
      ['119. se crea SHELL-AUTH-004;', '119. se refina SHELL-AUTH-004 sin cambiar su identificador;'],
      ['120. se crea SHELL-AUTH-005;', '120. se refina SHELL-AUTH-005 sin cambiar su identificador;'],
    ],
    'AUTH-CTX-027',
  );
  next.set(FILES.ctxImplementation, finish(ctxNext, eolOf(ctxOriginal)));

  const catalogOriginal = read(FILES.catalogApps);
  const catalogNext = replaceAllChecked(
    normalize(catalogOriginal),
    [
      ['@vento/auth\n@vento/operational-context', '@vento/os-context'],
    ],
    'AUTH-CAT-001',
  );
  next.set(FILES.catalogApps, finish(catalogNext, eolOf(catalogOriginal)));

  const protocolOriginal = read(FILES.protocol);
  const protocolNext = replaceManagedBlock(
    protocolOriginal,
    PROTOCOL_START,
    PROTOCOL_END,
    PROTOCOL_BLOCK,
    '## Regla canónica de granularidad documental',
  );
  next.set(FILES.protocol, finish(protocolNext, eolOf(protocolOriginal)));

  const orderOriginal = read(FILES.order);
  const orderNext = replaceManagedBlock(
    orderOriginal,
    ORDER_START,
    ORDER_END,
    ORDER_BLOCK,
    'FASE 4 — HABILITADORES TRANSVERSALES',
  );
  next.set(FILES.order, finish(orderNext, eolOf(orderOriginal)));

  const manifestNext = updateManifest(manifestOriginal);
  const manifestNextText = `${JSON.stringify(manifestNext, null, 2)}\n`;
  next.set(FILES.manifest, manifestNextText);

  validateInventory(manifestNext, next);

  for (const [file, value] of next) {
    const before = originals.get(file) ?? null;
    console.log(`${before === value ? 'OK' : 'CAMBIO'}: ${path.relative(ROOT, file)}`);
  }

  console.log('OK: IDs SHELL-AUTH y SHELL-CTX únicos, arquitectura consolidada y orden validado.');

  if (!APPLY) {
    console.log('\nDRY RUN completado. No se escribieron archivos.');
    return;
  }

  const backups = new Map();
  for (const [file] of next) backups.set(file, exists(file) ? read(file) : null);

  try {
    for (const [file, value] of next) {
      fs.mkdirSync(path.dirname(file), { recursive: true });
      fs.writeFileSync(file, value, 'utf8');
    }

    run(['scripts/docs/build-plan-canonico.mjs']);
    run(['scripts/docs/build-plan-canonico.mjs', '--check']);
  } catch (error) {
    for (const [file, value] of backups) {
      if (value === null) {
        if (exists(file)) fs.rmSync(file);
      } else {
        fs.writeFileSync(file, value, 'utf8');
      }
    }
    throw new Error(`Se revirtieron todos los cambios. ${error.message}`);
  }

  console.log('\nOK: reparación integral de AUTH-CTX-027 y BLOQUE H aplicada y verificada.');
}

try {
  main();
} catch (error) {
  console.error(`ERROR: ${error instanceof Error ? error.message : String(error)}`);
  process.exitCode = 1;
}
