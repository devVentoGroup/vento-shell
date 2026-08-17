import assert from 'node:assert/strict';
import fs from 'node:fs';
import test from 'node:test';

import { buildChatgptWorkStarter } from './chatgpt-work-starter.mjs';

test('genera un único iniciador desde la acción operativa vigente', () => {
  const result = buildChatgptWorkStarter();
  assert.equal(result.control.primaryAction.type, 'AUTORIZAR_IMPLEMENTACION');
  assert.equal(result.control.primaryAction.target, 'SHELL-CI-001::GLOBAL');
  assert.match(result.source, /^VENTO OS — INICIADOR CANÓNICO DE TRABAJO/u);
  assert.match(result.source, /ACCIÓN PRINCIPAL OBLIGATORIA/u);
  assert.match(result.source, /Objetivo exacto: SHELL-CI-001::GLOBAL/u);
  assert.match(result.source, /Tarea documental actual: SHELL-CI-003/u);
  assert.match(result.source, /Autorización física para este objetivo: NO/u);
  assert.match(result.source, /### ✅ SHELL-CI-001 — Crear pruebas de paquetes compartidos/u);
  assert.doesNotMatch(result.source, /No desarrollar `SHELL-CI-001` hasta/u);
  assert.doesNotMatch(result.source, /\{\{CURRENT_WORK\}\}/u);
  assert.equal(result.outputPath.endsWith('INICIADOR_VENTO_ACTUAL.txt'), true);
});

test('el build, check y watcher mantienen conectado el iniciador', () => {
  const build = fs.readFileSync('scripts/docs/build-plan-canonico.mjs', 'utf8');
  const watcher = fs.readFileSync('scripts/docs/watch-plan-canonico.mjs', 'utf8');
  const packageJson = JSON.parse(fs.readFileSync('package.json', 'utf8'));
  assert.match(build, /writeChatgptWorkStarter/u);
  assert.match(watcher, /writeChatgptWorkStarter/u);
  assert.match(watcher, /endsWith\("\.txt"\)/u);
  assert.match(packageJson.scripts['docs:plan:check'], /chatgpt-work-starter\.mjs --check/u);
  assert.equal(packageJson.scripts['docs:chatgpt:starter'], 'node scripts/docs/chatgpt-work-starter.mjs');
});
