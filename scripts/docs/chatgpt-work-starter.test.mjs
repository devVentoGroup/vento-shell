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
  assert.match(result.source, /Interacción: PASOS CONSECUTIVOS HASTA UN GATE DE EVIDENCIA/u);
  assert.match(result.source, /Raíz local exacta del repositorio: .+vento-shell/u);
  assert.match(result.source, /HISTORIAL FÍSICO ACUMULATIVO/u);
  assert.match(result.source, /Modo de almacenamiento: UN ARCHIVO POR INSTANCIA/u);
  assert.match(result.source, /Escrituras del asistente en archivos o repositorios: NO AUTORIZADAS/u);
  assert.match(result.source, /AUTORIZO EJECUCION ASISTIDA DEL PASO N/u);
  assert.match(result.source, /Contrato propietario SHA-256: [a-f0-9]{64}/u);
  assert.doesNotMatch(result.source, /\{\{CURRENT_WORK\}\}/u);
  assert.equal(result.outputPath.endsWith('INICIADOR_VENTO_ACTUAL.txt'), true);
});

test('iniciar implementación entrega transición y preflight en el mismo lote', () => {
  const source = actionResponseContract({
    primaryAction: {
      type: 'INICIAR_IMPLEMENTACION',
      target: 'SHELL-CI-001::GLOBAL',
    },
  }, 'b'.repeat(64));

  assert.match(source, /MAPA COMPLETO DE IMPLEMENTACIÓN/u);
  assert.match(source, /LOTE ACTUAL/u);
  assert.match(source, /status AUTHORIZED a IN_PROGRESS/u);
  assert.match(source, /comando exacto del preflight canónico/u);
  assert.match(source, /No pauses después de cambiar el estado/u);
  assert.match(source, /RESULTADO DEL PASO/u);
});

test('continuar implementación entrega todos los cambios deterministas hasta evidencia', () => {
  const source = actionResponseContract({
    primaryAction: {
      type: 'CONTINUAR_IMPLEMENTACION',
      target: 'SHELL-CI-001::GLOBAL',
    },
  }, 'c'.repeat(64));

  assert.match(source, /todos los pasos pendientes deterministas/u);
  assert.match(source, /Si la operación es CREAR/u);
  assert.match(source, /contenido completo sin elipsis/u);
  assert.match(source, /Si la operación es MODIFICAR/u);
  assert.match(source, /archivo completo listo para reemplazar/u);
  assert.match(source, /Si la operación es EJECUTAR/u);
  assert.match(source, /No lo ejecutes tú/u);
  assert.match(source, /mismo lote todas las creaciones y modificaciones/u);
  assert.match(source, /detener el resto del lote/u);
  assert.match(source, /RESULTADO DEL PASO N/u);
  assert.match(source, /progreso visible N\/M/u);
});

test('la autorización exige JSON completo, evidencia humana y pasos manuales exactos', () => {
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
  assert.match(
    source,
    /implementation-instances\/SHELL-CI-002__GLOBAL\.json/u,
  );
  assert.match(source, /El registro histórico actual contiene 1 instancia/u);
  assert.match(source, /SHELL-CI-001::GLOBAL=VERIFIED/u);
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
  assert.match(source, /INICIAR_IMPLEMENTACION/u);
  assert.match(source, /control de código fuente de VS Code/u);
  assert.match(source, /INICIADOR_VENTO_ACTUAL\.txt recién regenerado/u);
  assert.match(source, /mensaje de commit recomendado/u);
  assert.doesNotMatch(source, /reemplazar solo instances: \[\]/u);
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
    assert.match(source, /El operador es el usuario humano/u);
    assert.match(source, /No escribas archivos/u);
    assert.match(source, /todos los pasos consecutivos/u);
    assert.match(source, /No pauses por rutina/u);
    assert.match(source, /RESULTADO DEL PASO N/u);
    assert.match(source, /AUTORIZO EJECUCION ASISTIDA DEL PASO N/u);
  }
});

test('la plantilla global conserva el modo humano aunque cambie la acción actual', () => {
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
  assert.match(template, /nunca se reemplaza un arreglo global `instances`/u);
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
