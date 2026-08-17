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
  assert.match(result.source, /Operador que realiza los cambios: USUARIO HUMANO/u);
  assert.match(result.source, /Interacción: CAMBIOS EN LOTE \+ UNA SOLA BATERÍA FINAL/u);
  assert.match(result.source, /Watcher durante implementación física: APAGADO/u);
  assert.match(result.source, /Preflight físico: UNA VEZ/u);
  assert.match(result.source, /Gates intermedios rutinarios: PROHIBIDOS/u);
  assert.match(result.source, /Raíz local exacta del repositorio: .+vento-shell/u);
  assert.match(result.source, /HISTORIAL FÍSICO ACUMULATIVO/u);
  assert.match(result.source, /Modo de almacenamiento: UN ARCHIVO POR INSTANCIA/u);
  assert.match(result.source, /CONTENIDO LOCAL EXACTO DEL REGISTRO ACTIVO/u);
  assert.match(result.source, /Escrituras del asistente en archivos o repositorios: NO AUTORIZADAS/u);
  assert.match(result.source, /AUTORIZO EJECUCION ASISTIDA DEL PASO N/u);
  assert.match(result.source, /Regeneración ligera de control: npm run docs:implementation:status/u);
  assert.match(result.source, /Regeneración ligera del Iniciador: npm run docs:chatgpt:starter/u);
  assert.match(result.source, /Contrato propietario SHA-256: [a-f0-9]{64}/u);
  assert.doesNotMatch(result.source, /\{\{CURRENT_WORK\}\}/u);
  assert.equal(result.outputPath.endsWith('INICIADOR_VENTO_ACTUAL.txt'), true);
});

test('iniciar implementación apaga watcher, cambia estado y ejecuta un único preflight', () => {
  const source = actionResponseContract({
    primaryAction: {
      type: 'INICIAR_IMPLEMENTACION',
      target: 'SHELL-CI-001::GLOBAL',
    },
  }, 'b'.repeat(64));

  assert.match(source, /MAPA COMPLETO DE IMPLEMENTACIÓN/u);
  assert.match(source, /LOTE ACTUAL/u);
  assert.match(source, /detener el watcher si está activo/u);
  assert.match(source, /status AUTHORIZED a IN_PROGRESS/u);
  assert.match(source, /comando exacto del preflight canónico/u);
  assert.match(source, /primer y único gate previo al código/u);
  assert.match(source, /preflight se ejecuta una sola vez por instancia/u);
  assert.match(source, /RESULTADO DEL PASO/u);
  assert.doesNotMatch(source, /comprobación esperada del watcher/u);
});

test('continuar implementación entrega todo el cambio y una sola batería final', () => {
  const source = actionResponseContract({
    primaryAction: {
      type: 'CONTINUAR_IMPLEMENTACION',
      target: 'SHELL-CI-001::GLOBAL',
    },
  }, 'c'.repeat(64));

  assert.match(source, /todos los cambios físicos pendientes deterministas en un único lote/u);
  assert.match(source, /Mantén el watcher apagado/u);
  assert.match(source, /Si la operación es CREAR/u);
  assert.match(source, /contenido completo sin elipsis/u);
  assert.match(source, /Si la operación es MODIFICAR/u);
  assert.match(source, /archivo completo listo para reemplazar/u);
  assert.match(source, /No ejecutes validaciones entre archivos/u);
  assert.match(source, /gates intermedios/u);
  assert.match(source, /a IMPLEMENTED/u);
  assert.match(source, /una sola batería final/u);
  assert.match(source, /detenerse en el primer fallo/u);
  assert.match(source, /vuelve a ejecutar la misma batería final/u);
  assert.match(source, /no repitas la batería/u);
});

test('validar implementación usa una única batería fail-fast y no revalida después de PASS', () => {
  const source = actionResponseContract({
    primaryAction: {
      type: 'VALIDAR_IMPLEMENTACION',
      target: 'SHELL-CI-002::GLOBAL',
    },
  }, 'd'.repeat(64));

  assert.match(source, /una sola batería final/u);
  assert.match(source, /fail-fast/u);
  assert.match(source, /Mantén el watcher apagado/u);
  assert.match(source, /No conviertas cada comando de la batería en un gate separado/u);
  assert.match(source, /una única respuesta RESULTADO DEL PASO N/u);
  assert.match(source, /para VERIFIED/u);
  assert.match(source, /Después de VERIFIED no repitas la batería/u);
  assert.match(source, /npm run docs:implementation:status/u);
  assert.match(source, /npm run docs:chatgpt:starter/u);
});

