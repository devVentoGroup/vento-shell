import assert from 'node:assert/strict';
import fs from 'node:fs';
import test from 'node:test';

import {
  buildInfraPrBody,
  buildOpsPrBody,
  buildPrBody,
  classifyInfraPath,
  classifyOpsPath,
  classifyPrChecksProbe,
  classifyTaskPath,
  infraBranchName,
  opsBranchName,
  parsePorcelainPaths,
  parseTaskTreqDeclaration,
  resolveCanonicalOwnerRelativePath,
  resolveNpmInvocation,
  taskBranchName,
} from './task-branch-lifecycle.mjs';

test('normaliza una tarea canonica a task/<id-en-minusculas>', () => {
  assert.equal(taskBranchName('AUTH-SRV-001'), 'task/auth-srv-001');
  assert.equal(taskBranchName('shell-ci-024'), 'task/shell-ci-024');
});

test('rechaza identificadores que no parecen task IDs canonicos', () => {
  assert.throws(() => taskBranchName('mi-rama'), /TASK_ID invalido/u);
  assert.throws(() => taskBranchName('../main'), /TASK_ID invalido/u);
});

test('parsea git status sin perder rutas renombradas', () => {
  const source = [
    ' M docs/plan-canonico/modular/active-sequence.json',
    '?? scripts/docs/task-branch-lifecycle.mjs',
    'R  old.txt -> docs/plan-canonico/modular/new.md',
  ].join('\n');
  assert.deepEqual(parsePorcelainPaths(source), [
    'docs/plan-canonico/modular/active-sequence.json',
    'docs/plan-canonico/modular/new.md',
    'scripts/docs/task-branch-lifecycle.mjs',
  ]);
});

test('solo automatiza rutas gobernadas y bloquea archivos ajenos', () => {
  assert.equal(classifyTaskPath('docs/plan-canonico/modular/active-sequence.json'), 'ALLOWED');
  assert.equal(classifyTaskPath('scripts/docs/task-branch-lifecycle.mjs'), 'ALLOWED');
  assert.equal(classifyTaskPath('src/app/page.tsx'), 'ALLOWED');
  assert.equal(classifyTaskPath('.env.local'), 'OTHER');
  assert.equal(classifyTaskPath('notas-personales.txt'), 'OTHER');
});


test('cambio transversal usa infra/<change-id> y bloquea archivos canonicos de tarea', () => {
  assert.equal(
    infraBranchName('task-lifecycle-finish-verification'),
    'infra/task-lifecycle-finish-verification',
  );
  assert.throws(() => infraBranchName('../main'), /CHANGE_ID invalido/u);

  assert.equal(classifyInfraPath('scripts/docs/task-branch-lifecycle.mjs'), 'ALLOWED');
  assert.equal(classifyInfraPath('scripts/quality/lint-ratchet.mjs'), 'ALLOWED');
  assert.equal(classifyInfraPath('.github/workflows/vento-required-gate.yml'), 'ALLOWED');
  assert.equal(classifyInfraPath('package.json'), 'ALLOWED');
  assert.equal(
    classifyInfraPath('docs/plan-canonico/modular/bloques/J_ACCIONES_DE_SERVIDOR/01_INVENTARIO_DE_SUPERFICIES_DE_SERVIDOR.md'),
    'OTHER',
  );
  assert.equal(classifyInfraPath('src/app/page.tsx'), 'OTHER');
});

test('PR transversal declara TREQ NONE y enumera solo infraestructura permitida', () => {
  const body = buildInfraPrBody('task-lifecycle-finish-verification', [
    'scripts/docs/task-branch-lifecycle.mjs',
    'package.json',
  ]);
  assert.match(body, /^VENTO-TREQ-AFFECTED: NONE$/mu);
  assert.match(body, /task-lifecycle-finish-verification/u);
  assert.match(body, /- package\.json/u);
  assert.match(body, /- scripts\/docs\/task-branch-lifecycle\.mjs/u);
  assert.throws(
    () => buildInfraPrBody('bad-scope', ['src/app/page.tsx']),
    /solo admite infraestructura transversal/u,
  );
});


