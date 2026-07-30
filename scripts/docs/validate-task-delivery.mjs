import crypto from 'node:crypto';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const DEFAULT_CONTRACT = 'docs/plan-canonico/modular/delivery-contract.json';
const TASK_ID_SOURCE = '[A-Z][A-Z0-9]*(?:-[A-Z0-9]+)+-\\d{3}';
const TREQ_ID_SOURCE = 'TREQ-[A-Z]+-\\d{3,}';

function fail(message) {
  throw new Error(message);
}

function normalizeSource(source) {
  return source.replace(/^\uFEFF/, '').replace(/\r\n?/g, '\n');
}

function readUtf8(filePath, label) {
  if (!fs.existsSync(filePath)) {
    fail(`${label}: no existe ${filePath}`);
  }

  const buffer = fs.readFileSync(filePath);
  const decoded = buffer.toString('utf8');

  if (Buffer.from(decoded, 'utf8').compare(buffer) !== 0) {
    fail(`${label}: el archivo no es UTF-8 válido: ${filePath}`);
  }

  return normalizeSource(decoded);
}

function sha256(source) {
  return crypto.createHash('sha256').update(source, 'utf8').digest('hex');
}

function parseArgs(argv) {
  const args = {
    contract: DEFAULT_CONTRACT,
    task: null,
    registry: null,
    help: false,
  };

  for (let index = 0; index < argv.length; index += 1) {
    const token = argv[index];

    if (token === '--help' || token === '-h') {
      args.help = true;
      continue;
    }

    if (!['--contract', '--task', '--registry'].includes(token)) {
      fail(`Argumento desconocido: ${token}`);
    }

    const value = argv[index + 1];

    if (!value || value.startsWith('--')) {
      fail(`Falta el valor de ${token}`);
    }

    args[token.slice(2)] = value;
    index += 1;
  }

  return args;
}

function printUsage() {
  console.log(`Uso:
  npm run docs:delivery:check
  npm run docs:delivery:check -- --task <archivo-tarea.md> [--registry <archivo-04A-unico.md>]

Opciones:
  --contract <ruta>   Contrato de entrega. Predeterminado: ${DEFAULT_CONTRACT}
  --task <ruta>       Artefacto de tarea que se validará.
  --registry <ruta>   Registro 04A entregado con nombre único.
  --help              Muestra esta ayuda.

Sin --task se valida únicamente el contrato.
Con --task se valida el formato completo de la entrega.
Si la tarea genera o modifica TREQ, --registry es obligatorio.`);
}

function isPlainObject(value) {
  return value !== null && typeof value === 'object' && !Array.isArray(value);
}

function requireBoolean(object, key, label, errors) {
  if (typeof object?.[key] !== 'boolean') {
    errors.push(`${label}.${key} debe ser booleano.`);
  }
}

function requireString(object, key, label, errors) {
  if (typeof object?.[key] !== 'string' || object[key].trim() === '') {
    errors.push(`${label}.${key} debe ser un string no vacío.`);
  }
}