test('la autorización conserva ledger y deriva la acción sin recompilar todo el plan', () => {
  const source = actionResponseContract({
    primaryAction: {
      type: 'AUTORIZAR_IMPLEMENTACION',
      target: 'SHELL-CI-002::GLOBAL',
    },
    physical: {
      recordedInstances: [{ instance_id: 'SHELL-CI-001::GLOBAL', status: 'VERIFIED' }],
    },
  }, 'a'.repeat(64));

  assert.match(source, /exactamente sus ocho secciones/u);
  assert.match(source, /implementation-control\.json/u);
  assert.match(source, /implementation-instances\/SHELL-CI-002__GLOBAL\.json/u);
  assert.match(source, /El historial anterior contiene 1 instancia/u);
  assert.match(source, /SHELL-CI-001::GLOBAL=VERIFIED/u);
  assert.match(source, /PENDING_AUTHORIZATION/u);
  assert.match(source, /No entregues una propiedad instances/u);
  assert.match(source, /nunca borres, reemplaces, reordenes ni reescribas/u);
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
  assert.match(source, /detener el watcher si está activo/u);
  assert.match(source, /npm run docs:implementation:status/u);
  assert.match(source, /npm run docs:chatgpt:starter/u);
  assert.match(source, /INICIAR_IMPLEMENTACION/u);
  assert.match(source, /INICIADOR_VENTO_ACTUAL\.txt recién regenerado/u);
  assert.match(source, /mensaje de commit recomendado/u);
  assert.doesNotMatch(source, /esperar el watcher/u);
  assert.doesNotMatch(source, /reemplazar solo instances: \[\]/u);
});

test('las demás acciones también conservan guía humana y prohíben micro-gates', () => {
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
    assert.match(source, /El operador es el usuario humano/u);
    assert.match(source, /No escribas archivos/u);
    assert.match(source, /No pauses por rutina/u);
    assert.match(source, /watcher del plan debe permanecer apagado/u);
    assert.match(source, /una sola batería final/u);
    assert.match(source, /gates intermedios/u);
    assert.match(source, /AUTORIZO EJECUCION ASISTIDA DEL PASO N/u);
  }
});

test('la plantilla global conserva modo humano, watcher apagado y validación final única', () => {
  const template = fs.readFileSync(
    'docs/plan-canonico/modular/chatgpt-work-starter-template.txt',
    'utf8',
  );
  assert.match(template, /MODO PREDETERMINADO DE IMPLEMENTACIÓN HUMANA/u);
  assert.match(template, /el usuario humano crea, modifica, reemplaza y elimina archivos/u);
  assert.match(template, /ChatGPT entrega seguidos todos los pasos/u);
  assert.match(template, /no se pausa entre pasos por rutina ni para pedir `HECHO`/u);
  assert.match(template, /RESULTADO DEL PASO N/u);
  assert.match(template, /un archivo por instancia/u);
  assert.match(template, /watcher crea automáticamente su archivo exacto/u);
  assert.match(template, /usuario nunca crea manualmente el archivo/u);
  assert.match(template, /nunca se reemplaza un arreglo global `instances`/u);
  assert.match(template, /FLUJO RÁPIDO DE IMPLEMENTACIÓN FÍSICA/u);
  assert.match(template, /watcher debe permanecer apagado/u);
  assert.match(template, /una sola batería final/u);
  assert.match(template, /npm run docs:implementation:status/u);
  assert.match(template, /npm run docs:chatgpt:starter/u);
  assert.match(template, /Push Protection/u);
  assert.match(template, /AUTORIZO EJECUCION ASISTIDA DEL PASO 3/u);
  assert.match(template, /“haz la acción principal” no autorizan escrituras automáticas/u);
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