test('documentacion operativa usa ops/<change-id> y solo admite Markdown directo en docs', () => {
  assert.equal(opsBranchName('guia-operativa-comandos'), 'ops/guia-operativa-comandos');
  assert.throws(() => opsBranchName('../main'), /CHANGE_ID invalido/u);

  assert.equal(classifyOpsPath('docs/VENTO_OS_GUIA_OPERATIVA_DE_COMANDOS.md'), 'ALLOWED');
  assert.equal(classifyOpsPath('docs/OTRA_GUIA.md'), 'ALLOWED');
  assert.equal(classifyOpsPath('docs/plan-canonico/modular/01_PROTOCOLO.md'), 'OTHER');
  assert.equal(classifyOpsPath('docs/guias/otra.md'), 'OTHER');
  assert.equal(classifyOpsPath('scripts/docs/task-branch-lifecycle.mjs'), 'OTHER');
  assert.equal(classifyOpsPath('src/app/page.tsx'), 'OTHER');
  assert.equal(classifyInfraPath('docs/VENTO_OS_GUIA_OPERATIVA_DE_COMANDOS.md'), 'OTHER');
});

test('PR de documentacion operativa declara TREQ NONE y rechaza otros alcances', () => {
  const body = buildOpsPrBody('guia-operativa-comandos', [
    'docs/VENTO_OS_GUIA_OPERATIVA_DE_COMANDOS.md',
  ]);
  assert.match(body, /^VENTO-TREQ-AFFECTED: NONE$/mu);
  assert.match(body, /guia-operativa-comandos/u);
  assert.match(body, /- docs\/VENTO_OS_GUIA_OPERATIVA_DE_COMANDOS\.md/u);
  assert.throws(
    () => buildOpsPrBody('bad-scope', ['docs/plan-canonico/modular/01_PROTOCOLO.md']),
    /solo admite Markdown operativo/u,
  );
});

test('deriva NONE cuando la tarea declara cero TREQ', () => {
  const source = `### ✅ AUTH-SRV-001 — Inventariar Server Actions\n\n**Requisitos de prueba creados o modificados:** 0\n\n#### 1. Requisitos de prueba derivados\n\n**Resultado:** NO GENERA REQUISITOS DE PRUEBA\n\n#### 2. Continuidad\n\nTexto\n\n### [ ] AUTH-SRV-002 — Siguiente\n`;
  const declaration = parseTaskTreqDeclaration(source, 'AUTH-SRV-001');
  assert.deepEqual(declaration, { declaredCount: 0, ids: [] });
  const body = buildPrBody('AUTH-SRV-001', declaration);
  assert.match(body, /^VENTO-TREQ-AFFECTED: NONE$/mu);
  assert.match(body, /^VENTO-TREQ-ZERO-REASON: .{20,}$/mu);
});

test('deriva IDs TREQ exactos cuando la tarea declara cambios', () => {
  const source = `### ✅ TASK-001 — Ejemplo\n\n**Requisitos de prueba creados o modificados:** 2\n\n#### 1. Requisitos de prueba derivados\n\n- TREQ-AAA-001\n- TREQ-BBB-002\n\n#### 2. Continuidad\n\nTexto\n`;
  const declaration = parseTaskTreqDeclaration(source, 'TASK-001');
  assert.deepEqual(declaration, {
    declaredCount: 2,
    ids: ['TREQ-AAA-001', 'TREQ-BBB-002'],
  });
  assert.match(buildPrBody('TASK-001', declaration), /^VENTO-TREQ-AFFECTED: TREQ-AAA-001,TREQ-BBB-002$/mu);
});

test('falla cerrado si metadata TREQ y seccion derivada contradicen', () => {
  const source = `### ✅ TASK-001 — Ejemplo\n\n**Requisitos de prueba creados o modificados:** 0\n\n#### 1. Requisitos de prueba derivados\n\n- TREQ-AAA-001\n`;
  assert.throws(
    () => parseTaskTreqDeclaration(source, 'TASK-001'),
    /declara 0 TREQ/u,
  );
});

test('distingue checks aun no registrados de errores reales de gh', () => {
  assert.deepEqual(
    classifyPrChecksProbe({
      status: 1,
      stdout: '',
      stderr: "no checks reported on the 'task/auth-srv-002' branch",
    }),
    {
      state: 'WAIT',
      count: 0,
      detail: "no checks reported on the 'task/auth-srv-002' branch",
    },
  );

  assert.deepEqual(
    classifyPrChecksProbe({
      status: 0,
      stdout: '[]',
      stderr: '',
    }),
    { state: 'WAIT', count: 0, detail: '' },
  );

  assert.deepEqual(
    classifyPrChecksProbe({
      status: 8,
      stdout: '[{"name":"VENTO Required Gate","state":"IN_PROGRESS","bucket":"pending","link":"https://example.invalid"}]',
      stderr: '',
    }),
    { state: 'REGISTERED', count: 1, detail: '' },
  );

  assert.deepEqual(
    classifyPrChecksProbe({
      status: 1,
      stdout: '',
      stderr: 'HTTP 403: Resource not accessible',
    }),
    { state: 'ERROR', count: 0, detail: 'HTTP 403: Resource not accessible' },
  );
});

