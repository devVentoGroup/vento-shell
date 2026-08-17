import assert from 'node:assert/strict';
import fs from 'node:fs';
import test from 'node:test';

import {
  actionResponseContract,
  buildChatgptWorkStarter,
} from './chatgpt-work-starter.mjs';

test('genera un único iniciador desde la acción operativa vigente', () => {
  const result = buildChatgptWorkStarter();
  assert.match(result.source, /^VENTO OS — INICIADOR CANÓNICO DE TRABAJO/u);
  assert.match(result.source, /ACCIÓN PRINCIPAL OBLIGATORIA/u);
  assert.match(result.source, new RegExp(`Objetivo exacto: ${result.control.primaryAction.target}`, 'u'));
  assert.match(result.source, /CONTRATO OBLIGATORIO DE LA RESPUESTA Y DEL PASO MANUAL/u);
  assert.match(result.source, /PASOS EXACTOS PARA EL USUARIO/u);
  assert.match(result.source, /Contrato propietario SHA-256: [a-f0-9]{64}/u);
  assert.doesNotMatch(result.source, /\{\{CURRENT_WORK\}\}/u);
  assert.equal(result.outputPath.endsWith('INICIADOR_VENTO_ACTUAL.txt'), true);
});

test('la autorización exige JSON completo, evidencia humana y pasos manuales exactos', () => {
  const source = actionResponseContract({
    primaryAction: {
      type: 'AUTORIZAR_IMPLEMENTACION',
      target: 'SHELL-CI-001::GLOBAL',
    },
  }, 'a'.repeat(64));

  assert.match(source, /exactamente sus ocho secciones/u);
  assert.match(source, /implementation-control\.json/u);
  assert.match(source, /desde "instances": \[ hasta su corchete final \]/u);
  assert.match(source, /reemplazará exclusivamente la línea "instances": \[\]/u);
  assert.match(source, /No entregues únicamente el objeto interior/u);
  assert.match(source, /status AUTHORIZED/u);
  assert.match(source, /authorization y evidence: \[\]/u);
  assert.match(source, /decision: APPROVED/u);
  assert.match(source, /approved_by/u);
  assert.match(source, /approved_at/u);
  assert.match(source, /approval_statement/u);
  assert.match(source, /source_contract_sha256/u);
  assert.doesNotMatch(source, /proposal_scope_sha256/u);
  assert.match(source, /No pidas al usuario calcular, corregir o conciliar hashes manualmente/u);
  assert.match(source, new RegExp(`source_contract_sha256 debe ser exactamente ${'a'.repeat(64)}`, 'u'));
  assert.match(source, /VENTO_OWNER/u);
  assert.match(source, /America\/Bogota/u);
  assert.match(source, /INICIAR_IMPLEMENTACION/u);
  assert.match(source, /control de código fuente de VS Code/u);
  assert.match(source, /INICIADOR_VENTO_ACTUAL\.txt recién regenerado/u);
  assert.match(source, /mensaje de commit recomendado/u);
});

test('las demás acciones también terminan con una guía operativa exacta', () => {
  for (const type of [
    'INICIAR_IMPLEMENTACION',
    'CONTINUAR_IMPLEMENTACION',
    'VALIDAR_IMPLEMENTACION',
    'RESOLVER_BLOQUEO',
    'DESARROLLAR_TAREA_DOCUMENTAL',
  ]) {
    const source = actionResponseContract({
      primaryAction: { type, target: 'TASK-001' },
    }, 'b'.repeat(64));
    assert.match(source, /PASOS EXACTOS PARA EL USUARIO/u);
    assert.match(source, /No te limites a informar qué sigue/u);
    assert.match(source, /rutas exactas/u);
  }
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