function validateContract(contract) {
  const errors = [];

  if (!isPlainObject(contract)) {
    return ['El contrato debe ser un objeto JSON.'];
  }

  if (!Number.isInteger(contract.schema_version) || contract.schema_version < 1) {
    errors.push('schema_version debe ser un entero positivo.');
  }

  if (!isPlainObject(contract.task_artifact)) {
    errors.push('task_artifact debe ser un objeto.');
  } else {
    requireString(
      contract.task_artifact,
      'filename',
      'task_artifact',
      errors
    );

    requireBoolean(
      contract.task_artifact,
      'exactly_one_task',
      'task_artifact',
      errors
    );

    requireBoolean(
      contract.task_artifact,
      'allow_replacement_instructions_inside_file',
      'task_artifact',
      errors
    );

    requireBoolean(
      contract.task_artifact,
      'allow_chat_instructions_inside_file',
      'task_artifact',
      errors
    );

    requireBoolean(
      contract.task_artifact,
      'allow_global_summary_inside_file',
      'task_artifact',
      errors
    );

    if (
      typeof contract.task_artifact.filename === 'string'
      && !contract.task_artifact.filename.includes('<TASK-ID>')
    ) {
      errors.push('task_artifact.filename debe contener <TASK-ID>.');
    }
  }

  if (!isPlainObject(contract.registry_artifact)) {
    errors.push('registry_artifact debe ser un objeto.');
  } else {
    requireString(
      contract.registry_artifact,
      'canonical_repository_filename',
      'registry_artifact',
      errors
    );

    requireString(
      contract.registry_artifact,
      'delivery_filename',
      'registry_artifact',
      errors
    );

    requireBoolean(
      contract.registry_artifact,
      'delivery_filename_must_be_unique',
      'registry_artifact',
      errors
    );

    requireBoolean(
      contract.registry_artifact,
      'replace_complete_file',
      'registry_artifact',
      errors
    );

    const template = contract.registry_artifact.delivery_filename;

    if (typeof template === 'string') {
      for (const placeholder of [
        '<TASK-ID>',
        '<REVISION>',
        '<TIMESTAMP>',
      ]) {
        if (!template.includes(placeholder)) {
          errors.push(
            `registry_artifact.delivery_filename debe contener ${placeholder}.`
          );
        }
      }
    }
  }

  for (const key of ['chat_only_content', 'forbidden_inside_task']) {
    if (
      !Array.isArray(contract[key])
      || contract[key].length === 0
      || contract[key].some(
        (value) => typeof value !== 'string' || value.trim() === ''
      )
    ) {
      errors.push(`${key} debe ser un arreglo no vacío de strings.`);
    }
  }

  return errors;
}

