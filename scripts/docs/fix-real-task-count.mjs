import fs from 'node:fs';
import path from 'node:path';
import { spawnSync } from 'node:child_process';

const root = process.cwd();
const apply = process.argv.includes('--apply');
const file = path.join(root, 'scripts/docs/build-plan-canonico.mjs');

function fail(message) {
  throw new Error(message);
}

function run(args) {
  const result = spawnSync(process.execPath, args, {
    cwd: root,
    stdio: 'inherit',
    shell: false,
  });
  if (result.status !== 0) fail(`${args.join(' ')} terminó con código ${result.status}.`);
}

function patch(source) {
  if (source.includes('const taskSource = maskFencedCode(text);')) return source;

  const helperAnchor = "const fail = (message) => { console.error(`ERROR: ${message}`); process.exit(1); };";
  const helper = `${helperAnchor}\n\nfunction maskFencedCode(source) {\n  let insideFence = false;\n  return source.split('\\n').map((line) => {\n    if (/^\\s*\`\`\`/.test(line)) {\n      insideFence = !insideFence;\n      return '';\n    }\n    return insideFence ? '' : line;\n  }).join('\\n');\n}`;

  const countAnchor = "const taskMatches = [...text.matchAll(taskRegex)];";
  const countReplacement = "const taskSource = maskFencedCode(text);\nconst taskMatches = [...taskSource.matchAll(taskRegex)];";

  const authValidationAnchor = "const authCount = text.match(/^\\|\\s*Tareas `AUTH` únicas\\s*\\|\\s*\\*\\*(\\d+)\\*\\*\\s*\\|$/m)?.[1];";
  const totalValidation = `const taskCount = text.match(/^\\|\\s*Tareas canónicas con marcador\\s*\\|\\s*\\*\\*(\\d+)\\*\\*\\s*\\|$/m)?.[1];\nif (!taskCount) fail('no se pudo validar el número total de tareas declarado en la cabecera.');\nif (Number(taskCount) !== taskIds.length) fail(\`la cabecera declara \${taskCount} tareas, pero el compilado contiene \${taskIds.length} marcadores reales fuera de bloques de código.\`);\n\n${authValidationAnchor}`;

  let next = source;
  if (!next.includes(helperAnchor)) fail('No se encontró el ancla de helper.');
  if (!next.includes(countAnchor)) fail('No se encontró el ancla de conteo.');
  if (!next.includes(authValidationAnchor)) fail('No se encontró el ancla de validación AUTH.');

  next = next.replace(helperAnchor, helper);
  next = next.replace(countAnchor, countReplacement);
  next = next.replace(authValidationAnchor, totalValidation);
  next = next.replace('Tareas canónicas: ${taskIds.length}', 'Tareas canónicas reales: ${taskIds.length}');
  next = next.replace('tareas canónicas; ${authIds.length}', 'tareas canónicas reales; ${authIds.length}');
  return next;
}

try {
  if (!fs.existsSync(file)) fail(`No existe ${path.relative(root, file)}.`);
  const original = fs.readFileSync(file, 'utf8');
  const next = patch(original);
  console.log(`${original === next ? 'OK' : 'CAMBIO'}: scripts/docs/build-plan-canonico.mjs`);

  if (!apply) {
    console.log('DRY RUN completado. No se escribieron archivos.');
  } else {
    fs.writeFileSync(file, next, 'utf8');
    try {
      run(['scripts/docs/build-plan-canonico.mjs']);
      run(['scripts/docs/build-plan-canonico.mjs', '--check']);
    } catch (error) {
      fs.writeFileSync(file, original, 'utf8');
      throw new Error(`Se revirtió el compilador. ${error.message}`);
    }
    console.log('\nOK: conteo real de tareas corregido y verificado.');
  }
} catch (error) {
  console.error(`ERROR: ${error instanceof Error ? error.message : String(error)}`);
  process.exitCode = 1;
}