test('finish espera checks antes de watch y verifica el cierre completo antes de PASS', () => {
  const source = fs.readFileSync('scripts/docs/task-branch-lifecycle.mjs', 'utf8');
  const registrationCall = source.indexOf('const registeredCheckCount = waitForPrChecksToRegister(root, prNumber);');
  const watchCall = source.indexOf("'--watch',", registrationCall);
  const mergeWait = source.indexOf('const merged = waitForPrMerged(root, prNumber, headSha);', watchCall);
  const ancestorCheck = source.indexOf("['merge-base', '--is-ancestor', headSha, 'HEAD']", mergeWait);
  const cleanupCall = source.indexOf('const cleanup = cleanupBranch(root, branch);', ancestorCheck);
  const passOutput = source.indexOf("ESTADO: 'PASS'", cleanupCall);

  assert.ok(registrationCall >= 0);
  assert.ok(watchCall > registrationCall);
  assert.ok(mergeWait > watchCall);
  assert.ok(ancestorCheck > mergeWait);
  assert.ok(cleanupCall > ancestorCheck);
  assert.ok(passOutput > cleanupCall);
  assert.match(source, /HEAD_VALIDATED_IN_MAIN: 'SI'/u);
  assert.match(source, /CHECKS_REGISTERED: registeredCheckCount/u);
});


test('infra publish usa el mismo cierre fuerte y solo permite PASS al final', () => {
  const source = fs.readFileSync('scripts/docs/task-branch-lifecycle.mjs', 'utf8');
  const start = source.indexOf('export function publishInfraChange');
  const branchCreate = source.indexOf("git(['switch', '-c', branch]", start);
  const localValidation = source.indexOf('runInfraLocalValidation(root, dirty);', branchCreate);
  const push = source.indexOf("git(['push', '-u', 'origin', branch]", localValidation);
  const registration = source.indexOf('const registeredCheckCount = waitForPrChecksToRegister(root, prNumber);', push);
  const mergeWait = source.indexOf('const merged = waitForPrMerged(root, prNumber, headSha);', registration);
  const ancestor = source.indexOf("['merge-base', '--is-ancestor', headSha, 'HEAD']", mergeWait);
  const cleanup = source.indexOf('const cleanup = cleanupBranch(root, branch);', ancestor);
  const ready = source.indexOf("READY_FOR_NEXT_TASK: 'SI'", cleanup);

  assert.ok(start >= 0);
  assert.ok(branchCreate > start);
  assert.ok(localValidation > branchCreate);
  assert.ok(push > localValidation);
  assert.ok(registration > push);
  assert.ok(mergeWait > registration);
  assert.ok(ancestor > mergeWait);
  assert.ok(cleanup > ancestor);
  assert.ok(ready > cleanup);
});

test('ops publish usa cierre fuerte y solo permite PASS despues de integrar y limpiar', () => {
  const source = fs.readFileSync('scripts/docs/task-branch-lifecycle.mjs', 'utf8');
  const start = source.indexOf('export function publishOpsChange');
  const branchCreate = source.indexOf("git(['switch', '-c', branch]", start);
  const localValidation = source.indexOf('runOpsLocalValidation(root, dirty);', branchCreate);
  const push = source.indexOf("git(['push', '-u', 'origin', branch]", localValidation);
  const registration = source.indexOf('const registeredCheckCount = waitForPrChecksToRegister(root, prNumber);', push);
  const mergeWait = source.indexOf('const merged = waitForPrMerged(root, prNumber, headSha);', registration);
  const ancestor = source.indexOf("['merge-base', '--is-ancestor', headSha, 'HEAD']", mergeWait);
  const cleanup = source.indexOf('const cleanup = cleanupBranch(root, branch);', ancestor);
  const ready = source.indexOf("READY_FOR_NEXT_TASK: 'SI'", cleanup);

  assert.ok(start >= 0);
  assert.ok(branchCreate > start);
  assert.ok(localValidation > branchCreate);
  assert.ok(push > localValidation);
  assert.ok(registration > push);
  assert.ok(mergeWait > registration);
  assert.ok(ancestor > mergeWait);
  assert.ok(cleanup > ancestor);
  assert.ok(ready > cleanup);
});