function escapeRegex(value) {
  return value.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

function templateToRegex(template, placeholders) {
  const markerRegex = /<([A-Z-]+)>/g;
  let cursor = 0;
  let source = '^';

  for (const match of template.matchAll(markerRegex)) {
    source += escapeRegex(template.slice(cursor, match.index));

    const replacement = placeholders[match[0]];

    if (!replacement) {
      fail(`Placeholder no soportado en el contrato: ${match[0]}`);
    }

    source += replacement;
    cursor = match.index + match[0].length;
  }

  source += escapeRegex(template.slice(cursor));
  source += '$';

  return new RegExp(source);
}

function maskFencedCode(source) {
  let fenced = false;

  return source
    .split('\n')
    .map((line) => {
      if (/^\s*```/.test(line)) {
        fenced = !fenced;
        return '';
      }

      return fenced ? '' : line;
    })
    .join('\n');
}

function findLiteral(source, literal) {
  return source
    .toLocaleLowerCase('es')
    .includes(literal.toLocaleLowerCase('es'));
}

function expandTreqReferences(value) {
  const references = new Set();
  let withoutRanges = value;

  const rangeRegex =
    /TREQ-([A-Z]+)-(\d{3,})`?\s+a\s+`?TREQ-\1-(\d{3,})/g;

  for (const match of value.matchAll(rangeRegex)) {
    const [, domain, fromRaw, toRaw] = match;
    const from = Number(fromRaw);
    const to = Number(toRaw);

    if (!Number.isInteger(from) || !Number.isInteger(to) || to < from) {
      continue;
    }

    for (let number = from; number <= to; number += 1) {
      references.add(
        `TREQ-${domain}-${String(number).padStart(3, '0')}`
      );
    }

    withoutRanges = withoutRanges.replace(match[0], '');
  }

  for (
    const match of withoutRanges.matchAll(
      new RegExp(`\\b${TREQ_ID_SOURCE}\\b`, 'g')
    )
  ) {
    references.add(match[0]);
  }

  return [...references];
}

function extractRequirementsSection(source) {
  const headingPattern =
    /^####(?:\s+\d+\.)?\s+Requisitos de prueba (?:derivados|generados|incorporados)\s*$/gmi;

  const matches = [...source.matchAll(headingPattern)];

  if (matches.length === 0) {
    return null;
  }

  const start = matches[0].index;
  const afterHeading = start + matches[0][0].length;
  const tail = source.slice(afterHeading);
  const nextHeadingOffset = tail.search(/^####\s/m);

  return source.slice(
    start,
    nextHeadingOffset >= 0
      ? afterHeading + nextHeadingOffset
      : source.length
  );
}

function validateTask({ taskPath, contract }) {
  const errors = [];
  const source = readUtf8(taskPath, 'Tarea');
  const fileName = path.basename(taskPath);

  const filenameRegex = templateToRegex(
    contract.task_artifact.filename,
    {
      '<TASK-ID>': `(?<taskId>${TASK_ID_SOURCE})`,
    }
  );

  const filenameMatch = fileName.match(filenameRegex);

  if (!filenameMatch) {
    errors.push(
      `El nombre de la tarea no cumple task_artifact.filename: ${fileName}`
    );
  }

  const visibleSource = maskFencedCode(source);

  const taskHeadingRegex = new RegExp(
    `^###\\s+✅\\s+(?<taskId>${TASK_ID_SOURCE})\\s+—\\s+.+$`,
    'gmu'
  );

  const headings = [...visibleSource.matchAll(taskHeadingRegex)];

  if (
    contract.task_artifact.exactly_one_task
    && headings.length !== 1
  ) {
    errors.push(
      `La tarea debe contener exactamente un encabezado canónico; encontrados: ${headings.length}.`
    );
  }

  const headingTaskId = headings[0]?.groups?.taskId ?? null;
  const filenameTaskId = filenameMatch?.groups?.taskId ?? null;

  if (
    headingTaskId
    && filenameTaskId
    && headingTaskId !== filenameTaskId
  ) {
    errors.push(
      `El ID del encabezado (${headingTaskId}) no coincide con el nombre (${filenameTaskId}).`
    );
  }

  const approvedStates =
    visibleSource.match(
      /^\*\*Estado:\*\*\s+APROBADA\s*$/gmu
    ) ?? [];

  if (approvedStates.length !== 1) {
    errors.push(
      `Debe existir exactamente una línea "**Estado:** APROBADA"; encontradas: ${approvedStates.length}.`
    );
  }

  const forbidden = new Set([
    ...(contract.forbidden_inside_task ?? []),
    ...(contract.chat_only_content ?? []),
  ]);

  for (const phrase of forbidden) {
    if (findLiteral(source, phrase)) {
      errors.push(
        `Contenido reservado para el chat encontrado dentro de la tarea: "${phrase}".`
      );
    }
  }

  if (!contract.task_artifact.allow_chat_instructions_inside_file) {
    const chatPatterns = [
      /sandbox:\/\//i,
      /enlace\s+de\s+descarga/i,
      /descarg(?:a|ar|ue)/i,
    ];

    for (const pattern of chatPatterns) {
      if (pattern.test(source)) {
        errors.push(
          `La tarea contiene una instrucción de chat o descarga prohibida: ${pattern}.`
        );
      }
    }
  }

  if (
    !contract.task_artifact
      .allow_replacement_instructions_inside_file
  ) {
    const replacementPatterns = [
      /marcador\s+exacto/i,
      /reemplazar\s+completamente\s+(?:el\s+)?(?:archivo\s+)?04A/i,
      /no\s+copiar[^\n]*filas/i,
      /instrucci[oó]n\s+de\s+reemplazo/i,
    ];

    for (const pattern of replacementPatterns) {
      if (pattern.test(source)) {
        errors.push(
          `La tarea contiene una instrucción de reemplazo prohibida: ${pattern}.`
        );
      }
    }
  }

  if (!contract.task_artifact.allow_global_summary_inside_file) {
    const globalSummary =
      visibleSource.match(
        /^#{1,4}\s+(?:Resumen|Estado)\s+(?:final|global|general)\s*$/gmi
      ) ?? [];

    if (globalSummary.length > 0) {
      errors.push(
        'La tarea contiene un resumen global prohibido por el contrato.'
      );
    }
  }

  const requirementsSection = extractRequirementsSection(source);

  const declaresNoRequirements =
    /NO\s+GENERA\s+REQUISITOS\s+DE\s+PRUEBA/i.test(source);

  if (!requirementsSection && !declaresNoRequirements) {
    errors.push(
      'La tarea debe incluir una sección de requisitos de prueba derivados/generados/incorporados o declarar NO GENERA REQUISITOS DE PRUEBA.'
    );
  }

  const derivedTreqIds = requirementsSection
    ? expandTreqReferences(requirementsSection)
    : [];

  if (
    requirementsSection
    && derivedTreqIds.length === 0
    && !declaresNoRequirements
  ) {
    errors.push(
      'La sección de requisitos de prueba no declara ningún TREQ ni la ausencia de requisitos.'
    );
  }

  return {
    errors,
    source,
    taskId: headingTaskId ?? filenameTaskId,
    derivedTreqIds,
    requiresRegistry: derivedTreqIds.length > 0,
  };
}

function isValidTimestamp(value) {
  const match = value.match(
    /^(\d{4})(\d{2})(\d{2})-(\d{2})(\d{2})(\d{2})$/
  );

  if (!match) {
    return false;
  }

  const [, year, month, day, hour, minute, second] =
    match.map(Number);

  const date = new Date(
    Date.UTC(
      year,
      month - 1,
      day,
      hour,
      minute,
      second
    )
  );

  return (
    date.getUTCFullYear() === year
    && date.getUTCMonth() === month - 1
    && date.getUTCDate() === day
    && date.getUTCHours() === hour
    && date.getUTCMinutes() === minute
    && date.getUTCSeconds() === second
  );
}

function validateRegistry({
  registryPath,
  contract,
  taskId,
  derivedTreqIds,
}) {
  const errors = [];
  const source = readUtf8(registryPath, 'Registro 04A');
  const fileName = path.basename(registryPath);

  const canonicalName =
    contract.registry_artifact.canonical_repository_filename;

  if (
    contract.registry_artifact.delivery_filename_must_be_unique
    && fileName === canonicalName
  ) {
    errors.push(
      `El registro entregado no puede usar el nombre canónico ${canonicalName}; debe usar un nombre único.`
    );
  }

  const registryRegex = templateToRegex(
    contract.registry_artifact.delivery_filename,
    {
      '<TASK-ID>': `(?<taskId>${TASK_ID_SOURCE})`,
      '<REVISION>': '(?<revision>\\d{2,})',
      '<TIMESTAMP>': '(?<timestamp>\\d{8}-\\d{6})',
    }
  );

  const filenameMatch = fileName.match(registryRegex);

  if (!filenameMatch) {
    errors.push(
      `El nombre del registro no cumple registry_artifact.delivery_filename: ${fileName}`
    );
  } else {
    if (filenameMatch.groups?.taskId !== taskId) {
      errors.push(
        `El registro declara ${filenameMatch.groups?.taskId} en el nombre, pero la tarea es ${taskId}.`
      );
    }

    if (Number(filenameMatch.groups?.revision) < 1) {
      errors.push(
        'La revisión del registro debe ser mayor o igual que 01.'
      );
    }

    if (
      !isValidTimestamp(
        filenameMatch.groups?.timestamp ?? ''
      )
    ) {
      errors.push(
        'El timestamp del registro no es válido; se requiere YYYYMMDD-HHMMSS.'
      );
    }
  }

  const mainHeadings =
    source.match(
      /^## REGISTRO CANÓNICO DE REQUISITOS DE PRUEBA\s*$/gmu
    ) ?? [];

  if (mainHeadings.length !== 1) {
    errors.push(
      `El 04A debe contener exactamente un encabezado principal canónico; encontrados: ${mainHeadings.length}.`
    );
  }

  const latestTaskMatch = source.match(
    /^\|\s*Última tarea incorporada\s*\|\s*`?([^`|]+)`?\s*\|\s*$/mu
  );

  const latestTask =
    latestTaskMatch?.[1]?.trim() ?? null;

  if (!latestTask) {
    errors.push(
      'El 04A no declara "Última tarea incorporada" en el resumen vigente.'
    );
  } else if (latestTask !== taskId) {
    errors.push(
      `El 04A declara como última tarea ${latestTask}, pero se esperaba ${taskId}.`
    );
  }

  for (const treqId of derivedTreqIds) {
    const occurrences =
      source.match(
        new RegExp(`\\b${escapeRegex(treqId)}\\b`, 'g')
      ) ?? [];

    if (occurrences.length === 0) {
      errors.push(
        `El 04A no contiene el requisito derivado ${treqId}.`
      );
    }
  }

  if (!contract.registry_artifact.replace_complete_file) {
    errors.push(
      'registry_artifact.replace_complete_file debe permanecer en true.'
    );
  }

  return {
    errors,
    source,
  };
}

function main() {
  const args = parseArgs(process.argv.slice(2));

  if (args.help) {
    printUsage();
    return;
  }

  const contractPath = path.resolve(args.contract);
  const contractSource = readUtf8(
    contractPath,
    'Contrato'
  );

  let contract;

  try {
    contract = JSON.parse(contractSource);
  } catch (error) {
    fail(
      `Contrato JSON inválido: ${
        error instanceof Error
          ? error.message
          : String(error)
      }`
    );
  }

  const contractErrors = validateContract(contract);

  if (contractErrors.length > 0) {
    fail(
      `Contrato de entrega inválido:\n- ${contractErrors.join(
        '\n- '
      )}`
    );
  }

  const contractHash = sha256(contractSource);

  console.log(
    `OK: contrato de entrega; SHA-256 ${contractHash}.`
  );

  if (!args.task) {
    console.log(
      'OK: modo contrato; no se solicitó validar un artefacto de tarea.'
    );
    return;
  }

  const taskPath = path.resolve(args.task);

  const taskResult = validateTask({
    taskPath,
    contract,
  });

  const errors = [...taskResult.errors];

  if (!taskResult.taskId) {
    errors.push(
      'No se pudo resolver el identificador de la tarea.'
    );
  }

  if (taskResult.requiresRegistry && !args.registry) {
    errors.push(
      'La tarea genera o modifica TREQ; debe proporcionarse --registry con un nombre único.'
    );
  }

  let registryResult = null;

  if (args.registry && taskResult.taskId) {
    registryResult = validateRegistry({
      registryPath: path.resolve(args.registry),
      contract,
      taskId: taskResult.taskId,
      derivedTreqIds: taskResult.derivedTreqIds,
    });

    errors.push(...registryResult.errors);
  }

  if (errors.length > 0) {
    fail(
      `Entrega documental inválida:\n- ${errors.join(
        '\n- '
      )}`
    );
  }

  console.log(
    `OK: tarea ${taskResult.taskId}; `
      + `${taskResult.derivedTreqIds.length} TREQ derivados; `
      + `${sha256(taskResult.source)} SHA-256.`
  );

  if (registryResult) {
    console.log(
      `OK: registro 04A único; `
        + `${path.basename(args.registry)}; `
        + `${sha256(registryResult.source)} SHA-256.`
    );
  }
}

const isCli =
  process.argv[1]
  && path.resolve(process.argv[1])
    === path.resolve(fileURLToPath(import.meta.url));

if (isCli) {
  try {
    main();
  } catch (error) {
    console.error(
      `ERROR: ${
        error instanceof Error
          ? error.message
          : String(error)
      }`
    );

    process.exit(1);
  }
}