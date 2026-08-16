import assert from 'node:assert/strict';
import test from 'node:test';

import { validatorsForPath } from './canonical-task-preflight.mjs';

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