test('resuelve el owner del preflight dentro de docs/plan-canonico/modular', () => {
  const relativeOwner = 'bloques/J_ACCIONES_DE_SERVIDOR/01_INVENTARIO_DE_SUPERFICIES_DE_SERVIDOR.md';
  const repoRelativeOwner = `docs/plan-canonico/modular/${relativeOwner}`;

  assert.equal(
    resolveCanonicalOwnerRelativePath(relativeOwner),
    repoRelativeOwner,
  );
  assert.equal(
    resolveCanonicalOwnerRelativePath(repoRelativeOwner),
    repoRelativeOwner,
  );
  assert.throws(
    () => resolveCanonicalOwnerRelativePath('../fuera.md'),
    /Ruta de archivo propietario invalida/u,
  );
});

test('resuelve npm de forma portable y evita spawn directo de npm.cmd en Windows', () => {
  assert.deepEqual(
    resolveNpmInvocation({
      platform: 'win32',
      execPath: 'C:\\Program Files\\nodejs\\node.exe',
      npmExecPath: 'C:\\Program Files\\nodejs\\node_modules\\npm\\bin\\npm-cli.js',
      comspec: 'C:\\Windows\\System32\\cmd.exe',
    }),
    {
      command: 'C:\\Program Files\\nodejs\\node.exe',
      prefixArgs: ['C:\\Program Files\\nodejs\\node_modules\\npm\\bin\\npm-cli.js'],
    },
  );

  assert.deepEqual(
    resolveNpmInvocation({
      platform: 'win32',
      execPath: 'C:\\Program Files\\nodejs\\node.exe',
      npmExecPath: '',
      comspec: 'C:\\Windows\\System32\\cmd.exe',
    }),
    {
      command: 'C:\\Windows\\System32\\cmd.exe',
      prefixArgs: ['/d', '/s', '/c', 'npm.cmd'],
    },
  );

  assert.deepEqual(
    resolveNpmInvocation({
      platform: 'linux',
      execPath: '/usr/bin/node',
      npmExecPath: '',
    }),
    {
      command: 'npm',
      prefixArgs: [],
    },
  );
});

test('el iniciador exige start antes de trabajo y finish antes de siguiente tarea', () => {
  const template = fs.readFileSync(
    'docs/plan-canonico/modular/chatgpt-work-starter-template.txt',
    'utf8',
  );
  assert.match(template, /REGLA OBLIGATORIA DE RAMA POR TAREA Y CIERRE EN MAIN/u);
  assert.match(template, /npm run docs:task:start -- --task-id/u);
  assert.match(template, /task\/<task-id-en-minusculas>/u);
  assert.match(template, /npm run docs:task:finish -- --task-id/u);
  assert.match(template, /NEXT_TASK_ALLOWED: SI/u);
  assert.match(template, /ninguna tarea siguiente puede comenzar/u);
});

test('package.json expone ciclos de tarea, infraestructura y documentacion operativa', () => {
  const packageJson = JSON.parse(fs.readFileSync('package.json', 'utf8'));
  assert.equal(
    packageJson.scripts['docs:task:start'],
    'node scripts/docs/task-branch-lifecycle.mjs start',
  );
  assert.equal(
    packageJson.scripts['docs:task:finish'],
    'node scripts/docs/task-branch-lifecycle.mjs finish',
  );
  assert.equal(
    packageJson.scripts['docs:infra:publish'],
    'node scripts/docs/task-branch-lifecycle.mjs infra',
  );
  assert.equal(
    packageJson.scripts['docs:ops:publish'],
    'node scripts/docs/task-branch-lifecycle.mjs ops',
  );
});

test('el Required Gate usa main y no depende de la rama historica de BLOQUE T', () => {
  const workflow = fs.readFileSync('.github/workflows/vento-required-gate.yml', 'utf8');
  assert.match(workflow, /repository: vento-group-sas\/vento-shell[\s\S]*?ref: main/u);
  assert.doesNotMatch(workflow, /ref: shell-ci-018-global/u);
});