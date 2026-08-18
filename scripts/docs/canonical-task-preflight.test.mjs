import assert from 'node:assert/strict';
import test from 'node:test';

import {
  classifyPreflightFindings,
  parseWorktreePaths,
  validatorsForPath,
} from './canonical-task-preflight.mjs';

test('asigna validadores globales a cualquier tarea', () => {
  const validators = validatorsForPath('bloques/H_FUNDACION_COMPARTIDA/07_COMPONENTES_WEB_COMPARTIDOS.md');
  assert.ok(validators.includes('npm run docs:plan:check'));
  assert.ok(validators.includes('npm run docs:treq:check'));
  assert.ok(validators.includes('git diff --check'));
});

test('añade validadores proporcionales por dominio', () => {
  const screenValidators = validatorsForPath('bloques/I_NAVEGACION_Y_PANTALLAS/01.md');
  assert.ok(screenValidators.includes('npm run docs:block-i:check'));

  const supabaseValidators = validatorsForPath('bloques/E3_SUPABASE/06.md');
  assert.ok(supabaseValidators.includes('node scripts/docs/validate-e3-transition-closure.mjs'));

  const integrationValidators = validatorsForPath('bloques/X_INTEGRACIONES/02.md');
  assert.ok(integrationValidators.includes('npm run docs:int-app:check'));
  assert.ok(integrationValidators.includes('npm run docs:int-ext:check'));
});

test('extrae rutas modificadas de git status porcelain', () => {
  assert.deepEqual(
    parseWorktreePaths([
      ' M docs/plan-canonico/modular/implementation-instances/SHELL-CI-005__GLOBAL.json',
      '?? scripts/quality/new-file.mjs',
      'R  old.txt -> new.txt',
    ].join('\n')),
    [
      'docs/plan-canonico/modular/implementation-instances/SHELL-CI-005__GLOBAL.json',
      'new.txt',
      'scripts/quality/new-file.mjs',
    ],
  );
});

test('carril físico IN_PROGRESS acepta continuidad documental adelantada y cambio exclusivo del registro', () => {
  const result = classifyPreflightFindings({
    requestedTaskId: 'SHELL-CI-005',
    currentTaskId: 'SHELL-CI-006',
    requestedInstance: {
      instance_id: 'SHELL-CI-005::GLOBAL',
      task_id: 'SHELL-CI-005',
      status: 'IN_PROGRESS',
    },
    worktreePaths: [
      'docs/plan-canonico/modular/implementation-instances/SHELL-CI-005__GLOBAL.json',
    ],
    behind: 0,
    ahead: 0,
    activeSequenceCurrent: true,
    formatState: 'OK',
    contractErrors: [],
  });

  assert.deepEqual(result.blockers, []);
  assert.equal(result.advisories.length, 2);
  assert.match(result.advisories[0], /carril físico/u);
  assert.match(result.advisories[1], /únicamente cambios esperados del carril físico/u);
});

test('tolera proyecciones derivadas del estado físico junto con el registro activo', () => {
  const result = classifyPreflightFindings({
    requestedTaskId: 'SHELL-CI-005',
    currentTaskId: 'SHELL-CI-006',
    requestedInstance: {
      instance_id: 'SHELL-CI-005::GLOBAL',
      task_id: 'SHELL-CI-005',
      status: 'IN_PROGRESS',
    },
    worktreePaths: [
      'docs/plan-canonico/modular/00_CABECERA_Y_ESTADO.md',
      'docs/plan-canonico/modular/.generated/REGISTRO_DE_TAREAS_PENDIENTES_CON_CONTEXTO.md',
      'docs/plan-canonico/modular/implementation-instances/SHELL-CI-005__GLOBAL.json',
    ],
  });

  assert.deepEqual(result.blockers, []);
  assert.ok(result.advisories.some((entry) => /cambios esperados del carril físico/u.test(entry)));
});

test('bloquea cambios locales ajenos al registro antes de aplicar código', () => {
  const result = classifyPreflightFindings({
    requestedTaskId: 'SHELL-CI-005',
    currentTaskId: 'SHELL-CI-006',
    requestedInstance: {
      instance_id: 'SHELL-CI-005::GLOBAL',
      task_id: 'SHELL-CI-005',
      status: 'IN_PROGRESS',
    },
    worktreePaths: [
      'docs/plan-canonico/modular/implementation-instances/SHELL-CI-005__GLOBAL.json',
      'scripts/quality/unrelated.mjs',
    ],
  });

  assert.equal(result.blockers.length, 1);
  assert.match(result.blockers[0], /fuera del carril físico esperado/u);
  assert.match(result.blockers[0], /scripts\/quality\/unrelated\.mjs/u);
});

test('bloquea preflight físico si la instancia no está IN_PROGRESS', () => {
  const result = classifyPreflightFindings({
    requestedTaskId: 'SHELL-CI-005',
    currentTaskId: 'SHELL-CI-006',
    requestedInstance: {
      instance_id: 'SHELL-CI-005::GLOBAL',
      task_id: 'SHELL-CI-005',
      status: 'AUTHORIZED',
    },
  });

  assert.ok(result.blockers.some((entry) => /debe estar IN_PROGRESS/u.test(entry)));
});

test('behind, formato, active-sequence y contrato inválido siguen siendo bloqueos reales', () => {
  const result = classifyPreflightFindings({
    requestedTaskId: 'SHELL-CI-005',
    currentTaskId: 'SHELL-CI-006',
    requestedInstance: {
      instance_id: 'SHELL-CI-005::GLOBAL',
      task_id: 'SHELL-CI-005',
      status: 'IN_PROGRESS',
    },
    behind: 2,
    activeSequenceCurrent: false,
    formatState: 'NEEDS_FORMAT',
    contractErrors: ['CONTRACT_ERROR'],
  });

  assert.ok(result.blockers.some((entry) => /2 commit/u.test(entry)));
  assert.ok(result.blockers.some((entry) => /active-sequence/u.test(entry)));
  assert.ok(result.blockers.some((entry) => /formato de tarea/u.test(entry)));
  assert.ok(result.blockers.some((entry) => /contrato de entrega inválido/u.test(entry)));
});

test('ahead durante una instancia física es aviso y no bloqueo', () => {
  const result = classifyPreflightFindings({
    requestedTaskId: 'SHELL-CI-005',
    currentTaskId: 'SHELL-CI-006',
    requestedInstance: {
      instance_id: 'SHELL-CI-005::GLOBAL',
      task_id: 'SHELL-CI-005',
      status: 'IN_PROGRESS',
    },
    ahead: 1,
  });

  assert.deepEqual(result.blockers, []);
  assert.ok(result.advisories.some((entry) => /1 commit/u.test(entry)));
});
