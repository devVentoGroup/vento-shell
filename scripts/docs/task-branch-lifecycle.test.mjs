import assert from 'node:assert/strict';
import fs from 'node:fs';
import test from 'node:test';

import {
  buildPrBody,
  classifyTaskPath,
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

test('package.json expone los dos comandos de ciclo de tarea', () => {
  const packageJson = JSON.parse(fs.readFileSync('package.json', 'utf8'));
  assert.equal(
    packageJson.scripts['docs:task:start'],
    'node scripts/docs/task-branch-lifecycle.mjs start',
  );
  assert.equal(
    packageJson.scripts['docs:task:finish'],
    'node scripts/docs/task-branch-lifecycle.mjs finish',
  );
});

test('el Required Gate usa main y no depende de la rama historica de BLOQUE T', () => {
  const workflow = fs.readFileSync('.github/workflows/vento-required-gate.yml', 'utf8');
  assert.match(workflow, /repository: vento-group-sas\/vento-shell[\s\S]*?ref: main/u);
  assert.doesNotMatch(workflow, /ref: shell-ci-018-global/u);
});